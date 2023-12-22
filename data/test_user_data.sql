INSERT INTO `travel`.`user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `name`, `birth`, `genderCode`, `genderTranslation`, `phone`, `photo`, `init`, `last_update`, `resume_id`) VALUES (1, 'pbkdf2_sha256$260000$R8vGws1zEFAPVTqDlX517K$ndi59BtPgKB6SrE4TNaXnYXpeV9VYzTB7X9w+dj/Po4=', NULL, 1, 'root', '', '', '854771076@qq.com', 1, 1, '2023-10-20 09:37:58.835221', NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-10-20 09:37:58.957336', 1);
INSERT INTO `travel`.`user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `name`, `birth`, `genderCode`, `genderTranslation`, `phone`, `photo`, `init`, `last_update`, `resume_id`) VALUES (2, 'pbkdf2_sha256$260000$R8vGws1zEFAPVTqDlX517K$ndi59BtPgKB6SrE4TNaXnYXpeV9VYzTB7X9w+dj/Po4=', NULL, 1, 'JF100000', '', '', '2910226625@qq.com', 1, 1, '2023-10-20 09:37:58.835221', NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-10-20 09:37:58.957336', 2);
INSERT INTO `travel`.`user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `name`, `birth`, `genderCode`, `genderTranslation`, `phone`, `photo`, `init`, `last_update`, `resume_id`) VALUES (3, 'pbkdf2_sha256$260000$R8vGws1zEFAPVTqDlX517K$ndi59BtPgKB6SrE4TNaXnYXpeV9VYzTB7X9w+dj/Po4=', NULL, 1, 'JF100001', '', '', 'fuyang854771076@gmail.com', 1, 1, '2023-10-20 09:37:58.835221', NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-10-20 09:37:58.957336', 3);

INSERT INTO `travel`.`resume` (`id`, `city1`, `city1Translation`, `city2`, `city2Translation`, `city3`, `city3Translation`, `topic`, `topicTranslation`, `low_price`, `high_price`, `created_time`, `last_update`, `user_id`) VALUES (1, 1, '石家庄', 3, '邯郸', 7, '廊坊', 3, '人文古迹', 30, 180, '2023-12-22 13:03:49.000000', '2023-12-22 13:03:55.000000', 1);
INSERT INTO `travel`.`resume` (`id`, `city1`, `city1Translation`, `city2`, `city2Translation`, `city3`, `city3Translation`, `topic`, `topicTranslation`, `low_price`, `high_price`, `created_time`, `last_update`, `user_id`) VALUES (2, 11, '衡水', 10, '沧州', 7, '廊坊', 4, '主题乐园', 100, 280, '2023-12-22 13:03:49.000000', '2023-12-22 13:03:55.000000', 2);
INSERT INTO `travel`.`resume` (`id`, `city1`, `city1Translation`, `city2`, `city2Translation`, `city3`, `city3Translation`, `topic`, `topicTranslation`, `low_price`, `high_price`, `created_time`, `last_update`, `user_id`) VALUES (3, 1, '石家庄', 5, '秦皇岛', 4, '张家口', 10, '展览展馆', 100, 580, '2023-12-22 13:03:49.000000', '2023-12-22 13:03:55.000000', 3);


INSERT INTO `star` (`create_time`, `travel_id`, `user_id`) VALUES ( '2023-10-23 17:45:03', 1, 1);
INSERT INTO `star` ( `create_time`, `travel_id`, `user_id`) VALUES ('2023-10-23 17:45:03', 2, 1);
INSERT INTO `star` ( `create_time`, `travel_id`, `user_id`) VALUES ('2023-10-23 17:45:03', 3, 1);
INSERT INTO `star` ( `create_time`, `travel_id`, `user_id`) VALUES ('2023-10-23 17:45:03', 4, 1);
INSERT INTO `star` ( `create_time`, `travel_id`, `user_id`) VALUES ('2023-10-23 17:45:03', 2, 2);
INSERT INTO `star` ( `create_time`, `travel_id`, `user_id`) VALUES ('2023-10-23 17:45:03', 44, 2);
INSERT INTO `star` ( `create_time`, `travel_id`, `user_id`) VALUES ('2023-10-23 17:45:03', 55, 2);
INSERT INTO `star` ( `create_time`, `travel_id`, `user_id`) VALUES ('2023-10-23 17:45:03', 66, 2);
INSERT INTO `star` ( `create_time`, `travel_id`, `user_id`) VALUES ('2023-10-23 17:45:03', 2, 3);
INSERT INTO `star` ( `create_time`, `travel_id`, `user_id`) VALUES ('2023-10-23 17:45:03', 23, 3);
INSERT INTO `star` ( `create_time`, `travel_id`, `user_id`) VALUES ('2023-10-23 17:45:03', 25, 3);
INSERT INTO `star` ( `create_time`, `travel_id`, `user_id`) VALUES ('2023-10-23 17:45:03', 26, 3);


INSERT INTO `click` (`count`, `create_time`,  `user_id`,`travel_id`, `last_update`) VALUES ( 10, '2023-10-27 09:17:18.000000', 1, 1, '2023-10-27 09:17:27.000000');
INSERT INTO `click` (`count`, `create_time`, `user_id`, `travel_id`, `last_update`) VALUES ( 10, '2023-10-27 09:17:18.000000', 1, 2, '2023-10-27 09:17:27.000000');
INSERT INTO `click` (`count`, `create_time`,  `user_id`,`travel_id`,  `last_update`) VALUES ( 10, '2023-10-27 09:17:18.000000', 1, 3, '2023-10-27 09:17:27.000000');
INSERT INTO `click` (`count`, `create_time`,  `user_id`,`travel_id`,  `last_update`) VALUES ( 10, '2023-10-27 09:17:18.000000', 1, 4, '2023-10-27 09:17:27.000000');

INSERT INTO `click` (`count`, `create_time`,  `user_id`,`travel_id`,`last_update`) VALUES ( 10, '2023-10-27 09:17:18.000000', 2, 11, '2023-10-27 09:17:27.000000');
INSERT INTO `click` (`count`, `create_time`, `user_id`, `travel_id`, `last_update`) VALUES ( 10, '2023-10-27 09:17:18.000000', 2, 12, '2023-10-27 09:17:27.000000');
INSERT INTO `click` (`count`, `create_time`,  `user_id`,`travel_id`, `last_update`) VALUES ( 10, '2023-10-27 09:17:18.000000', 2, 13, '2023-10-27 09:17:27.000000');
INSERT INTO `click` (`count`, `create_time`,  `user_id`,`travel_id`, `last_update`) VALUES ( 10, '2023-10-27 09:17:18.000000', 2, 14, '2023-10-27 09:17:27.000000');

INSERT INTO `click` (`count`, `create_time`,  `user_id`,`travel_id`, `last_update`) VALUES ( 10, '2023-10-27 09:17:18.000000', 3, 21, '2023-10-27 09:17:27.000000');
INSERT INTO `click` (`count`, `create_time`,  `user_id`,`travel_id`, `last_update`) VALUES ( 10, '2023-10-27 09:17:18.000000', 3, 22, '2023-10-27 09:17:27.000000');
INSERT INTO `click` (`count`, `create_time`,  `user_id`,`travel_id`,  `last_update`) VALUES ( 10, '2023-10-27 09:17:18.000000', 3, 23, '2023-10-27 09:17:27.000000');
INSERT INTO `click` (`count`, `create_time`, `user_id`, `travel_id`,  `last_update`) VALUES ( 10, '2023-10-27 09:17:18.000000', 3, 24, '2023-10-27 09:17:27.000000');