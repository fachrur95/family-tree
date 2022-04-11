/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : family_tree

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 11/04/2022 16:15:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for families
-- ----------------------------
DROP TABLE IF EXISTS `families`;
CREATE TABLE `families`  (
  `familyId` int(11) NOT NULL AUTO_INCREMENT,
  `children` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `marriageDate` date NULL DEFAULT NULL,
  `marriagePlace` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NULL DEFAULT NULL,
  `divorceDate` date NULL DEFAULT NULL,
  `divorcePlace` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `husbandId` int(11) NULL DEFAULT NULL,
  `wifeId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`familyId`) USING BTREE,
  INDEX `husbandId`(`husbandId`) USING BTREE,
  INDEX `wifeId`(`wifeId`) USING BTREE,
  CONSTRAINT `families_ibfk_1` FOREIGN KEY (`husbandId`) REFERENCES `individuals` (`individualId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `families_ibfk_2` FOREIGN KEY (`wifeId`) REFERENCES `individuals` (`individualId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of families
-- ----------------------------
INSERT INTO `families` VALUES (1, '[\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 2);
INSERT INTO `families` VALUES (2, '[\"21\",\"22\",\"23\",\"24\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 11);
INSERT INTO `families` VALUES (3, '[\"25\",\"26\",\"27\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 12);
INSERT INTO `families` VALUES (4, '[\"28\",\"29\",\"30\",\"31\",\"32\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13, 5);
INSERT INTO `families` VALUES (5, '[\"33\",\"34\",\"35\",\"36\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 14, 6);
INSERT INTO `families` VALUES (6, '[\"37\",\"38\",\"39\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 15);
INSERT INTO `families` VALUES (7, '[\"40\",\"41\",\"42\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 16);
INSERT INTO `families` VALUES (8, '[\"43\",\"44\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 17);
INSERT INTO `families` VALUES (9, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 18);
INSERT INTO `families` VALUES (10, '[\"45\",\"46\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 19, 10);
INSERT INTO `families` VALUES (11, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 20, 10);
INSERT INTO `families` VALUES (12, '[\"62\",\"63\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 21, 47);
INSERT INTO `families` VALUES (13, '[\"64\",\"65\",\"66\",\"67\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 22, 49);
INSERT INTO `families` VALUES (14, '[\"68\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23, 50);
INSERT INTO `families` VALUES (15, '[\"69\",\"70\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51, 25);
INSERT INTO `families` VALUES (16, '[\"71\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 52, 28);
INSERT INTO `families` VALUES (17, '[\"72\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 53, 29);
INSERT INTO `families` VALUES (18, '[\"73\",\"74\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 54, 30);
INSERT INTO `families` VALUES (19, '[\"75\",\"76\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 31, 55);
INSERT INTO `families` VALUES (20, '[\"77\",\"78\",\"79\",\"80\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 33, 56);
INSERT INTO `families` VALUES (21, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34, 57);
INSERT INTO `families` VALUES (22, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 35, 58);
INSERT INTO `families` VALUES (23, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59, 36);
INSERT INTO `families` VALUES (24, '[\"81\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 60, 37);
INSERT INTO `families` VALUES (25, '[\"82\"]', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 61, 45);
INSERT INTO `families` VALUES (27, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 80, 81);

-- ----------------------------
-- Table structure for individuals
-- ----------------------------
DROP TABLE IF EXISTS `individuals`;
CREATE TABLE `individuals`  (
  `individualId` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NULL DEFAULT NULL,
  `sex` enum('M','F','O') CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `birthDate` date NULL DEFAULT NULL,
  `birthPlace` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NULL DEFAULT NULL,
  `deathDate` date NULL DEFAULT NULL,
  `deathPlace` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`individualId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of individuals
-- ----------------------------
INSERT INTO `individuals` VALUES (1, 'KH. FADHOLI ASMUNI\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'M', '2022-04-05', 'sumenep', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (2, 'Ny. Hj. Ukhrowiyah\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'F', '2022-04-05', 'sumenep', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (3, '1. Hasbullah Fadholi\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'M', '2022-04-05', 'sumenep', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (4, '2. Saifur Rijal\r\n\r\n\r\n', 'M', '2022-04-05', 'sumenep', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (5, '3. Siti Muti\'ah Fadholi\r\n\r\n\r\n\r\n\r\n\r\n', 'F', '2022-04-05', 'sumenep', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (6, '4.Fatimatus Zahroh Fadholi\r\n\r\n\r\n\r\n\r\n\r\n', 'F', '2022-04-05', 'sumenep', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (7, '4. Imam Asy\'ari\r\n\r\n', 'M', '2022-04-05', 'pekanbaru', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (8, '5. Subhan Efendi\r\n\r\n', 'M', '2022-04-05', 'pekanbaru', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (9, '6. Ali Mas\'udi\r\n\r\n', 'M', '2022-04-05', 'sumenep', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (10, '7. Sumailah Fadholi\r\n\r\n', 'M', '2022-04-05', 'subang', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (11, '1. Siti Suhaimi\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'F', '2022-04-05', 'subang', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (12, '1. Husnul Hotimah\r\n\r\n\r\n', 'F', '2022-04-05', 'karawang', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (13, '1. Ali Maksum', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (14, '1. Sufyan\r\n\r\n\r\n\r\n\r\n\r\n', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (15, '1. Nur Holifah\r\n\r\n', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (16, '1. Musrifah\r\n\r\n', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (17, '1. Ruqoyyah\r\n', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (18, '2. Moslimah', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (19, '1. K. Idris\r\n', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (20, '2. Syafi\'i', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (21, 'Rif\'atus saadah\r\n\r\n', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (22, 'Fifin\r\n\r\n\r\n', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (23, 'Afifurrahman', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (24, 'Fida', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (25, 'Wimatus Sholihah\r\n', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (26, 'Chairil', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (27, 'Miftah', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (28, 'Yatul', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (29, 'Yatin (almh)', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (30, 'Zaitun\r\n', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (31, 'Anis\r\n', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (32, 'Farhan', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (33, 'Fahrur Rozi\r\n\r\n\r\n', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (34, 'Farid Mawardi', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (35, 'Fardanuddin Sufyan', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (36, 'Anna Fifit Rotin', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (37, 'Nia', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (38, 'ain', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (39, 'Fathi', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (40, 'Rizki', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (41, 'Rizal', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (42, 'Faqih', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (43, 'Zaim', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (44, 'Azam', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (45, 'Aini', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (46, 'Dyah', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (47, 'abdurrahman (cerai)\r\n', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (48, 'Ainur Rofek', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (49, 'Suherman\r\n\r\n\r\n', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (50, 'fulanah', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (51, 'A. Fauzan\r\n', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (52, 'Nasihen', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (53, 'syafii', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (54, 'Khairuddin\r\n', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (55, 'hartono\r\n', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (56, 'Uswatun Hasanah\r\n\r\n\r\n', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (57, 'Chamidah', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (58, 'Nur Romlah', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (59, 'Shafwan', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (60, 'Iqbal', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (61, 'Ahis', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (62, 'Fatihul Haq', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (63, 'Nada', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (64, 'Izza', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (65, 'Najwa', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (66, 'Azhar', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (67, 'Faris', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (68, 'Fulan 3', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (69, 'Nuro', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (70, 'Malika', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (71, 'Lia', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (72, 'Ilham', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (73, 'baroroh', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (74, 'adiba', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (75, 'alif', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (76, 'alya', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (77, 'Fahkim', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (78, 'Fahri', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (79, 'Fathir', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (80, 'Fawaid', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (81, 'jasmin', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (82, 'Fulanah 4', 'F', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (83, 'bapak romlah', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `individuals` VALUES (84, 'ibu romlah', 'M', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

SET FOREIGN_KEY_CHECKS = 1;
