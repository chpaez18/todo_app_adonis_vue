/*
 Navicat Premium Data Transfer

 Source Server         : PhpMyAdmin
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : todo_app_adonis_vue

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 14/06/2021 11:34:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adonis_schema
-- ----------------------------
DROP TABLE IF EXISTS `adonis_schema`;
CREATE TABLE `adonis_schema`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `batch` int(11) NULL DEFAULT NULL,
  `migration_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adonis_schema
-- ----------------------------
INSERT INTO `adonis_schema` VALUES (1, '1503250034279_user', 1, '2021-06-11 16:04:56');
INSERT INTO `adonis_schema` VALUES (2, '1503250034280_token', 1, '2021-06-11 16:04:56');
INSERT INTO `adonis_schema` VALUES (3, '1623443096419_project_schema', 2, '2021-06-11 16:30:55');
INSERT INTO `adonis_schema` VALUES (4, '1623679745961_task_schema', 3, '2021-06-14 10:12:24');

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `projects_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO `projects` VALUES (1, 1, 'prueba proyecto user 1', '2021-06-11 17:17:01', '2021-06-14 10:03:18');
INSERT INTO `projects` VALUES (2, 2, 'prueba proyecto user 2', '2021-06-11 17:17:26', '2021-06-11 17:17:26');
INSERT INTO `projects` VALUES (3, 1, 'prueba 2 proyecto user 1', '2021-06-11 17:18:45', '2021-06-11 17:18:45');
INSERT INTO `projects` VALUES (4, 1, 'prueba 3 proyecto user 1', '2021-06-11 17:18:49', '2021-06-11 17:18:49');

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tasks_project_id_foreign`(`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES (2, 1, 'tarea n° 2 del proyecto 1', 1, '2021-06-14 10:55:21', '2021-06-14 11:11:39');
INSERT INTO `tasks` VALUES (3, 1, 'tarea n° 3 del proyecto 1', 0, '2021-06-14 10:55:30', '2021-06-14 10:55:30');
INSERT INTO `tasks` VALUES (4, 3, 'tarea n° 1 del proyecto 3', 0, '2021-06-14 10:55:49', '2021-06-14 10:55:49');
INSERT INTO `tasks` VALUES (5, 3, 'tarea n° 2 del proyecto 3', 0, '2021-06-14 10:55:55', '2021-06-14 10:55:55');

-- ----------------------------
-- Table structure for tokens
-- ----------------------------
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_revoked` tinyint(1) NULL DEFAULT 0,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tokens_token_unique`(`token`) USING BTREE,
  INDEX `tokens_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `tokens_token_index`(`token`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tokens
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'prueba@gmail.com', 'prueba@gmail.com', '$2a$10$xmpyGY.dDrjp6eLuJwajqeR6hte/jwf4Himh4r3n6LFPYGADWUyAK', '2021-06-11 16:05:16', '2021-06-11 16:05:16');
INSERT INTO `users` VALUES (2, 'prueba2@gmail.com', 'prueba2@gmail.com', '$2a$10$tMYRKvOFguQYx1/il1xsku.tvvDZ27vc3YHusBsiX8V47cOZCrOri', '2021-06-11 16:07:47', '2021-06-11 16:07:47');
INSERT INTO `users` VALUES (3, 'prueba3@gmail.com', 'prueba3@gmail.com', '$2a$10$TT97BZm9RdJ1s5KCh2A.p.AKoDwj2fU7nnM5TU4HLH7UBOnzMtLpa', '2021-06-11 16:08:25', '2021-06-11 16:08:25');
INSERT INTO `users` VALUES (4, 'prueba4@gmail.com', 'prueba4@gmail.com', '$2a$10$wCfZDuqW27yAmNUZkFb.hOCFOmLvpoTBeg.IjFJXPJX3nQYYcNBN.', '2021-06-11 16:21:48', '2021-06-11 16:21:48');

SET FOREIGN_KEY_CHECKS = 1;
