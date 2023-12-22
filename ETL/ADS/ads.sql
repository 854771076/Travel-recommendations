create database ads_travel;
create TABLE `ads_travel`.`ads_travel_db_travel_t_recommendforallusers`(
  `user_id` int,
  `recommendations` string
)
create TABLE `ads_travel`.`ads_travel_db_travel_t_hottravel_TOP20`(
  `id` int,
  `weight` bigint
)PARTITIONED BY (partition_date string);
select CAST(id as int) as id,sum(weight) as weight from dwd_travel.dwd_travel_db_travel_t_hottravel group by id order by weight desc limit 20