
create database dwd_travel;
CREATE TABLE `dwd_travel`.`dwd_travel_db_spider_t_travel`(
  `id` int,
  `name` string,
  `topic` int,
  `topicTranslation` string,
  `low_price` float,
  `high_price` float,
  `address` string,
  `city` int,
  `cityTranslation` string,
  `url` string,
  `img` string,
  `create_time` timestamp
  )
PARTITIONED BY (partition_date string);


CREATE TABLE `dwd_travel`.`dwd_travel_db_travel_t_hottravel`(	
  `id` string, 	
  `weight` bigint
  )	PARTITIONED BY (partition_date string);

-- 用户浏览数据加工
-- 用户收藏数据加工，1收藏相当于10点击
select travel_id,click_num from
(select *, 
row_number() over (distribute by travel_id sort by last_update DESC ) as rank ,
sum(`count`) over (PARTITION by travel_id) as click_num
from `ods_travel`.`ods_travel_db_travel_t_clicktravel`) t1
where t1.rank = 1 
UNION ALL
select travel_id,count(*)*10 as star_num_weight from ods_travel.ods_travel_db_travel_t_startravel group by travel_id;

-- 处理travel
select 
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
Case when
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
from ods_travel.ods_travel_db_spider_t_travel

CREATE TABLE `dwd_travel`.`dwd_travel_db_travel_t_resume` (
  `id` string,
  `city1` int,
  `city1Translation` string,
  `city2` int,
  `city2Translation` string,
  `city3` int,
  `city3Translation` string,
  `topic` int,
  `topicTranslation` string,
  `low_price` float,
  `high_price` float,
  `created_time` timestamp,
  `last_update` timestamp,
  `user_id` int,
  `cdc_sync_date` timestamp
) PARTITIONED BY (partition_date string)



-- 获取最新简历到dwd
select 
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
where t1.rank = 1


create TABLE `dwd_travel`.`dwd_travel_db_travel_t_resume_train`(
  `user_id` int,
  `topic` int,
  `city` int,
  `low_price` int,
  `high_price` int
)
select user_id, 
if(topic is not null,topic,0) as topic, 
(if(city1 is not null,city1,0)+if(city2 is not null,city2,if(city1 is not null,city1,0))+if(city3  is not null,city3,if(city1  is not null,city1,0))) as city, 
if(low_price  is not null,low_price,0) as low_price, 
if(high_price  is not null,high_price,0) as high_price
from dwd_travel.dwd_travel_db_travel_t_resume


create TABLE `dwd_travel`.`dwd_travel_db_spider_t_travel_train`(
  `travel_id` int,
  `topic` int,
  `city` int,
  `low_price` int,
  `high_price` int
)
SELECT id as travel_id,topic, city*3 as city, low_price,high_price FROM dwd_travel.dwd_travel_db_spider_t_travel