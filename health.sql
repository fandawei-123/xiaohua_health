/*
 Navicat Premium Data Transfer

 Source Server         : ecs
 Source Server Type    : MySQL
 Source Server Version : 50651
 Source Host           : 114.55.85.190:3306
 Source Schema         : health

 Target Server Type    : MySQL
 Target Server Version : 50651
 File Encoding         : 65001

 Date: 02/04/2022 22:51:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addressName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lngAndLat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经纬度',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `map` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detailaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_address
-- ----------------------------
INSERT INTO `t_address` VALUES (4, '福建省立医院', '1731111111', '119.313187,26.093912', '8e3d2a01-1b47-4edb-9274-d5fed33f81c5.jpg', NULL, '福建省福州市东街');
INSERT INTO `t_address` VALUES (6, '福建医科大学附属第一医院', '17356535908', '119.30347,26.080429', '14046332-eea8-45f3-8e14-604126459fbc.jpg', NULL, '福州市台江区');
INSERT INTO `t_address` VALUES (7, '福建省肿瘤医院', '1234567894513', '119.349327,26.081392', '6fdc838a-8cff-40bf-b4e2-49294edb3100.jpg', NULL, '福州市晋安区');
INSERT INTO `t_address` VALUES (11, '莆田学院附属医院', '12345678910', '119.021528,25.442322', '55c8e8f1-f581-4f02-a645-c6de3455ac3a.jpg', NULL, '莆田市荔城区');
INSERT INTO `t_address` VALUES (12, '莆田市第一医院', '123456', '119.012566,25.434264', '92c48f18-6692-4b6e-ba20-0a0978333fee.jpg', NULL, '莆田市城厢区');
INSERT INTO `t_address` VALUES (13, '门诊部', '13453733473', '119.014539,25.44939', '462dd1bd-f8c7-4647-9f25-ef3bac2e01c7.jpg', NULL, '莆田市城厢区莆田学院');
INSERT INTO `t_address` VALUES (14, '莆田市秀屿区妈祖医学院', '5463753737', '119.124923,25.159549', 'ee2e62f8-395d-4b70-8f3d-bb4c2310ae64.jpg', NULL, '莆田市秀屿区妈祖医学院');

-- ----------------------------
-- Table structure for t_checkgroup
-- ----------------------------
DROP TABLE IF EXISTS `t_checkgroup`;
CREATE TABLE `t_checkgroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `helpCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attention` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_checkgroup
-- ----------------------------
INSERT INTO `t_checkgroup` VALUES (5, '0001', '一般检查', 'YBJC', '0', '一般检查', '无');
INSERT INTO `t_checkgroup` VALUES (6, '0002', '视力色觉', 'SLSJ', '0', '视力色觉', '无');
INSERT INTO `t_checkgroup` VALUES (7, '0003', '血常规', 'XCG', '0', '血常规', '无');
INSERT INTO `t_checkgroup` VALUES (9, '0005', '肝功三项', 'GGSX', '0', '肝功三项', '无');
INSERT INTO `t_checkgroup` VALUES (10, '0006', '肾功三项', 'NGSX', '0', '肾功三项', '无');
INSERT INTO `t_checkgroup` VALUES (11, '0007', '血脂四项', 'XZSX', '0', '血脂四项', '无');
INSERT INTO `t_checkgroup` VALUES (12, '0008', '心肌酶三项', 'XJMSX', '0', '心肌酶三项', '无');
INSERT INTO `t_checkgroup` VALUES (13, '0009', '甲功三项', 'JGSX', '0', '甲功三项', '无');
INSERT INTO `t_checkgroup` VALUES (14, '0010', '子宫附件彩超', 'ZGFJCC', '2', '子宫附件彩超', '无');
INSERT INTO `t_checkgroup` VALUES (15, '0011', '胆红素三项', 'DHSSX', '0', '胆红素三项', '无');

-- ----------------------------
-- Table structure for t_checkgroup_checkitem
-- ----------------------------
DROP TABLE IF EXISTS `t_checkgroup_checkitem`;
CREATE TABLE `t_checkgroup_checkitem`  (
  `checkgroup_id` int(11) NOT NULL DEFAULT 0,
  `checkitem_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`checkgroup_id`, `checkitem_id`) USING BTREE,
  INDEX `item_id`(`checkitem_id`) USING BTREE,
  CONSTRAINT `group_id` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_id` FOREIGN KEY (`checkitem_id`) REFERENCES `t_checkitem` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_checkgroup_checkitem
-- ----------------------------
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 28);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 29);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 30);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 31);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 32);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 33);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 34);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 35);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 36);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 38);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 39);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 40);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 41);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 42);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 43);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 44);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 45);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 46);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 47);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 48);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 49);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 50);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 51);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 52);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 53);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 54);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 55);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 56);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 72);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 73);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 74);
INSERT INTO `t_checkgroup_checkitem` VALUES (10, 75);
INSERT INTO `t_checkgroup_checkitem` VALUES (10, 76);
INSERT INTO `t_checkgroup_checkitem` VALUES (10, 77);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 78);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 79);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 80);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 81);
INSERT INTO `t_checkgroup_checkitem` VALUES (12, 82);
INSERT INTO `t_checkgroup_checkitem` VALUES (12, 83);
INSERT INTO `t_checkgroup_checkitem` VALUES (12, 84);
INSERT INTO `t_checkgroup_checkitem` VALUES (13, 85);
INSERT INTO `t_checkgroup_checkitem` VALUES (13, 86);
INSERT INTO `t_checkgroup_checkitem` VALUES (13, 87);
INSERT INTO `t_checkgroup_checkitem` VALUES (15, 90);
INSERT INTO `t_checkgroup_checkitem` VALUES (15, 91);
INSERT INTO `t_checkgroup_checkitem` VALUES (15, 92);

-- ----------------------------
-- Table structure for t_checkitem
-- ----------------------------
DROP TABLE IF EXISTS `t_checkitem`;
CREATE TABLE `t_checkitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查检项类型,分为检查和检验两种',
  `attention` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_checkitem
-- ----------------------------
INSERT INTO `t_checkitem` VALUES (28, '0001', '身高', '0', '0-100', 5, '1', '无', '身高');
INSERT INTO `t_checkitem` VALUES (29, '0002', '体重', '0', '0-100', 5, '1', '无', '体重');
INSERT INTO `t_checkitem` VALUES (30, '0003', '体重指数', '0', '0-100', 5, '1', '无', '体重指数');
INSERT INTO `t_checkitem` VALUES (31, '0004', '收缩压', '0', '0-100', 5, '1', '无', '收缩压');
INSERT INTO `t_checkitem` VALUES (32, '0005', '舒张压', '0', '0-100', 5, '1', '无', '舒张压');
INSERT INTO `t_checkitem` VALUES (33, '0006', '裸视力（右）', '0', '0-100', 5, '1', '无', '裸视力（右）');
INSERT INTO `t_checkitem` VALUES (34, '0007', '裸视力（左）', '0', '0-100', 5, '1', '无', '裸视力（左）');
INSERT INTO `t_checkitem` VALUES (35, '0008', '矫正视力（右）', '0', '0-100', 5, '1', '无', '矫正视力（右）');
INSERT INTO `t_checkitem` VALUES (36, '0009', '矫正视力（左）', '0', '0-100', 5, '1', '无', '矫正视力（左）');
INSERT INTO `t_checkitem` VALUES (38, '0011', '白细胞计数', '0', '0-100', 10, '2', '无', '白细胞计数');
INSERT INTO `t_checkitem` VALUES (39, '0012', '红细胞计数', '0', '0-100', 10, '2', NULL, '红细胞计数');
INSERT INTO `t_checkitem` VALUES (40, '0013', '血红蛋白', '0', '0-100', 10, '2', NULL, '血红蛋白');
INSERT INTO `t_checkitem` VALUES (41, '0014', '红细胞压积', '0', '0-100', 10, '2', NULL, '红细胞压积');
INSERT INTO `t_checkitem` VALUES (42, '0015', '平均红细胞体积', '0', '0-100', 10, '2', NULL, '平均红细胞体积');
INSERT INTO `t_checkitem` VALUES (43, '0016', '平均红细胞血红蛋白含量', '0', '0-100', 10, '2', NULL, '平均红细胞血红蛋白含量');
INSERT INTO `t_checkitem` VALUES (44, '0017', '平均红细胞血红蛋白浓度', '0', '0-100', 10, '2', NULL, '平均红细胞血红蛋白浓度');
INSERT INTO `t_checkitem` VALUES (45, '0018', '红细胞分布宽度-变异系数', '0', '0-100', 10, '2', NULL, '红细胞分布宽度-变异系数');
INSERT INTO `t_checkitem` VALUES (46, '0019', '血小板计数', '0', '0-100', 10, '2', NULL, '血小板计数');
INSERT INTO `t_checkitem` VALUES (47, '0020', '平均血小板体积', '0', '0-100', 10, '2', NULL, '平均血小板体积');
INSERT INTO `t_checkitem` VALUES (48, '0021', '血小板分布宽度', '0', '0-100', 10, '2', NULL, '血小板分布宽度');
INSERT INTO `t_checkitem` VALUES (49, '0022', '淋巴细胞百分比', '0', '0-100', 10, '2', NULL, '淋巴细胞百分比');
INSERT INTO `t_checkitem` VALUES (50, '0023', '中间细胞百分比', '0', '0-100', 10, '2', NULL, '中间细胞百分比');
INSERT INTO `t_checkitem` VALUES (51, '0024', '中性粒细胞百分比', '0', '0-100', 10, '2', NULL, '中性粒细胞百分比');
INSERT INTO `t_checkitem` VALUES (52, '0025', '淋巴细胞绝对值', '0', '0-100', 10, '2', NULL, '淋巴细胞绝对值');
INSERT INTO `t_checkitem` VALUES (53, '0026', '中间细胞绝对值', '0', '0-100', 10, '2', NULL, '中间细胞绝对值');
INSERT INTO `t_checkitem` VALUES (54, '0027', '中性粒细胞绝对值', '0', '0-100', 10, '2', NULL, '中性粒细胞绝对值');
INSERT INTO `t_checkitem` VALUES (55, '0028', '红细胞分布宽度-标准差', '0', '0-100', 10, '2', NULL, '红细胞分布宽度-标准差');
INSERT INTO `t_checkitem` VALUES (56, '0029', '血小板压积', '0', '0-100', 10, '2', NULL, '血小板压积');
INSERT INTO `t_checkitem` VALUES (57, '0030', '尿比重', '0', '0-100', 10, '2', NULL, '尿比重');
INSERT INTO `t_checkitem` VALUES (58, '0031', '尿酸碱度', '0', '0-100', 10, '2', NULL, '尿酸碱度');
INSERT INTO `t_checkitem` VALUES (59, '0032', '尿白细胞', '0', '0-100', 10, '2', NULL, '尿白细胞');
INSERT INTO `t_checkitem` VALUES (60, '0033', '尿亚硝酸盐', '0', '0-100', 10, '2', NULL, '尿亚硝酸盐');
INSERT INTO `t_checkitem` VALUES (61, '0034', '尿蛋白质', '0', '0-100', 10, '2', NULL, '尿蛋白质');
INSERT INTO `t_checkitem` VALUES (62, '0035', '尿糖', '0', '0-100', 10, '2', NULL, '尿糖');
INSERT INTO `t_checkitem` VALUES (63, '0036', '尿酮体', '0', '0-100', 10, '2', NULL, '尿酮体');
INSERT INTO `t_checkitem` VALUES (64, '0037', '尿胆原', '0', '0-100', 10, '2', NULL, '尿胆原');
INSERT INTO `t_checkitem` VALUES (65, '0038', '尿胆红素', '0', '0-100', 10, '2', NULL, '尿胆红素');
INSERT INTO `t_checkitem` VALUES (66, '0039', '尿隐血', '0', '0-100', 10, '2', NULL, '尿隐血');
INSERT INTO `t_checkitem` VALUES (67, '0040', '尿镜检红细胞', '0', '0-100', 10, '2', NULL, '尿镜检红细胞');
INSERT INTO `t_checkitem` VALUES (68, '0041', '尿镜检白细胞', '0', '0-100', 10, '2', NULL, '尿镜检白细胞');
INSERT INTO `t_checkitem` VALUES (69, '0042', '上皮细胞', '0', '0-100', 10, '2', NULL, '上皮细胞');
INSERT INTO `t_checkitem` VALUES (70, '0043', '无机盐类', '0', '0-100', 10, '2', NULL, '无机盐类');
INSERT INTO `t_checkitem` VALUES (71, '0044', '尿镜检蛋白定性', '0', '0-100', 10, '2', NULL, '尿镜检蛋白定性');
INSERT INTO `t_checkitem` VALUES (72, '0045', '丙氨酸氨基转移酶', '0', '0-100', 10, '2', NULL, '丙氨酸氨基转移酶');
INSERT INTO `t_checkitem` VALUES (73, '0046', '天门冬氨酸氨基转移酶', '0', '0-100', 10, '2', NULL, '天门冬氨酸氨基转移酶');
INSERT INTO `t_checkitem` VALUES (74, '0047', 'Y-谷氨酰转移酶', '0', '0-100', 10, '2', NULL, 'Y-谷氨酰转移酶');
INSERT INTO `t_checkitem` VALUES (75, '0048', '尿素', '0', '0-100', 10, '2', NULL, '尿素');
INSERT INTO `t_checkitem` VALUES (76, '0049', '肌酐', '0', '0-100', 10, '2', NULL, '肌酐');
INSERT INTO `t_checkitem` VALUES (77, '0050', '尿酸', '0', '0-100', 10, '2', NULL, '尿酸');
INSERT INTO `t_checkitem` VALUES (78, '0051', '总胆固醇', '0', '0-100', 10, '2', NULL, '总胆固醇');
INSERT INTO `t_checkitem` VALUES (79, '0052', '甘油三酯', '0', '0-100', 10, '2', NULL, '甘油三酯');
INSERT INTO `t_checkitem` VALUES (80, '0053', '高密度脂蛋白胆固醇', '0', '0-100', 10, '2', NULL, '高密度脂蛋白胆固醇');
INSERT INTO `t_checkitem` VALUES (81, '0054', '低密度脂蛋白胆固醇', '0', '0-100', 10, '2', NULL, '低密度脂蛋白胆固醇');
INSERT INTO `t_checkitem` VALUES (82, '0055', '磷酸肌酸激酶', '0', '0-100', 10, '2', NULL, '磷酸肌酸激酶');
INSERT INTO `t_checkitem` VALUES (83, '0056', '磷酸肌酸激酶同工酶', '0', '0-100', 10, '2', NULL, '磷酸肌酸激酶同工酶');
INSERT INTO `t_checkitem` VALUES (84, '0057', '乳酸脱氢酶', '0', '0-100', 10, '2', NULL, '乳酸脱氢酶');
INSERT INTO `t_checkitem` VALUES (85, '0058', '三碘甲状腺原氨酸', '0', '0-100', 10, '2', NULL, '三碘甲状腺原氨酸');
INSERT INTO `t_checkitem` VALUES (86, '0059', '甲状腺素', '0', '0-100', 10, '2', NULL, '甲状腺素');
INSERT INTO `t_checkitem` VALUES (87, '0060', '促甲状腺激素', '0', '0-100', 10, '2', NULL, '促甲状腺激素');
INSERT INTO `t_checkitem` VALUES (90, '0063', '总胆红素', '0', '0-100', 10, '2', NULL, '总胆红素');
INSERT INTO `t_checkitem` VALUES (91, '0064', '直接胆红素', '0', '0-100', 10, '2', NULL, '直接胆红素');
INSERT INTO `t_checkitem` VALUES (92, '0065', '间接胆红素', '0', '0-100', 10, '2', NULL, '间接胆红素');

-- ----------------------------
-- Table structure for t_food
-- ----------------------------
DROP TABLE IF EXISTS `t_food`;
CREATE TABLE `t_food`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `foodname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kind` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_food
-- ----------------------------
INSERT INTO `t_food` VALUES (1, '苹果', '水果类', '个', '0-95');
INSERT INTO `t_food` VALUES (2, '香蕉', '水果类', '千克', '0-100');
INSERT INTO `t_food` VALUES (3, '葡萄', '水果类', '克', '0-100');
INSERT INTO `t_food` VALUES (16, '火龙果', '水果类', '千克', '0-100');
INSERT INTO `t_food` VALUES (17, '火龙果(进口)', '大豆类', '个', '0-100');
INSERT INTO `t_food` VALUES (18, '牛奶', '奶类', '升', '0-85');

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileNumber` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idCard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `regTime` date NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `healthmanager` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_member_user`(`healthmanager`) USING BTREE,
  CONSTRAINT `fk_member_user` FOREIGN KEY (`healthmanager`) REFERENCES `t_user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES (83, '', '布鲁斯', '1', '123456789000999999', '18956101528', '2019-03-11', NULL, '3161758940@qq.com', '1998-09-15', NULL, '韦宇杨');
INSERT INTO `t_member` VALUES (84, '', '洋洋', '1', '177988455322885', '18256589787', '2019-03-13', NULL, NULL, '1934-07-01', '', '范大炜');
INSERT INTO `t_member` VALUES (85, NULL, '12313', '2', '541254897854265897', '15334344343', '2019-03-06', NULL, NULL, '2019-10-01', '', '范大炜');
INSERT INTO `t_member` VALUES (86, NULL, '苏京盛', '1', '123131241434232453', '15156059456', '2019-04-04', NULL, NULL, '2019-09-25', NULL, '范大炜');
INSERT INTO `t_member` VALUES (87, NULL, '美国队长', '2', '313131314334245', '13856513229', '2019-02-06', NULL, NULL, '1999-06-24', NULL, '范大炜');
INSERT INTO `t_member` VALUES (88, '147', '345353', '1', '234223423113312', '13856513229', '2019-04-10', NULL, NULL, '1984-06-24', '8799879', '范大炜');
INSERT INTO `t_member` VALUES (89, NULL, 'jone', '1', '314423243111112', '13561234456', '2018-12-01', NULL, NULL, '1970-06-24', NULL, '范大炜');
INSERT INTO `t_member` VALUES (101, NULL, '王辉', NULL, '998759143245678', '13999999999', '2020-09-26', NULL, NULL, '1990-07-05', NULL, '范大炜');
INSERT INTO `t_member` VALUES (111, '1346', '陈伯', '1', '123456789101112', '13856513229', '2020-09-26', NULL, NULL, '2020-09-02', NULL, '范大炜');
INSERT INTO `t_member` VALUES (113, NULL, '2131', '1', '340602199705260617', '17688825511', NULL, NULL, '932045210@qq.com', NULL, NULL, '韦宇杨');
INSERT INTO `t_member` VALUES (116, NULL, '威威', NULL, '111111111111111', '13035059310', '2020-09-27', NULL, NULL, '2021-04-01', NULL, '韦宇杨');
INSERT INTO `t_member` VALUES (118, '22', '范大炜', '1', '350821200004100810', '17759010609', '2022-03-29', 'd7dd6b6f2c4a3996f8c22a9d93a030e5', 'xiaohuashidai@aliyun.com', '2000-04-10', NULL, '范大炜');
INSERT INTO `t_member` VALUES (119, NULL, '2', '1', '350252356236546', '13121212122', '2022-03-29', NULL, NULL, '2000-04-10', NULL, '韦宇杨');
INSERT INTO `t_member` VALUES (120, NULL, '55', '1', '353535353535355555', '15151519191', '2022-03-29', NULL, NULL, NULL, NULL, '范大炜');
INSERT INTO `t_member` VALUES (121, NULL, '韦宇杨', '1', '356462122235652456', '18759085656', '2022-03-29', NULL, NULL, NULL, NULL, '范大炜');
INSERT INTO `t_member` VALUES (122, NULL, '王辉', '1', '358888888888888888', '18888888888', '2022-03-29', NULL, NULL, NULL, NULL, '韦宇杨');
INSERT INTO `t_member` VALUES (124, NULL, '华政浩', '1', '356222200003010510', '18759990023', NULL, NULL, NULL, '2000-03-01', NULL, '韦宇杨');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkUrl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentMenuId` int(11) NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_13`(`parentMenuId`) USING BTREE,
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`parentMenuId`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, '会员管理', NULL, '2', 1, 'fa-user-md', '', NULL, 1);
INSERT INTO `t_menu` VALUES (2, '会员档案', 'member.html', '/2-2', 1, NULL, NULL, 1, 2);
INSERT INTO `t_menu` VALUES (5, '预约管理', NULL, '3', 2, 'fa-tty', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (7, '预约设置', 'ordersetting.html', '/3-2', 2, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (8, '套餐管理', 'setmeal.html', '/3-3', 3, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (9, '检查组管理', 'checkgroup.html', '/3-4', 4, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (10, '检查项管理', 'checkitem.html', '/3-5', 5, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (13, '统计分析', NULL, '5', 4, 'fa-heartbeat', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (14, '会员数量', 'report_member.html', '/5-1', 1, NULL, NULL, 13, 2);
INSERT INTO `t_menu` VALUES (15, '系统设置', NULL, '6', 5, 'fa-users', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (16, '菜单管理', 'menu.html', '/6-2', 2, NULL, NULL, 15, 2);
INSERT INTO `t_menu` VALUES (17, '权限管理', 'permission.html', '/6-1', 1, NULL, NULL, 15, 2);
INSERT INTO `t_menu` VALUES (18, '角色管理', 'role.html', '/6-4', 4, NULL, NULL, 15, 2);
INSERT INTO `t_menu` VALUES (19, '用户管理', 'user.html', '/6-3', 3, NULL, NULL, 15, 2);
INSERT INTO `t_menu` VALUES (20, '套餐占比', 'report_setmeal.html', '/5-2', 2, NULL, NULL, 13, 2);
INSERT INTO `t_menu` VALUES (21, '运营数据', 'report_business.html', '/5-3', 3, NULL, NULL, 13, 2);
INSERT INTO `t_menu` VALUES (30, '预约订单管理', 'order.html', '/3-7', 1, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (32, '体检机构', NULL, '7', 6, 'fa-stethoscope', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (33, '体检机构预览', 'map.html', '/7-1', 1, NULL, NULL, 32, 2);
INSERT INTO `t_menu` VALUES (34, '体检机构管理', 'address.html', '/7-2', 2, NULL, NULL, 32, 2);
INSERT INTO `t_menu` VALUES (35, '日志管理', 'syslog.html', '/8-1', 1, NULL, NULL, 15, 4);
INSERT INTO `t_menu` VALUES (36, '知识库', NULL, '8', 7, 'fa-book', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (37, '饮食库', 'food.html', '/8-1', 1, NULL, NULL, 36, 2);
INSERT INTO `t_menu` VALUES (38, '运动库', 'sport.html', '/8-2', 2, NULL, NULL, 36, 2);
INSERT INTO `t_menu` VALUES (39, '年龄分布统计', 'report_age.html', '/3-4', 4, NULL, NULL, 13, 2);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL COMMENT '员会id',
  `orderDate` date NULL DEFAULT NULL COMMENT '约预日期',
  `orderType` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '约预类型 电话预约/微信预约',
  `orderStatus` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约状态（是否到诊）',
  `setmeal_id` int(11) NULL DEFAULT NULL COMMENT '餐套id',
  `food` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sport` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `healthName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `suggestion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_member_id`(`member_id`) USING BTREE,
  INDEX `key_setmeal_id`(`setmeal_id`) USING BTREE,
  INDEX `key_address_id`(`address_id`) USING BTREE,
  CONSTRAINT `key_address_id` FOREIGN KEY (`address_id`) REFERENCES `t_address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `key_member_id` FOREIGN KEY (`member_id`) REFERENCES `t_member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `key_setmeal_id` FOREIGN KEY (`setmeal_id`) REFERENCES `t_setmeal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (2, 83, '2020-09-17', '电话预约', '已到诊', 13, '香蕉,苹果', '背部拉伸', 'admin', '564456', 7);
INSERT INTO `t_order` VALUES (3, 84, '2020-09-17', '电话预约', '未到诊', 14, NULL, NULL, NULL, NULL, 6);
INSERT INTO `t_order` VALUES (16, 83, '2020-09-23', '电话预约', '未到诊', 14, NULL, NULL, NULL, NULL, 11);
INSERT INTO `t_order` VALUES (17, 84, '2020-09-25', '微信预约', '未到诊', 13, '苹果,香蕉', '背部拉伸,碾压脊柱', 'admin', 'aaa', 12);
INSERT INTO `t_order` VALUES (19, 86, '2020-09-26', '微信预约', '已到诊', 15, NULL, NULL, NULL, NULL, 14);
INSERT INTO `t_order` VALUES (21, 88, '2020-09-27', '微信预约', '未到诊', 15, NULL, NULL, '仲飞', NULL, NULL);
INSERT INTO `t_order` VALUES (22, 89, '2020-09-28', '微信预约', '已到诊', 13, '苹果', NULL, 'admin', 'undefined', NULL);
INSERT INTO `t_order` VALUES (88, 113, '2020-09-27', '微信预约', '已到诊', 12, '香蕉,苹果,葡萄', '背部拉伸,碾压脊柱', 'admin', 'undefined', NULL);
INSERT INTO `t_order` VALUES (93, 101, '2020-09-27', '微信预约', '已到诊', 13, '苹果,香蕉', '背部拉伸,碾压脊柱', 'test', 'vvvv', NULL);
INSERT INTO `t_order` VALUES (94, 118, '2022-04-23', '电话预约', '已到诊', 12, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (95, 119, '2022-04-27', '电话预约', '未到诊', 12, NULL, NULL, NULL, NULL, 4);
INSERT INTO `t_order` VALUES (96, 120, '2022-04-21', '电话预约', '未到诊', 12, NULL, NULL, NULL, NULL, 14);
INSERT INTO `t_order` VALUES (97, 121, '2022-04-08', '电话预约', '未到诊', 12, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (98, 122, '2022-04-15', '电话预约', '未到诊', 14, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (99, 122, '2022-04-11', '电话预约', '未到诊', 12, NULL, NULL, NULL, NULL, 7);

-- ----------------------------
-- Table structure for t_ordersetting
-- ----------------------------
DROP TABLE IF EXISTS `t_ordersetting`;
CREATE TABLE `t_ordersetting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` date NULL DEFAULT NULL COMMENT '约预日期',
  `number` int(11) NULL DEFAULT NULL COMMENT '可预约人数',
  `reservations` int(11) NULL DEFAULT NULL COMMENT '已预约人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ordersetting
-- ----------------------------
INSERT INTO `t_ordersetting` VALUES (13, '2020-09-23', 100, 0);
INSERT INTO `t_ordersetting` VALUES (14, '2020-09-24', 200, 0);
INSERT INTO `t_ordersetting` VALUES (15, '2020-09-25', 300, 0);
INSERT INTO `t_ordersetting` VALUES (16, '2020-09-26', 200, 1);
INSERT INTO `t_ordersetting` VALUES (17, '2020-09-27', 200, 3);
INSERT INTO `t_ordersetting` VALUES (18, '2020-09-28', 200, 0);
INSERT INTO `t_ordersetting` VALUES (19, '2020-09-29', 200, 4);
INSERT INTO `t_ordersetting` VALUES (20, '2020-09-30', 200, 6);
INSERT INTO `t_ordersetting` VALUES (21, '2020-10-01', 300, 0);
INSERT INTO `t_ordersetting` VALUES (22, '2020-10-02', 600, 0);
INSERT INTO `t_ordersetting` VALUES (23, '2020-10-03', 500, 0);
INSERT INTO `t_ordersetting` VALUES (24, '2020-10-04', 500, 0);
INSERT INTO `t_ordersetting` VALUES (25, '2020-10-05', 400, 0);
INSERT INTO `t_ordersetting` VALUES (26, '2020-10-06', 300, 0);
INSERT INTO `t_ordersetting` VALUES (27, '2020-10-07', 300, 1);
INSERT INTO `t_ordersetting` VALUES (28, '2020-10-08', 300, 0);
INSERT INTO `t_ordersetting` VALUES (29, '2020-10-09', 300, 0);
INSERT INTO `t_ordersetting` VALUES (30, '2020-10-10', 200, 0);
INSERT INTO `t_ordersetting` VALUES (31, '2020-10-11', 300, 0);
INSERT INTO `t_ordersetting` VALUES (32, '2020-10-12', 200, 0);
INSERT INTO `t_ordersetting` VALUES (33, '2020-10-13', 400, 0);
INSERT INTO `t_ordersetting` VALUES (34, '2020-10-14', 800, 0);
INSERT INTO `t_ordersetting` VALUES (69, '2020-10-09', 500, 0);
INSERT INTO `t_ordersetting` VALUES (70, '2020-10-14', 300, 0);
INSERT INTO `t_ordersetting` VALUES (71, '2020-10-15', 200, 0);
INSERT INTO `t_ordersetting` VALUES (72, '2020-10-16', 300, 0);
INSERT INTO `t_ordersetting` VALUES (73, '2020-10-17', 400, 0);
INSERT INTO `t_ordersetting` VALUES (74, '2022-03-28', 400, 0);
INSERT INTO `t_ordersetting` VALUES (75, '2022-03-29', 300, 0);
INSERT INTO `t_ordersetting` VALUES (76, '2022-03-30', 200, 0);
INSERT INTO `t_ordersetting` VALUES (77, '2022-03-31', 300, 0);
INSERT INTO `t_ordersetting` VALUES (78, '2022-04-01', 200, 0);
INSERT INTO `t_ordersetting` VALUES (79, '2022-04-02', 200, 0);
INSERT INTO `t_ordersetting` VALUES (80, '2022-04-03', 500, 0);
INSERT INTO `t_ordersetting` VALUES (81, '2022-04-04', 500, 0);
INSERT INTO `t_ordersetting` VALUES (82, '2022-04-05', 400, 0);
INSERT INTO `t_ordersetting` VALUES (83, '2022-04-06', 300, 0);
INSERT INTO `t_ordersetting` VALUES (84, '2022-04-07', 200, 0);
INSERT INTO `t_ordersetting` VALUES (85, '2022-04-08', 150, 1);
INSERT INTO `t_ordersetting` VALUES (86, '2022-04-09', 200, 0);
INSERT INTO `t_ordersetting` VALUES (87, '2022-04-10', 250, 0);
INSERT INTO `t_ordersetting` VALUES (88, '2022-04-11', 300, 1);
INSERT INTO `t_ordersetting` VALUES (89, '2022-04-12', 50, 0);
INSERT INTO `t_ordersetting` VALUES (90, '2022-04-13', 300, 0);
INSERT INTO `t_ordersetting` VALUES (91, '2022-04-14', 200, 0);
INSERT INTO `t_ordersetting` VALUES (92, '2022-04-15', 200, 1);
INSERT INTO `t_ordersetting` VALUES (93, '2022-04-16', 200, 0);
INSERT INTO `t_ordersetting` VALUES (94, '2022-04-17', 200, 0);
INSERT INTO `t_ordersetting` VALUES (95, '2022-04-18', 200, 0);
INSERT INTO `t_ordersetting` VALUES (96, '2022-04-19', 200, 0);
INSERT INTO `t_ordersetting` VALUES (97, '2022-04-20', 200, 0);
INSERT INTO `t_ordersetting` VALUES (98, '2022-04-21', 200, 2);
INSERT INTO `t_ordersetting` VALUES (99, '2022-04-22', 200, 0);
INSERT INTO `t_ordersetting` VALUES (100, '2022-04-23', 200, 0);
INSERT INTO `t_ordersetting` VALUES (101, '2022-04-24', 200, 0);
INSERT INTO `t_ordersetting` VALUES (102, '2022-04-25', 200, 0);
INSERT INTO `t_ordersetting` VALUES (103, '2022-04-26', 200, 0);
INSERT INTO `t_ordersetting` VALUES (104, '2022-04-27', 200, 1);
INSERT INTO `t_ordersetting` VALUES (105, '2022-04-28', 200, 0);
INSERT INTO `t_ordersetting` VALUES (106, '2022-04-29', 200, 0);
INSERT INTO `t_ordersetting` VALUES (107, '2022-04-30', 200, 0);
INSERT INTO `t_ordersetting` VALUES (108, '2022-05-01', 200, 0);
INSERT INTO `t_ordersetting` VALUES (109, '2022-05-02', 200, 0);
INSERT INTO `t_ordersetting` VALUES (110, '2022-05-03', 200, 0);
INSERT INTO `t_ordersetting` VALUES (111, '2022-05-04', 200, 0);
INSERT INTO `t_ordersetting` VALUES (112, '2022-05-05', 200, 0);
INSERT INTO `t_ordersetting` VALUES (113, '2022-05-06', 200, 0);
INSERT INTO `t_ordersetting` VALUES (114, '2022-05-07', 200, 0);
INSERT INTO `t_ordersetting` VALUES (115, '2022-05-08', 200, 0);
INSERT INTO `t_ordersetting` VALUES (116, '2022-05-09', 200, 0);
INSERT INTO `t_ordersetting` VALUES (117, '2022-05-10', 200, 0);
INSERT INTO `t_ordersetting` VALUES (118, '2022-05-11', 200, 0);
INSERT INTO `t_ordersetting` VALUES (119, '2022-05-12', 200, 0);
INSERT INTO `t_ordersetting` VALUES (120, '2022-05-13', 200, 0);
INSERT INTO `t_ordersetting` VALUES (121, '2022-05-14', 200, 0);
INSERT INTO `t_ordersetting` VALUES (122, '2022-05-15', 200, 0);
INSERT INTO `t_ordersetting` VALUES (123, '2022-05-16', 200, 0);
INSERT INTO `t_ordersetting` VALUES (124, '2022-05-17', 200, 0);
INSERT INTO `t_ordersetting` VALUES (125, '2022-05-18', 200, 0);
INSERT INTO `t_ordersetting` VALUES (126, '2022-05-19', 200, 0);
INSERT INTO `t_ordersetting` VALUES (127, '2022-05-20', 200, 0);
INSERT INTO `t_ordersetting` VALUES (128, '2022-05-21', 200, 0);
INSERT INTO `t_ordersetting` VALUES (129, '2022-05-22', 200, 0);
INSERT INTO `t_ordersetting` VALUES (130, '2022-05-23', 200, 0);
INSERT INTO `t_ordersetting` VALUES (131, '2022-05-24', 200, 0);
INSERT INTO `t_ordersetting` VALUES (132, '2022-05-25', 200, 0);
INSERT INTO `t_ordersetting` VALUES (133, '2022-05-26', 200, 0);
INSERT INTO `t_ordersetting` VALUES (134, '2022-05-27', 200, 0);
INSERT INTO `t_ordersetting` VALUES (135, '2022-05-28', 200, 0);
INSERT INTO `t_ordersetting` VALUES (136, '2022-05-29', 200, 0);
INSERT INTO `t_ordersetting` VALUES (137, '2022-05-30', 200, 0);
INSERT INTO `t_ordersetting` VALUES (138, '2022-05-31', 200, 0);
INSERT INTO `t_ordersetting` VALUES (139, '2022-06-01', 200, 0);
INSERT INTO `t_ordersetting` VALUES (140, '2022-06-02', 200, 0);
INSERT INTO `t_ordersetting` VALUES (141, '2022-06-03', 200, 0);
INSERT INTO `t_ordersetting` VALUES (142, '2022-06-04', 200, 0);
INSERT INTO `t_ordersetting` VALUES (143, '2022-06-05', 200, 0);
INSERT INTO `t_ordersetting` VALUES (144, '2022-06-06', 200, 0);
INSERT INTO `t_ordersetting` VALUES (145, '2022-06-07', 200, 0);
INSERT INTO `t_ordersetting` VALUES (146, '2022-06-08', 200, 0);
INSERT INTO `t_ordersetting` VALUES (147, '2022-06-09', 200, 0);
INSERT INTO `t_ordersetting` VALUES (148, '2022-06-10', 200, 0);
INSERT INTO `t_ordersetting` VALUES (149, '2022-06-11', 200, 0);
INSERT INTO `t_ordersetting` VALUES (150, '2022-06-12', 200, 0);
INSERT INTO `t_ordersetting` VALUES (151, '2022-06-13', 200, 0);
INSERT INTO `t_ordersetting` VALUES (152, '2022-06-14', 200, 0);
INSERT INTO `t_ordersetting` VALUES (153, '2022-06-15', 200, 0);
INSERT INTO `t_ordersetting` VALUES (154, '2022-06-16', 200, 0);
INSERT INTO `t_ordersetting` VALUES (155, '2022-06-17', 200, 0);
INSERT INTO `t_ordersetting` VALUES (156, '2022-06-18', 200, 0);
INSERT INTO `t_ordersetting` VALUES (157, '2022-06-19', 200, 0);
INSERT INTO `t_ordersetting` VALUES (158, '2022-06-20', 500, 0);
INSERT INTO `t_ordersetting` VALUES (159, '2022-06-21', 200, 0);
INSERT INTO `t_ordersetting` VALUES (160, '2022-06-22', 200, 0);
INSERT INTO `t_ordersetting` VALUES (161, '2022-06-23', 300, 0);
INSERT INTO `t_ordersetting` VALUES (162, '2022-06-24', 200, 0);
INSERT INTO `t_ordersetting` VALUES (163, '2022-06-25', 200, 0);
INSERT INTO `t_ordersetting` VALUES (164, '2022-06-26', 500, 0);
INSERT INTO `t_ordersetting` VALUES (165, '2022-06-27', 200, 0);
INSERT INTO `t_ordersetting` VALUES (166, '2022-06-28', 200, 0);
INSERT INTO `t_ordersetting` VALUES (167, '2022-06-29', 200, 0);
INSERT INTO `t_ordersetting` VALUES (168, '2022-06-30', 400, 0);
INSERT INTO `t_ordersetting` VALUES (169, '2022-07-01', 200, 0);
INSERT INTO `t_ordersetting` VALUES (170, '2022-07-02', 300, 0);
INSERT INTO `t_ordersetting` VALUES (171, '2022-07-03', 200, 0);
INSERT INTO `t_ordersetting` VALUES (172, '2022-07-04', 200, 0);
INSERT INTO `t_ordersetting` VALUES (173, '2022-07-05', 100, 0);
INSERT INTO `t_ordersetting` VALUES (174, '2022-07-06', 200, 0);
INSERT INTO `t_ordersetting` VALUES (175, '2022-07-07', 100, 0);
INSERT INTO `t_ordersetting` VALUES (176, '2022-07-08', 200, 0);
INSERT INTO `t_ordersetting` VALUES (177, '2022-07-09', 200, 0);
INSERT INTO `t_ordersetting` VALUES (178, '2022-07-10', 220, 0);
INSERT INTO `t_ordersetting` VALUES (179, '2022-07-11', 240, 0);
INSERT INTO `t_ordersetting` VALUES (180, '2022-07-12', 260, 0);
INSERT INTO `t_ordersetting` VALUES (181, '2022-07-13', 280, 0);
INSERT INTO `t_ordersetting` VALUES (182, '2022-07-14', 300, 0);
INSERT INTO `t_ordersetting` VALUES (183, '2022-07-15', 320, 0);
INSERT INTO `t_ordersetting` VALUES (184, '2022-07-16', 340, 0);
INSERT INTO `t_ordersetting` VALUES (185, '2022-07-17', 360, 0);
INSERT INTO `t_ordersetting` VALUES (186, '2022-07-18', 380, 0);
INSERT INTO `t_ordersetting` VALUES (187, '2022-07-19', 400, 0);
INSERT INTO `t_ordersetting` VALUES (188, '2022-07-20', 420, 0);
INSERT INTO `t_ordersetting` VALUES (189, '2022-07-21', 440, 0);
INSERT INTO `t_ordersetting` VALUES (190, '2022-07-22', 460, 0);
INSERT INTO `t_ordersetting` VALUES (191, '2022-07-23', 480, 0);
INSERT INTO `t_ordersetting` VALUES (192, '2022-07-24', 500, 0);
INSERT INTO `t_ordersetting` VALUES (193, '2022-07-25', 300, 0);
INSERT INTO `t_ordersetting` VALUES (194, '2022-07-26', 300, 0);
INSERT INTO `t_ordersetting` VALUES (195, '2022-07-27', 300, 0);
INSERT INTO `t_ordersetting` VALUES (196, '2022-07-28', 300, 0);
INSERT INTO `t_ordersetting` VALUES (197, '2022-07-29', 300, 0);
INSERT INTO `t_ordersetting` VALUES (198, '2022-07-30', 300, 0);
INSERT INTO `t_ordersetting` VALUES (199, '2022-07-31', 200, 0);
INSERT INTO `t_ordersetting` VALUES (200, '2022-08-01', 5000, 0);
INSERT INTO `t_ordersetting` VALUES (201, '2022-08-02', 300, 0);

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyword` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cretime` date NULL DEFAULT NULL,
  `station` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, '新增检查项', 'CHECKITEM_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (2, '删除检查项', 'CHECKITEM_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (3, '编辑检查项', 'CHECKITEM_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (4, '查询检查项', 'CHECKITEM_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (5, '新增检查组', 'CHECKGROUP_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (6, '删除检查组', 'CHECKGROUP_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (7, '编辑检查组', 'CHECKGROUP_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (8, '查询检查组', 'CHECKGROUP_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (9, '新增套餐', 'SETMEAL_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (10, '删除套餐', 'SETMEAL_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (11, '编辑套餐', 'SETMEAL_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (12, '查询套餐', 'SETMEAL_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (13, '预约设置', 'ORDERSETTING', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (14, '查看统计报表', 'REPORT_VIEW', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (15, '新增菜单', 'MENU_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (16, '删除菜单', 'MENU_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (17, '编辑菜单', 'MENU_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (18, '查询菜单', 'MENU_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (19, '新增角色', 'ROLE_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (20, '删除角色', 'ROLE_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (21, '编辑角色', 'ROLE_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (22, '查询角色', 'ROLE_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (23, '新增用户', 'USER_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (24, '删除用户', 'USER_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (25, '编辑用户', 'USER_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (26, '查询用户', 'USER_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (27, '初始化套餐', 'SETMEAL_INIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (28, '初始化套餐', 'SETMEAL_INIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (29, '预约模板下载', 'ORDER_DOWM', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (30, '预约模板上传', 'ORDER_UPLOAD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (31, '查询会员', 'MEMBER_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (32, '编辑会员', 'MEMBER_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (33, '删除会员', 'MEMBER_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (34, '查询会员', 'MEMBER_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (35, '会员模板下载', 'MEMBER_DOWN', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (36, '新增体检机构', 'ADDRESS_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (37, '查询体检机构', 'ADDRESS_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (38, '修改体检机构', 'ADDRESS_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (39, '删除体检机构', 'ADDRESS_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (42, '查询食物', 'FOOD_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (43, '新增食物', 'FOOD_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (44, '修改食物', 'FOOD_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (45, '删除食物', 'FOOD_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (48, '新增运动', 'SPORT_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (49, '修改运动', 'SPORT_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (50, '删除运动', 'SPORT_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (51, '查询运动', 'SPORT_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (52, '新增权限', 'PERMISSION_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (53, '编辑权限', 'PERMISSION_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (54, '删除权限', 'PERMISSION_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (55, '查询权限', 'PERMISSION_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (60, '查询预约', 'ORDER_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (61, '添加预约', 'ORDER_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (62, '编辑预约', 'ORDER_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (63, '删除预约', 'ORDER_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (64, '电话预约', 'ORDER_BY_TELEPHONE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (66, '查看健康干预', 'HEALTH_LOOK', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (67, '新增健康干预', 'HEALTH_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (68, '测试', 'TEST', '测试用', '2022-03-26', '1');
INSERT INTO `t_permission` VALUES (70, '修改到诊状态', 'STATUS_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (71, '运营数据导出', 'REPORT_DOWN', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (72, '日志查看', 'SYSLOG_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (73, '日志删除', 'SYSLOG_DELETE', NULL, NULL, '1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyword` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '系统管理员', 'ROLE_ADMIN', NULL);
INSERT INTO `t_role` VALUES (3, '安全管理大师', 'SAFE_SYSTEM', '国家6A认证');
INSERT INTO `t_role` VALUES (7, '健康管理师', 'HEALTH_MANAGER', '2');
INSERT INTO `t_role` VALUES (14, '后台系统管理员', 'SYSTEMBK_MANAGER', '后台系统管理员');
INSERT INTO `t_role` VALUES (15, '会员管理大师', 'MEMBER_MANAGER', NULL);
INSERT INTO `t_role` VALUES (16, '推广大使', 'PROMONTION_MANAGER', '体检机构管理');
INSERT INTO `t_role` VALUES (17, '数据管理师', 'DATA_ADMINISTRATOR', '后台数据报表');
INSERT INTO `t_role` VALUES (18, '人事主管', 'H_R', '人事牛皮');
INSERT INTO `t_role` VALUES (19, '健康管理员', 'HEALTHER_MANAGER', '健康干预');
INSERT INTO `t_role` VALUES (20, 'PERSON', 'LOOK_ALL', 'COMMON_EVERY');
INSERT INTO `t_role` VALUES (22, '讲师', 'CHENG', NULL);

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FK_Reference_10`(`menu_id`) USING BTREE,
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (1, 1);
INSERT INTO `t_role_menu` VALUES (3, 1);
INSERT INTO `t_role_menu` VALUES (14, 1);
INSERT INTO `t_role_menu` VALUES (15, 1);
INSERT INTO `t_role_menu` VALUES (1, 2);
INSERT INTO `t_role_menu` VALUES (3, 2);
INSERT INTO `t_role_menu` VALUES (14, 2);
INSERT INTO `t_role_menu` VALUES (15, 2);
INSERT INTO `t_role_menu` VALUES (1, 5);
INSERT INTO `t_role_menu` VALUES (3, 5);
INSERT INTO `t_role_menu` VALUES (7, 5);
INSERT INTO `t_role_menu` VALUES (14, 5);
INSERT INTO `t_role_menu` VALUES (18, 5);
INSERT INTO `t_role_menu` VALUES (19, 5);
INSERT INTO `t_role_menu` VALUES (20, 5);
INSERT INTO `t_role_menu` VALUES (1, 7);
INSERT INTO `t_role_menu` VALUES (3, 7);
INSERT INTO `t_role_menu` VALUES (14, 7);
INSERT INTO `t_role_menu` VALUES (19, 7);
INSERT INTO `t_role_menu` VALUES (1, 8);
INSERT INTO `t_role_menu` VALUES (3, 8);
INSERT INTO `t_role_menu` VALUES (14, 8);
INSERT INTO `t_role_menu` VALUES (19, 8);
INSERT INTO `t_role_menu` VALUES (20, 8);
INSERT INTO `t_role_menu` VALUES (1, 9);
INSERT INTO `t_role_menu` VALUES (3, 9);
INSERT INTO `t_role_menu` VALUES (14, 9);
INSERT INTO `t_role_menu` VALUES (19, 9);
INSERT INTO `t_role_menu` VALUES (20, 9);
INSERT INTO `t_role_menu` VALUES (1, 10);
INSERT INTO `t_role_menu` VALUES (3, 10);
INSERT INTO `t_role_menu` VALUES (14, 10);
INSERT INTO `t_role_menu` VALUES (19, 10);
INSERT INTO `t_role_menu` VALUES (1, 13);
INSERT INTO `t_role_menu` VALUES (3, 13);
INSERT INTO `t_role_menu` VALUES (14, 13);
INSERT INTO `t_role_menu` VALUES (17, 13);
INSERT INTO `t_role_menu` VALUES (20, 13);
INSERT INTO `t_role_menu` VALUES (1, 14);
INSERT INTO `t_role_menu` VALUES (3, 14);
INSERT INTO `t_role_menu` VALUES (14, 14);
INSERT INTO `t_role_menu` VALUES (17, 14);
INSERT INTO `t_role_menu` VALUES (20, 14);
INSERT INTO `t_role_menu` VALUES (1, 15);
INSERT INTO `t_role_menu` VALUES (3, 15);
INSERT INTO `t_role_menu` VALUES (14, 15);
INSERT INTO `t_role_menu` VALUES (1, 16);
INSERT INTO `t_role_menu` VALUES (3, 16);
INSERT INTO `t_role_menu` VALUES (14, 16);
INSERT INTO `t_role_menu` VALUES (1, 17);
INSERT INTO `t_role_menu` VALUES (3, 17);
INSERT INTO `t_role_menu` VALUES (14, 17);
INSERT INTO `t_role_menu` VALUES (1, 18);
INSERT INTO `t_role_menu` VALUES (3, 18);
INSERT INTO `t_role_menu` VALUES (14, 18);
INSERT INTO `t_role_menu` VALUES (1, 19);
INSERT INTO `t_role_menu` VALUES (3, 19);
INSERT INTO `t_role_menu` VALUES (14, 19);
INSERT INTO `t_role_menu` VALUES (1, 20);
INSERT INTO `t_role_menu` VALUES (3, 20);
INSERT INTO `t_role_menu` VALUES (14, 20);
INSERT INTO `t_role_menu` VALUES (17, 20);
INSERT INTO `t_role_menu` VALUES (1, 21);
INSERT INTO `t_role_menu` VALUES (3, 21);
INSERT INTO `t_role_menu` VALUES (14, 21);
INSERT INTO `t_role_menu` VALUES (17, 21);
INSERT INTO `t_role_menu` VALUES (1, 30);
INSERT INTO `t_role_menu` VALUES (3, 30);
INSERT INTO `t_role_menu` VALUES (14, 30);
INSERT INTO `t_role_menu` VALUES (19, 30);
INSERT INTO `t_role_menu` VALUES (1, 32);
INSERT INTO `t_role_menu` VALUES (3, 32);
INSERT INTO `t_role_menu` VALUES (14, 32);
INSERT INTO `t_role_menu` VALUES (16, 32);
INSERT INTO `t_role_menu` VALUES (20, 32);
INSERT INTO `t_role_menu` VALUES (1, 33);
INSERT INTO `t_role_menu` VALUES (3, 33);
INSERT INTO `t_role_menu` VALUES (14, 33);
INSERT INTO `t_role_menu` VALUES (16, 33);
INSERT INTO `t_role_menu` VALUES (20, 33);
INSERT INTO `t_role_menu` VALUES (1, 34);
INSERT INTO `t_role_menu` VALUES (3, 34);
INSERT INTO `t_role_menu` VALUES (14, 34);
INSERT INTO `t_role_menu` VALUES (16, 34);
INSERT INTO `t_role_menu` VALUES (20, 34);
INSERT INTO `t_role_menu` VALUES (1, 35);
INSERT INTO `t_role_menu` VALUES (3, 35);
INSERT INTO `t_role_menu` VALUES (14, 35);
INSERT INTO `t_role_menu` VALUES (1, 36);
INSERT INTO `t_role_menu` VALUES (14, 36);
INSERT INTO `t_role_menu` VALUES (19, 36);
INSERT INTO `t_role_menu` VALUES (20, 36);
INSERT INTO `t_role_menu` VALUES (22, 36);
INSERT INTO `t_role_menu` VALUES (1, 37);
INSERT INTO `t_role_menu` VALUES (14, 37);
INSERT INTO `t_role_menu` VALUES (19, 37);
INSERT INTO `t_role_menu` VALUES (20, 37);
INSERT INTO `t_role_menu` VALUES (1, 38);
INSERT INTO `t_role_menu` VALUES (14, 38);
INSERT INTO `t_role_menu` VALUES (19, 38);
INSERT INTO `t_role_menu` VALUES (20, 38);
INSERT INTO `t_role_menu` VALUES (1, 39);
INSERT INTO `t_role_menu` VALUES (14, 39);
INSERT INTO `t_role_menu` VALUES (17, 39);
INSERT INTO `t_role_menu` VALUES (20, 39);

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `FK_Reference_12`(`permission_id`) USING BTREE,
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES (1, 1);
INSERT INTO `t_role_permission` VALUES (14, 1);
INSERT INTO `t_role_permission` VALUES (19, 1);
INSERT INTO `t_role_permission` VALUES (1, 2);
INSERT INTO `t_role_permission` VALUES (14, 2);
INSERT INTO `t_role_permission` VALUES (19, 2);
INSERT INTO `t_role_permission` VALUES (1, 3);
INSERT INTO `t_role_permission` VALUES (14, 3);
INSERT INTO `t_role_permission` VALUES (19, 3);
INSERT INTO `t_role_permission` VALUES (1, 4);
INSERT INTO `t_role_permission` VALUES (7, 4);
INSERT INTO `t_role_permission` VALUES (14, 4);
INSERT INTO `t_role_permission` VALUES (19, 4);
INSERT INTO `t_role_permission` VALUES (1, 5);
INSERT INTO `t_role_permission` VALUES (3, 5);
INSERT INTO `t_role_permission` VALUES (14, 5);
INSERT INTO `t_role_permission` VALUES (19, 5);
INSERT INTO `t_role_permission` VALUES (1, 6);
INSERT INTO `t_role_permission` VALUES (3, 6);
INSERT INTO `t_role_permission` VALUES (14, 6);
INSERT INTO `t_role_permission` VALUES (19, 6);
INSERT INTO `t_role_permission` VALUES (1, 7);
INSERT INTO `t_role_permission` VALUES (3, 7);
INSERT INTO `t_role_permission` VALUES (14, 7);
INSERT INTO `t_role_permission` VALUES (19, 7);
INSERT INTO `t_role_permission` VALUES (1, 8);
INSERT INTO `t_role_permission` VALUES (3, 8);
INSERT INTO `t_role_permission` VALUES (14, 8);
INSERT INTO `t_role_permission` VALUES (19, 8);
INSERT INTO `t_role_permission` VALUES (1, 9);
INSERT INTO `t_role_permission` VALUES (3, 9);
INSERT INTO `t_role_permission` VALUES (14, 9);
INSERT INTO `t_role_permission` VALUES (19, 9);
INSERT INTO `t_role_permission` VALUES (1, 10);
INSERT INTO `t_role_permission` VALUES (3, 10);
INSERT INTO `t_role_permission` VALUES (14, 10);
INSERT INTO `t_role_permission` VALUES (19, 10);
INSERT INTO `t_role_permission` VALUES (1, 11);
INSERT INTO `t_role_permission` VALUES (3, 11);
INSERT INTO `t_role_permission` VALUES (14, 11);
INSERT INTO `t_role_permission` VALUES (19, 11);
INSERT INTO `t_role_permission` VALUES (1, 12);
INSERT INTO `t_role_permission` VALUES (3, 12);
INSERT INTO `t_role_permission` VALUES (14, 12);
INSERT INTO `t_role_permission` VALUES (19, 12);
INSERT INTO `t_role_permission` VALUES (1, 13);
INSERT INTO `t_role_permission` VALUES (3, 13);
INSERT INTO `t_role_permission` VALUES (14, 13);
INSERT INTO `t_role_permission` VALUES (1, 14);
INSERT INTO `t_role_permission` VALUES (3, 14);
INSERT INTO `t_role_permission` VALUES (14, 14);
INSERT INTO `t_role_permission` VALUES (1, 15);
INSERT INTO `t_role_permission` VALUES (3, 15);
INSERT INTO `t_role_permission` VALUES (14, 15);
INSERT INTO `t_role_permission` VALUES (1, 16);
INSERT INTO `t_role_permission` VALUES (3, 16);
INSERT INTO `t_role_permission` VALUES (14, 16);
INSERT INTO `t_role_permission` VALUES (1, 17);
INSERT INTO `t_role_permission` VALUES (3, 17);
INSERT INTO `t_role_permission` VALUES (14, 17);
INSERT INTO `t_role_permission` VALUES (1, 18);
INSERT INTO `t_role_permission` VALUES (3, 18);
INSERT INTO `t_role_permission` VALUES (14, 18);
INSERT INTO `t_role_permission` VALUES (1, 19);
INSERT INTO `t_role_permission` VALUES (3, 19);
INSERT INTO `t_role_permission` VALUES (14, 19);
INSERT INTO `t_role_permission` VALUES (1, 20);
INSERT INTO `t_role_permission` VALUES (3, 20);
INSERT INTO `t_role_permission` VALUES (14, 20);
INSERT INTO `t_role_permission` VALUES (1, 21);
INSERT INTO `t_role_permission` VALUES (3, 21);
INSERT INTO `t_role_permission` VALUES (14, 21);
INSERT INTO `t_role_permission` VALUES (1, 22);
INSERT INTO `t_role_permission` VALUES (3, 22);
INSERT INTO `t_role_permission` VALUES (14, 22);
INSERT INTO `t_role_permission` VALUES (1, 23);
INSERT INTO `t_role_permission` VALUES (3, 23);
INSERT INTO `t_role_permission` VALUES (14, 23);
INSERT INTO `t_role_permission` VALUES (1, 24);
INSERT INTO `t_role_permission` VALUES (3, 24);
INSERT INTO `t_role_permission` VALUES (14, 24);
INSERT INTO `t_role_permission` VALUES (1, 25);
INSERT INTO `t_role_permission` VALUES (3, 25);
INSERT INTO `t_role_permission` VALUES (14, 25);
INSERT INTO `t_role_permission` VALUES (1, 26);
INSERT INTO `t_role_permission` VALUES (3, 26);
INSERT INTO `t_role_permission` VALUES (14, 26);
INSERT INTO `t_role_permission` VALUES (1, 27);
INSERT INTO `t_role_permission` VALUES (3, 27);
INSERT INTO `t_role_permission` VALUES (14, 27);
INSERT INTO `t_role_permission` VALUES (1, 28);
INSERT INTO `t_role_permission` VALUES (3, 28);
INSERT INTO `t_role_permission` VALUES (14, 28);
INSERT INTO `t_role_permission` VALUES (19, 28);
INSERT INTO `t_role_permission` VALUES (1, 29);
INSERT INTO `t_role_permission` VALUES (3, 29);
INSERT INTO `t_role_permission` VALUES (14, 29);
INSERT INTO `t_role_permission` VALUES (19, 29);
INSERT INTO `t_role_permission` VALUES (1, 30);
INSERT INTO `t_role_permission` VALUES (3, 30);
INSERT INTO `t_role_permission` VALUES (14, 30);
INSERT INTO `t_role_permission` VALUES (19, 30);
INSERT INTO `t_role_permission` VALUES (1, 31);
INSERT INTO `t_role_permission` VALUES (3, 31);
INSERT INTO `t_role_permission` VALUES (14, 31);
INSERT INTO `t_role_permission` VALUES (15, 31);
INSERT INTO `t_role_permission` VALUES (1, 32);
INSERT INTO `t_role_permission` VALUES (3, 32);
INSERT INTO `t_role_permission` VALUES (14, 32);
INSERT INTO `t_role_permission` VALUES (15, 32);
INSERT INTO `t_role_permission` VALUES (1, 33);
INSERT INTO `t_role_permission` VALUES (3, 33);
INSERT INTO `t_role_permission` VALUES (14, 33);
INSERT INTO `t_role_permission` VALUES (15, 33);
INSERT INTO `t_role_permission` VALUES (1, 34);
INSERT INTO `t_role_permission` VALUES (3, 34);
INSERT INTO `t_role_permission` VALUES (14, 34);
INSERT INTO `t_role_permission` VALUES (15, 34);
INSERT INTO `t_role_permission` VALUES (19, 34);
INSERT INTO `t_role_permission` VALUES (1, 35);
INSERT INTO `t_role_permission` VALUES (3, 35);
INSERT INTO `t_role_permission` VALUES (14, 35);
INSERT INTO `t_role_permission` VALUES (15, 35);
INSERT INTO `t_role_permission` VALUES (1, 36);
INSERT INTO `t_role_permission` VALUES (3, 36);
INSERT INTO `t_role_permission` VALUES (14, 36);
INSERT INTO `t_role_permission` VALUES (16, 36);
INSERT INTO `t_role_permission` VALUES (1, 37);
INSERT INTO `t_role_permission` VALUES (3, 37);
INSERT INTO `t_role_permission` VALUES (14, 37);
INSERT INTO `t_role_permission` VALUES (16, 37);
INSERT INTO `t_role_permission` VALUES (1, 38);
INSERT INTO `t_role_permission` VALUES (3, 38);
INSERT INTO `t_role_permission` VALUES (14, 38);
INSERT INTO `t_role_permission` VALUES (16, 38);
INSERT INTO `t_role_permission` VALUES (1, 39);
INSERT INTO `t_role_permission` VALUES (3, 39);
INSERT INTO `t_role_permission` VALUES (14, 39);
INSERT INTO `t_role_permission` VALUES (16, 39);
INSERT INTO `t_role_permission` VALUES (1, 42);
INSERT INTO `t_role_permission` VALUES (3, 42);
INSERT INTO `t_role_permission` VALUES (14, 42);
INSERT INTO `t_role_permission` VALUES (19, 42);
INSERT INTO `t_role_permission` VALUES (1, 43);
INSERT INTO `t_role_permission` VALUES (3, 43);
INSERT INTO `t_role_permission` VALUES (14, 43);
INSERT INTO `t_role_permission` VALUES (19, 43);
INSERT INTO `t_role_permission` VALUES (1, 44);
INSERT INTO `t_role_permission` VALUES (3, 44);
INSERT INTO `t_role_permission` VALUES (14, 44);
INSERT INTO `t_role_permission` VALUES (19, 44);
INSERT INTO `t_role_permission` VALUES (1, 45);
INSERT INTO `t_role_permission` VALUES (3, 45);
INSERT INTO `t_role_permission` VALUES (14, 45);
INSERT INTO `t_role_permission` VALUES (19, 45);
INSERT INTO `t_role_permission` VALUES (1, 48);
INSERT INTO `t_role_permission` VALUES (3, 48);
INSERT INTO `t_role_permission` VALUES (14, 48);
INSERT INTO `t_role_permission` VALUES (19, 48);
INSERT INTO `t_role_permission` VALUES (1, 49);
INSERT INTO `t_role_permission` VALUES (3, 49);
INSERT INTO `t_role_permission` VALUES (14, 49);
INSERT INTO `t_role_permission` VALUES (19, 49);
INSERT INTO `t_role_permission` VALUES (1, 50);
INSERT INTO `t_role_permission` VALUES (3, 50);
INSERT INTO `t_role_permission` VALUES (14, 50);
INSERT INTO `t_role_permission` VALUES (19, 50);
INSERT INTO `t_role_permission` VALUES (1, 51);
INSERT INTO `t_role_permission` VALUES (3, 51);
INSERT INTO `t_role_permission` VALUES (14, 51);
INSERT INTO `t_role_permission` VALUES (19, 51);
INSERT INTO `t_role_permission` VALUES (1, 52);
INSERT INTO `t_role_permission` VALUES (3, 52);
INSERT INTO `t_role_permission` VALUES (14, 52);
INSERT INTO `t_role_permission` VALUES (1, 53);
INSERT INTO `t_role_permission` VALUES (3, 53);
INSERT INTO `t_role_permission` VALUES (14, 53);
INSERT INTO `t_role_permission` VALUES (1, 54);
INSERT INTO `t_role_permission` VALUES (3, 54);
INSERT INTO `t_role_permission` VALUES (14, 54);
INSERT INTO `t_role_permission` VALUES (1, 55);
INSERT INTO `t_role_permission` VALUES (3, 55);
INSERT INTO `t_role_permission` VALUES (14, 55);
INSERT INTO `t_role_permission` VALUES (1, 60);
INSERT INTO `t_role_permission` VALUES (3, 60);
INSERT INTO `t_role_permission` VALUES (14, 60);
INSERT INTO `t_role_permission` VALUES (18, 60);
INSERT INTO `t_role_permission` VALUES (19, 60);
INSERT INTO `t_role_permission` VALUES (1, 61);
INSERT INTO `t_role_permission` VALUES (3, 61);
INSERT INTO `t_role_permission` VALUES (14, 61);
INSERT INTO `t_role_permission` VALUES (18, 61);
INSERT INTO `t_role_permission` VALUES (1, 62);
INSERT INTO `t_role_permission` VALUES (3, 62);
INSERT INTO `t_role_permission` VALUES (14, 62);
INSERT INTO `t_role_permission` VALUES (18, 62);
INSERT INTO `t_role_permission` VALUES (1, 63);
INSERT INTO `t_role_permission` VALUES (3, 63);
INSERT INTO `t_role_permission` VALUES (14, 63);
INSERT INTO `t_role_permission` VALUES (18, 63);
INSERT INTO `t_role_permission` VALUES (1, 64);
INSERT INTO `t_role_permission` VALUES (3, 64);
INSERT INTO `t_role_permission` VALUES (14, 64);
INSERT INTO `t_role_permission` VALUES (18, 64);
INSERT INTO `t_role_permission` VALUES (1, 66);
INSERT INTO `t_role_permission` VALUES (3, 66);
INSERT INTO `t_role_permission` VALUES (14, 66);
INSERT INTO `t_role_permission` VALUES (19, 66);
INSERT INTO `t_role_permission` VALUES (1, 67);
INSERT INTO `t_role_permission` VALUES (3, 67);
INSERT INTO `t_role_permission` VALUES (14, 67);
INSERT INTO `t_role_permission` VALUES (19, 67);
INSERT INTO `t_role_permission` VALUES (1, 70);
INSERT INTO `t_role_permission` VALUES (1, 71);
INSERT INTO `t_role_permission` VALUES (1, 72);
INSERT INTO `t_role_permission` VALUES (1, 73);

-- ----------------------------
-- Table structure for t_setmeal
-- ----------------------------
DROP TABLE IF EXISTS `t_setmeal`;
CREATE TABLE `t_setmeal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `helpCode` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attention` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_setmeal
-- ----------------------------
INSERT INTO `t_setmeal` VALUES (12, '入职无忧体检套餐（男女通用）', '0001', 'RZTJ', '0', '18-60', 300, '入职体检套餐', '入职体检', 'c1c110e0-fce3-4b1f-9387-ac9c0b432a331.jpg');
INSERT INTO `t_setmeal` VALUES (13, '粉红珍爱(女)升级TM12项筛查体检套餐', '0002', 'FHZA', '2', '18-60', 1200, '本套餐针对宫颈(TCT检查、HPV乳头瘤病毒筛查）、乳腺（彩超，癌抗125），甲状腺（彩超，甲功验血）以及胸片，血常规肝功等有全面检查，非常适合女性全面疾病筛查使用。', '女性专用', '6fa6af41-b57a-4e53-9ef6-26885ec40eb72.jpg');
INSERT INTO `t_setmeal` VALUES (14, '阳光爸妈升级肿瘤12项筛查（男女单人）体检套餐', '0003', 'YGBM', '0', '55-100', 1400, '本套餐主要针对常见肿瘤筛查，肝肾、颈动脉、脑血栓、颅内血流筛查，以及风湿、颈椎、骨密度检查', '注意体检前饮食', '553e6e81-cee9-4c0b-be81-8d9e0978c6be3.jpg');
INSERT INTO `t_setmeal` VALUES (15, '珍爱高端升级肿瘤12项筛查（男女单人）', '0004', 'ZAGD', '0', '14-20', 2400, '本套餐是一款针对生化五项检查，心，肝，胆，胃，甲状腺，颈椎，肺功能，脑部检查（经颅多普勒）以及癌症筛查，适合大众人群体检的套餐', '保护自己', 'f947c183-3ac7-46fc-b0de-ac5561a097522.jpg');

-- ----------------------------
-- Table structure for t_setmeal_checkgroup
-- ----------------------------
DROP TABLE IF EXISTS `t_setmeal_checkgroup`;
CREATE TABLE `t_setmeal_checkgroup`  (
  `setmeal_id` int(11) NOT NULL DEFAULT 0,
  `checkgroup_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`setmeal_id`, `checkgroup_id`) USING BTREE,
  INDEX `checkgroup_key`(`checkgroup_id`) USING BTREE,
  CONSTRAINT `checkgroup_key` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `setmeal_key` FOREIGN KEY (`setmeal_id`) REFERENCES `t_setmeal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_setmeal_checkgroup
-- ----------------------------
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 5);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 6);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 7);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 9);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (14, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (15, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (14, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (15, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (14, 12);
INSERT INTO `t_setmeal_checkgroup` VALUES (14, 13);
INSERT INTO `t_setmeal_checkgroup` VALUES (15, 13);
INSERT INTO `t_setmeal_checkgroup` VALUES (13, 14);
INSERT INTO `t_setmeal_checkgroup` VALUES (15, 14);
INSERT INTO `t_setmeal_checkgroup` VALUES (13, 15);

-- ----------------------------
-- Table structure for t_sport
-- ----------------------------
DROP TABLE IF EXISTS `t_sport`;
CREATE TABLE `t_sport`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `helpCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sportname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sporttime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_sport
-- ----------------------------
INSERT INTO `t_sport` VALUES (1, 'YD3108', '背部拉伸', '3-5次/周', '30-60分钟/次');
INSERT INTO `t_sport` VALUES (2, 'YD3107', '碾压脊柱', '1-2次/周', '30-60分钟/次');
INSERT INTO `t_sport` VALUES (3, 'YD3106', '扭转脊柱的坐位拉伸', '3-5次', '30-60分钟/次');
INSERT INTO `t_sport` VALUES (4, 'YD3105', '跑步', '每天一次', '每次半个小时');

-- ----------------------------
-- Table structure for t_syslog
-- ----------------------------
DROP TABLE IF EXISTS `t_syslog`;
CREATE TABLE `t_syslog`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consumerName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visitTime` datetime(0) NULL DEFAULT NULL,
  `visit_timestr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `executionTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_syslog
-- ----------------------------
INSERT INTO `t_syslog` VALUES ('0709bb78-a1a8-4b69-98d9-f34f9dc79e82', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '183', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('0b28ea76-2bc0-4585-a9da-d754b7a5ad27', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '737', '[类]com.huahua.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('0cb6970a-c962-49d7-a83b-61b3d18359d5', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:33:11', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '567', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('15c64284-7b24-4ea9-87fc-2d33e4577868', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:33:07', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '21', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('17fac4d1-2d27-4b63-8d93-8c98f242494c', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '180', '[类]com.huahua.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1c9b7ea7-0730-4436-9482-f05bbda6dc65', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('1cdbd5f7-bfc8-4535-bec7-a7d278a48930', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('2184d725-2d1c-47b8-bab7-bbef47c2f45a', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '141', '[类]com.huahua.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('2364f2fc-e817-41d5-a5f4-44d93c08c2be', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:25:54', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '113', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('28ef994a-122e-4c8b-b28c-5de5f7c56321', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '176', '[类]com.huahua.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('291dcada-ebbf-4238-a074-30b8c8bfa174', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:22:20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('2fa3bcd4-1d15-4dd8-a213-723cbc865ac3', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '946', '[类]com.huahua.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('31aef7c4-de18-4e93-832c-911c3bf6e5d9', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '113', '[类]com.huahua.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('33d70b83-f22a-4dd7-b2aa-04d4950b9222', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '591', '[类]com.huahua.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('359f246b-ec1d-4114-aec6-a2b61934210c', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:24:05', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '120', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('36eff95f-b853-4149-83a3-6262db8648f3', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:25:46', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '116', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('3c68124a-6734-4371-af98-bc070ce31650', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '174', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('3d07bae7-a53f-485e-b54b-bcfcf8026ba2', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('4016c489-690a-4aa9-a153-67febacdc3f3', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '122', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4651589a-71b8-44d7-aba9-1564507faf66', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:33:40', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('46ec202a-70f8-42b5-958a-36566a402833', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '116', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('48ea41f5-9f62-40f0-acfd-459a42bfa712', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '266', '[类]com.huahua.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('4b365935-967c-4d52-bf8f-f76649fc4eea', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:33:40', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '860', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('4bd48709-f3ca-409c-ad9a-03f8f943b8f4', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:30:32', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '9900', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('511aef21-902e-46a7-9a9e-18fa5763cc76', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:22:31', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '164', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5a6af763-f9b5-4aaa-8ee4-24d5e4a9f026', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:25:53', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '113', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5c8c4997-0cb7-4ff8-a610-d18b2050d2cd', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '460', '[类]com.huahua.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('5cd2c83b-1de7-4076-9d16-8ecfea700ba7', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '189', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('61311351-802e-4ba3-afa8-131a090e40ad', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:24:07', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '119', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('66104c53-41e9-4d5a-b455-0a03b4e0e94c', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:30:32', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '12762', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('6beb5d7f-bc21-4fe7-9145-af9fac79edc5', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '172', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('78bcabde-1998-4e5f-a1b9-cbaed159c24f', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '114', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7c8f3ce2-be53-4004-a654-da3a60ad3ef2', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:33:47', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '191', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7dc9674e-4a6d-4836-84bc-ccc00c336478', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '1970-01-01 08:00:00.024', '[类]com.huahua.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('7e436e53-54ac-43aa-b95b-cf66aa568e2b', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '837', '[类]com.huahua.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('80884197-48ab-4364-bb07-f01150b3e0e7', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1231', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('816dfdf3-e704-4af6-b48a-e6f33d19fbfd', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '231', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('899e4b88-21bd-4d1b-b75f-57a0d0a303d1', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '131', '[类]com.huahua.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8e320d9f-99be-47b9-b521-18661534f97a', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '163', '[类]com.huahua.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('90cbdf13-d1e1-43c9-b250-034c0ec89f47', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:22:18', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '847', '[类]com.huahua.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('9141f0ab-421d-4c0e-8aed-00e7b8cf7e75', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '18', '[类]com.huahua.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('91b66393-1153-4995-9089-819de3a0b25b', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '172', '[类]com.huahua.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('93260a37-d326-459a-a510-d0e0da19d794', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '666', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('94089e05-b445-4014-a8de-1ce73cb3016e', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '183', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('955f10ac-bb27-4c0a-b4dc-aeac12ed2ce2', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '114', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('95f7918e-58d0-4711-bf72-b5cdcb870fc9', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:24:02', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '158', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('96ede46a-7b26-477e-b601-9369484a85fa', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '1970-01-01 08:00:00.112', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('99113cd4-642e-4e34-bc7f-b8d43d3d3255', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:24:10', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '123', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9a0fc999-74b6-4c49-8e14-19b90062024a', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '1970-01-01 08:00:00.125', '[类]com.huahua.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9a317ad1-3224-4507-ac04-144c00fb9e70', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '1156', '[类]com.huahua.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('9e522a81-dfdb-4755-8b62-d8cb1bc100ab', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '1178', '[类]com.huahua.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('a109d6cf-663a-46b9-ba43-a12401bdc856', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '111', '[类]com.huahua.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('a7228fe2-e489-45fa-95f7-dd56e9896531', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '1970-01-01 08:00:01.416', '[类]com.huahua.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('a8f11d62-ef0b-4b97-9beb-f93a46bd4e61', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '118', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('aa056770-b00a-4cb6-ad44-30cc1e0a0b5d', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('ab3b5fb4-bdf8-49d9-9517-9a1612881eef', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:30:32', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('b2396c4c-5e6a-4d9d-b2cf-c865c5f19e65', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('b638eb56-2242-40dc-b92b-8f6afb6c4e81', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:24:57', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '123', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b640328d-82e4-4164-879c-219460f08676', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '1031', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bc1b4e6a-b216-485e-a7e2-e0bb62fc0751', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:24:04', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '121', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bd7139af-50e7-481d-bd4a-b56eb0ba102c', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '17', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('c861e2ce-026c-4334-95d0-60e7e7298317', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '221', '[类]com.huahua.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c965c88a-1a6c-4b60-962f-271e260b887c', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:24:09', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '119', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cdd8b197-bef4-45a5-ab7d-916d5445ac1f', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '113', '[类]com.huahua.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('cf4d05c8-4b29-426b-9e9b-fef6d12d19fa', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '900', '[类]com.huahua.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('d3708f93-4ae1-4355-a52c-93cb398ad2ff', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '983', '[类]com.huahua.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('d38ce420-beeb-4575-b8aa-47b36e6bfd8f', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:22:20', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '601', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('d5b2f1ab-680d-47eb-aec8-011840964c1d', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '1970-01-01 08:00:00.198', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d6dd699c-902e-41a6-8b66-d535dd79e075', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '951', '[类]com.huahua.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('d826d9e1-30a7-4cdc-986c-98bdc8ae4c1c', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:25:04', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '119', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('df8ac81c-ebd5-426e-91f9-d63032880d1a', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '214', '[类]com.huahua.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('dfb1dc15-234b-4056-9edb-78a1d50e82d9', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:25:04', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '371', '[类]com.huahua.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('e37ed0c4-69de-4198-8049-146518c5716b', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '117', '[类]com.huahua.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e51c0799-1704-4bde-a4d6-05582a2772ea', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '829', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('e790fbd1-a808-4d8a-b921-8691582b5bf7', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '236', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ec474ce8-209f-4258-9b3a-dc21598ec253', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '192', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f49c0260-615b-48d0-8dbf-fd5fedc7d0a1', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('f648ae9a-252b-4c9b-b3cf-b41229565b47', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:33:07', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '978', '[类]com.huahua.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('f7f6a495-248e-4958-8c72-ade62dcd1803', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '113', '[类]com.huahua.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('faf2957c-6556-4da6-a0ab-2a3b831d8518', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 12:25:52', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '113', '[类]com.huahua.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ff23c094-4f14-442d-bd50-c7d809206ed5', 'admin', '0:0:0:0:0:0:0:1', '2022-04-02 00:00:00', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '1', '[类]com.huahua.controller.UserController[方法]getAllMenus');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birthday` date NULL DEFAULT NULL,
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `station` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, NULL, NULL, 'admin', '$2a$10$R/m4NYvpvDjmptDv8ys./Oq7eQ7y9tgltU606whneIp4VEhMzULS.', NULL, '1', NULL);
INSERT INTO `t_user` VALUES (2, NULL, NULL, 'xiaoming', '$2a$10$3xW2nBjwBM3rx1LoYprVsemNri5bvxeOd/QfmO7UDFQhW2HRHLi.C', NULL, '1', NULL);
INSERT INTO `t_user` VALUES (3, NULL, NULL, 'test', '$2a$10$sYnPAadtZw5LGZF7uSaV2.pgZjYO8XN/fYK72..21BEGnDz.8Vj1.', NULL, '0', NULL);
INSERT INTO `t_user` VALUES (4, '2020-09-01', '0', '仲飞', '$2a$10$rIML9.fC3MK6IatXVH7py.M0WMDxGksyBZln4MWwUZbhUiM6T81Da', NULL, '1', '13812345678');
INSERT INTO `t_user` VALUES (15, '2020-09-14', '1', '122', '$2a$10$29FYbVmNuo82qw2DtA0Ty.Oqh5NyEHbfMnxkad17v/Lu0SoCqXl4q', '12', '0', '21');
INSERT INTO `t_user` VALUES (17, '2020-09-30', '1', '秀姐', '$2a$10$w/LhDC/iTvSYETy9OLFL.us4I0Nicw7C/uLbdz5.Klu9MnM/5Zava', NULL, '0', '19856506030');
INSERT INTO `t_user` VALUES (18, '2000-04-10', '0', '范大炜', '$2a$10$RZOzVFawi7bfbURlOA2v1OUkopgpseEL.YqZryju.BalBYLDEY8/y', NULL, NULL, '17759010609');
INSERT INTO `t_user` VALUES (19, NULL, '0', '韦宇杨', '$2a$10$YLKrrUKjYKqYrcESZQY9Ruaq3Soo2mqxnTa/BBrtxGU9QxZfV0R6u', NULL, NULL, '18795956456');
INSERT INTO `t_user` VALUES (20, '2022-03-10', '0', '张永骏', '$2a$10$aiQzoLSTqi3JOK2Kjp2Bdunem5/AoNhC2WF8g0G8KWPEV47f3vHqC', NULL, NULL, '15155555955');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FK_Reference_8`(`role_id`) USING BTREE,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1);
INSERT INTO `t_user_role` VALUES (3, 1);
INSERT INTO `t_user_role` VALUES (18, 1);
INSERT INTO `t_user_role` VALUES (3, 3);
INSERT INTO `t_user_role` VALUES (18, 7);
INSERT INTO `t_user_role` VALUES (19, 7);
INSERT INTO `t_user_role` VALUES (20, 7);
INSERT INTO `t_user_role` VALUES (20, 16);
INSERT INTO `t_user_role` VALUES (20, 19);

SET FOREIGN_KEY_CHECKS = 1;
