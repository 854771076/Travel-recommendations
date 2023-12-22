from pyspark.sql.types import *
from pyspark.sql import functions as F
from pyspark.sql import SparkSession
import datetime
import sys
import threading
import time
from sys import stderr
from logging import getLogger, StreamHandler, Formatter, INFO, DEBUG, ERROR, FileHandler, WARNING

'''
spark.sql.shuffle.partitions Local模式下调小，一般为CPU核心数2-10倍
'''
import findspark

findspark.init()

# hdfs:///user/cdh/jars/mysql-connector-java-5.1.49.jar为传入的mysql-connector包
spark = SparkSession.builder \
    .appName("ods_dwd加工") \
    .appName("dwd_mysql加工") \
    .master('local[*]') \
    .config("spark.sql.catalogImplementation","hive") \
    .getOrCreate()


# 配置参数
class settings:
    # 日志信息存储的mysql
    MYSQL_CONNECT = {
        'host': '10.8.16.253',
        'port': 3306,
        'user': 'root',
        'password': 'fiang123',
        'charset': 'utf8',
        'db': 'logs'
    }

    TABLES = [
        {"name": "旅游景点爬虫数据ods->dwd", "db1": "ods_travel", "tb1": "ods_travel_db_spider_t_travel", 'db2': 'dwd_travel', 'tb2': 'dwd_travel_db_spider_t_travel', "update_column": "create_time",
         "SQL": '''select 
            cast ( id as int) as id,
            `name`,
            Case when
            topic="不限" then 0
            when topic="休闲娱乐" then 1
            when topic="自然风光" then 2
            when topic="人文古迹" then 3
            when topic="主题乐园" then 4
            when topic="温泉" then 5
            when topic="滑雪" then 6
            when topic="园林景观" then 7
            when topic="动植物园" then 8
            when topic="登山徒步" then 9
            when topic="展览展馆" then 10
            when topic="民俗风情" then 11
            else 0
            end as topic ,
            topic as topicTranslation,
            cast ( `low_price` as float) as low_price,
            cast (`high_price` as float) as high_price,
            `address`,
            Case
            when city="不限" then 0
            when city="石家庄" then 1
            when city="保定" then 2
            when city="邯郸" then 3
            when city="张家口" then 4
            when city="秦皇岛" then 5
            when city="承德" then 6
            when city="廊坊" then 7
            when city="邢台" then 8
            when city="唐山" then 9
            when city="沧州" then 10
            when city="衡水" then 11
            else 0
            end as city,
            city as `cityTranslation`,
            `url`,
            `img`,
            `create_time`
            from ods_travel.ods_travel_db_spider_t_travel''','partition':True
         },
        {
            "name": "智联招聘用户简历信息ods->dwd", "db1": "ods_travel", "tb1": "ods_travel_db_travel_t_resume", 'db2': 'dwd_travel', 'tb2': 'dwd_travel_db_travel_t_resume', "update_column": "last_update",
            'SQL': '''select 
            `id` ,
            `city1`,
            `city1Translation`,
            `city2`,
            `city2Translation`,
            `city3`,
            `city3Translation`,
            `topic`,
            `topicTranslation`,
            `low_price`,
            `high_price`,
            `created_time`,
            `last_update`,
            `user_id`,
            `cdc_sync_date`
            from (select *, row_number() over (distribute by id sort by last_update DESC ) as rank from `ods_travel`.`ods_travel_db_travel_t_resume`) t1
            where t1.rank = 1''','partition':True        
        },
        {
            "name": "智联招聘用户简历特征信息dwd->dwd", "db1": "dwd_travel", "tb1": "dwd_travel_db_travel_t_resume", 'db2': 'dwd_travel', 'tb2': 'dwd_travel_db_travel_t_resume_train', "update_column": None,
            "SQL": '''select user_id, 
            if(topic is not null,topic,0) as topic, 
            (if(city1 is not null,city1,0)+if(city2 is not null,city2,if(city1 is not null,city1,0))+if(city3  is not null,city3,if(city1  is not null,city1,0))) as city, 
            if(low_price  is not null,low_price,0) as low_price, 
            if(high_price  is not null,high_price,0) as high_price
            from dwd_travel.dwd_travel_db_travel_t_resume'''
        },
        {
            "name": "智联招聘信息特征dwd->dwd", "db1": "dwd_travel", "tb1": "dwd_travel_db_spider_t_travel", 'db2': 'dwd_travel', 'tb2': 'dwd_travel_db_spider_t_travel_train', "update_column": None,
            "SQL": '''SELECT id as travel_id,topic, city*3 as city, low_price,high_price FROM dwd_travel.dwd_travel_db_spider_t_travel'''
        },
        {
            "name": "用户浏览数据加工ods->dwd", "db1": "ods_travel", "tb1": "ods_travel_db_travel_t_clicktravel", 'db2': 'dwd_travel', 'tb2': 'dwd_travel_db_travel_t_hottravel', "update_column": None,'partition':True,
            "SQL": '''select travel_id,click_num from
            (select *, 
            row_number() over (distribute by travel_id sort by last_update DESC ) as rank ,
            sum(`count`) over (PARTITION by travel_id) as click_num
            from `ods_travel`.`ods_travel_db_travel_t_clicktravel`) t1
            where t1.rank = 1
            UNION ALL
            select travel_id,count(*)*10 as star_num_weight from ods_travel.ods_travel_db_travel_t_startravel group by travel_id'''
        },
        
        {
            "name": "热门景点TOP加工dwd->ads", "db1": "dwd_travel", "tb1": "dwd_travel_db_travel_t_hottravel", 'db2': 'ads_travel', 'tb2': 'ads_travel_db_travel_t_hottravel_TOP20', "update_column": None,'partition':True,
            "SQL": '''select CAST(id as int) as id,sum(weight) as weight from dwd_travel.dwd_travel_db_travel_t_hottravel group by id order by weight desc limit 20'''
        }
    ]

    log_tb_name = f"dwd_travel_spark"
    log_name = f'{log_tb_name}.log'
    error_log_name = f'{log_tb_name}_spark.error.log'
    TYPE = 'update'
    # 日志结构
    log_data = {
        'db1': 'ods_travel',
        'tb1': 'ods_travel_db_spider_t_travel',
        'status': False,
        'db2': 'dwd_travel',
        'tb2': 'dwd_travel_db_spider_t_travel',
        'msg': '',
        'num': 0,
        'executed_way': TYPE,
        'local_row_update_time_start': '',
        'local_row_update_time_end': '',
        'partition_date': '',
        'SQL': '',
        'exec_time': datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    }
    # 是否删除已有分区
    is_del = True


