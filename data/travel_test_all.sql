/*
 Navicat Premium Data Transfer

 Source Server         : 10.8.16.253
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26-log)
 Source Host           : 10.8.16.253:3306
 Source Schema         : travel

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26-log)
 File Encoding         : 65001

 Date: 26/12/2023 16:24:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add 景点热门列表', 6, 'add_hot_top20');
INSERT INTO `auth_permission` VALUES (22, 'Can change 景点热门列表', 6, 'change_hot_top20');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 景点热门列表', 6, 'delete_hot_top20');
INSERT INTO `auth_permission` VALUES (24, 'Can view 景点热门列表', 6, 'view_hot_top20');
INSERT INTO `auth_permission` VALUES (25, 'Can add 用户推荐列表', 7, 'add_recommendforallusers');
INSERT INTO `auth_permission` VALUES (26, 'Can change 用户推荐列表', 7, 'change_recommendforallusers');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 用户推荐列表', 7, 'delete_recommendforallusers');
INSERT INTO `auth_permission` VALUES (28, 'Can view 用户推荐列表', 7, 'view_recommendforallusers');
INSERT INTO `auth_permission` VALUES (29, 'Can add 景区列表', 8, 'add_travel');
INSERT INTO `auth_permission` VALUES (30, 'Can change 景区列表', 8, 'change_travel');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 景区列表', 8, 'delete_travel');
INSERT INTO `auth_permission` VALUES (32, 'Can view 景区列表', 8, 'view_travel');
INSERT INTO `auth_permission` VALUES (33, 'Can add 用户信息', 9, 'add_user');
INSERT INTO `auth_permission` VALUES (34, 'Can change 用户信息', 9, 'change_user');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 用户信息', 9, 'delete_user');
INSERT INTO `auth_permission` VALUES (36, 'Can view 用户信息', 9, 'view_user');
INSERT INTO `auth_permission` VALUES (37, 'Can add 用户画像信息', 10, 'add_userresume');
INSERT INTO `auth_permission` VALUES (38, 'Can change 用户画像信息', 10, 'change_userresume');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 用户画像信息', 10, 'delete_userresume');
INSERT INTO `auth_permission` VALUES (40, 'Can view 用户画像信息', 10, 'view_userresume');
INSERT INTO `auth_permission` VALUES (41, 'Can add 收藏列表', 11, 'add_startravel');
INSERT INTO `auth_permission` VALUES (42, 'Can change 收藏列表', 11, 'change_startravel');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 收藏列表', 11, 'delete_startravel');
INSERT INTO `auth_permission` VALUES (44, 'Can view 收藏列表', 11, 'view_startravel');
INSERT INTO `auth_permission` VALUES (45, 'Can add 操作日志', 12, 'add_logs');
INSERT INTO `auth_permission` VALUES (46, 'Can change 操作日志', 12, 'change_logs');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 操作日志', 12, 'delete_logs');
INSERT INTO `auth_permission` VALUES (48, 'Can view 操作日志', 12, 'view_logs');
INSERT INTO `auth_permission` VALUES (49, 'Can add 浏览列表', 13, 'add_clicktravel');
INSERT INTO `auth_permission` VALUES (50, 'Can change 浏览列表', 13, 'change_clicktravel');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 浏览列表', 13, 'delete_clicktravel');
INSERT INTO `auth_permission` VALUES (52, 'Can view 浏览列表', 13, 'view_clicktravel');
INSERT INTO `auth_permission` VALUES (53, 'Can add 评论列表', 14, 'add_commenttravel');
INSERT INTO `auth_permission` VALUES (54, 'Can change 评论列表', 14, 'change_commenttravel');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 评论列表', 14, 'delete_commenttravel');
INSERT INTO `auth_permission` VALUES (56, 'Can view 评论列表', 14, 'view_commenttravel');

-- ----------------------------
-- Table structure for click
-- ----------------------------
DROP TABLE IF EXISTS `click`;
CREATE TABLE `click`  (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  `travel_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `click_travel_id_c59b75a9`(`travel_id`) USING BTREE,
  INDEX `click_user_id_43946bc8`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of click
-- ----------------------------
INSERT INTO `click` VALUES (1, 10, '2023-10-27 09:17:18.000000', '2023-10-27 09:17:27.000000', 1, 1);
INSERT INTO `click` VALUES (2, 10, '2023-10-27 09:17:18.000000', '2023-10-27 09:17:27.000000', 2, 1);
INSERT INTO `click` VALUES (3, 10, '2023-10-27 09:17:18.000000', '2023-10-27 09:17:27.000000', 3, 1);
INSERT INTO `click` VALUES (4, 10, '2023-10-27 09:17:18.000000', '2023-10-27 09:17:27.000000', 4, 1);
INSERT INTO `click` VALUES (5, 10, '2023-10-27 09:17:18.000000', '2023-10-27 09:17:27.000000', 11, 2);
INSERT INTO `click` VALUES (6, 10, '2023-10-27 09:17:18.000000', '2023-10-27 09:17:27.000000', 12, 2);
INSERT INTO `click` VALUES (7, 10, '2023-10-27 09:17:18.000000', '2023-10-27 09:17:27.000000', 13, 2);
INSERT INTO `click` VALUES (8, 10, '2023-10-27 09:17:18.000000', '2023-10-27 09:17:27.000000', 14, 2);
INSERT INTO `click` VALUES (9, 10, '2023-10-27 09:17:18.000000', '2023-10-27 09:17:27.000000', 21, 3);
INSERT INTO `click` VALUES (10, 10, '2023-10-27 09:17:18.000000', '2023-10-27 09:17:27.000000', 22, 3);
INSERT INTO `click` VALUES (11, 10, '2023-10-27 09:17:18.000000', '2023-10-27 09:17:27.000000', 23, 3);
INSERT INTO `click` VALUES (12, 10, '2023-10-27 09:17:18.000000', '2023-10-27 09:17:27.000000', 24, 3);
INSERT INTO `click` VALUES (13, 2, '2023-12-24 23:56:35.924081', '2023-12-24 23:56:35.924081', 22, 1);
INSERT INTO `click` VALUES (14, 2, '2023-12-24 23:57:26.133199', '2023-12-24 23:57:26.133199', 21, 1);
INSERT INTO `click` VALUES (15, 5, '2023-12-25 00:11:10.831976', '2023-12-25 00:11:10.832974', 87, 1);
INSERT INTO `click` VALUES (16, 22, '2023-12-25 00:49:23.651928', '2023-12-25 00:49:23.651928', 97, 1);
INSERT INTO `click` VALUES (17, 6, '2023-12-25 00:55:24.925170', '2023-12-25 00:55:24.925690', 82, 1);
INSERT INTO `click` VALUES (18, 35, '2023-12-25 01:04:21.403857', '2023-12-25 01:04:21.403857', 308, 1);
INSERT INTO `click` VALUES (19, 2, '2023-12-25 13:28:55.077673', '2023-12-25 13:28:55.077673', 7, 1);
INSERT INTO `click` VALUES (20, 2, '2023-12-25 13:32:17.331301', '2023-12-25 13:32:17.331301', 293, 1);
INSERT INTO `click` VALUES (21, 3, '2023-12-26 14:37:01.554953', '2023-12-26 14:37:01.554953', 78, 1);
INSERT INTO `click` VALUES (22, 2, '2023-12-26 15:09:56.480905', '2023-12-26 15:09:56.480905', 74, 1);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `travel_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `comment_travel_id_8827a855`(`travel_id`) USING BTREE,
  INDEX `comment_user_id_2224f9d1`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 'good', '2023-12-25 02:00:03.690132', 308, 1);
INSERT INTO `comment` VALUES (2, 'nice', '2023-12-25 02:01:56.367115', 308, 1);
INSERT INTO `comment` VALUES (3, '666', '2023-12-25 02:14:41.410386', 308, 1);
INSERT INTO `comment` VALUES (4, 'test', '2023-12-25 02:15:47.455980', 308, 1);
INSERT INTO `comment` VALUES (5, '111', '2023-12-26 14:23:09.650781', 97, 1);
INSERT INTO `comment` VALUES (6, '666', '2023-12-26 14:23:14.696790', 97, 1);
INSERT INTO `comment` VALUES (7, '666', '2023-12-26 14:23:24.010760', 97, 1);
INSERT INTO `comment` VALUES (8, '888', '2023-12-26 14:26:23.219560', 97, 1);
INSERT INTO `comment` VALUES (9, '999', '2023-12-26 14:30:22.794803', 97, 1);
INSERT INTO `comment` VALUES (10, '555', '2023-12-26 14:30:41.818070', 97, 1);
INSERT INTO `comment` VALUES (11, '555', '2023-12-26 14:31:11.642409', 97, 1);
INSERT INTO `comment` VALUES (12, '666', '2023-12-26 14:31:46.665410', 97, 1);
INSERT INTO `comment` VALUES (13, '777', '2023-12-26 14:31:58.081587', 97, 1);
INSERT INTO `comment` VALUES (14, '777', '2023-12-26 14:32:01.530148', 97, 1);
INSERT INTO `comment` VALUES (15, '888', '2023-12-26 14:32:46.195029', 97, 1);
INSERT INTO `comment` VALUES (16, '111', '2023-12-26 14:33:59.010065', 82, 1);
INSERT INTO `comment` VALUES (17, '222', '2023-12-26 14:36:27.297373', 82, 1);
INSERT INTO `comment` VALUES (18, '999', '2023-12-26 14:36:50.042325', 97, 1);
INSERT INTO `comment` VALUES (19, '111', '2023-12-26 14:37:03.697716', 78, 1);
INSERT INTO `comment` VALUES (20, '111', '2023-12-26 15:09:59.441495', 74, 1);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (6, 'api', 'hot_top20');
INSERT INTO `django_content_type` VALUES (7, 'api', 'recommendforallusers');
INSERT INTO `django_content_type` VALUES (8, 'api', 'travel');
INSERT INTO `django_content_type` VALUES (9, 'api', 'user');
INSERT INTO `django_content_type` VALUES (10, 'api', 'userresume');
INSERT INTO `django_content_type` VALUES (11, 'api', 'startravel');
INSERT INTO `django_content_type` VALUES (12, 'api', 'logs');
INSERT INTO `django_content_type` VALUES (13, 'api', 'clicktravel');
INSERT INTO `django_content_type` VALUES (14, 'api', 'commenttravel');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2023-12-22 12:47:24.902355');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2023-12-22 12:47:24.920307');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2023-12-22 12:47:24.978850');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2023-12-22 12:47:24.987825');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2023-12-22 12:47:24.991814');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2023-12-22 12:47:24.994806');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2023-12-22 12:47:24.998796');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2023-12-22 12:47:24.999793');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2023-12-22 12:47:25.003782');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2023-12-22 12:47:25.006774');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2023-12-22 12:47:25.010764');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2023-12-22 12:47:25.019740');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2023-12-22 12:47:25.023729');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2023-12-22 12:47:25.026721');
INSERT INTO `django_migrations` VALUES (15, 'api', '0001_initial', '2023-12-22 12:47:25.210810');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2023-12-22 12:47:25.237738');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2023-12-22 12:47:25.245717');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2023-12-22 12:47:25.253738');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2023-12-22 12:47:25.267701');
INSERT INTO `django_migrations` VALUES (20, 'api', '0002_auto_20231222_1253', '2023-12-22 12:53:42.362356');
INSERT INTO `django_migrations` VALUES (21, 'api', '0003_user_resume_id', '2023-12-22 13:01:35.514322');
INSERT INTO `django_migrations` VALUES (22, 'api', '0004_commenttravel', '2023-12-25 01:58:19.905386');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('ktofbwtefku9axjo1i7ba7iphk92fbmo', '.eJzFVk1vozAQ_SsV5yjxBzYmx73vL1gqNDameMtHZPDuocp_L1N6aEqARpXS04jxzPN7bwbES5RDGKo89NbnroiOEY12H3MazLNt8aD4C-1TtzddO3in91iyfz_t97-7wta_3msvACroK-wm2hpLGOWEaCpBJ5IZmnLCkkRIqUjKNGUAWsuSKsq5iGMhmZIipkCURtDGtqEfsf68ZFELjc2i40MWZVlIBFNjkIwn-KSBYoiJzKLdWNEguR6rNzrj0mKnJLKcOoOvp9IDFI1r4eQOKOownWpvoTA-NPor4DNabrQSa9tQ1-fdw43ULrofMWNdgQlKCNuESwTXYxDElDfo9rYPjf0B9Rt017zgm-CSAz4pLsiiem9N14z7V5Sdh7pGM_of8GFGdU15fAVOCi4RQJjlSfcD-MHDP1vfReGM0pomcQVAaRO_BQ2LmqbpDXeUNWO1Jkte86WIcdlVatSyrNqZ53vO6jOnNVHJlMj_W_dUDZgklwX02g1S4g0J0emtn3JiizGkwqpPOEvuVd2QD92JkS96t8Ft601e57fmZLpslOAcMDCK81RKLi_LTXvyPa0b5Fa0UjLbGnpphjo_jj8DvWtOtQ0uZ4RxypiMjoMP9vwK0q60-Q:1rI2e2:mnzJJd3AOqMvR0AZReUu7krJoCbjgp8_cGAemNL3VyU', '2024-01-09 16:18:34.097443');

-- ----------------------------
-- Table structure for hot_top20
-- ----------------------------
DROP TABLE IF EXISTS `hot_top20`;
CREATE TABLE `hot_top20`  (
  `id` int(11) NULL DEFAULT NULL,
  `weight` bigint(20) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of hot_top20
-- ----------------------------
INSERT INTO `hot_top20` VALUES (82, 2);
INSERT INTO `hot_top20` VALUES (87, 5);
INSERT INTO `hot_top20` VALUES (66, 10);
INSERT INTO `hot_top20` VALUES (44, 10);
INSERT INTO `hot_top20` VALUES (25, 10);
INSERT INTO `hot_top20` VALUES (55, 10);
INSERT INTO `hot_top20` VALUES (26, 10);
INSERT INTO `hot_top20` VALUES (14, 10);
INSERT INTO `hot_top20` VALUES (13, 10);
INSERT INTO `hot_top20` VALUES (12, 10);
INSERT INTO `hot_top20` VALUES (24, 10);
INSERT INTO `hot_top20` VALUES (11, 10);
INSERT INTO `hot_top20` VALUES (21, 12);
INSERT INTO `hot_top20` VALUES (4, 20);
INSERT INTO `hot_top20` VALUES (1, 20);
INSERT INTO `hot_top20` VALUES (23, 20);
INSERT INTO `hot_top20` VALUES (3, 20);
INSERT INTO `hot_top20` VALUES (22, 22);
INSERT INTO `hot_top20` VALUES (308, 35);
INSERT INTO `hot_top20` VALUES (2, 40);

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `lid` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`lid`) USING BTREE,
  INDEX `logs_user_id_237f5f83_fk_user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for recommendforallusers
-- ----------------------------
DROP TABLE IF EXISTS `recommendforallusers`;
CREATE TABLE `recommendforallusers`  (
  `user_id` int(11) NULL DEFAULT NULL,
  `recommendations` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommendforallusers
-- ----------------------------
INSERT INTO `recommendforallusers` VALUES (1, '[{\"travel_id\":2,\"rating\":0.99658465},{\"travel_id\":4,\"rating\":0.9961312},{\"travel_id\":65,\"rating\":0.995355},{\"travel_id\":87,\"rating\":0.9952245},{\"travel_id\":80,\"rating\":0.99522036},{\"travel_id\":18,\"rating\":0.9952196},{\"travel_id\":48,\"rating\":0.99521893},{\"travel_id\":94,\"rating\":0.9952173},{\"travel_id\":89,\"rating\":0.9952173},{\"travel_id\":86,\"rating\":0.9951407},{\"travel_id\":23,\"rating\":0.9951405},{\"travel_id\":71,\"rating\":0.9951395},{\"travel_id\":68,\"rating\":0.9951376},{\"travel_id\":70,\"rating\":0.9951113},{\"travel_id\":19,\"rating\":0.9950876},{\"travel_id\":57,\"rating\":0.9950271},{\"travel_id\":20,\"rating\":0.9950209},{\"travel_id\":32,\"rating\":0.9950205},{\"travel_id\":64,\"rating\":0.9950199},{\"travel_id\":45,\"rating\":0.9950168},{\"travel_id\":13,\"rating\":0.99501663},{\"travel_id\":25,\"rating\":0.995015},{\"travel_id\":33,\"rating\":0.9950134},{\"travel_id\":15,\"rating\":0.9950134},{\"travel_id\":52,\"rating\":0.995013},{\"travel_id\":30,\"rating\":0.99501276},{\"travel_id\":26,\"rating\":0.99501085},{\"travel_id\":14,\"rating\":0.994984},{\"travel_id\":38,\"rating\":0.99496293},{\"travel_id\":59,\"rating\":0.99496245},{\"travel_id\":1,\"rating\":0.9949621},{\"travel_id\":97,\"rating\":0.9949612},{\"travel_id\":76,\"rating\":0.9949612},{\"travel_id\":56,\"rating\":0.99495816},{\"travel_id\":78,\"rating\":0.9949427},{\"travel_id\":24,\"rating\":0.9949293},{\"travel_id\":82,\"rating\":0.9948787},{\"travel_id\":53,\"rating\":0.9948787},{\"travel_id\":66,\"rating\":0.99487835},{\"travel_id\":100,\"rating\":0.99487764},{\"travel_id\":69,\"rating\":0.9948771},{\"travel_id\":28,\"rating\":0.994877},{\"travel_id\":98,\"rating\":0.9948693},{\"travel_id\":73,\"rating\":0.99484295},{\"travel_id\":93,\"rating\":0.9948279},{\"travel_id\":12,\"rating\":0.9948259},{\"travel_id\":29,\"rating\":0.9947961},{\"travel_id\":217,\"rating\":0.994789},{\"travel_id\":152,\"rating\":0.994789},{\"travel_id\":99,\"rating\":0.994789}]');
INSERT INTO `recommendforallusers` VALUES (2, '[{\"travel_id\":102,\"rating\":0.9970788},{\"travel_id\":91,\"rating\":0.9969546},{\"travel_id\":22,\"rating\":0.9965855},{\"travel_id\":46,\"rating\":0.99646425},{\"travel_id\":95,\"rating\":0.99632156},{\"travel_id\":79,\"rating\":0.99616903},{\"travel_id\":61,\"rating\":0.9960441},{\"travel_id\":49,\"rating\":0.9960441},{\"travel_id\":55,\"rating\":0.9960415},{\"travel_id\":36,\"rating\":0.9960197},{\"travel_id\":16,\"rating\":0.99600387},{\"travel_id\":21,\"rating\":0.9959582},{\"travel_id\":34,\"rating\":0.9959067},{\"travel_id\":292,\"rating\":0.99582493},{\"travel_id\":42,\"rating\":0.99582064},{\"travel_id\":272,\"rating\":0.9958204},{\"travel_id\":169,\"rating\":0.9958195},{\"travel_id\":212,\"rating\":0.9958192},{\"travel_id\":220,\"rating\":0.9958155},{\"travel_id\":171,\"rating\":0.9958155},{\"travel_id\":197,\"rating\":0.9958152},{\"travel_id\":167,\"rating\":0.995812},{\"travel_id\":135,\"rating\":0.995812},{\"travel_id\":239,\"rating\":0.9958115},{\"travel_id\":114,\"rating\":0.99580836},{\"travel_id\":151,\"rating\":0.99580693},{\"travel_id\":150,\"rating\":0.99580276},{\"travel_id\":260,\"rating\":0.99579537},{\"travel_id\":60,\"rating\":0.99276173},{\"travel_id\":4,\"rating\":0.9925563},{\"travel_id\":92,\"rating\":0.99254084},{\"travel_id\":27,\"rating\":0.9924884},{\"travel_id\":9,\"rating\":0.99245226},{\"travel_id\":96,\"rating\":0.99241334},{\"travel_id\":93,\"rating\":0.99222875},{\"travel_id\":47,\"rating\":0.99215275},{\"travel_id\":6,\"rating\":0.9921421},{\"travel_id\":37,\"rating\":0.9921386},{\"travel_id\":50,\"rating\":0.9921295},{\"travel_id\":54,\"rating\":0.9921243},{\"travel_id\":74,\"rating\":0.99200326},{\"travel_id\":51,\"rating\":0.991972},{\"travel_id\":75,\"rating\":0.9919683},{\"travel_id\":35,\"rating\":0.991956},{\"travel_id\":12,\"rating\":0.9919438},{\"travel_id\":17,\"rating\":0.9918334},{\"travel_id\":10,\"rating\":0.99172664},{\"travel_id\":88,\"rating\":0.99167085},{\"travel_id\":216,\"rating\":0.99166787},{\"travel_id\":43,\"rating\":0.99165964}]');
INSERT INTO `recommendforallusers` VALUES (3, '[{\"travel_id\":81,\"rating\":0.99687916},{\"travel_id\":90,\"rating\":0.9968002},{\"travel_id\":84,\"rating\":0.99675506},{\"travel_id\":103,\"rating\":0.99662507},{\"travel_id\":58,\"rating\":0.9964245},{\"travel_id\":8,\"rating\":0.99639446},{\"travel_id\":91,\"rating\":0.99226767},{\"travel_id\":102,\"rating\":0.9920634},{\"travel_id\":2,\"rating\":0.99108624},{\"travel_id\":4,\"rating\":0.9859094},{\"travel_id\":22,\"rating\":0.0015199333},{\"travel_id\":46,\"rating\":0.0015197396},{\"travel_id\":95,\"rating\":0.0015195459},{\"travel_id\":79,\"rating\":0.0015193},{\"travel_id\":55,\"rating\":0.0015191138},{\"travel_id\":61,\"rating\":0.0015191063},{\"travel_id\":49,\"rating\":0.0015191063},{\"travel_id\":16,\"rating\":0.0015190616},{\"travel_id\":36,\"rating\":0.0015190542},{\"travel_id\":21,\"rating\":0.0015189722},{\"travel_id\":34,\"rating\":0.0015189201},{\"travel_id\":169,\"rating\":0.0015187785},{\"travel_id\":292,\"rating\":0.001518771},{\"travel_id\":272,\"rating\":0.001518771},{\"travel_id\":212,\"rating\":0.001518771},{\"travel_id\":197,\"rating\":0.001518771},{\"travel_id\":167,\"rating\":0.001518771},{\"travel_id\":135,\"rating\":0.001518771},{\"travel_id\":42,\"rating\":0.0015187636},{\"travel_id\":151,\"rating\":0.0015187562},{\"travel_id\":239,\"rating\":0.0015187487},{\"travel_id\":220,\"rating\":0.0015187487},{\"travel_id\":171,\"rating\":0.0015187487},{\"travel_id\":260,\"rating\":0.0015187338},{\"travel_id\":150,\"rating\":0.0015187338},{\"travel_id\":114,\"rating\":0.0015187338},{\"travel_id\":60,\"rating\":7.3873997E-4},{\"travel_id\":92,\"rating\":7.386431E-4},{\"travel_id\":27,\"rating\":7.3850155E-4},{\"travel_id\":9,\"rating\":7.384941E-4},{\"travel_id\":47,\"rating\":7.3832273E-4},{\"travel_id\":96,\"rating\":7.382855E-4},{\"travel_id\":54,\"rating\":7.382706E-4},{\"travel_id\":50,\"rating\":7.382706E-4},{\"travel_id\":93,\"rating\":7.380694E-4},{\"travel_id\":37,\"rating\":7.3804706E-4},{\"travel_id\":74,\"rating\":7.380396E-4},{\"travel_id\":6,\"rating\":7.380396E-4},{\"travel_id\":51,\"rating\":7.380247E-4},{\"travel_id\":35,\"rating\":7.379651E-4}]');

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city1` int(11) NULL DEFAULT NULL,
  `city1Translation` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `city2` int(11) NULL DEFAULT NULL,
  `city2Translation` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `city3` int(11) NULL DEFAULT NULL,
  `city3Translation` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `topic` bigint(20) NULL DEFAULT NULL,
  `topicTranslation` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `low_price` double NULL DEFAULT NULL,
  `high_price` double NULL DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES (1, 0, '不限', 5, '秦皇岛', 4, '张家口', 4, '主题乐园', 30, 180, '2023-12-22 13:03:49.000000', '2023-12-25 13:51:05.979853', 1);
INSERT INTO `resume` VALUES (2, 11, '衡水', 10, '沧州', 7, '廊坊', 4, '主题乐园', 100, 280, '2023-12-22 13:03:49.000000', '2023-12-22 13:03:55.000000', 2);
INSERT INTO `resume` VALUES (3, 1, '石家庄', 5, '秦皇岛', 4, '张家口', 10, '展览展馆', 100, 580, '2023-12-22 13:03:49.000000', '2023-12-22 13:03:55.000000', 3);

-- ----------------------------
-- Table structure for star
-- ----------------------------
DROP TABLE IF EXISTS `star`;
CREATE TABLE `star`  (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `travel_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `star_travel_id_edf5f396`(`travel_id`) USING BTREE,
  INDEX `star_user_id_30b629e4`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of star
-- ----------------------------
INSERT INTO `star` VALUES (1, '2023-10-23 17:45:03.000000', 1, 1);
INSERT INTO `star` VALUES (2, '2023-10-23 17:45:03.000000', 2, 1);
INSERT INTO `star` VALUES (3, '2023-10-23 17:45:03.000000', 3, 1);
INSERT INTO `star` VALUES (4, '2023-10-23 17:45:03.000000', 4, 1);
INSERT INTO `star` VALUES (5, '2023-10-23 17:45:03.000000', 2, 2);
INSERT INTO `star` VALUES (6, '2023-10-23 17:45:03.000000', 44, 2);
INSERT INTO `star` VALUES (7, '2023-10-23 17:45:03.000000', 55, 2);
INSERT INTO `star` VALUES (8, '2023-10-23 17:45:03.000000', 66, 2);
INSERT INTO `star` VALUES (9, '2023-10-23 17:45:03.000000', 2, 3);
INSERT INTO `star` VALUES (10, '2023-10-23 17:45:03.000000', 23, 3);
INSERT INTO `star` VALUES (11, '2023-10-23 17:45:03.000000', 25, 3);
INSERT INTO `star` VALUES (12, '2023-10-23 17:45:03.000000', 26, 3);
INSERT INTO `star` VALUES (13, '2023-12-24 23:56:45.715656', 22, 1);
INSERT INTO `star` VALUES (14, '2023-12-25 13:32:19.333587', 293, 1);

-- ----------------------------
-- Table structure for travel
-- ----------------------------
DROP TABLE IF EXISTS `travel`;
CREATE TABLE `travel`  (
  `id` int(11) NULL DEFAULT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `topic` int(11) NULL DEFAULT NULL,
  `topicTranslation` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `low_price` float NULL DEFAULT NULL,
  `high_price` float NULL DEFAULT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `city` int(11) NULL DEFAULT NULL,
  `cityTranslation` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `url` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `img` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of travel
-- ----------------------------
INSERT INTO `travel` VALUES (311, '名人世纪3D艺术蜡像馆(绿溪谷店)', 0, NULL, 19.9, 359, '河北省保定市竞秀区阳光北大街2121号', 2, '保定', 'http://ticket.lvmama.com/scenic-10904162', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/1012765/395e1a4305264fd8591838a91d1a15d8_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (310, '兴芮温泉会馆', 0, NULL, 50, 50, '河北省保定市徐水县高林村镇郎五庄村大午温泉城', 2, '保定', 'http://ticket.lvmama.com/scenic-10915509', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/1039872/13e4b879ae605ce1df10bae023b9ad94_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (309, '泥河湾温泉生态城', 0, NULL, 98, 98, '河北省张家口市阳原县三马坊乡澡洗塘村（在三马坊温泉...', 4, '张家口', 'http://ticket.lvmama.com/scenic-10925158', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/1071849/912df39c7bd02d4563fadc9923bafefd_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (307, '正定冰雪嘉年华', 0, NULL, 36, 65, '河北省石家庄市正定县长乐门西南侧正定冰雪嘉年华', 1, '石家庄', 'http://ticket.lvmama.com/scenic-11340997', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/1585835/e6bf26de545a5f5dee9a7bfc326ea515_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (308, '萌宠奇缘', 0, NULL, 125, 166, '石家庄市新华区中华大街联盟路交口南行100米路西荣...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-11327556', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/1569184/d689762bacec066be94a4fe3860fcf01_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (306, '石家庄市动物园', 0, NULL, 50, 249, '河北石家庄鹿泉市向阳南大街——石家庄市动物园', 0, '河北', 'http://ticket.lvmama.com/scenic-160407', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/172388/4247507ecf74e0bd381676712f03584e_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (305, '公主号游船', 0, NULL, 9, 9, '河北省秦皇岛市海港区南山街56号', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-100517', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/181726/855b83266b98eaab3bd0882fa11d54c1_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (304, '秦皇岛浅水湾浴场', 0, NULL, 45, 50, '河北省秦皇岛市北戴河区滨海大道中段', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-100400', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/181819/faaff5aea6a4e461920fa911a37e0eb3_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (303, '山海关王家大院', 0, NULL, 9, 9, '河北省秦皇岛市山海关古城东三条29号', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-161662', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/182013/0f2bcf671fb322c100d016475857b803_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (302, '荣国府与宁荣街', 0, NULL, 88, 88, '河北省石家庄市正定县兴荣路51号', 1, '石家庄', 'http://ticket.lvmama.com/scenic-101979', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/182138/7a2108b35b071b1b21fe6bba53274d16_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (301, '祖山景区', 0, NULL, 9, 9, '河北省秦皇岛市青龙满族自治县祖山镇', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-101827', 'http://pic.lvmama.com/uploads/pc/place2/2019-08-28/3d8c02b1-61f8-42c6-9834-59db65337361_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (300, '角山长城景区', 0, NULL, 40, 300, '河北省秦皇岛市山海关城北', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-101817', 'http://pic.lvmama.com/uploads/pc/place2/2016-06-15/aa6e9046-42f8-477e-84b4-2dc50bb769cf_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (299, '老龙头', 0, NULL, 400, 400, '河北省秦皇岛市山海关区老龙头路1号', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-101813', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/182228/6279715f373dfc51c6f5b5624911a1c3_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (298, '天门山', 0, NULL, 50, 60, '河北省承德市宽城满族自治县孟子岭乡南天门村5组', 6, '承德', 'http://ticket.lvmama.com/scenic-101803', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/182235/8376e7abd1d9569b126b1b5c45eed417_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (297, '山叶口景区', 0, NULL, 60, 60, '河北省迁安市大五里乡山叶口村', 9, '唐山', 'http://ticket.lvmama.com/scenic-157140', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/182410/c6166904fdf349ab59df089128aa3d88_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (296, '狼牙山', 0, NULL, 9, 9, '河北省保定市易县狼牙山镇东西水村', 2, '保定', 'http://ticket.lvmama.com/scenic-101499', 'http://pic.lvmama.com/uploads/pc/place2/2017-03-22/1524fc70-386a-47e1-9336-0b961d36178a_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (295, '吴桥杂技大世界', 0, NULL, 108.39, 220, '河北省沧州市吴桥县京福路1号', 10, '沧州', 'http://ticket.lvmama.com/scenic-102937', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/182523/1dc8807ba529ec0ad6691284f47702ac_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (294, '山海关古城景区', 0, NULL, 15, 15, '河北省秦皇岛市山海关区东大街1号', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-102957', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/182564/5e4510c65f2398fc55772d98e111aa6c_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (293, '秦皇古道', 0, NULL, 20, 20, '河北省石家庄市井陉县城东北4公里', 1, '石家庄', 'http://ticket.lvmama.com/scenic-106787', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/182609/ac8c150ad74f9a5bb19af4928cf4e447_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (292, '抱犊寨', 0, NULL, 7, 7, '河北省石家庄市西的鹿泉市城西', 1, '石家庄', 'http://ticket.lvmama.com/scenic-162204', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/183045/e5802fc7e1b7438c775cc262d1bf1d7d_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (291, '九龙峡', 0, NULL, 55, 78, '河北省邢台市浆水镇营房台村', 8, '邢台', 'http://ticket.lvmama.com/scenic-158020', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/183117/b6037349b5fc202adfe75646412ea476_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (290, '大型室内史诗演出《长城》', 0, NULL, 7, 7, '河北省秦皇岛市山海关城南5公里处', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-157999', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/234882/7e334da3ffff18bcea159e7e4d584e07_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (289, '太行五指山滑雪场', 0, NULL, 68, 69.9, '河北省邯郸市涉县河南店镇南庄村', 3, '邯郸', 'http://ticket.lvmama.com/scenic-158031', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/236134/8863088cdd26ac7baf37b5ea5fb2fafb_180_120.jpg', '2023-12-25 10:41:07');
INSERT INTO `travel` VALUES (288, '河北鸡鸣山旅游景区', 0, NULL, 27, 27, '河北省张家口市下花园区鸡鸣山旅游景区', 4, '张家口', 'http://ticket.lvmama.com/scenic-158051', 'http://pic.lvmama.com/uploads/pc/place2/2014-11-06/1415271107590_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (286, '娲皇宫', 0, NULL, 68, 68, '河北省邯郸市涉县索堡', 3, '邯郸', 'http://ticket.lvmama.com/scenic-100599', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/248317/273687ae2a0baa1466bca2ee8c005323_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (287, '邢台天梯山景区', 0, NULL, 10, 10, '河北省邢台市西东牛庄', 8, '邢台', 'http://ticket.lvmama.com/scenic-101923', 'http://pic.lvmama.com/uploads/pc/place2/2014-10-28/1414486101459_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (284, '魁星楼', 0, NULL, 200, 200, '河北省承德市双桥区环城南路', 6, '承德', 'http://ticket.lvmama.com/scenic-101763', 'http://pic.lvmama.com/uploads/pc/place2/2015-08-26/c17301cd-2a38-48b9-9d10-603519d2ba73_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (285, '京娘湖', 0, NULL, 80, 105, '河北省邯郸市武安市西北部山区的口上村北', 3, '邯郸', 'http://ticket.lvmama.com/scenic-100221', 'http://pic.lvmama.com/uploads/pc/place2/2017-05-16/35a5e319-d0d0-47d9-94ad-7bea4070fb8d_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (283, '嶂石岩', 0, NULL, 99, 102.8, '河北省石家庄市赞皇县嶂石岩乡嶂石岩村', 1, '石家庄', 'http://ticket.lvmama.com/scenic-103675', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/251091/847a5db873b78ec050dccc2fb868b379_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (282, '邢台大峡谷', 0, NULL, 48, 48, '河北省邢台县西南路罗镇贺家坪村', 8, '邢台', 'http://ticket.lvmama.com/scenic-102148', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/252184/372d88d2cfad961dfe3ec49641208b96_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (281, '封龙山', 0, NULL, 20, 20, '河北省石家庄市元氏县和鹿泉市境内。', 1, '石家庄', 'http://ticket.lvmama.com/scenic-101815', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/252431/4a7e481f0fb3edf6d1cd87fa4e9deffd_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (280, '正定隆兴寺', 0, NULL, 9, 9, '河北省石家庄市正定县中山东路109号', 1, '石家庄', 'http://ticket.lvmama.com/scenic-102866', 'http://pic.lvmama.com/uploads/pc/place2/2017-05-15/8d658b71-a3c0-4e8e-b251-73de930b63f3_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (279, '九峰山', 0, NULL, 20, 40, '河北省邯郸市涉县九峰山', 0, '河北', 'http://ticket.lvmama.com/scenic-160087', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/254016/01ecd5fda93c41410a87479fd30a4f15_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (278, '驼梁风景区', 0, NULL, 16, 16, '河北省平山县驼梁景区管理委员会（平山县合河口乡前大...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-100659', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/254031/412a004560d2e214bef2b7248e61996c_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (275, '禅林寺古银杏风景园', 0, NULL, 43.9, 43.9, '河北省遵化市东北侯家寨乡', 9, '唐山', 'http://ticket.lvmama.com/scenic-101960', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/254403/74c18ce9e00c8ff223b9bc28d2121944_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (276, '磬锤峰国家森林公园', 0, NULL, 9, 25, '河北省承德市承德县普乐北路东侧', 6, '承德', 'http://ticket.lvmama.com/scenic-100571', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/254115/c1cc1bea03b7f131f29f9c9cbb016c09_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (277, '塞罕坝国家森林公园', 0, NULL, 10, 10, '河北省承德市围场满族蒙古族自治县北部', 6, '承德', 'http://ticket.lvmama.com/scenic-100559', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/254097/a97f36979972a5e83177bd5a33b9fc80_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (274, '双塔山', 0, NULL, 200, 200, '河北省承德市双滦区双塔山镇', 6, '承德', 'http://ticket.lvmama.com/scenic-101776', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/254470/0c7001a615808060cb54492686e6da1f_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (273, '中国爱情山（邢台天河山）', 0, NULL, 9, 9, '河北省邢台县白岸乡清泉村（邢左公路西行65公里）天...', 8, '邢台', 'http://ticket.lvmama.com/scenic-161126', 'http://pic.lvmama.com/uploads/pc/place2/2015-09-02/52bebecd-770d-4ad1-bab4-d0d05cd9de56_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (272, '武华山', 0, NULL, 7, 7, '河北武安市西北52公里的活水乡后柏坡村南', 3, '邯郸', 'http://ticket.lvmama.com/scenic-158048', 'http://pic.lvmama.com/uploads/pc/place2/158048/1372061581454_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (271, '武安长寿村', 0, NULL, 9, 9, '河北省武安市活水乡长寿村', 3, '邯郸', 'http://ticket.lvmama.com/scenic-158029', 'http://pic.lvmama.com/uploads/pc/place2/158029/1371808229618_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (269, '菩提岛', 0, NULL, 9, 9, '河北省唐山市乐亭县渤海湾', 9, '唐山', 'http://ticket.lvmama.com/scenic-102152', 'http://pic.lvmama.com/uploads/pc/place2/2015-06-18/694cf9d5-1200-4ada-81c1-27a20efc7f18_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (270, '地球科学博物院', 0, NULL, 7, 7, '河北邯郸市磁县台城乡（邯郸机场门口西行3000米）', 0, '河北', 'http://ticket.lvmama.com/scenic-159934', 'http://pic.lvmama.com/uploads/pc/place2/160139/1393050911894_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (268, '赵云庙', 0, NULL, 10, 10, '河北省石家庄市正定县兴荣路东头(近正定县科技馆)', 1, '石家庄', 'http://ticket.lvmama.com/scenic-105492', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/256284/01f5431942a24991a81226e05affebd2_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (267, '鸡鸣驿古城', 0, NULL, 36, 36, '河北省张家口市怀来县鸡鸣驿乡鸡鸣驿村', 4, '张家口', 'http://ticket.lvmama.com/scenic-157924', 'http://pic.lvmama.com/uploads/pc/place2/2015-07-14/285b1bad-5ad0-4e97-b5ca-970a69045245_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (265, '圣井岗', 0, NULL, 7, 7, '河北省邯郸市', 3, '邯郸', 'http://ticket.lvmama.com/scenic-158073', 'http://pic.lvmama.com/uploads/pc/place2/158073/1372148051874_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (266, '邺城铜雀三台遗址公园', 0, NULL, 7, 7, '河北省邯郸市临漳县香菜营乡', 3, '邯郸', 'http://ticket.lvmama.com/scenic-158069', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/256712/881668ea34085c7ad125047c301ebc70_180_120.jpg', '2023-12-25 10:41:06');
INSERT INTO `travel` VALUES (264, '扁鹊庙', 0, NULL, 10, 10, '河北省邢台市内丘县', 8, '邢台', 'http://ticket.lvmama.com/scenic-158036', 'http://pic.lvmama.com/uploads/pc/place2/158036/1372054655235_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (263, '邢台紫金山', 0, NULL, 30, 30, '河北省邢台县白岸乡前坪村', 8, '邢台', 'http://ticket.lvmama.com/scenic-179043', 'http://pic.lvmama.com/uploads/pc/place2/2014-11-10/1415619317642_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (262, '佛山滑雪滑草乐园', 0, NULL, 35, 55, '河北省邯郸市永年区广府大街西头佛山景区', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12208919', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2592287/d097061a53cd49b1cb7260c12f420ab5_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (260, '赵王欢乐城', 0, NULL, 6.8, 29.9, '邯郸市广平县广安路东湖公园', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12212981', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2607218/bde835c061b35366c8f3f7635383ccc4_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (261, '正迪欢乐世界', 0, NULL, 30, 30, '河北省保定市南市区裕华西路264号,直隶总督署对面', 2, '保定', 'http://ticket.lvmama.com/scenic-101513', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2607097/7e72af5e635fc9fead532d45f9289f52_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (259, '保定市动物园', 0, NULL, 10, 10, '保定市保定莲池区永华南大街688号', 2, '保定', 'http://ticket.lvmama.com/scenic-12213725', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2608073/c8b9e53570562902197c444362a51130_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (257, '傍水崖风景区', 0, NULL, 49, 49, '秦皇岛市海港区石门寨镇北未庄村', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-12214172', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2608716/3a99dbb4e9d3551fd3e190ed63ad7d9e_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (258, '天河山', 0, NULL, 64, 70, '河北省邢台市白岸乡清泉村', 8, '邢台', 'http://ticket.lvmama.com/scenic-108023', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2608348/95d09d17a1e3b8012063816740abc52f_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (256, '中国马镇舞马世界主题乐园', 0, NULL, 10, 10, '河北省承德市丰宁县大滩镇向北6公里', 6, '承德', 'http://ticket.lvmama.com/scenic-10821831', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2608744/5e2c6a20cc507de8c7184ac38440bcf7_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (255, '天保那苏图草原旅游度假区', 0, NULL, 7, 7, '张家口市-张北县-张北镇', 4, '张家口', 'http://ticket.lvmama.com/scenic-12214202', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2608754/eef28a9ddef7780378763c2fc7c6b8bc_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (254, '中华三祖圣地黄帝城遗址文化旅游区', 0, NULL, 57, 118, '张家口市涿鹿县矾山镇', 4, '张家口', 'http://ticket.lvmama.com/scenic-12214283', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2608858/faf5c7396c38d5ff179e1448676e2079_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (253, '仙人峪景区', 0, NULL, 28, 28, '保定市涞源县城西15公里处', 2, '保定', 'http://ticket.lvmama.com/scenic-12214320', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2608903/83cbd1582540d79c2629d08dd06ad85e_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (252, '清风峡风景区', 0, NULL, 39.9, 99, '石家庄市平山县北冶乡清风村东南', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12215060', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2609859/b48851c1e5a8b058f92b8a74c4674932_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (251, '紫云山松果乐园', 0, NULL, 7, 7, '秦皇岛市海港区民族北路西（紫云山滑雪场）', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-12215135', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2609946/4fdba006f2647b667f7e4288737312b4_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (250, '南戴河', 0, NULL, 117.5, 237, '河北省秦皇岛市沿海公路', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-10632741', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2610503/9b3a912ed8f3a187ea658421b2825af2_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (249, '金水湾温泉度假村', 0, NULL, 85.1, 88, '河北省承德市隆化县七家镇温泉村', 6, '承德', 'http://ticket.lvmama.com/scenic-10689753', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2610559/22db2e7bb0d41e43fffbdffacb7a0ca0_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (248, '邯郸朱山乐园', 0, NULL, 52, 52, '邯郸市永年县合会镇吴庄村村北', 3, '邯郸', 'http://ticket.lvmama.com/scenic-178949', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611188/dab004223f7febee76859957edd0d380_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (247, '霸州名泉温泉酒店温泉', 0, NULL, 69.9, 128, '廊坊市霸州市金各庄兴华北路', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12216230', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611201/c76b89eda89f600899a0aa9ed62390f1_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (246, '渔岛菲奢尔海景温泉', 0, NULL, 99, 99, '秦皇岛市北戴河新区赤洋口片区滨海新大道D4段东侧渔...', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-12216335', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611332/5c38741f8a6e99b4f2f163fa18abe4de_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (244, '瑞阁温泉酒店温泉中心', 0, NULL, 139, 397, NULL, 7, '廊坊', 'http://ticket.lvmama.com/scenic-12216366', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611398/35b359ed8e1a989f2ea8e9aa860b1a5f_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (245, '法米动物园', 0, NULL, 98, 128, '石家庄市长安区建设北大街38号蜂巢购物中心7楼', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12216380', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611389/507a75e6da2329f6e8a50616e944a781_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (243, '杨露禅故居', 0, NULL, 10, 10, '邯郸市永年区广府专线', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12216558', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611623/8ca89aebe904e66f84ad267de4d48b37_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (242, '净觉寺', 0, NULL, 19.9, 19.9, '唐山市玉田县蛮子营村东', 9, '唐山', 'http://ticket.lvmama.com/scenic-12216857', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611951/c0e80ed27a1b01e07ec94629a10f7e52_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (241, '邯郸园博园', 0, NULL, 7, 7, '邯郸市复兴区建设北大街519号', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12217066', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612175/350d0221082f9262c47f216baddf03c6_180_120.jpg', '2023-12-25 10:41:05');
INSERT INTO `travel` VALUES (240, '趣太空？航天科技体验馆', 0, NULL, 19.9, 109.9, '石家庄市长安区东大街3号国际科技博览活动中心三楼', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12217465', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612627/13fa0ba8550e374ba4c9087971e7ead2_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (239, '冀南山底抗日地道遗址', 0, NULL, 20, 74, '邯郸市峰峰矿区义井镇山底村', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12217801', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612982/ffec95bfa5a2a4b8bf12675f8623c54d_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (238, '福宝乐园', 0, NULL, 35.9, 35.9, '石家庄市正定县正定镇塔元庄村塔元庄乡村振兴示范园西...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12217923', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2613111/5e5537d7941c8e3a94823ebc89251cfc_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (237, '无极山滑雪场', 0, NULL, 59.9, 1899, '石家庄市元氏县苏村乡岳庄庄西南', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12217973', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2613163/62d7a953d94c6c58a820b4ee09ea5f36_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (236, '七山滑雪度假区', 0, NULL, 117, 3280, '保定市涞源县白石山镇西龙虎村', 2, '保定', 'http://ticket.lvmama.com/scenic-12217994', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2613186/79bef7c6a42d3bcbbd723df428533f9c_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (235, '御水湾天然温泉', 0, NULL, 9.9, 395, '秦皇岛市青龙满族自治县温泉村', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-12218183', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2613379/a369af2aabb673409f8b29d96e03f4a9_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (234, '南高基滑雪场', 0, NULL, 20, 189, '石家庄市新华区月牙路南高基公园', 1, '石家庄', 'http://ticket.lvmama.com/scenic-174657', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2614414/4a25002744c4c826a6c713b303cdfa33_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (233, '张家口达华建国酒店温泉', 0, NULL, 58, 58, '张家口市涿鹿县矾山镇张家口达华建国酒店', 4, '张家口', 'http://ticket.lvmama.com/scenic-12218858', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2614772/a61a248f346546a5a5b09dfa35a8dd47_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (231, '正定古城樱花小镇', 0, NULL, 60, 100, '石家庄市正定县吴兴村', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12218891', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2614816/a06e3a3e2dd6c67fbc3573a74ed872a0_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (232, '定州黄家营葡萄酒庄', 0, NULL, 9.9, 9.9, '保定市定州市东亭镇382省道东胜生态园内', 2, '保定', 'http://ticket.lvmama.com/scenic-12218873', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2614794/534952849f95ef949218d879f04a4631_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (230, '安远庙', 0, NULL, 50, 50, '河北省承德市双桥区避暑山庄东北', 6, '承德', 'http://ticket.lvmama.com/scenic-170161', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2614982/ceec10bcb3bf492dd12b23cb9d0a9121_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (229, '云花溪谷景区', 0, NULL, 7, 7, '河北省保定市阜平县面盆村', 2, '保定', 'http://ticket.lvmama.com/scenic-12248033', 'http://pic.lvmama.com/uploads/pc/place2/2022-04-24/9e041444-52d6-4d49-9624-8644d0d72715_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (228, '园博动物园', 0, NULL, 45, 110, '河北省邯郸市复兴区齐村牌坊北侧', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12263703', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2616582/25d1e1019b44974df90847a0de447821_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (227, '绿溪谷风景区', 0, NULL, 50, 50, '承德市兴隆县南天门乡南天门村', 6, '承德', 'http://ticket.lvmama.com/scenic-12281926', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2617557/db6c19171d70e1462d3e1516dda47b88_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (226, '黄金沙滩', 0, NULL, 29.9, 49.9, '石家庄市正定县滹沱河叶子广场(南岸)', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12281943', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2617564/86c9da1beb7dbfda5d8e0c55a65cfd70_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (225, '渔渡一号海上休闲渔业平台', 0, NULL, 59, 59, '河北省秦皇岛市东港路120号', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-12283281', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2617747/84e7d58c20a7543a3fe00cb5bc89a5cc_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (224, '御龙河公园', 0, NULL, 9.9, 198, '河北省廊坊市安次区杨税务镇安铭道', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12285618', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2617769/445d86cdd9cfacef7f9590dcdafff4b2_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (223, '小火车主题乐园', 0, NULL, 29.9, 68, '河北省唐山市开平区唐山花海北区南二门3号智慧生活馆', 9, '唐山', 'http://ticket.lvmama.com/scenic-12294693', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2617958/531a5b62bfceb53416c204e890f2a566_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (222, '天域温泉庄园', 0, NULL, 55, 55, '承德市隆化县七家镇天域温泉', 6, '承德', 'http://ticket.lvmama.com/scenic-12306331', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2618280/e02f46000862c3df6920436f84645b36_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (221, '抱香谷', 0, NULL, 38, 40, '河北省邢台市信都区龙泉寺乡北和庄村村北', 8, '邢台', 'http://ticket.lvmama.com/scenic-12354705', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2619292/d8fd468a6c108f8a4897a19320500699_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (220, '骞海沐悦温泉', 0, NULL, 29.9, 46, '张家口市宣化区皇城桥路皇城大厦三楼', 4, '张家口', 'http://ticket.lvmama.com/scenic-12363107', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2619844/5c2e14ab6a398c31ef9c67acdd89ad49_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (219, '天梯山冰雪乐园', 0, NULL, 75, 95, '河北省邢台市信都区抗大路天梯山景区对面', 8, '邢台', 'http://ticket.lvmama.com/scenic-12363123', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2619863/4aa7e51f5d92f452bf0708a278e98571_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (218, '金山岭国际滑雪场', 0, NULL, 169, 899, '河北省承德市滦平县长山峪镇金山岭国际滑雪旅游度假区', 6, '承德', 'http://ticket.lvmama.com/scenic-12363209', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2619953/4fcab978fa4c91b1f1cbdf1d74e7e63d_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (217, '南和嘉年华主题乐园', 0, NULL, 19.9, 19.9, '邢台市南和区s325与中兴东大街交叉口，距南和农业...', 8, '邢台', 'http://ticket.lvmama.com/scenic-12363244', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2619991/d7846c82802c597b1eb78e5d1fa64137_180_120.jpg', '2023-12-25 10:41:04');
INSERT INTO `travel` VALUES (216, '新绎农场冰雪嘉年华', 0, NULL, 19.9, 19.9, '刘其营乡恒山南路', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12363402', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2620416/79f5ed3a141d29fd0daea6f0e87573b3_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (215, '糖汇漫生活', 0, NULL, 39, 89, '河北省唐山市路北区大里北路280号', 9, '唐山', 'http://ticket.lvmama.com/scenic-12364939', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2621149/c86acc16ba7877b6f33bebb31dba9de0_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (214, '北极童话雪乡', 0, NULL, 15, 15, '石家庄市中华北大街与学府路交口东行200米路南（经...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12365131', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2621406/c09679e26fa813542c53bf2015332e25_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (213, '周公山', 0, NULL, 45, 60, '邢台市邢台县路罗镇桃树坪村西北', 8, '邢台', 'http://ticket.lvmama.com/scenic-12365155', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2621431/268b2484ad9bf1cf57663692f43c7b1b_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (211, '秦皇岛市玻璃博物馆', 0, NULL, 7, 7, '秦皇岛市海港区文化路44号', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-12365843', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2622066/a8a71e9c8190a588dedaeca35e465c53_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (212, '碹窑艺术小镇', 0, NULL, 25, 25, '河北省张家口市怀安县怀安第六屯乡常家沟村', 4, '张家口', 'http://ticket.lvmama.com/scenic-12365797', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2621995/febd296d8c61d6b36dc3d8be74500e24_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (210, '乱刀峪', 0, NULL, 35, 35, '河北省秦皇岛市抚宁区大新寨镇大石窟村乱刀峪景区', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-174241', 'http://pic.lvmama.com/uploads/pc/place2/2022-07-21/4f53c4a0-6e1b-4c91-bdbe-906fa849c8b7_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (209, '康都水汇', 0, NULL, 29.9, 39.9, '河北省邯郸市成安县聚良大道35号', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12435807', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2622464/09ac86555678b50c0d844990e16c30e1_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (208, '青青牧场', 0, NULL, 199, 199, '河北省保定市涞源县白石山镇菜村岗村', 2, '保定', 'http://ticket.lvmama.com/scenic-12435828', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2622495/bef558303742b1b5d37ac354fa0c3298_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (207, '嗨熊猫亲子乐园', 0, NULL, 19.9, 33, '河北省邢台市信都区邢和公路和抗大路交叉口南侧', 8, '邢台', 'http://ticket.lvmama.com/scenic-12435830', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2622497/84361f3b28d45a134341747e4e2e4f85_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (206, '圣托里尼·蓝顶海景温泉', 0, NULL, 39.9, 40, '河北省秦皇岛市海港区东港路2号菲拉休闲旅游度假区院...', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-12435847', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2622520/e5f17d1e812701fbcba327e91e6f17ca_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (205, '赵王印象城', 0, NULL, 19.9, 88, '邯郸市广平镇赵王路', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12435976', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2622687/7cf7874298fe6ef6aef1f76db7835282_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (204, '事竞成滑雪场', 0, NULL, 9.9, 9.9, '沧州市在沧县纸房头乡周庄子村北', 10, '沧州', 'http://ticket.lvmama.com/scenic-12435999', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2623122/0c07e21d6d08f939a4e9044bc761d184_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (203, '万龙度假天堂', 0, NULL, 479, 1409, '张家口市崇礼区红花梁', 4, '张家口', 'http://ticket.lvmama.com/scenic-12436004', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2623126/6349dc10a871fad37eaa88863cf18b9f_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (202, '郊野公园秦皇岛园海洋馆', 0, NULL, 42, 119, '河北省雄安新区容城郊野公园云塘东路1号', 2, '保定', 'http://ticket.lvmama.com/scenic-12436038', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2623193/aa20776818ad27daafa7c3643e14e319_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (201, '长果乐园', 0, NULL, 10, 39.9, '河北省石家庄市新乐市木刀沟生态园区东侧', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12436088', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2623263/b8a0a49261f800fadfda027ddd278557_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (200, '万清绿水汤泉生活馆', 0, NULL, 28.8, 129, '河北省唐山市路北区北新西道159号', 9, '唐山', 'http://ticket.lvmama.com/scenic-12436293', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2623528/bf60e2bc39b4ccc61a2e5278e03e25bf_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (199, '澜湾水汇', 0, NULL, 59, 59, '河北省廊坊市大城县正大街9号帝景花园底商', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12436308', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2623546/842028c9e55b4933d79c18e57da4a7af_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (198, '避暑山庄博物馆', 0, NULL, 200, 200, '河北省承德市双滦区避暑山庄园内', 6, '承德', 'http://ticket.lvmama.com/scenic-12436325', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2623560/4453163aa5f6bf12ca1100c2262d1ced_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (197, '石洞酒海洞藏酒基地', 0, NULL, 5.9, 11.8, '石家庄市井陉县吴家窑乡石佛村', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12436329', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2623564/6832a8be9fdb5c276a950fcb5477380c_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (195, '觅道31号营地', 0, NULL, 35, 49.9, '河北省石家庄市灵寿县北洼乡觅道31号营地', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12436366', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2623603/027c4ea5eb8419b9ff98a5c8517f4f79_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (196, '杉林部落', 0, NULL, 49.9, 49.9, '河北省保定市涿州市东城坊镇中国农业大学涿州教学实验...', 2, '保定', 'http://ticket.lvmama.com/scenic-12436357', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2623594/b78d9106a2e5dcb736b9cda8a30dd0f4_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (194, '瀑河欢乐世界', 0, NULL, 28, 71, '河北省保定市徐水区朝阳大街瀑河欢乐世界', 2, '保定', 'http://ticket.lvmama.com/scenic-12436605', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2623931/417a075965bc2db79af9477758ab8f0d_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (193, '郊野活力小镇', 0, NULL, 39.9, 109, '河北省保定市容城县郊野公园云塘东路2-1号八于乡雄...', 2, '保定', 'http://ticket.lvmama.com/scenic-12436658', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2624014/7e9b7b2ed6fa56e3d134c1ee0413b129_180_120.jpg', '2023-12-25 10:41:03');
INSERT INTO `travel` VALUES (192, '大境门景区', 0, NULL, 12, 12, '张家口市桥西区明德北路与正沟街交叉口', 4, '张家口', 'http://ticket.lvmama.com/scenic-12436687', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2624064/df86679da33ef0bb2a3754032b5a293c_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (191, '响堂山风景区', 0, NULL, 56, 60, '河北省邯郸市峰峰矿区和村镇响堂山风景区', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12436714', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2624116/449d5e53644d839343810ed1e9ae9c75_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (190, '吉吉萌宠王国', 0, NULL, 39, 799, '河北省秦皇岛市海港区太阳城新天地广场二楼', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-12436821', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2624303/5a1d49c3b2e616205daf1f98305c2dba_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (189, '福豪水汇', 0, NULL, 39, 39, '河北省承德市双滦区元宝山大街9号维利多得酒店院内西...', 6, '承德', 'http://ticket.lvmama.com/scenic-12436858', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2624363/2724086d299bfad25c942553ae45e575_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (188, '张家口市清河影视基地', 0, NULL, 18, 35, '张家口市桥西区东窑子镇清河村退役军人服务站东北侧2...', 4, '张家口', 'http://ticket.lvmama.com/scenic-12436912', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2624477/c51d2d213420cc0f687e4a7723750e7d_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (186, '国风·未来', 0, NULL, 58, 199, '河北省石家庄市藁城区滹沱河西湖北岸', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12437042', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2624725/5f2263c5003fba5355a265b3414e8d3d_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (187, '花乐园景区', 0, NULL, 19.9, 19.9, '邢台市沙河市孔渡线', 8, '邢台', 'http://ticket.lvmama.com/scenic-12437027', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2624697/453a107ff4561806e055b8e450a40909_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (185, '忘忧湖萌宠乐园', 0, NULL, 18.9, 18.9, '河北省邢台市内丘县柳林镇杨家庄村村北', 8, '邢台', 'http://ticket.lvmama.com/scenic-12437049', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2624732/a837ff65a129c274a95b3d55502c0de1_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (184, '原木森林亲子农场', 0, NULL, 39.9, 49.9, '河北省涿州市豆庄镇京白路39号屈庄村口路东', 2, '保定', 'http://ticket.lvmama.com/scenic-12437095', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2624843/090f52507c554154f0e92b4aba22bf14_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (183, '南高基七彩滑道', 0, NULL, 10, 10, '南高基公园东北', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12437206', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2625071/0a3305e0a606449f2031c85bb1bbebb8_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (182, '稻梦户外动物乐园', 0, NULL, 298, 298, '河北省石家庄市藁城区藁城区岗上镇小丰村农业观光园', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12437248', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2625153/25d8d871532ae0dcdddab59b6f36872a_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (181, '邢台海洋乐园', 0, NULL, 9, 598, '邢台市襄都区经济开发区东汪镇长安路1288号', 8, '邢台', 'http://ticket.lvmama.com/scenic-12437251', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2625165/17a07dcaa507c9e6dea0ec1f5528ce05_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (180, '风之谷·郊野乐园', 0, NULL, 29.9, 49.9, '河北省石家庄市藁城区岗上村富强大街文明路交叉口东行...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12437270', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2625189/c9d56503fd6ac9f2207e8282e976d213_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (179, '荆东小镇', 0, NULL, 24.9, 34.9, '河北省廊坊市固安县彭村乡荆垡营东村', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12437442', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2625509/3b137b2919948f612a4f6221c3fca524_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (178, '河北骐骥野骑俱乐部', 0, NULL, 29.9, 88, '河北省石家庄市正定县常山陵园往北150米路西', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12437455', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2625526/53f13a86b332bdac6ec79270cdaea3c0_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (177, '尧王古镇', 0, NULL, 9.9, 9.9, '河北省邯郸市邯山区光禄镇尧王庄村', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12437548', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2625754/4c5418ed899a03a11e1d14878f1f3b04_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (176, '五季树主题乐园', 0, NULL, 9.9, 19.9, '河北省廊坊市广阳区采留线九州镇小伍龙村', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12437558', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2625773/5fb01c44ab43dfece6939f580edff44f_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (174, '半亩方塘', 0, NULL, 29, 69, '唐山市丰南区景政路7号', 9, '唐山', 'http://ticket.lvmama.com/scenic-12437632', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2625920/5e245336368cdb742223c78e7c379f65_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (175, '林栖谷森林康养度假区', 0, NULL, 78, 248, '河北省廊坊市永清县韩村镇柴庄子村首督路1号', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12437594', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2625853/e0101658da641fa48fda96a4d3cf77ea_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (173, '东玺庄园', 0, NULL, 98, 98, '廊坊市大厂回族自治县夏垫镇北坞四村西', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12437671', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2625998/e7abbb3267c9f0432b6bf5b838a8a068_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (172, '栗精灵创意乐园', 0, NULL, 40, 40, '唐山市迁西县汉儿庄镇杨家峪村', 9, '唐山', 'http://ticket.lvmama.com/scenic-12437677', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2626011/171237f35ebcb79a51c64853e267d6d7_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (171, '草莓里无动力儿童乐园', 0, NULL, 19.9, 29.9, '河北省承德市双滦区偏桥子镇大贵口村山谷驿站草莓里无...', 6, '承德', 'http://ticket.lvmama.com/scenic-12437752', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2626137/baa465c853ce5ae662fa478586218c82_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (170, '大理石长城景区', 0, NULL, 20, 20, '建昌营镇旅游路北110米', 9, '唐山', 'http://ticket.lvmama.com/scenic-12437774', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2626183/af2a90fa86bc99bd7a3eed3c51afc2cb_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (168, '璧山景区', 0, NULL, 24.9, 29.9, '河北省石家庄市井陉县苍岩山镇上坪村村南', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12437820', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2626278/9ad345d04ebf209cf78c53e74f95a73c_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (169, '蒲公英精灵王国', 0, NULL, 39, 39, '河北省石家庄市蒿城区黄石高速东三环岗上村村北', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12437802', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2626233/9ba7d0f0ea541e8468f53db34133aedf_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (167, '阳光乐园', 0, NULL, 26.9, 46.9, '河北省张家口市怀来县甲咀村往东2百米蓝天加油站东侧', 4, '张家口', 'http://ticket.lvmama.com/scenic-12438037', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2626703/a378ee50afb8b5a5932889bc38402940_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (166, '新保安民俗馆', 0, NULL, 25, 25, '河北省张家口市怀来县 新保安镇前进街', 4, '张家口', 'http://ticket.lvmama.com/scenic-12438222', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2627073/d44b9ca946f61fdb79374709f9e9e101_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (165, '河间乐汤汇温泉生活汗蒸馆(沧州红太阳购物广场店)', 0, NULL, 56, 148, '河北省沧州市河间京开北大街把红太阳购物广场五楼', 10, '沧州', 'http://ticket.lvmama.com/scenic-12438245', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2627113/ca9d147259901df77a82e82e77f7a7d6_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (164, '鸭鸭探险岛', 0, NULL, 68, 68, '河北省衡水市桃城区滨湖新区红旗南大街3369号', 11, '衡水', 'http://ticket.lvmama.com/scenic-12438295', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2627218/8362713b38385813a2fe7cfbe9f6594e_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (163, '猪猪亲子乐园', 0, NULL, 56, 56, '河北省秦皇岛市山海关区龙海大道128号', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-12438407', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2627415/a85017cc38d95e3ca159cf4a077c1823_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (162, '鸳鸯湖滑雪场', 0, NULL, 120, 888, '河北省张家口市尚义县南壕堑镇马莲渠', 4, '张家口', 'http://ticket.lvmama.com/scenic-12438449', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2627498/0cb0644894e19e28cdab8aed5b677e32_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (161, '石家庄海洋萌宠探索乐园', 0, NULL, 29.9, 85, '石家庄市新华区联盟街道北二环与泰华街交汇处香格里小...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12438593', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2627784/702ede98923044e3ac133e9bfaaac344_180_120.jpg', '2023-12-25 10:41:02');
INSERT INTO `travel` VALUES (160, '邯郸人工智能教育基地', 0, NULL, 35, 40, '邯郸市邯山区创优路与经三街交叉口西行300米', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12438616', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2627831/c2a219663861faca406085c8a96c1341_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (159, '风屿飞行航空飞行基地', 0, NULL, 150, 898, '石家庄市井陉县S392衡井线', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12438635', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2627876/c59a1d6862b52759a5d2652b54f09e84_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (158, '远村儿童乐园', 0, NULL, 39.9, 59.9, '河北省廊坊市永清县刘街乡月亮海马业东北100米', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12438647', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2627902/14eca022bbf99ccce3d78d1be657fd36_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (156, '广府荷花大观园', 0, NULL, 19.9, 28, '河北省邯郸市永年区广府冰雕艺术馆西南侧120米', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12438727', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2628068/5105e13a8865ff34cd8b5eaca59d46b6_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (157, '渔田休闲渔业俱乐部', 0, NULL, 210, 11500, '北戴河新区中国海监昌黎县大队西侧', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-12438669', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2627963/a136a5576feddd744acd2e9a3c813f20_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (155, '世界葡萄酒之窗', 0, NULL, 30, 30, '河北省张家口市怀来县桑干酒庄斜对面', 4, '张家口', 'http://ticket.lvmama.com/scenic-12438754', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2628110/3fd9387ca477efa616cc78edbf37ee69_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (154, '揽月湾旅游景区', 0, NULL, 9.9, 159, '河北省唐山市曹妃甸区通海路', 9, '唐山', 'http://ticket.lvmama.com/scenic-12438803', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2628176/71a21b9e95b6c09a6cf5ded870331918_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (153, '奥乐奥游乐园', 0, NULL, 9.9, 66, '河北省沧州市海兴县海政路南兴盛街西', 10, '沧州', 'http://ticket.lvmama.com/scenic-12438819', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2628194/c4e71579a1078b63feaebdf71c165560_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (152, '邢襄古镇彩虹乐园', 0, NULL, 19.9, 19.9, '河北省邢台市信都区龙泉寺乡055乡道附近', 8, '邢台', 'http://ticket.lvmama.com/scenic-12438828', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2628214/e6cff21d5c2c91c3e11bfc1bdb69595f_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (151, '十里童话乐园', 0, NULL, 35, 35, '河北省保定市竞秀区北二环与风能街交口西行50米路南...', 2, '保定', 'http://ticket.lvmama.com/scenic-12438923', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2628344/631171f7116aef9a9f01b732faba3d2c_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (149, '垣宇宙探索乐园', 0, NULL, 29.9, 49.9, '河北省石家庄市长安区御城路与建华北大街交叉路口路西...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12439106', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2628630/951a8c6a8fa25879a2ab28cab53d2425_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (150, '响堂山石窟艺术博物馆', 0, NULL, 14, 14, '邯郸市峰峰矿区太行西路12号', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12439049', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2628546/db58422fd4e9c108e9609e26147f36d5_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (148, '东垣遗址公园', 0, NULL, 29.9, 29.9, '石家庄市长安区御城路亲亲家园北侧约150米', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12439159', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2628707/8bb029c69d0655ea89a293ccbaee785a_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (147, '滹沱河艺术生态岛', 0, NULL, 29.9, 29.9, '石家庄市正定县', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12439255', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2628858/84d69c55485a03826a42d5023b516ea5_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (146, '溢泉湖文化公园', 0, NULL, 30, 30, '邯郸市磁县107国道', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12439270', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2628895/ecbf54a37b1c8f40dacf8226418235f4_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (145, '金葫芦乐园', 0, NULL, 49, 49, '河北省唐山市路南区汉沽管理区皂店村干渠路与团结东路...', 9, '唐山', 'http://ticket.lvmama.com/scenic-12439378', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2629056/d32078b373a8f5df5cf3383fe2be6ea7_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (144, '辛玛森林动物乐园', 0, NULL, 24.9, 399, '河北省保定市容城县云塘西路10号雄安郊野公园内', 2, '保定', 'http://ticket.lvmama.com/scenic-12439391', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2629095/eac830bf3eb098317b0198afafecfa31_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (143, '龙海公园', 0, NULL, 1, 100, '曲周县老邯临路与南开街交叉口西南角(近曲周县世纪文...', 3, '邯郸', 'http://ticket.lvmama.com/scenic-174074', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2629358/8523d2b58f8ff240f14354aaecaa17bc_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (141, '悦容公园', 0, NULL, 240, 240, '河北省保定市容城县幸福路与东方道交叉口东北500米', 2, '保定', 'http://ticket.lvmama.com/scenic-12439757', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2629667/ac7f296a8e6a2416190f8937fa30be3c_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (142, '齐盘林山庄', 0, NULL, 350, 350, '河北省唐山市迁安市长城大理石景区附近', 9, '唐山', 'http://ticket.lvmama.com/scenic-12439568', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2629366/2f1cc081bbaf63e520ef7afcc8d13908_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (140, '金湖公园', 0, NULL, 240, 240, '河北省保定市容城县金湖东路与金湖街交叉口西300米', 2, '保定', 'http://ticket.lvmama.com/scenic-12439759', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2629669/fae2a66b5a310f390dc8bbf1197e90f0_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (139, '植物公园', 0, NULL, 9.9, 9.9, '世纪大道北面', 2, '保定', 'http://ticket.lvmama.com/scenic-12439799', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2629750/c4345cd5bfa88ba3838378a339d79871_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (138, '瑞美冰雪大世界', 0, NULL, 20, 50, '迁安市永顺街道滦河文化产业园区黄台湖10号岛', 9, '唐山', 'http://ticket.lvmama.com/scenic-12439853', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2629847/8c5a98824dd81bad327af55d59c8dbd6_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (137, '梵高星空艺术馆(石家庄店)', 0, NULL, 39.9, 39.9, '石家庄市新华区中山西路东购银座商城5楼', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12439864', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2629873/bb57f9c2bc3c7a680f2730ee99273ed5_180_120.jpg', '2023-12-25 10:41:01');
INSERT INTO `travel` VALUES (136, '左转汤泉水上乐园', 0, NULL, 38, 38, '张家口市宣化区顾家营镇左家营村南2号院', 4, '张家口', 'http://ticket.lvmama.com/scenic-12439889', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2629917/5799978eda194bd9ddc21c896b16a31e_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (135, '冶河冰雪乐园', 0, NULL, 9.9, 9.9, '河北省石家庄市平山县平山镇富民北街秀水公园北300...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12439902', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2629937/8762d39fa8b40fa8f16dbbb3d4cd2aed_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (134, '奥峰滑雪场', 0, NULL, 9.9, 19.9, '河北省邢台市邢台县西牛峪村西500米', 8, '邢台', 'http://ticket.lvmama.com/scenic-12439916', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2629962/eb77d32c24e13da5d48253a6bcd30f3b_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (133, '倒流水冰雪水乐园', 0, NULL, 33, 90, '承德市兴隆县挂兰峪镇大鹿圈村鹿圈庄里南200米', 6, '承德', 'http://ticket.lvmama.com/scenic-12439944', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2630014/b3d346c96ddc8639d8d3a1b1c8584f6d_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (131, '乐动儿童益智乐园', 0, NULL, 18, 20.8, '河北省张家口市蔚县政府东50米', 4, '张家口', 'http://ticket.lvmama.com/scenic-12439972', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2630063/0cb4e2c2bd6a7812da2a34aad9c62b91_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (132, '文安鲁能生态旅游度假区', 0, NULL, 50, 50, '河北省廊坊市文安县苏桥镇界围农场', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12439945', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2630018/26e849e85b9eb59237161af25ca616be_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (130, '廊坊澜亭水汇', 0, NULL, 49, 389, '河北省廊坊市广阳区廊万路196号（新东方客运公司东...', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12440002', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2630114/e021149c8aa381bde8f58a32c331166f_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (129, '伯驭体育马术俱乐部', 0, NULL, 18.8, 58.8, '石家庄市长安区滹沱河建设管理处便民服务点西南100...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12440044', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2630184/a1b87adb60def6f8b296e1840d42ab9c_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (128, '同心岛冰雪嘉年华', 0, NULL, 19.9, 29.9, '邢台市信都区守敬南路七里河同心岛', 8, '邢台', 'http://ticket.lvmama.com/scenic-12440079', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2630243/0ef2c25b289cf298297ca36564c86ad7_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (127, '十里雪乡冰雪乐园', 0, NULL, 9.8, 9.8, '石家庄桥西区红旗大街与汇明路交口西南角南行100米...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12440080', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2630244/f9d17532749f0cb3ea6b678d40781f1c_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (126, '塞那都冰雪世界', 0, NULL, 19.9, 19.9, '河北省张家口市张北县小二台乡太子湖', 4, '张家口', 'http://ticket.lvmama.com/scenic-12440083', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2630253/87fcad0df5d312bfc58f668a31f91368_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (125, '悦动格子（廊坊店）', 0, NULL, 109, 109, '广阳区尚品街八区1-1177号', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12440105', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2630290/e7fce9125da46e98649d87dfbfe7f237_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (124, '幻影超人（廊坊店）', 0, NULL, 109, 109, '广阳区尚品街九区1-1181室', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12440110', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2630295/531a5b62bfceb53416c204e890f2a566_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (122, '曲周县冰雪乐园嘉年华', 0, NULL, 19.9, 19.9, '邯郸市曲周县依庄乡依庄中学北200米', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12440122', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2630316/11ca662e10b7ddc1bb26aee32350f031_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (123, '张家口国际冰雪大世界', 0, NULL, 138, 308, '河北省张家口市宣化区柳川河大桥南150米', 4, '张家口', 'http://ticket.lvmama.com/scenic-12440120', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2630314/6ccb64b73168e347005dfade00a5acad_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (121, '圣蓝海洋公园', 0, NULL, 9.8, 29.8, '河北省秦皇岛市昌黎县昌黄路与沿海公路交口东北角', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-10642965', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/447328/7dce63bb1fe544772429057aa9a0a81f_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (120, '石家庄植物园', 0, NULL, 10, 230, '河北省石家庄市新华区植物园街与外环路交叉口北行，近...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-10657886', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/590469/3bf910efd98d27cf2be92c7bb1e294a5_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (119, '艺海假日酒店洗浴中心', 0, NULL, 52, 208, '河北省石家庄市新华区和平西路395号,河北省人民医...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-10660882', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/595693/3792acd37b5e5596edf49ad4f27d0b1e_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (117, '恒河源天桥峪漂流', 0, NULL, 69.9, 69.9, '河北省承德市兴隆县安子岭乡天桥峪村', 6, '承德', 'http://ticket.lvmama.com/scenic-10679121', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/631657/e511dc21f99cc290f7ddfe27bcee3666_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (118, '西部长青金蟾山', 0, NULL, 158, 426, '河北省石家庄市鹿泉市白鹿泉乡梁庄村', 1, '石家庄', 'http://ticket.lvmama.com/scenic-10525616', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/600372/901e9c89b45421400c60283029225bfc_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (116, '锦绣水世界', 0, NULL, 15, 158, '河北省石家庄市正定县中华北大街滹沱河景区云龙大桥河...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-10681279', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/636999/ac2755cfb0cb2f51d04873b9801e52e0_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (115, '白洋淀卓润建国温泉', 0, NULL, 13.8, 58, '河北省保定市雄县白洋淀温泉城旅游路温泉城东500米', 2, '保定', 'http://ticket.lvmama.com/scenic-10684825', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/645910/a97946f0193fba4d792e3c6db91a4064_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (114, '李唐帝江汗蒸水疗中心', 0, NULL, 12, 12, '河北省唐山市路南区南湖体育休闲示范区内', 9, '唐山', 'http://ticket.lvmama.com/scenic-10690462', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/663667/704bb5201d8e927f2f7a8761c64f9ec0_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (113, '六里坪国家森林公园', 0, NULL, 7, 7, '河北省承德市兴隆县（兴隆镇）县城西南15公里', 6, '承德', 'http://ticket.lvmama.com/scenic-174044', 'http://pic.lvmama.com/uploads/pc/place2/2016-05-24/4527507d-c2c3-4e93-b4ab-f9186eb0b88c_180_120.jpg', '2023-12-25 10:41:00');
INSERT INTO `travel` VALUES (111, '双石井自然风景区', 0, NULL, 8, 8, '河北省承德市兴隆县南天门乡石庙子村', 6, '承德', 'http://ticket.lvmama.com/scenic-10816159', 'http://pic.lvmama.com/uploads/pc/place2/2016-06-30/1627b685-d556-4bde-80b0-ae9483196684_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (112, '白草洼国家森林公园', 0, NULL, 9, 9, '河北省承德市滦平县付营子乡靳家沟门村', 6, '承德', 'http://ticket.lvmama.com/scenic-170260', 'http://pic.lvmama.com/uploads/pc/place2/2016-06-02/4c99397a-71be-4051-8c05-5735e876c13b_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (110, '冰塘峪长城风情大峡谷', 0, NULL, 35, 35, '河北省秦皇岛市抚宁县大新寨镇梁家湾村（高速口抚宁北...', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-10821448', 'http://pic.lvmama.com/uploads/pc/place2/2023-02-15/7292c0a2-053b-4a3a-971c-0a9147d7e1bc_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (109, '白洋淀鸳鸯岛', 0, NULL, 7, 7, '河北省保定市安新县白洋淀景区内', 2, '保定', 'http://ticket.lvmama.com/scenic-170333', 'http://pic.lvmama.com/uploads/pc/place2/2016-07-15/77bec7c0-3428-4267-adac-da5f80c5ebee_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (108, '华峪山庄', 0, NULL, 13.8, 13.8, '河北省保定市唐县大洋乡大长峪村', 2, '保定', 'http://ticket.lvmama.com/scenic-172740', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/862443/6752b38ae855efc829df9829dac0003e_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (107, '沽源天鹅湖景区', 0, NULL, 50, 170, '河北省张家口市沽源县天鹅湖景区', 4, '张家口', 'http://ticket.lvmama.com/scenic-10807178', 'http://pic.lvmama.com/uploads/pc/place2/2016-08-26/c268ffc9-ada1-432d-9924-34088dbfb9a3_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (105, '6号水世界', 0, NULL, 36, 36, '河北省石家庄市无极县6号水世界', 1, '石家庄', 'http://ticket.lvmama.com/scenic-11367422', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/1672401/9931fedfe19bf5030bd12d1d0f6d39a8_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (106, '真武庙', 0, NULL, 38, 38, '河北省张家口市蔚县宋家庄镇东南山脚下真武庙', 4, '张家口', 'http://ticket.lvmama.com/scenic-10829369', 'http://pic.lvmama.com/uploads/pc/place2/2016-09-26/03374690-b13c-4c47-8d40-07b7159066aa_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (104, '威尼斯水世界', 0, NULL, 52, 227, '石家庄市裕华区体育南大街263号', 1, '石家庄', 'http://ticket.lvmama.com/scenic-175927', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/879451/4646c509231fd10ea758922d0b2b9d86_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (103, '保定市农业生态园', 8, '动植物园', 59, 189, '河北省保定市江城乡大汲店农业生态园东南角', 2, '保定', 'http://ticket.lvmama.com/scenic-10925202', 'http://pic.lvmama.com/uploads/pc/place2/2017-03-16/e34888b0-3064-4eac-bf71-57d707d66cf7_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (102, '紫图园生态庄园', 7, '园林景观', 7, 7, '河北省廊坊市大厂回族自治县陈府乡东杨辛庄村西侧', 7, '廊坊', 'http://ticket.lvmama.com/scenic-11275863', 'http://pic.lvmama.com/uploads/pc/place2/2017-04-25/fa6d63fb-3397-440b-bc16-3296993a93c7_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (100, '温泉圣地', 5, '温泉', 46, 46, '河北省石家庄市晋州市003县道', 1, '石家庄', 'http://ticket.lvmama.com/scenic-11318397', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/1522954/83e753453b7a3ee2f68dcea1de80d240_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (101, '唐家湾丹霞温泉度假区', 0, '登山徒步,温泉', 88, 88, '河北省承德市承德县仓子乡唐家湾温泉度假区', 6, '承德', 'http://ticket.lvmama.com/scenic-11317539', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/1493615/b7e54e2665ef8fca58b5244fd2a870df_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (99, '太舞滑雪小镇', 0, '休闲娱乐,滑雪', 29.9, 1370, '河北省张家口市崇礼区太舞滑雪小镇', 4, '张家口', 'http://ticket.lvmama.com/scenic-11322001', 'http://pic.lvmama.com/uploads/pc/place2/2021-01-08/12a38b93-ff4a-4ec0-b922-4846ae2dfc7c_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (98, '福瑞锶温泉', 5, '温泉', 79, 79, '河北省石家庄市元氏县马村乡张掖村西红旗大街1298...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-11488066', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/1800006/b73429f626947364b81dd367d3fdfeaf_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (97, '野三坡', 1, '休闲娱乐', 10, 10, '河北省保定市涞水县野三坡', 2, '保定', 'http://ticket.lvmama.com/scenic-156143', 'http://pic.lvmama.com/uploads/pc/place2/156143/1334831318914_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (96, '金山岭长城', 3, '人文古迹', 52, 52, '河北省承德市滦平县巴克什营一带（北京密云县与河北滦...', 6, '承德', 'http://ticket.lvmama.com/scenic-100408', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/181814/fbfe2a2f511622f649544bc1bb2e8cd5_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (94, '响堂山石窟', 2, '自然风光', 10, 10, '河北省邯郸市峰峰矿区鼓山', 3, '邯郸', 'http://ticket.lvmama.com/scenic-101781', 'http://pic.lvmama.com/uploads/places/648x297/ff8080811cfb4ab1011d0e4f583e1ca1_648x297_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (95, '澜悦温泉', 5, '温泉', 89, 89, '河北省霸州市泰山路519号', 7, '廊坊', 'http://ticket.lvmama.com/scenic-157363', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/181896/085f0e8a6e38f24a9e724c8b4f9dda35_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (93, '鸽子窝公园', 4, '主题乐园', 35, 35, '河北省秦皇岛市北戴河区北戴河东山鸽赤路', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-101804', 'http://pic.lvmama.com/uploads/pc/place2/2017-05-16/a3d91ce9-2ab3-41c1-af3d-5e7d47e659f2_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (92, '迁西县青山关旅游区', 2, '自然风光', 42, 42, '河北省唐山市迁西县上营乡青山口村', 9, '唐山', 'http://ticket.lvmama.com/scenic-102946', 'http://pic.lvmama.com/uploads/pc/place2/2016-08-24/8882b9bb-a1a2-42d0-9515-bf5171d62e8a_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (91, '元宝山新潮玩乐园', 7, '园林景观', 45, 199, '河北省承德市双桥区丽正门大街', 6, '承德', 'http://ticket.lvmama.com/scenic-153754', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/182823/fd646a95b38593d5eac7269e1bbeb783_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (90, '东山文化博艺园', 11, '民俗风情', 9, 9, '河北省邯郸市武安市东郊', 3, '邯郸', 'http://ticket.lvmama.com/scenic-100244', 'http://pic.lvmama.com/uploads/places/648x297/ff8080811c214371011c788cd06a074d_648x297_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (89, '广府古城旅游景区', 2, '自然风光', 10, 35, '河北省邯郸市永年广府镇广府古城景区（太极城）', 3, '邯郸', 'http://ticket.lvmama.com/scenic-158026', 'http://pic.lvmama.com/uploads/pc/place2/2016-11-10/c70f8cae-fd18-4935-94f4-c4af647186e7_180_120.jpg', '2023-12-25 10:40:59');
INSERT INTO `travel` VALUES (88, '崆山白云洞', 0, '登山徒步,自然风光', 95, 95, '河北省邢台市临城县崆山白云洞风景名胜区', 8, '邢台', 'http://ticket.lvmama.com/scenic-100422', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/249103/feacb6ce119723d2c61b9f02a24bc7b5_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (87, '北岳庙', 3, '人文古迹', 29.9, 29.9, '河北省保定市曲阳县北岳路', 2, '保定', 'http://ticket.lvmama.com/scenic-158055', 'http://pic.lvmama.com/uploads/pc/place2/2016-11-04/4338d826-61bd-47e8-9a2b-0c198fbbef70_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (85, '金丰农科园', 0, '动植物园,动植物园', 9.9, 200, '河北省廊坊市广阳区和平路北端', 7, '廊坊', 'http://ticket.lvmama.com/scenic-161087', 'http://pic.lvmama.com/uploads/pc/place2/2015-05-05/66281ee0-87ea-45c1-ba19-4f92cda24cf2_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (86, '十瀑峡', 2, '自然风光', 23, 23, '河北省保定市涞源县', 2, '保定', 'http://ticket.lvmama.com/scenic-158042', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/254906/7cc111de40c5aa9c8399dd4c71c5e5bc_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (84, '白洋淀异国风情园', 11, '民俗风情', 10, 10, '河北省保定市安新县白洋淀景区内', 2, '保定', 'http://ticket.lvmama.com/scenic-158065', 'http://pic.lvmama.com/uploads/pc/place2/2016-07-15/6bb2c661-dbc0-4087-83af-552ff5eda100_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (83, '邯郸方特国色春秋', 0, '主题乐园,主题乐园', 99, 159, '河北省邯郸市中华慈大街18号', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12209817', 'http://pic.lvmama.com/uploads/pc/place2/2019-07-12/01cf08ba-ed5c-49dc-b38f-dcdf320e8da8_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (82, '悦海汗蒸', 1, '休闲娱乐', 29.9, 109, '石家庄桥西区中山西路777号', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12212872', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2607088/5d29b67eeba53b960ac5bf8e94eaaa37_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (81, '狼牙山文化博物馆', 10, '展览展馆', 64, 64, '保定市易县东西水村狼牙山中路', 2, '保定', 'http://ticket.lvmama.com/scenic-12212875', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2607093/54b2ae6d002d1214eb6c8c75b131c35a_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (79, '水岸潮白景区', 2, '自然风光', 59.9, 59.9, '廊坊市香河县蒋辛屯镇北李庄村', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12213092', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2607340/c578c73cd7d1e148eb63e0158d68d0da_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (80, '冉庄滑雪场', 3, '人文古迹', 8.8, 15.8, '河北省保定市清苑县冉庄镇', 2, '保定', 'http://ticket.lvmama.com/scenic-175349', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2607096/af775610207358a592645dff74e0ec2b_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (78, '白石山温泉旅游度假区', 1, '休闲娱乐', 98, 168, '保定市涞源县白石山镇白石山温泉度假区', 2, '保定', 'http://ticket.lvmama.com/scenic-12213283', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2607558/1d78e78e5b7023a927e09da3a1fb323a_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (77, '八路军一二九师纪念馆太行颂文化园', 10, '展览展馆', 19, 19, '邯郸市涉县河南店镇赤岸村', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12213299', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2607581/4d6647b652fa8aa33bb4af6090e6a37c_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (75, '祖山风景区', 2, '自然风光', 140, 158, '秦皇岛市青龙满族自治县京省高速秦皇岛北出口青龙方向...', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-12213441', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2607744/2c69cd91ca5b9fced4ca23596331581e_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (76, '享水溪旅游度假区', 1, '休闲娱乐', 10, 10, '保定市顺平县享水溪旅游度假区', 2, '保定', 'http://ticket.lvmama.com/scenic-12213384', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2607680/5ff82dc4a68ee7bd24edc68ecd798678_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (74, '阿派朗创造力乐园', 1, '休闲娱乐', 129, 189, '廊坊市固安县大广高速牛驼出口西行500米路南', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12213797', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2608180/089398a0714f3c2acaa160e11c84cbff_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (73, '缥缈间温泉', 1, '休闲娱乐', 126, 298, '石家庄市平山县两河乡河北野生原度假村内', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12213827', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2608221/2c4ce6d86f62b00390dd7faac4fc71c4_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (72, '刘伶醉酒古烧锅遗址', 3, '人文古迹', 38, 38, '河北省保定市徐水县振兴中路徐水二中对面', 2, '保定', 'http://ticket.lvmama.com/scenic-10834166', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2608447/643430cf6ea467f5244f735379b24336_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (71, '神泉山旅游景区', 2, '自然风光', 15.9, 138, '保定市满城区S332省道神泉山风景区', 2, '保定', 'http://ticket.lvmama.com/scenic-12214090', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2608604/5de89d85787acde829a022e15f53a2cd_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (70, '刘伶醉景区游乐城', 2, '自然风光', 99, 139, '河北省保定市徐水县刘伶路与盛源南大街交口西行500...', 2, '保定', 'http://ticket.lvmama.com/scenic-11317827', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2609094/cb7fbf1ba5f9e65326962c6c5ce7de92_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (69, '西部长青自然儿童乐园', 1, '休闲娱乐', 50, 50, '石家庄市鹿泉市白鹿泉乡梁庄、水峪', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12214584', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2609251/9d8f064637720b69ceecc0fa9192aec4_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (68, '千佛山森林公园', 2, '自然风光', 7, 7, '保定市易县白马乡盘神庙村', 2, '保定', 'http://ticket.lvmama.com/scenic-12214647', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2609329/db493b4d0b78641e83178e0a368d8df4_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (66, '新濠假日酒店温泉', 1, '休闲娱乐', 39.9, 351, '石家庄市桥西区新华西路568号', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12214958', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2609731/e41f8b0856f100ec069e96645f12d872_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (67, '天鹅湖洗浴', 1, '休闲娱乐', 52, 208, '中华南大街350号', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12214916', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2609684/7939112611d402730726523c49a9b100_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (65, '古武当山', 3, '人文古迹', 29.9, 198, '邯郸武安市西40公里太行山深处，距邯郸市70公里', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12215703', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2610594/7f3210e4e9348e147f7234a1f8af4300_180_120.jpg', '2023-12-25 10:40:58');
INSERT INTO `travel` VALUES (64, '国玉陶瓷文化园', 1, '休闲娱乐', 15, 15, '张家口市宣化区幸福街148号1号', 4, '张家口', 'http://ticket.lvmama.com/scenic-12215963', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2610885/ae6bb90265d5fbdb50f7636f36e21c18_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (63, '雄安保府酒文化园', 1, '休闲娱乐', 7, 7, '保定市雄安新区容城县金台路69号', 2, '保定', 'http://ticket.lvmama.com/scenic-12215984', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2610912/52996365534f8aec6025d4febcb41f8e_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (61, '大自然温泉会馆（沧州店）', 1, '休闲娱乐', 35, 269, '沧州市运河区开发区渤海路阳光医药东临', 10, '沧州', 'http://ticket.lvmama.com/scenic-12216136', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611078/5c29704a5634a0f738f8f3ebcf99b2f6_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (62, '周家庄农业特色观光园', 1, '休闲娱乐', 18.8, 18.8, '河北省石家庄市晋州市滨河路594号', 1, '石家庄', 'http://ticket.lvmama.com/scenic-106788', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2610928/5d4d31909507bbb9e500045fb664c056_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (60, '王硇村', 3, '人文古迹', 19.9, 19.9, '邢台市沙河市王硇村', 8, '邢台', 'http://ticket.lvmama.com/scenic-12216158', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611102/2f459201f98ba40b147d51c2d276218c_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (59, '壹零壹森林公学', 1, '休闲娱乐', 19.9, 69, '竞秀区慈航寺南街', 2, '保定', 'http://ticket.lvmama.com/scenic-12216241', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611214/27ee3c146582af8840a801a7855060b8_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (58, '六北定植物园', 8, '动植物园', 37, 158, '廊坊市三河市洵阳镇六道曹村西南', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12216247', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611221/03517dcbff270ed368ecb30500dc60a4_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (57, '迪山云顶风景区', 2, '自然风光', 19.9, 19.9, '石家庄市平山县南甸镇寨北乡指角沟村庙岩', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12216329', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611325/ceaed295e8efa4c4ccb2038221c28a5f_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (56, '龙珠温泉', 1, '休闲娱乐', 63, 131, '保定市莲池区天鹅中路1777号', 2, '保定', 'http://ticket.lvmama.com/scenic-12216393', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611407/fe7e8c63540b616dc8d26b1a48f9e48c_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (55, '盛世嘉年华温泉洗浴', 1, '休闲娱乐', 29, 358, '沧州市运河区浮阳北大道西环中街戏水乐园5栋1-3层...', 10, '沧州', 'http://ticket.lvmama.com/scenic-12216395', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611409/97aa63258b0e8f70fd95c447a7dd706b_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (54, '山缘生态庄园', 1, '休闲娱乐', 27, 27, '唐山市丰润区王官营镇施家营村', 9, '唐山', 'http://ticket.lvmama.com/scenic-12216426', 'http://pic.lvmama.com/uploads/pc/place2/2021-03-03/20ca16b9-235f-47de-9aa0-96113c06044c_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (52, '九龙湾温泉汗蒸时代(洗浴部)', 1, '休闲娱乐', 39.9, 99, '农林路与光明大街交叉口西行100米路北', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12216634', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611711/2d3fb5c85fc49f315dbfa159e65ba544_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (53, '石门弓箭俱乐部（怀特店）', 1, '休闲娱乐', 30, 200, '石家庄市长安区裕彤体育中心九号步行梯三层', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12216458', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611493/2e004e4ae4a6851090b59edae4610745_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (51, '金银海洗浴', 1, '休闲娱乐', 21.8, 388, '廊坊市大厂回族自治县祁各庄镇小八百户村', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12216658', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611736/99847efc8b5631224c627f3ca6be168f_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (50, '九洲浴乐宫', 1, '休闲娱乐', 33, 199, '唐山市迁安市丰乐大路九洲大酒店', 9, '唐山', 'http://ticket.lvmama.com/scenic-12216686', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611765/058fb841b53134385072ebafd66e0ba6_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (49, '清水湾汗蒸广场', 1, '休闲娱乐', 35, 219, '朝阳街朝阳路56号', 10, '沧州', 'http://ticket.lvmama.com/scenic-12216828', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611918/d5275a3319fae843308dc151c1a0efb1_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (48, '太行药王谷', 2, '自然风光', 16.8, 19.9, '邯郸市峰峰矿区义井镇东王看村北角沁河东岸', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12216874', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2611967/296be218e5ef46920ce4c58dc4f2a2d7_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (47, '汤泉宫温泉度假村', 1, '休闲娱乐', 128, 128, '唐山市遵化市汤泉乡汤泉村乡政府西侧100米', 9, '唐山', 'http://ticket.lvmama.com/scenic-12217023', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612132/5b32239d7afac6e10e33a65085797643_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (46, '红鼻子成长乐园', 4, '主题乐园', 29.9, 128, '邢台市信都区路罗镇路罗村', 8, '邢台', 'http://ticket.lvmama.com/scenic-12217163', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612281/d7691419506d22e67a38d9771be89e15_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (45, '万龙滑雪场', 1, '休闲娱乐', 59, 2100, '张家口市崇礼县红花梁', 4, '张家口', 'http://ticket.lvmama.com/scenic-12217244', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612392/ee77a673358033e8991974fafc84ec17_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (44, '蔚·花园元宇宙乐园', 1, '休闲娱乐', 68, 99, '张家口桥西区', 4, '张家口', 'http://ticket.lvmama.com/scenic-170428', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612426/26d7033ddeab5619938e207b7dca8bb2_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (43, '温泉堡一号温泉', 1, '休闲娱乐', 49.9, 99.9, '温泉堡金龙温泉度假村', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-12217301', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612455/99b72dae59d351b490bb7af6884d4720_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (42, '拉唯那那间温泉', 0, '休闲娱乐,温泉', 44, 44, '河北省唐山市唐山国际旅游岛中南未来海岸小区综合楼', 9, '唐山', 'http://ticket.lvmama.com/scenic-12217310', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612477/7258db3168d8b93de87db4a47cf0f4cf_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (41, '翠云山银河滑雪场', 0, '休闲娱乐,滑雪', 220, 938, '张家口市崇礼区大夹道沟村(张承高速北出口南侧)', 4, '张家口', 'http://ticket.lvmama.com/scenic-12217323', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612478/95d28b9762ff3ecf85472b51d9adc811_180_120.jpg', '2023-12-25 10:40:57');
INSERT INTO `travel` VALUES (40, '密苑云顶乐园', 0, '休闲娱乐,休闲娱乐', 312, 1785, NULL, 4, '张家口', 'http://ticket.lvmama.com/scenic-12217338', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612492/4c34f2f7f4d296bc15af30ab666f9632_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (39, '九州伊甸园', 1, '休闲娱乐', 110, 110, '廊坊市大厂回族自治县陈府镇王指挥屯村', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12217468', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612631/b37445dc68a60ab7f0f1908a0733092a_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (38, '腰山王氏庄园', 1, '休闲娱乐', 30, 30, '河北省保定市顺平县腰山镇南腰山村', 2, '保定', 'http://ticket.lvmama.com/scenic-101542', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612648/746061f9969d21096df14124968378fd_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (37, '叮当洞景区', 2, '自然风光', 7, 7, '095乡道东50米', 6, '承德', 'http://ticket.lvmama.com/scenic-12217606', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612777/5b7dac3bfb1f999deb3e4ef18b968058_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (36, '泰达·豪庭金门酒店温泉', 1, '休闲娱乐', 68, 168, '衡水市桃城区榕花北大街1010号', 11, '衡水', 'http://ticket.lvmama.com/scenic-12217815', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2612997/d946182c042d8ea102e28003f86766e8_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (35, '荣华洗浴', 1, '休闲娱乐', 5.8, 26.8, '霸州市金锚路与112国道(津保路)交汇处西50米', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12217886', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2613077/d6fc54c2b723c806db256c2432a28176_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (34, '亿福园', 1, '休闲娱乐', 98, 98, '承德市隆化县茅荆坝乡茅荆坝村亿福农业生态园', 6, '承德', 'http://ticket.lvmama.com/scenic-12218133', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2613330/201f23d1313f418964f2159edaed9dcc_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (33, '甘露寺', 1, '休闲娱乐', 30, 30, '邯郸市永年县广府城东桥村', 3, '邯郸', 'http://ticket.lvmama.com/scenic-172483', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2613816/f1ddb5ccd0c14914fff1f1d9592fe981_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (32, '九号生活馆', 1, '休闲娱乐', 39, 257, '张家口市经开区东环路与站前东大街北侧交叉出口处(烟...', 4, '张家口', 'http://ticket.lvmama.com/scenic-12218391', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2614066/3800d2c00d332ec9b66f8525f1f6ea4b_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (31, '龙门温泉', 1, '休闲娱乐', 32, 32, '保定市涞源县水堡镇龙门村', 2, '保定', 'http://ticket.lvmama.com/scenic-12218783', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2614662/4dc3fe09f24aef4bd5286305fe4a3cf8_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (30, '蓝精灵欢乐岛', 1, '休闲娱乐', 19.9, 19.9, '邯郸市涉县将军路与刘张公路交叉口东行1000米', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12218890', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2614815/736fff275a4b3f3585e5a35e00cdccf4_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (29, '茗汤日月潭温泉会馆', 1, '休闲娱乐', 88, 198, '廊坊市霸州市国际温泉城泰山路529号', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12219032', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2615041/e28a30456723ac63b1478eefcd2c384e_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (28, '万象云端', 1, '休闲娱乐', 9.9, 9.9, '石家庄市裕华区万达步行街中心塔东侧', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12220002', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2615152/1cfcfe8c030da0eec6ef8786dd8af3ba_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (27, '前南峪生态观光旅游区', 2, '自然风光', 55, 55, '邢台市邢台县浆水镇前南峪村', 8, '邢台', 'http://ticket.lvmama.com/scenic-12222881', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2615264/6a004a6d221d01bc9a5accdd051bcd01_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (26, '磁州水墨园', 1, '休闲娱乐', 7, 7, '邯郸市磁县和谐大道1号', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12249408', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2615608/758249d0602cb5fd20ec820be9f65509_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (25, '怀来帝曼温泉度假村', 1, '休闲娱乐', 65, 65, '张家口市怀来县桑园镇帝曼温泉度假村', 4, '张家口', 'http://ticket.lvmama.com/scenic-154301', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2615809/78180848045bcd5b496e7a0282ff4db6_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (24, '保定科技海洋中心', 1, '休闲娱乐', 118, 128, '河北省保定市竞秀区建国路江城乡生态园真天地科普乐园...', 2, '保定', 'http://ticket.lvmama.com/scenic-12275597', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2617162/d9f8f5deb1b6dd662da9bf7a0a8672b4_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (23, '三城水上乐园', 4, '主题乐园', 39.9, 39.9, '河北省保定市涿州市东城坊镇三城村建红农业观光园内', 2, '保定', 'http://ticket.lvmama.com/scenic-12278809', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2617363/bc5dce13a8a2352fa71da6ac96e36c7f_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (22, '沧州海洋馆', 4, '主题乐园', 87, 87, '沧州市运河区北京路游泳馆西区', 10, '沧州', 'http://ticket.lvmama.com/scenic-12345598', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2618596/f1c76dbd692b3e1a57eaed4a5faaaa58_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (21, '大厂影视小镇', 1, '休闲娱乐', 7, 7, '厂通路和中轴路交叉口东南角', 7, '廊坊', 'http://ticket.lvmama.com/scenic-12346961', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2618715/8dbeee5f30a99e0aa09fac5d61a06136_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (20, '官厅红色记忆', 1, '休闲娱乐', 28, 28, '官厅镇官厅大街北6号', 4, '张家口', 'http://ticket.lvmama.com/scenic-12349210', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2618842/44b80fff3733530dfc90b36758cd3720_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (19, '正定古城', 3, '人文古迹', 30, 38, '河北省石家庄市正定县燕赵南大街', 1, '石家庄', 'http://ticket.lvmama.com/scenic-12349915', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2618937/38c4239240bcc294a2c884d2f9ba5077_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (18, '太行花溪谷景区', 2, '自然风光', 19.9, 19.9, '武安市活水乡牛心山村张家台西', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12349918', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2618940/cd273d6b1e44ec3f41fa1e1a9c374fda_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (17, '九龙松', 1, '休闲娱乐', 30, 30, '五道营乡112线四道营村九龙松旅游点', 6, '承德', 'http://ticket.lvmama.com/scenic-12350869', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2618987/c1a606498ef4cd80aae7fe046190c41a_180_120.jpg', '2023-12-25 10:40:56');
INSERT INTO `travel` VALUES (16, '衡水之眼', 1, '休闲娱乐', 178, 188, '河北省衡水市桃城区滏东嘉园北', 11, '衡水', 'http://ticket.lvmama.com/scenic-12352222', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2619106/e75db1942dc274908b52a3d622511b54_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (15, '赤水湾古镇', 1, '休闲娱乐', 29.9, 88, '邯郸市涉县赤水湾古镇', 3, '邯郸', 'http://ticket.lvmama.com/scenic-12352597', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2619152/2b7f58355f9956b70513fb98e485be0b_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (14, '水域半岛', 1, '休闲娱乐', 26, 232, '秦皇岛市海港区秦皇半岛三区44栋（广源超市旁）', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-12357953', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2619370/d06a7be36a1885960b16d75537602673_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (13, '水道汤泉', 1, '休闲娱乐', 60, 60, '河北省张家口市纬二路金鹰悦城水道汤泉生活馆', 4, '张家口', 'http://ticket.lvmama.com/scenic-12360294', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2619486/c3af37f535f76b664292e55b89e2084c_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (12, '秦皇岛板厂峪长城景区', 2, '自然风光', 23.9, 68, '河北省秦皇岛市抚宁县驻操营镇板厂峪村', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-10654185', 'http://pic.lvmama.com/uploads/pc/place2/2017-09-08/24d6b55d-3084-4d3e-bf7b-2f389352dbbe_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (11, '保定国际俱乐部', 1, '休闲娱乐', 112, 112, '河北省保定市高新区天鹅西路199号', 2, '保定', 'http://ticket.lvmama.com/scenic-10048168', 'http://pic.lvmama.com/uploads/pc/place2/2015-09-18/2bc72c40-bb3d-47e8-a65e-12ec652524b1_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (10, '多乐美地滑雪场', 6, '滑雪', 69, 550, '河北省张家口市崇礼县', 4, '张家口', 'http://ticket.lvmama.com/scenic-10667727', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/644126/58a96f886d45e864c121a634dc5bc925_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (9, '邢台北武当山', 2, '自然风光', 19.9, 19.9, '河北省邢台市沙河市蝉房乡大欠村', 8, '邢台', 'http://ticket.lvmama.com/scenic-10690726', 'http://pic.lvmama.com/uploads/pc/place2/2016-03-11/e0add7f2-5bd3-4fdc-9a0d-edbcc708d06d_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (8, '怪楼奇园', 7, '园林景观', 18, 18, '河北省秦皇岛市北戴河区联峰路怪楼奇园大酒店西侧50...', 5, '秦皇岛', 'http://ticket.lvmama.com/scenic-172012', 'http://pic.lvmama.com/uploads/pc/place2/2016-07-18/d3d426f4-8f67-47f4-bad6-051ddaff9045_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (7, '石家庄海洋公园', 4, '主题乐园', 7, 7, '河北省石家庄市桥西区裕华西路66号', 1, '石家庄', 'http://ticket.lvmama.com/scenic-10789943', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/816658/4d4a18eba3694d16582f357ed2fe0146_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (6, '天子山自然生态旅游区', 2, '自然风光', 10, 10, '河北省承德市兴隆县挂兰峪镇二甸子村', 6, '承德', 'http://ticket.lvmama.com/scenic-10815273', 'http://pic.lvmama.com/uploads/pc/place2/2016-06-30/ee7e943b-4af5-4b52-b3e0-ca3ae3746240_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (5, '白鹿温泉', 5, '温泉', 108, 259, '河北省石家庄市平山县温塘镇归咏路与汉塘街街北行10...', 1, '石家庄', 'http://ticket.lvmama.com/scenic-10823899', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/840736/0589dea567dd579f0d99fc2539711daa_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (4, '翠云山国际旅游度假区', 6, '滑雪', 188, 668, '河北省张家口市崇礼东马线翠云山景区', 4, '张家口', 'http://ticket.lvmama.com/scenic-11318687', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/863266/823489bca123ef139ca67a25926d031a_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (3, '木兰溶洞', 9, '登山徒步', 36, 36, '河北省保定市满城县西赵庄村大西峪木兰峪风景区', 2, '保定', 'http://ticket.lvmama.com/scenic-10834169', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/881225/a9beef37839ac800d45c895fe72c019c_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (2, '丛台公园', 7, '园林景观', 9, 9, '邯郸市丛台区中华北大街80号', 3, '邯郸', 'http://ticket.lvmama.com/scenic-170926', 'http://pic.lvmama.com/uploads/pc/place2/2016-11-23/248ea009-7836-4131-80cf-f0784ba339f4_180_120.jpg', '2023-12-25 10:40:55');
INSERT INTO `travel` VALUES (1, '兴芮水世界', 1, '休闲娱乐', 159, 159, '保定市徐水区郎五庄村大午温泉度假村', 2, '保定', 'http://ticket.lvmama.com/scenic-12214293', 'http://pic.lvmama.com/uploads/pc/place2/ctrip/photo/2608870/228bd3e7f7ef55dfb75d1f1f704130fa_180_120.jpg', '2023-12-25 10:40:55');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `birth` date NULL DEFAULT NULL,
  `genderCode` int(11) NULL DEFAULT NULL,
  `genderTranslation` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `init` tinyint(1) NULL DEFAULT NULL,
  `last_update` datetime(6) NOT NULL,
  `resume_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'pbkdf2_sha256$260000$R8vGws1zEFAPVTqDlX517K$ndi59BtPgKB6SrE4TNaXnYXpeV9VYzTB7X9w+dj/Po4=', '2023-12-26 15:23:11.842153', 1, 'root', '', '', '854771076@qq.com', 1, 1, '2023-10-20 09:37:58.835221', 'yyy', '2023-12-24', 0, '女', '', 'root/headerpic.jpg', 1, '2023-12-26 14:30:17.448991', 1);
INSERT INTO `user` VALUES (2, 'pbkdf2_sha256$260000$R8vGws1zEFAPVTqDlX517K$ndi59BtPgKB6SrE4TNaXnYXpeV9VYzTB7X9w+dj/Po4=', NULL, 1, 'JF100000', '', '', '2910226625@qq.com', 1, 1, '2023-10-20 09:37:58.835221', NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-10-20 09:37:58.957336', 2);
INSERT INTO `user` VALUES (3, 'pbkdf2_sha256$260000$R8vGws1zEFAPVTqDlX517K$ndi59BtPgKB6SrE4TNaXnYXpeV9VYzTB7X9w+dj/Po4=', NULL, 1, 'JF100001', '', '', 'fuyang854771076@gmail.com', 1, 1, '2023-10-20 09:37:58.835221', NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-10-20 09:37:58.957336', 3);

-- ----------------------------
-- Table structure for user_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_groups`;
CREATE TABLE `user_groups`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_groups_user_id_group_id_40beef00_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `user_groups_group_id_b76f8aba_fk_auth_group_id`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_user_permissions`;
CREATE TABLE `user_user_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `user_user_permission_permission_id_9deb68a3_fk_auth_perm`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of user_user_permissions
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
