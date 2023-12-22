create database ods_travel;

CREATE TABLE `ods_travel`.`ods_travel_db_spider_t_travel` (
  `id` string,
  `name` string,
  `topic` string,
  `low_price` string,
  `high_price` string,
  `address` string,
  `city` string,
  `url` string,
  `img` string,
  `create_time` timestamp,
  `cdc_sync_date` timestamp
) PARTITIONED BY (partition_date string);

CREATE TABLE `ods_travel`.`ods_travel_db_travel_t_resume` (
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
) PARTITIONED BY (partition_date string);

CREATE TABLE `ods_travel`.`ods_travel_db_travel_t_clicktravel` (
  `cid` string,
  `count` int,
  `created_time` timestamp,
  `last_update` timestamp,
  `travel_id` int,
  `user_id` int,
  `cdc_sync_date` timestamp
) PARTITIONED BY (partition_date string);

CREATE TABLE `ods_travel`.`ods_travel_db_travel_t_startravel` (
  `sid` string,
  `created_time` timestamp,
  `travel_id` int,
  `user_id` int,
  `cdc_sync_date` timestamp
) PARTITIONED BY (partition_date string);