def getHiveDataOnSQL(SQL: str):
    '''
    使用spark读取hive数据
    '''
    df = spark.sql(SQL)
    return df


# 日志
def getLog():
    '''
    获得日志对象
    '''
    logger = getLogger(f'log_{datetime.datetime.now()}')
    logger.setLevel(INFO)
    rf_handler = StreamHandler(stderr)  # 默认是sys.stderr
    rf_handler.setLevel(DEBUG)
    f2_handler = FileHandler(settings.log_name)
    f2_handler.setLevel(INFO)
    f2_handler.setFormatter(Formatter(
        "%(asctime)s - %(levelname)s - %(filename)s[:%(lineno)d] - %(message)s"))
    f3_handler = FileHandler(settings.error_log_name)
    f3_handler.setLevel(ERROR)
    f3_handler.setFormatter(Formatter(
        "%(asctime)s - %(levelname)s - %(filename)s[:%(lineno)d] - %(message)s"))
    logger.addHandler(rf_handler)
    logger.addHandler(f2_handler)
    logger.addHandler(f3_handler)
    return logger


class MysqlDB:
    '''
    mysql操作类
    '''

    def __init__(self, params):
        self.params = params

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
    def create_table(self, conn, table_name: str, columns: list, types: list):
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
    def check_table_exists(self, conn, table_name):
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

    def save(self, data: list, table_name: str, method: str = 'append'):
        '''
        简单便捷的保存方法
        自动建库建表
        支持append、replace模式
        '''
        import pandas as pd
        assert len(data) > 0, 'data不能为空'

        df = pd.DataFrame(data)
        conn = self.getconn()
        cur = conn.cursor()
        data = df.values.tolist()
        columns = df.columns.tolist()
        columns_str = ','.join([f'`{i}`' for i in columns])
        s_str = ','.join(['%s' for i in range(len(columns))])
        sql = f'insert into {table_name}({columns_str}) values ({s_str})'
        if self.check_table_exists(conn, table_name):
            if method == 'append':
                pass
            else:
                cur.execute(f'drop table {table_name}')
                conn.commit()
                types = self.get_types(data)
                self.create_table(conn, table_name, columns, types)
        else:
            types = self.get_types(data)
            self.create_table(conn, table_name, columns, types)
        try:
            cur.executemany(sql, data)
            conn.commit()
        except Exception as e:
            conn.rollback()
            raise ValueError(f'保存失败-error:{e}-sql:{sql}')


