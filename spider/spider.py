import requests
from lxml import etree
from datetime import datetime
class MysqlDB:
    '''
    mysql操作类
    '''

    def __init__(self, params):
        self.params=params
    
    def getconn(self):
        import pymysql
        try:
            conn = pymysql.connect(**self.params)
        except pymysql.err.OperationalError:
            # 如果没有数据库则创建数据库
            db = self.params.pop('db')
            conn = pymysql.connect(**self.params)
            cursor = conn.cursor()
            cursor.execute(f"CREATE DATABASE {db}")
            cursor.close()
            conn.close()
            self.params['db'] = db
            conn = pymysql.connect(**self.params)
        return conn
    @staticmethod
    def is_alive(params):
        '''
        判断mysql连接是否存活
        '''
        import pymysql
        try:
            # 执行一个简单的查询
            conn = pymysql.connect(**params)
            with conn.cursor() as cursor:
                cursor.execute("SELECT 1")
            # 检查查询结果
            result = cursor.fetchone()
            if result[0] == 1:
                return True
            else:
                return False
        except:
            return False
    @classmethod
    def create_table(self,conn, table_name: str, columns: list, types: list):
        '''
        根据表名、字段、字段类型建表
        '''
        columns_str = ''
        id_str = '`id` INT AUTO_INCREMENT PRIMARY KEY,\n'
        for i, j in enumerate(columns):
            if j == 'id':
                id_str = ''
            columns_str += f'`{j}` {types[i]},\n'
        columns_str = columns_str.strip("\n").strip(",")
        sql = f'''
        CREATE TABLE IF NOT EXISTS {table_name} (
            {id_str}
            {columns_str}
        )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
        '''
        try:
            cur = conn.cursor()
            cur.execute(sql)
            conn.commit()
            return True
        except Exception as e:
            conn.rollback()
            raise ValueError(f'创建表{table_name}失败-error{e}-sql:{sql}')

    def get_types(self, data: list):
        '''
        根据数据的类型转换为mysql中字段类型
        '''
        from datetime import datetime
        # 获取一行数据
        data = data[0]
        
        def getType(column):
            if isinstance(column, str):
                return 'TEXT'
            elif isinstance(column, datetime):
                return 'datetime'
            elif isinstance(column, int):
                return 'int'
            elif isinstance(column, float):
                return 'double'
            elif isinstance(column, bool):
                return 'bool'
            else:
                raise ValueError(f'不支持字段类型:{type(column)}')

        types = []
        for i in data:
            types.append(getType(i))
        return types
    @classmethod
    def check_table_exists(self,conn, table_name):
        '''
        查询表是否存在
        '''
        try:
            # 创建游标对象
            cursor = conn.cursor()
            # 执行SHOW TABLES查询
            cursor.execute("SHOW TABLES")
            # 获取返回的所有表名
            tables = cursor.fetchall()
            # 检查目标表是否在返回的结果中存在
            if (table_name,) in tables:
                return True
            else:
                return False
        except:
            return False

    def save(self, data: list, table_name: str, method: str = 'repace'):
        '''
        简单便捷的保存方法
        自动建库建表
        支持append、replace模式
        '''
        import pandas as pd
        assert len(data) > 0, 'data不能为空'

        df = pd.DataFrame(data)
        conn=self.getconn()
        cur = conn.cursor()
        data = df.values.tolist()
        columns = df.columns.tolist()
        columns_str = ','.join([f'`{i}`' for i in columns])
        s_str = ','.join(['%s' for i in range(len(columns))])
        sql = f'insert into {table_name}({columns_str}) values ({s_str})'
        if self.check_table_exists(conn,table_name):
            if method == 'append':
                pass
            else:
                cur.execute(f'drop table {table_name}')
                conn.commit()
                types = self.get_types(data)
                self.create_table(conn,table_name, columns, types)
        else:
            types = self.get_types(data)
            self.create_table(conn,table_name, columns, types)
        try:
            cur.executemany(sql, data)
            conn.commit()
        except Exception as e:
            conn.rollback()
            raise ValueError(f'保存失败-error:{e}-sql:{sql}')
def   get_list_data(data):
    if data!=[]:
        return data[0].strip().replace(']','')
    else:
        return "" 
def spider_page(page):
    headers={
    'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0'
    }
    r=requests.get(f'http://s.lvmama.com/ticket/H9K310000P{page}PRO3?keyword=%E6%B2%B3%E5%8C%97&tabType=route350#list',headers=headers)
    tree=etree.HTML(r.text)
    try:
        dd=tree.xpath('//*[@class="product-details clearfix"]//dd/text()')
    except:
        print(r.text)
    res=[]
    for item in tree.xpath('//*[@class="product-item product-ticket searchTicket clearfix"]'):
        d={}
        for i in item.xpath('.//*[@class="product-details clearfix"]'):
            d[get_list_data(i.xpath('./dt/text()'))]=get_list_data(i.xpath('./dd/text()'))
        high_price=max([float(i.strip().replace('¥','').replace('--','0')) for i in item.xpath('.//*[@class="lv-price"]//dfn/text()')])
        data={
        'name':get_list_data(item.xpath('.//a[@class="name"]/text()')),
        'topic':d.get('主\u2003\u2003题'),
        'low_price':get_list_data(item.xpath('.//*[@class="product-price"]/em/text()')),
        'high_price':high_price,
        'address':d.get('景点地址'),
        'city':get_list_data(item.xpath('.//*[@class="city"]/text()')).split('·')[-1],
        'url':get_list_data(item.xpath('.//*[@class="product-picture"]/@href')),
        'img':get_list_data(item.xpath('.//*[@class="product-picture"]/img/@src')),
        'create_time':datetime.now()
        }
        res.append(data)
    return res
def run():
    data=[]
    for i in range(1,40):
        base_data=spider_page(i)
        data+=base_data
    return data
data=run()
MYSQL_CONNECT = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'password': 'root',
    'charset': 'utf8',
    'db': 'spider'
}
db=MysqlDB(MYSQL_CONNECT)
db.save(data=data,table_name='travel')