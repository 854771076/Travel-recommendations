from pyspark.ml.feature import VectorAssembler
from pyspark.ml.linalg import Vectors, DenseVector
from pyspark.ml.feature import Normalizer,MinMaxScaler
from pyspark.sql.functions import *
from pyspark.sql import SparkSession
from pyspark.sql.types import *
import numpy as np

MYSQL_PARAMS = {
        'host': '10.8.16.83',
        'port': 3306,
        'user': 'root',
        'password': 'fiang123',
        'db':'travel',
        'table':'recommendforallusers'
    }


spark = SparkSession.builder \
    .appName("model") \
    .master('local[*]') \
    .config("spark.sql.catalogImplementation","hive") \
    .getOrCreate()
weights =[0.6333 ,0.2605 , 0.1062]
def weighted_cos_similarity(vector1, vector2):
    # 确保向量和权重的长度相同
    assert len(vector1) == len(vector2) == len(weights), "向量和权重的长度必须相同"
    # 计算向量每个元素乘以对应权重后的加权向量
    weighted_vector1 = np.multiply(vector1, weights)
    weighted_vector2 = np.multiply(vector2, weights)
    # 计算加权向量的点积
    dot_product = np.dot(weighted_vector1, weighted_vector2)
    # 计算加权向量的模
    norm_vector1 = np.linalg.norm(weighted_vector1)
    norm_vector2 = np.linalg.norm(weighted_vector2)
    # 计算带权重的余弦相似度
    similarity = dot_product / (norm_vector1 * norm_vector2)
    return float(similarity)
def cos_similarity(Vector1, Vector2):
    similarity = Vector1.dot(Vector2) / (np.linalg.norm(Vector1) * np.linalg.norm(Vector2))
    return float(similarity)
def chebyshev_distance(a, b):
    distance = np.max(np.abs(a - b))
    return float(distance)
def euclidean_distance(a, b):
    distance = np.linalg.norm(a - b)
    return float(distance)
def weighted_euclidean_distance(x, y):
    x=np.array(x)
    y=np.array(y)
    squared_diff = (x - y)**2
    weighted_diff = squared_diff * weights
    return 1-float(np.sqrt(np.sum(weighted_diff)))
euclidean_distance_udf=udf(euclidean_distance, DoubleType())
weighted_euclidean_distance_udf=udf(weighted_euclidean_distance, DoubleType())
cos_similarity_udf = udf(cos_similarity, DoubleType())
weighted_cos_similarity_udf = udf(weighted_cos_similarity, DoubleType())
# 加载用户画像数据
user_profile_df = spark.sql('SELECT user_id,topic,city,low_price FROM `dwd_travel`.`dwd_travel_db_travel_t_resume_train`')
travel_postings_df = spark.sql('SELECT travel_id,topic,city,low_price FROM `dwd_travel`.`dwd_travel_db_spider_t_travel_train`  ')


# 合并用户画像特征为一个向量列
assembler = VectorAssembler(inputCols=user_profile_df.columns[1:], outputCol="features")
user_profile_df = assembler.transform(user_profile_df)

# 合并景点信息特征为一个向量列
assembler = VectorAssembler(inputCols=travel_postings_df.columns[1:], outputCol="features")
travel_postings_df = assembler.transform(travel_postings_df)
# 标准化向量列
minmax = MinMaxScaler(inputCol="features", outputCol="travel_features_norm")
minmax_model=minmax.fit(travel_postings_df)

travel_postings_df =minmax_model.transform(travel_postings_df)
minmax =MinMaxScaler(inputCol="features", outputCol="user_features_norm")
minmax_model=minmax.fit(travel_postings_df)
user_profile_df = minmax_model.transform(user_profile_df)

# # 获取用户画像向量和景点信息特征向量的笛卡尔积
cartesian_df = user_profile_df.crossJoin(travel_postings_df)


# # 计算相似度
cartesian_df = cartesian_df.withColumn("similarity",weighted_euclidean_distance_udf(cartesian_df['user_features_norm'],cartesian_df['travel_features_norm']) )

# # 显示相似度计算结果，可以根据需要进行进一步筛选和排序
cartesian_df.orderBy("similarity", ascending=False).show()

# # 假设筛选条件为相似度大于0.9的用户-信息对
filtered_df = cartesian_df.filter("similarity> 0.7")
# # 根据相似度值进行降序排序
sorted_df = filtered_df.orderBy("similarity", ascending=False)


from pyspark.ml.recommendation import ALS
rating_matrix_df=sorted_df.selectExpr('user_id','travel_id','similarity')
rating_matrix_df.show()
# 创建ALS模型实例
als = ALS(userCol="user_id", itemCol="travel_id", ratingCol="similarity", coldStartStrategy="drop",implicitPrefs=True,maxIter=10,regParam=0.01)

# 拆分数据集为训练集和测试集
(training_data, test_data) = rating_matrix_df.randomSplit([0.8, 0.2])

# 训练ALS模型
model = als.fit(training_data)

from pyspark.ml.evaluation import RegressionEvaluator
# 使用测试集评估模型
predictions = model.transform(test_data)

# 创建 RegressionEvaluator 评估器
evaluator = RegressionEvaluator(labelCol="similarity", predictionCol="prediction", metricName="rmse")
# 计算 RMSE
rmse = evaluator.evaluate(predictions)
# 输出评估结果
print("Root Mean Squared Error (RMSE):", rmse)
df=model.recommendForAllUsers(50)
df.createOrReplaceTempView('recommendForAllUsers')

spark.sql('INSERT  OVERWRITE table ads_travel.ads_travel_db_travel_t_recommendforallusers  SELECT user_id,to_json(recommendations) FROM recommendForAllUsers')
MYSQL_PARAMS = {
        'host': '10.8.16.253',
        'port': 3306,
        'user': 'root',
        'password': 'fiang123',
        'charset': 'utf8',
        'db': 'travel',
        'table':'recommendforallusers'
    }
df2=spark.sql('SELECT * FROM ads_travel.ads_travel_db_travel_t_recommendforallusers')
df2.write.format('jdbc') \
        .mode('overwrite') \
        .option('url',
                f"jdbc:mysql://{MYSQL_PARAMS.get('host')}:{MYSQL_PARAMS.get('port')}/{MYSQL_PARAMS.get('db')}?useSSL=false&useUnicode=true") \
        .option('dbtable', MYSQL_PARAMS.get('table')) \
        .option('user', MYSQL_PARAMS.get('user')) \
        .option('driver', 'com.mysql.jdbc.Driver') \
        .option('password', MYSQL_PARAMS.get('password')) \
        .save()