def hive_to_hive(log_data: dict, table: dict, Type):
    '''
    调用spark将hive数据导入hive，并记录日志
    '''
    logger.info(
        f"Thread {table['db1']}.{table['tb1']}->{table['db2']}.{table['tb2']}执行开始")
    try:
        log_data['db1'] = table.get('db1')
        log_data['tb1'] = table.get('tb1')

        # 删除partition_date分区已有数据
        try:
            if settings.is_del:
                spark.sql(
                    f'ALTER TABLE {table["db2"]}.{table["tb2"]} DROP PARTITION (partition_date="{partition_date}")')
        except:
            pass
        # 导入数据到hive
        where = 'where'
        if not table['update_column']:
            SQL = table.get('SQL')
            df = getHiveDataOnSQL(SQL)
        else:
            if table.get('SQL').find('where') != -1:
                where = ' and '
            if TYPE == 'all':
                SQL = table.get('SQL')
                df = getHiveDataOnSQL(SQL)
            elif TYPE == 'update':
                SQL = table.get('SQL') + \
                    f' {where} partition_date="{partition_date}"'
                df = getHiveDataOnSQL(SQL)
            elif TYPE == 'other':
                SQL = table.get(
                    'SQL')+f" {where} {table['update_column']} between '{start_time}' and '{end_time}'"
                df = getHiveDataOnSQL(SQL)
            else:
                logger.error(f"Type类型错误:{TYPE}")
                return
        log_data['SQL'] = SQL
        # 查询为空
        if df.rdd.isEmpty():
            log_data['status'] = True
            log_data['num'] = 0
            logger.info(f"表{table['db1']}.{table['tb1']}无更新---num:0")
            log_data['msg'] = f"表{table['db1']}.{table['tb1']}无更新"
            return
        num = df.count()
        df.createOrReplaceTempView(f"hive_to_hive_tmp")
        if not table['update_column'] and not table.get('partition'):
            spark.sql(
                f"INSERT  OVERWRITE table {table['db2']}.{table['tb2']}  SELECT * FROM hive_to_hive_tmp")
        
        else:
            spark.sql(
                f"INSERT INTO {table['db2']}.{table['tb2']} PARTITION(partition_date={partition_date}) SELECT * FROM hive_to_hive_tmp")

        logger.info(
            f"Thread {table['db1']}.{table['tb1']}->{table['db2']}.{table['tb2']}执行成功---num:{num}")
        log_data['status'] = True
        log_data['num'] = num
        log_data['msg'] = f"导入{table['db1']}.{table['tb1']}数据到hive表{table['db2']}.{table['tb2']}成功"
    except Exception as e:
        logger.error(
            f"{table['db1']}.{table['tb1']}->{table['db2']}.{table['tb2']}执行失败----error:{e}")
        log_data['msg'] = f"导入表{table['db1']}.{table['tb1']}失败----error:{e}"
    finally:
        Log_db.save([log_data], settings.log_tb_name, 'append')


def insertData(table: dict):
    '''
    导入
    '''
    table = table.copy()
    log_data = settings.log_data.copy()
    log_data['db2'] = table.get('db2')
    log_data['tb2'] = table.get('tb2')
    log_data['exec_time'] = datetime.datetime.now().strftime(
        "%Y-%m-%d %H:%M:%S")
    hive_to_hive(log_data, table, TYPE)


if __name__ == '__main__':
    logger = getLog()
    Log_db = MysqlDB(settings.MYSQL_CONNECT)
    today_time = datetime.date.today()
#     yesterday_time = today_time + datetime.timedelta(-1)
    partition_date = today_time.strftime("%Y%m%d")
    try:
        TYPE = sys.argv[1]
        if TYPE not in ['all', 'update', 'other']:
            TYPE = settings.TYPE
    except:
        TYPE = settings.TYPE
    tables = settings.TABLES
    logger.info(f'导入开始--type:{TYPE}')
    start = time.time()
    # 1 全量  截止运行时间零点
    if TYPE == 'all':
        settings.log_data['executed_way'] = TYPE
        settings.log_data['partition_date'] = partition_date
        settings.log_data['local_row_update_time_start'] = today_time.strftime(
            "%Y-%m-%d %H:%M:%S")
        settings.log_data['local_row_update_time_end'] = today_time.strftime(
            "%Y-%m-%d %H:%M:%S")

    elif TYPE == 'update':
        settings.log_data['executed_way'] = TYPE
        settings.log_data['partition_date'] = partition_date
        settings.log_data['local_row_update_time_start'] = today_time.strftime(
            "%Y-%m-%d %H:%M:%S")
        settings.log_data['local_row_update_time_end'] = today_time.strftime(
            "%Y-%m-%d %H:%M:%S")

    # 3 指定时间段 追加放入昨天分区/指定分区里
    elif TYPE == 'other':
        start_time = sys.argv[2]
        end_time = sys.argv[3]
        # start_time = "2022-08-11 00:00:00"
        # end_time   = "2022-08-12 00:00:00"
        partition_date = sys.argv[4] if len(sys.argv) > 4 else partition_date
        where_str = "{} between '%s' and '%s' " % (start_time, end_time)
        is_merge_small_file = True
        settings.log_data['partition_date'] = partition_date
        settings.log_data['executed_way'] = TYPE
        settings.log_data['local_row_update_time_start'] = start_time
        settings.log_data['local_row_update_time_end'] = end_time
    else:
        raise ValueError(f'不能识别类型{TYPE}')
    for table in tables:
        insertData(table)
    end = time.time()

    logger.info(f'导入完成---总耗时{(end-start)}秒')
