#### 环境

Anaconda

MySQL

Python

Redis

Hadoop

#### 1 Web程序

##### 配置settings.py

```python
# web-server\DRF\settings.py
# SMTP邮箱设置,怎么申请请自行网上学习
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = ''  # 邮箱SMTP服务器地址
EMAIL_HOST_USER = ''  # 邮箱用户名
EMAIL_HOST_PASSWORD = ''  # 邮箱密码
# EMAIL_USE_TLS = True  # 使用TLS加密
DEFAULT_FROM_EMAIL = ''  # 默认发件人邮箱
#redis
REDIS_HOST='127.0.0.1'
REDIS_PORT=6379
REDIS_PSW=''
REDIS_DB=1
#MySQL
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'jobfree',  
        'USER': 'root',  
        'PASSWORD': 'root',  
        'HOST': '127.0.0.1',
        'PORT': 3306,
        'OPTIONS': {'charset': 'utf8mb4'},
    },

}
```

##### 迁移数据库

```cmd
conda activate web
cd web-server
python manage.py migrate
```

##### 导入测试数据

> data\travel_test_all.sql，然后完成ETL模块再进行下一步运行

##### windows一键启动

> 双击web-start.bat

##### 正常启动

```cmd
cd web-server
conda activate jobfree
python manage.py runserver
```

#### 2 ETL模块

##### 环境搭建

> 有集群则跳过

[Windows下使用hadoop+hive+sparkSQL-CSDN博客](https://blog.csdn.net/qq_41631913/article/details/134804263)

##### 初始化hive数据库

> ETL\init.sql

##### 安装python库

```cmd
pip install findspark
```

##### 执行ETL脚本

> ETL\xxx目录下的py文件

##### 模型训练

> model\ALS.py