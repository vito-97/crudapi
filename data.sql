/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : water

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 09/07/2022 14:42:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for water_admin
-- ----------------------------
DROP TABLE IF EXISTS `water_admin`;
CREATE TABLE `water_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '账号',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `last_login_ip` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '上次登录的IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上次登录的时间',
  `add_ip` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建账号的IP',
  `role_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色id',
  `tel` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `mark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `disabled_mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '禁用的原因',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_admin
-- ----------------------------
INSERT INTO `water_admin` VALUES (1, 'admin', '1ad359f5abcb1ac4fd1d85c6a2f99816', '超级管理员', 1, '2130706433', 1657331901, '', 1, '', '', '', '', 1647912470, 1657331901, 0);
INSERT INTO `water_admin` VALUES (5, 'admin1', '1ad359f5abcb1ac4fd1d85c6a2f99816', '管理员', 1, '2130706433', 1657250166, '', 2, '', '', '', '', 1648198749, 1657250166, 0);
INSERT INTO `water_admin` VALUES (6, 'admin4', '1ad359f5abcb1ac4fd1d85c6a2f99816', '管理员4', 1, '', 0, '', 2, '', '', '', '', 1648625415, 1653631577, 0);
INSERT INTO `water_admin` VALUES (7, 'admin5', '1ad359f5abcb1ac4fd1d85c6a2f99816', '管理员5', 1, '', 0, '', 2, '', '', '', '', 1648625459, 1653631577, 0);
INSERT INTO `water_admin` VALUES (8, 'admin6', '1ad359f5abcb1ac4fd1d85c6a2f99816', '管理员6', 1, '', 0, '', 2, '', '', '', '', 1648625488, 1653631577, 0);
INSERT INTO `water_admin` VALUES (10, 'admin7', '1ad359f5abcb1ac4fd1d85c6a2f99816', '管理员7', 1, '', 0, '', 2, '', '', '', '', 1648627198, 1653631577, 0);
INSERT INTO `water_admin` VALUES (11, 'admin8', '1ad359f5abcb1ac4fd1d85c6a2f99816', '管理员11', 1, '', 0, '', 2, '', '', '', '', 1648628544, 1653631617, 0);
INSERT INTO `water_admin` VALUES (12, 'admin9', '1ad359f5abcb1ac4fd1d85c6a2f99816', '管理员12', 1, '', 0, '', 2, '', '123456@qq.com', '', '', 1648694250, 1653631577, 0);
INSERT INTO `water_admin` VALUES (13, 'admin91', '1ad359f5abcb1ac4fd1d85c6a2f99816', '管理员91', 1, '', 0, '2130706433', 1, '', '', '', '', 1652954007, 1653631617, 0);
INSERT INTO `water_admin` VALUES (14, 'test', 'c49fa61a1acc3f6205254000ce84b895', '测试', 1, '', 0, '2130706433', 2, '', '', '123', '1111111', 1653466178, 1653631577, 0);
INSERT INTO `water_admin` VALUES (15, 'admin911', '1ad359f5abcb1ac4fd1d85c6a2f99816', '管理员911', 1, '', 0, '2130706433', 3, '', '', '', '', 1657181944, 1657181944, 0);

-- ----------------------------
-- Table structure for water_adverts
-- ----------------------------
DROP TABLE IF EXISTS `water_adverts`;
CREATE TABLE `water_adverts`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_adverts
-- ----------------------------
INSERT INTO `water_adverts` VALUES (1, '广告1', 'https://cdn.uviewui.com/uview/swiper/swiper1.png', 'http://xxx.com/pages/xxx/xxx', 1, 1, 1648700388, 1648713128, 0);
INSERT INTO `water_adverts` VALUES (2, '广告2', 'https://cdn.uviewui.com/uview/swiper/swiper2.png', 'http://xxx.com/pages/xxx/xxx', 1, 1, 1648708791, 1648708791, 0);
INSERT INTO `water_adverts` VALUES (3, '广告3', 'https://cdn.uviewui.com/uview/swiper/swiper3.png', 'http://xxx.com/pages/xxx/xxx', 1, 1, 1648709087, 1648709087, 0);
INSERT INTO `water_adverts` VALUES (4, '测试广告', 'http://www.xxx.com/abc.png', 'http://www.xxx.com/', 119, 1, 1657002146, 1657002146, 0);
INSERT INTO `water_adverts` VALUES (5, 'test', '/upload/attachment/6d/d5ef6f17f3d39d4e2f7da2551f05d7.jpg', 'http://aaa.www.cn/a', 1, 1, 1657336610, 1657346669, 0);

-- ----------------------------
-- Table structure for water_all_in_pay
-- ----------------------------
DROP TABLE IF EXISTS `water_all_in_pay`;
CREATE TABLE `water_all_in_pay`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `app_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用ID',
  `cus_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商户号',
  `public_key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公钥',
  `private_key` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '私钥',
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理',
  `amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '已收款的金额',
  `refund_amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '已退款的金额',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '支付类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通联支付' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_all_in_pay
-- ----------------------------
INSERT INTO `water_all_in_pay` VALUES (1, '通联支付', '00231935', '650586057220HNX', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxQN7EDEaXqnf+Do8GapWisc8TGvJdDqEhpts9hpQoMnWzblka8LyY9Mm+s5lwXcPRc437v/lidJKmzlzAGkeog9QqdkNnKuc2H0s64IS5GImU1BRFbAjYF2vd4M5P7rX9V46j6X0p7baeIR5TX2Y2qpGtC0nNV63+/xaElq92kG1RceGIl8Zn5pRL91cYi69afXN+jGL1tQC5MWxh8IxOZv4otGVz1K+S9qbozK2YGes/v2gliW+yQsAfFGE2DFCBNKTeXhDU22itPAqk5sUwLU5LC8aGQ4Ru/8R27sffC2HFqNJT3NBIjlLGEv89pIGQmXElMluLqzMw1oWa1W6eQIDAQAB', 'MIIEpAIBAAKCAQEAxQN7EDEaXqnf+Do8GapWisc8TGvJdDqEhpts9hpQoMnWzblka8LyY9Mm+s5lwXcPRc437v/lidJKmzlzAGkeog9QqdkNnKuc2H0s64IS5GImU1BRFbAjYF2vd4M5P7rX9V46j6X0p7baeIR5TX2Y2qpGtC0nNV63+/xaElq92kG1RceGIl8Zn5pRL91cYi69afXN+jGL1tQC5MWxh8IxOZv4otGVz1K+S9qbozK2YGes/v2gliW+yQsAfFGE2DFCBNKTeXhDU22itPAqk5sUwLU5LC8aGQ4Ru/8R27sffC2HFqNJT3NBIjlLGEv89pIGQmXElMluLqzMw1oWa1W6eQIDAQABAoIBABdPpp+PV9HsosIhzduxkoTgNyvJszAL/oNY36ctDO5Bg6ea8J1plzmlkd6qTlL6bfWyBV9DqxrIJajBPvDE/2loi4BVXO11Rt08znRdUzPvwx4nijiZO05bN3haMAtw5b20NRSrK8wucCJDdoDrRAtXi38lOpbvirCHtvamAwHQgEFRoMxEsSgfyenCxY2h04bKUSSRiwhmvSTptfA6TIwbCeSfObOyZniiVbZpFJ4B4SEQWIYQSkO/k0gqUDcXKUiyjIKHmZMI0UvsyjUw+qdA47nypy4AHKtFm/pwmu829H14+RcmF+nGRlvEryyvs8ymnDXpffwM9WOJnMTdOxsCgYEA8gxCcJ6MZzxzERYzNw4zy11XfFfRzqdTdDbiEIk67JttXf2JeXLdyD27vC/tzj3tO4T6AcLg+ib1rRLnG2E7rsFs7dz7ha0Arr34Akrz6YkBDJi95tKJpk97eDLCqTA1CMCUvUMTQib3577T71agYBWRY4r0sXDu4jSSbPytzcsCgYEA0F6uEOFIjlfU5ePuAqamJWnvYn3BnpWR1pOmCAe29n7dxYY6nT8v+YlyiHgcx0ikO7uxy2mVV5ssHtBhXs38YU14uL1hlYjmIhN08USiwAynQArjNPADalaZxtp0VNPSvHxWMyxPH9E9dIPOjKWcGJ6toFLh3QbNPH8QzwjxUEsCgYEA6jIoevU9Xoojv82eIlAQl12qT3pdW7mUyuZrl5pgNB0zFfVB9gvJQX1Rz4UEcECE8Mj6aYfYzNGzdhHLITfUWoN21TOy/iVleq3+cKF7HWRdaoXDgLoHS66uBZ//r1oghmZnxDRJRwGTbly6jWJg7HcR5KHHnoRp7t71KpTVyj8CgYBdRLQXfC+0/12dlXvZFe0yvAtaA75iFMMV0Ds2RvW/uiPcoWulLT51LO/mZBVFop9Y2XgI+/bMIvoJxO6AuCUrDLlnv+VpQMD6KcljoXxUCJXolbcD4Bc3RxJIL0p5GeOvWNxgxYmZTVh7ye/vhsWrQ4OmStMs0zmUxa+pbHBPpwKBgQCWH9OLVWvf0YP2AroXrwHIMSFzyQwcKm0Cbxr5MiP7Meqsma53UWxwJPnXaBt06dqhTpDGf6GZxecErNmzm8exJ+pDN4xgsx92IFLd3/GOzZ1AUHhLaoR8BZXR6h/uYi2gK0WD+YAYMugbe3D7FxTXWMiuDvCwtftByY+DMFag4Q==', 0, 0.01, 0.00, 1, 1, 1649216601, 1655446382, 0);
INSERT INTO `water_all_in_pay` VALUES (2, '通联支付', '00231935', '650586057220HNX', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxQN7EDEaXqnf+Do8GapWisc8TGvJdDqEhpts9hpQoMnWzblka8LyY9Mm+s5lwXcPRc437v/lidJKmzlzAGkeog9QqdkNnKuc2H0s64IS5GImU1BRFbAjYF2vd4M5P7rX9V46j6X0p7baeIR5TX2Y2qpGtC0nNV63+/xaElq92kG1RceGIl8Zn5pRL91cYi69afXN+jGL1tQC5MWxh8IxOZv4otGVz1K+S9qbozK2YGes/v2gliW+yQsAfFGE2DFCBNKTeXhDU22itPAqk5sUwLU5LC8aGQ4Ru/8R27sffC2HFqNJT3NBIjlLGEv89pIGQmXElMluLqzMw1oWa1W6eQIDAQAB', 'MIIEpAIBAAKCAQEAxQN7EDEaXqnf+Do8GapWisc8TGvJdDqEhpts9hpQoMnWzblka8LyY9Mm+s5lwXcPRc437v/lidJKmzlzAGkeog9QqdkNnKuc2H0s64IS5GImU1BRFbAjYF2vd4M5P7rX9V46j6X0p7baeIR5TX2Y2qpGtC0nNV63+/xaElq92kG1RceGIl8Zn5pRL91cYi69afXN+jGL1tQC5MWxh8IxOZv4otGVz1K+S9qbozK2YGes/v2gliW+yQsAfFGE2DFCBNKTeXhDU22itPAqk5sUwLU5LC8aGQ4Ru/8R27sffC2HFqNJT3NBIjlLGEv89pIGQmXElMluLqzMw1oWa1W6eQIDAQABAoIBABdPpp+PV9HsosIhzduxkoTgNyvJszAL/oNY36ctDO5Bg6ea8J1plzmlkd6qTlL6bfWyBV9DqxrIJajBPvDE/2loi4BVXO11Rt08znRdUzPvwx4nijiZO05bN3haMAtw5b20NRSrK8wucCJDdoDrRAtXi38lOpbvirCHtvamAwHQgEFRoMxEsSgfyenCxY2h04bKUSSRiwhmvSTptfA6TIwbCeSfObOyZniiVbZpFJ4B4SEQWIYQSkO/k0gqUDcXKUiyjIKHmZMI0UvsyjUw+qdA47nypy4AHKtFm/pwmu829H14+RcmF+nGRlvEryyvs8ymnDXpffwM9WOJnMTdOxsCgYEA8gxCcJ6MZzxzERYzNw4zy11XfFfRzqdTdDbiEIk67JttXf2JeXLdyD27vC/tzj3tO4T6AcLg+ib1rRLnG2E7rsFs7dz7ha0Arr34Akrz6YkBDJi95tKJpk97eDLCqTA1CMCUvUMTQib3577T71agYBWRY4r0sXDu4jSSbPytzcsCgYEA0F6uEOFIjlfU5ePuAqamJWnvYn3BnpWR1pOmCAe29n7dxYY6nT8v+YlyiHgcx0ikO7uxy2mVV5ssHtBhXs38YU14uL1hlYjmIhN08USiwAynQArjNPADalaZxtp0VNPSvHxWMyxPH9E9dIPOjKWcGJ6toFLh3QbNPH8QzwjxUEsCgYEA6jIoevU9Xoojv82eIlAQl12qT3pdW7mUyuZrl5pgNB0zFfVB9gvJQX1Rz4UEcECE8Mj6aYfYzNGzdhHLITfUWoN21TOy/iVleq3+cKF7HWRdaoXDgLoHS66uBZ//r1oghmZnxDRJRwGTbly6jWJg7HcR5KHHnoRp7t71KpTVyj8CgYBdRLQXfC+0/12dlXvZFe0yvAtaA75iFMMV0Ds2RvW/uiPcoWulLT51LO/mZBVFop9Y2XgI+/bMIvoJxO6AuCUrDLlnv+VpQMD6KcljoXxUCJXolbcD4Bc3RxJIL0p5GeOvWNxgxYmZTVh7ye/vhsWrQ4OmStMs0zmUxa+pbHBPpwKBgQCWH9OLVWvf0YP2AroXrwHIMSFzyQwcKm0Cbxr5MiP7Meqsma53UWxwJPnXaBt06dqhTpDGf6GZxecErNmzm8exJ+pDN4xgsx92IFLd3/GOzZ1AUHhLaoR8BZXR6h/uYi2gK0WD+YAYMugbe3D7FxTXWMiuDvCwtftByY+DMFag4Q==', 1, 0.11, 0.00, 1, 1, 1649216601, 1655446382, 0);
INSERT INTO `water_all_in_pay` VALUES (3, '', '', '', '', '', 118, 0.00, 0.00, 1, 1, 1656381503, 1656381503, 0);

-- ----------------------------
-- Table structure for water_attachment
-- ----------------------------
DROP TABLE IF EXISTS `water_attachment`;
CREATE TABLE `water_attachment`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '文件名称',
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类别',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '物理路径',
  `width` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '宽度',
  `height` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '高度',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '类型',
  `size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `mime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'mime类型',
  `storage` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(10) NOT NULL COMMENT '创建日期',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `category`(`category`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_attachment
-- ----------------------------
INSERT INTO `water_attachment` VALUES (1, 'c.png', 'image', 1, 1, '/upload/attachment/b4/f105d64ef7b02caf7d450cfad7a4f6.png', '949', '969', 'png', 1012430, 'image/png', 'public', 'ecabf6261960c073f5686bffeca61d13dcf38063', 1653013389, 1653013389, 0);
INSERT INTO `water_attachment` VALUES (2, 'data.zip', 'zip', 1, 0, '/upload/attachment/eb/613d4e348b479ba104729ba534b55a.zip', '0', '0', 'zip', 22938, 'application/zip', 'public', '63320568dca36b42e563ed536ebf4083a505166d', 1653448406, 1653448406, 0);
INSERT INTO `water_attachment` VALUES (3, 'src=http___i0.hdslb.com_bfs_article_92ce90d8ce1453dff642cd6e92a5c99cf1d5664a.jpg&refer=http___i0.hds', 'image', 1, 0, '/upload/attachment/0f/eae7294f75456b2f3715fb3fd26253.jpg', '1056', '594', 'jpg', 326948, 'image/jpeg', 'public', '92ce90d8ce1453dff642cd6e92a5c99cf1d5664a', 1653450761, 1653450761, 0);
INSERT INTO `water_attachment` VALUES (4, 'src=http___clubimg.club.vmall.com_data_attachment_forum_201912_05_002430huzuyie6ffwwkkzl.png&refer=h', 'image', 1, 0, '/upload/attachment/fd/dfbaf6cd5c0f577f9d0e15d251e9a8.png', '1819', '1280', 'png', 1852564, 'image/png', 'public', '685f82fae6fdb8dccaabb1e1221a038ac2855378', 1653452742, 1653452742, 0);
INSERT INTO `water_attachment` VALUES (5, 'Snipaste_2021-12-16_10-11-54.jpg', 'image', 1, 0, '/upload/attachment/6d/d5ef6f17f3d39d4e2f7da2551f05d7.jpg', '266', '181', 'jpg', 16668, 'image/jpeg', 'public', '9553b9792a385076348e6141a234390972df622f', 1653459536, 1653459536, 0);
INSERT INTO `water_attachment` VALUES (6, 'Snipaste_2021-11-10_20-08-38.jpg', 'image', 1, 0, '/upload/attachment/69/49df182de5e4b9acbfe7667503e7e6.jpg', '102', '36', 'jpg', 2858, 'image/jpeg', 'public', '175ac7f4978af19c9f166fd8ad4e37f7b65101f3', 1653971267, 1653971267, 0);
INSERT INTO `water_attachment` VALUES (7, 'Snipaste_2021-12-02_13-14-47.jpg', 'image', 1, 0, '/upload/attachment/43/0e4ab0ffc83da16d655224028dca47.jpg', '494', '260', 'jpg', 9339, 'image/jpeg', 'public', '00c8e03ba272e0eb4e659013275629938dfb4b8e', 1653971327, 1653971327, 0);
INSERT INTO `water_attachment` VALUES (8, 'm.mp4', 'video', 1, 0, '/upload/attachment/d5/a1be2951bb44d5a352590d8149549b.mp4', '0', '0', 'mp4', 4814995, 'video/mp4', 'public', '633146700dc77aa1fce1dd308e17d299483b5f5b', 1653978395, 1653978395, 0);
INSERT INTO `water_attachment` VALUES (9, '86d6277f9e2f07084ddaac5ce924b899a801f28b.png', 'image', 1, 0, '/upload/attachment/50/852351315e019e1f6ec88f17056fd5.png', '1280', '720', 'png', 584827, 'image/png', 'public', '0530cd4a23ffd850a72daa0ce3bdcd8d26d0b83b', 1653978576, 1653978576, 0);
INSERT INTO `water_attachment` VALUES (10, 'Snipaste_2021-12-16_10-37-37.jpg', 'image', 1, 0, '/upload/attachment/d5/bef1e9429925d2bb8bde89c2c7d035.jpg', '711', '285', 'jpg', 15244, 'image/jpeg', 'public', '4530304073cd105bf593b7233425c3bb7d789a10', 1653978831, 1653978831, 0);
INSERT INTO `water_attachment` VALUES (15, 'Snipaste_2022-02-23_17-29-19.jpg', 'image', 1, 0, '/upload/attachment/6d/24a41233ec466dad3e089eb7f744ad.jpg', '1907', '922', 'jpg', 210867, 'image/jpeg', 'public', '8933572f89c38b7068a6fa59639968814eac6c92', 1654137222, 1654137222, 0);
INSERT INTO `water_attachment` VALUES (16, 'Snipaste_2021-12-16_10-11-54.jpg', 'image', 0, 1, '/upload/attachment/6d/d5ef6f17f3d39d4e2f7da2551f05d7.jpg', '266', '181', 'jpg', 16668, 'image/jpeg', 'public', '9553b9792a385076348e6141a234390972df622f', 1654935545, 1654935545, 0);
INSERT INTO `water_attachment` VALUES (17, 'm.mp4', 'video', 0, 1, '/upload/attachment/d5/a1be2951bb44d5a352590d8149549b.mp4', '0', '0', 'mp4', 4814995, 'video/mp4', 'public', '633146700dc77aa1fce1dd308e17d299483b5f5b', 1654935671, 1654935671, 0);

-- ----------------------------
-- Table structure for water_card
-- ----------------------------
DROP TABLE IF EXISTS `water_card`;
CREATE TABLE `water_card`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `card_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '卡号',
  `card_pass` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '卡密',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户',
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0：冻结 1：正常',
  `use_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用时间',
  `money` decimal(8, 2) UNSIGNED NOT NULL COMMENT '金额',
  `mark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `card_no`(`card_no`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_card
-- ----------------------------
INSERT INTO `water_card` VALUES (1, 'card123456', '', 0, 0, 1, 0, 0.00, '', 1648720303, 1653980182, 0);
INSERT INTO `water_card` VALUES (2, 'card1234567', '', 0, 0, 1, 0, 0.00, '', 1648720307, 1653980182, 0);

-- ----------------------------
-- Table structure for water_contract
-- ----------------------------
DROP TABLE IF EXISTS `water_contract`;
CREATE TABLE `water_contract`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '合同号',
  `amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '金额',
  `flow` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '流量',
  `used_flow` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已使用',
  `water_company_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '水务公司',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '取水客户',
  `is_recharged` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已充值',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_contract
-- ----------------------------
INSERT INTO `water_contract` VALUES (1, '合同', '123456', 1234.00, 99999, 0, 118, 120, 0, 1, 1656320783, 1656320783, 0);
INSERT INTO `water_contract` VALUES (2, '合同', '123456', 1234.00, 99999, 0, 118, 120, 0, 1, 1656320964, 1656320964, 0);
INSERT INTO `water_contract` VALUES (3, '合同', '123456', 1234.00, 99999, 0, 118, 120, 0, 1, 1656321184, 1656321184, 0);

-- ----------------------------
-- Table structure for water_coupon
-- ----------------------------
DROP TABLE IF EXISTS `water_coupon`;
CREATE TABLE `water_coupon`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '优惠券名',
  `full_minus` decimal(8, 2) UNSIGNED NOT NULL COMMENT '满减金额',
  `amount` decimal(8, 2) UNSIGNED NOT NULL COMMENT '优惠金额',
  `total` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总量',
  `issued_total` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '领取数量',
  `is_infinite` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为无限张',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '绑定的套餐',
  `get_start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始领取时间',
  `get_end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束领取时间',
  `use_start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用开始时间',
  `use_end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用结束时间',
  `coupon_day` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '领取后有效时间 0不限制 单位天数',
  `limit` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '限制数量 0不限制',
  `limit_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1：所有 2：按天 3：按月 4按年',
  `sort` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0：禁止领取 1：启用 2：已失效',
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理',
  `coupon_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券管理员',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型：1优惠券 2现金券',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product`(`product_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `coupon_user_id`(`coupon_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_coupon
-- ----------------------------
INSERT INTO `water_coupon` VALUES (1, '满50减10元', 50.00, 10.00, 99, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 99, 1, 0, 0, 1, 1648796445, 1648879618, 0);
INSERT INTO `water_coupon` VALUES (2, '满100减20元', 100.00, 20.00, 99, 3, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1648796688, 1648869522, 0);
INSERT INTO `water_coupon` VALUES (3, '满100减50元', 100.00, 50.00, 99, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1648798090, 1648798090, 0);
INSERT INTO `water_coupon` VALUES (4, '满100减50元', 100.00, 50.00, 99, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1, 1, 1, 0, 0, 1, 1649208304, 1649208304, 0);
INSERT INTO `water_coupon` VALUES (5, '10元现金券', 0.00, 10.00, 9999, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 2, 1654653903, 1654653903, 0);
INSERT INTO `water_coupon` VALUES (6, '99元现金券', 0.00, 99.00, 9999, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 2, 1654653957, 1654653957, 0);
INSERT INTO `water_coupon` VALUES (7, '99元现金券', 0.00, 99.00, 9999, 3, 0, 0, 1654012800, 1659283199, 1654012800, 1659283199, 0, 1, 2, 1, 1, 1, 0, 2, 1654654412, 1655689295, 0);
INSERT INTO `water_coupon` VALUES (8, '199元现金券', 0.00, 10.00, 9999, 3, 0, 0, 1654012800, 1659283199, 1654012800, 1659283199, 0, 1, 3, 0, 1, 1, 102, 2, 1654654420, 1655343999, 0);

-- ----------------------------
-- Table structure for water_coupon_card
-- ----------------------------
DROP TABLE IF EXISTS `water_coupon_card`;
CREATE TABLE `water_coupon_card`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `coupon_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `use_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用时间',
  `is_use` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已经使用',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 0：禁用 1：正常 2：过期失效',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型',
  `coupon_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券管理员',
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理',
  `expire_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '过期时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `coupon`(`coupon_id`) USING BTREE,
  INDEX `user`(`user_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `expire_time`(`expire_time`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `coupon_user_id`(`coupon_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_coupon_card
-- ----------------------------
INSERT INTO `water_coupon_card` VALUES (1, 1, 1, 0, 0, 2, 1, 0, 0, 1648953623, 1648867224, 1649232430, 0);
INSERT INTO `water_coupon_card` VALUES (2, 2, 1, 0, 1, 1, 1, 0, 0, 0, 1648867316, 1649295642, 0);
INSERT INTO `water_coupon_card` VALUES (3, 2, 1, 0, 0, 1, 1, 0, 0, 0, 1648867360, 1649232438, 0);
INSERT INTO `water_coupon_card` VALUES (4, 2, 1, 0, 0, 1, 1, 0, 0, 0, 1648867537, 1649214347, 0);
INSERT INTO `water_coupon_card` VALUES (5, 2, 1, 0, 0, 1, 1, 0, 0, 0, 1648867620, 1648867790, 0);
INSERT INTO `water_coupon_card` VALUES (6, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1648867620, 1648867620, 0);
INSERT INTO `water_coupon_card` VALUES (7, 8, 1, 0, 0, 1, 2, 102, 1, 0, 1654656768, 1655343999, 0);
INSERT INTO `water_coupon_card` VALUES (8, 8, 2, 0, 0, 1, 2, 102, 1, 0, 1654656797, 1655343999, 0);
INSERT INTO `water_coupon_card` VALUES (9, 8, 88, 0, 0, 1, 2, 102, 1, 0, 1654656932, 1655343999, 0);

-- ----------------------------
-- Table structure for water_device
-- ----------------------------
DROP TABLE IF EXISTS `water_device`;
CREATE TABLE `water_device`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `imei` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备IMEI',
  `device_no` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备编号',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0：禁用 1：正常 2：故障',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '设备使用状态',
  `lat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `lng` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `used_flow` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已使用的流量 单位升',
  `l_to_pulse` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一升对应几个脉冲',
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理',
  `water_gage` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '水压',
  `tds` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `used_global_product` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否使用全局的套餐',
  `temperature` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '温度',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '报障电话',
  `address` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址',
  `mark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上线时间',
  `adverts_light` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告灯',
  `disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `site_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '站点',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '设备类型',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `device_no`(`device_no`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `imei`(`imei`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `site_id`(`site_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_device
-- ----------------------------
INSERT INTO `water_device` VALUES (1, '设备12', '869298053598439', '000001', 1, 0, '23.369862', '116.72131', 0, 0, 1, 0, '', 1, 0, '8123456', 'xx省xx市xx区xxx', '123', 0, 0, 0, 1, 1, 1648885882, 1656644787, 0);
INSERT INTO `water_device` VALUES (2, '设备2', '869298056464886', '000002', 1, 0, '23.333', '26.213', 0, 15, 1, 0, '', 1, 0, '8123456', 'xx省xx市xx区xxx', '', 0, 0, 0, 1, 1, 1648885882, 1655372735, 0);
INSERT INTO `water_device` VALUES (3, '000003', '869298053598431', '000003', 0, 0, '', '', 0, 0, 1, 0, '', 0, 0, '', '', '', 0, 0, 0, 1, 1, 1652761997, 1655260403, 0);
INSERT INTO `water_device` VALUES (4, '000004', '869298053598430', '000004', 1, 0, '', '', 0, 0, 1, 0, '', 1, 0, '', '', '', 0, 0, 0, 1, 1, 0, 1655691389, 0);
INSERT INTO `water_device` VALUES (5, '000005', '869298053598411', '000005', 1, 0, '', '', 0, 0, 1, 0, '', 1, 0, '', '', '', 0, 0, 0, 1, 1, 0, 1655774963, 1655774963);
INSERT INTO `water_device` VALUES (6, '测试', '123456789', '000006', 1, 0, '', '', 666, 0, 119, 0, '', 1, 0, '', '', '', 0, 0, 0, 1, 1, 1655691664, 1655718048, 0);
INSERT INTO `water_device` VALUES (7, '测试', '123457890', '', 1, 0, '', '', 0, 0, 87, 0, '', 1, 0, '', '', '', 0, 0, 0, 1, 1, 1656569680, 1656569680, 0);
INSERT INTO `water_device` VALUES (9, '设备1', '1234567890', '000008', 1, 0, '23.333', '26.213', 0, 0, 0, 0, '', 1, 0, '', 'xx省xx市xx区xxx', '', 0, 0, 0, 1, 1, 1656570240, 1656570240, 0);
INSERT INTO `water_device` VALUES (10, '设备1', '12345678901', '000010', 1, 0, '23.333', '26.213', 0, 0, 0, 0, '', 1, 0, '', 'xx省xx市xx区xxx', '', 0, 0, 0, 1, 1, 1656570305, 1656570305, 0);
INSERT INTO `water_device` VALUES (11, '设备1', '12345678902', '000011', 1, 0, '23.333', '26.213', 0, 0, 0, 0, '', 1, 0, '', 'xx省xx市xx区xxx', '', 0, 0, 0, 1, 1, 1656570397, 1656570397, 0);

-- ----------------------------
-- Table structure for water_device_app_version
-- ----------------------------
DROP TABLE IF EXISTS `water_device_app_version`;
CREATE TABLE `water_device_app_version`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `version` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '版本号',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '下载链接',
  `is_new` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为最新',
  `is_force` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否强制更新',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '升级信息',
  `push_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '指定时间推送 0为立即推送',
  `mark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备app版本号' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_device_app_version
-- ----------------------------
INSERT INTO `water_device_app_version` VALUES (1, '第一次更新', '1.0.0', 'http://xxx.com/xxx.apk', 1, 0, '第一次上传的版本', 0, '', 1, 1648890467, 1648890467, 0);
INSERT INTO `water_device_app_version` VALUES (2, '更新一些问题', '1.0.1', 'http://xxx.com/xxx.apk', 1, 0, '更新内容和发现的bug', 0, '', 1, 1648890509, 1648890509, 0);

-- ----------------------------
-- Table structure for water_device_control
-- ----------------------------
DROP TABLE IF EXISTS `water_device_control`;
CREATE TABLE `water_device_control`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '设备ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1：待启动 2：启动 3：暂停 4：结束 5：等待超时',
  `flow` int(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用的流量',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `device`(`device_id`) USING BTREE,
  INDEX `user`(`user_id`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 440 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_device_control
-- ----------------------------
INSERT INTO `water_device_control` VALUES (1, 1, 1, 2, 0, 1652665499, 1652665499, 0);
INSERT INTO `water_device_control` VALUES (2, 1, 1, 4, 0, 1652665506, 1652665506, 0);
INSERT INTO `water_device_control` VALUES (3, 1, 1, 1, 0, 1652688283, 1652688283, 0);
INSERT INTO `water_device_control` VALUES (4, 1, 1, 5, 0, 1652688383, 1652688383, 0);
INSERT INTO `water_device_control` VALUES (5, 1, 1, 1, 0, 1652688383, 1652688383, 0);
INSERT INTO `water_device_control` VALUES (6, 1, 1, 5, 0, 1652688490, 1652688490, 0);
INSERT INTO `water_device_control` VALUES (7, 1, 1, 1, 0, 1652688491, 1652688491, 0);
INSERT INTO `water_device_control` VALUES (8, 1, 1, 5, 0, 1652688570, 1652688570, 0);
INSERT INTO `water_device_control` VALUES (9, 1, 1, 1, 0, 1652688572, 1652688572, 0);
INSERT INTO `water_device_control` VALUES (10, 1, 1, 5, 0, 1652688635, 1652688635, 0);
INSERT INTO `water_device_control` VALUES (11, 1, 1, 1, 0, 1652688637, 1652688637, 0);
INSERT INTO `water_device_control` VALUES (12, 1, 1, 5, 0, 1652688654, 1652688654, 0);
INSERT INTO `water_device_control` VALUES (13, 1, 1, 1, 0, 1652688656, 1652688656, 0);
INSERT INTO `water_device_control` VALUES (14, 1, 1, 5, 0, 1652688683, 1652688683, 0);
INSERT INTO `water_device_control` VALUES (15, 1, 1, 1, 0, 1652688685, 1652688685, 0);
INSERT INTO `water_device_control` VALUES (16, 1, 1, 5, 0, 1652688718, 1652688718, 0);
INSERT INTO `water_device_control` VALUES (17, 1, 1, 1, 0, 1652688723, 1652688723, 0);
INSERT INTO `water_device_control` VALUES (18, 1, 1, 5, 0, 1652688832, 1652688832, 0);
INSERT INTO `water_device_control` VALUES (19, 1, 1, 1, 0, 1652688834, 1652688834, 0);
INSERT INTO `water_device_control` VALUES (20, 1, 1, 5, 0, 1652688950, 1652688950, 0);
INSERT INTO `water_device_control` VALUES (21, 1, 1, 1, 0, 1652688953, 1652688953, 0);
INSERT INTO `water_device_control` VALUES (22, 1, 1, 5, 0, 1652688968, 1652688968, 0);
INSERT INTO `water_device_control` VALUES (23, 1, 1, 1, 0, 1652688971, 1652688971, 0);
INSERT INTO `water_device_control` VALUES (24, 1, 1, 5, 0, 1652688989, 1652688989, 0);
INSERT INTO `water_device_control` VALUES (25, 1, 1, 1, 0, 1652688992, 1652688992, 0);
INSERT INTO `water_device_control` VALUES (26, 1, 57, 5, 0, 1652689041, 1652689041, 0);
INSERT INTO `water_device_control` VALUES (27, 1, 57, 2, 0, 1652689044, 1652689044, 0);
INSERT INTO `water_device_control` VALUES (28, 1, 57, 4, 0, 1652689050, 1652689050, 0);
INSERT INTO `water_device_control` VALUES (29, 1, 57, 2, 0, 1652689565, 1652689565, 0);
INSERT INTO `water_device_control` VALUES (30, 1, 57, 4, 0, 1652689571, 1652689571, 0);
INSERT INTO `water_device_control` VALUES (31, 1, 57, 2, 0, 1652689577, 1652689577, 0);
INSERT INTO `water_device_control` VALUES (32, 1, 57, 4, 0, 1652689581, 1652689581, 0);
INSERT INTO `water_device_control` VALUES (33, 1, 57, 2, 0, 1652689606, 1652689606, 0);
INSERT INTO `water_device_control` VALUES (34, 1, 57, 4, 0, 1652689611, 1652689611, 0);
INSERT INTO `water_device_control` VALUES (35, 1, 57, 2, 0, 1652689695, 1652689695, 0);
INSERT INTO `water_device_control` VALUES (36, 1, 57, 4, 0, 1652689703, 1652689703, 0);
INSERT INTO `water_device_control` VALUES (37, 1, 57, 2, 0, 1652689715, 1652689715, 0);
INSERT INTO `water_device_control` VALUES (38, 1, 57, 4, 0, 1652689721, 1652689721, 0);
INSERT INTO `water_device_control` VALUES (39, 1, 57, 2, 0, 1652689733, 1652689733, 0);
INSERT INTO `water_device_control` VALUES (40, 1, 57, 4, 0, 1652689739, 1652689739, 0);
INSERT INTO `water_device_control` VALUES (41, 1, 57, 2, 0, 1652689769, 1652689769, 0);
INSERT INTO `water_device_control` VALUES (42, 1, 57, 4, 0, 1652690296, 1652690296, 0);
INSERT INTO `water_device_control` VALUES (43, 1, 57, 2, 0, 1652691716, 1652691716, 0);
INSERT INTO `water_device_control` VALUES (44, 1, 57, 4, 0, 1652692230, 1652692230, 0);
INSERT INTO `water_device_control` VALUES (45, 1, 57, 2, 0, 1652694663, 1652694663, 0);
INSERT INTO `water_device_control` VALUES (46, 1, 57, 4, 0, 1652694805, 1652694805, 0);
INSERT INTO `water_device_control` VALUES (47, 1, 57, 2, 0, 1652694903, 1652694903, 0);
INSERT INTO `water_device_control` VALUES (48, 1, 57, 4, 0, 1652694913, 1652694913, 0);
INSERT INTO `water_device_control` VALUES (49, 1, 57, 2, 0, 1652694935, 1652694935, 0);
INSERT INTO `water_device_control` VALUES (50, 1, 57, 4, 0, 1652694944, 1652694944, 0);
INSERT INTO `water_device_control` VALUES (51, 1, 57, 2, 0, 1652694952, 1652694952, 0);
INSERT INTO `water_device_control` VALUES (52, 1, 57, 4, 0, 1652694982, 1652694982, 0);
INSERT INTO `water_device_control` VALUES (53, 1, 57, 2, 0, 1652695027, 1652695027, 0);
INSERT INTO `water_device_control` VALUES (54, 1, 57, 4, 0, 1652695037, 1652695037, 0);
INSERT INTO `water_device_control` VALUES (55, 1, 57, 2, 0, 1652695049, 1652695049, 0);
INSERT INTO `water_device_control` VALUES (56, 1, 57, 4, 0, 1652695071, 1652695071, 0);
INSERT INTO `water_device_control` VALUES (57, 1, 57, 2, 0, 1652695122, 1652695122, 0);
INSERT INTO `water_device_control` VALUES (58, 1, 57, 4, 0, 1652695136, 1652695136, 0);
INSERT INTO `water_device_control` VALUES (59, 1, 58, 2, 0, 1652751260, 1652751260, 0);
INSERT INTO `water_device_control` VALUES (60, 1, 58, 4, 0, 1652751264, 1652751264, 0);
INSERT INTO `water_device_control` VALUES (61, 1, 58, 2, 0, 1652752038, 1652752038, 0);
INSERT INTO `water_device_control` VALUES (62, 1, 58, 4, 0, 1652752327, 1652752327, 0);
INSERT INTO `water_device_control` VALUES (63, 1, 58, 2, 0, 1652752336, 1652752336, 0);
INSERT INTO `water_device_control` VALUES (64, 1, 58, 4, 0, 1652752356, 1652752356, 0);
INSERT INTO `water_device_control` VALUES (65, 1, 58, 2, 0, 1652752559, 1652752559, 0);
INSERT INTO `water_device_control` VALUES (66, 1, 58, 4, 0, 1652752876, 1652752876, 0);
INSERT INTO `water_device_control` VALUES (67, 1, 58, 2, 0, 1652752988, 1652752988, 0);
INSERT INTO `water_device_control` VALUES (68, 1, 58, 4, 0, 1652753023, 1652753023, 0);
INSERT INTO `water_device_control` VALUES (69, 1, 58, 2, 0, 1652753126, 1652753126, 0);
INSERT INTO `water_device_control` VALUES (70, 1, 58, 4, 0, 1652753136, 1652753136, 0);
INSERT INTO `water_device_control` VALUES (71, 1, 58, 2, 0, 1652753178, 1652753178, 0);
INSERT INTO `water_device_control` VALUES (72, 1, 58, 4, 0, 1652753185, 1652753185, 0);
INSERT INTO `water_device_control` VALUES (73, 1, 58, 2, 0, 1652753584, 1652753584, 0);
INSERT INTO `water_device_control` VALUES (74, 1, 58, 4, 0, 1652753600, 1652753600, 0);
INSERT INTO `water_device_control` VALUES (75, 1, 58, 2, 0, 1652753633, 1652753633, 0);
INSERT INTO `water_device_control` VALUES (76, 1, 58, 4, 0, 1652753642, 1652753642, 0);
INSERT INTO `water_device_control` VALUES (77, 1, 58, 2, 0, 1652753668, 1652753668, 0);
INSERT INTO `water_device_control` VALUES (78, 1, 58, 4, 0, 1652753690, 1652753690, 0);
INSERT INTO `water_device_control` VALUES (79, 1, 58, 2, 0, 1652753796, 1652753796, 0);
INSERT INTO `water_device_control` VALUES (80, 1, 58, 4, 0, 1652753882, 1652753882, 0);
INSERT INTO `water_device_control` VALUES (81, 1, 58, 2, 0, 1652753891, 1652753891, 0);
INSERT INTO `water_device_control` VALUES (82, 1, 58, 4, 0, 1652753898, 1652753898, 0);
INSERT INTO `water_device_control` VALUES (83, 1, 58, 2, 0, 1652753976, 1652753976, 0);
INSERT INTO `water_device_control` VALUES (84, 1, 58, 4, 0, 1652754027, 1652754027, 0);
INSERT INTO `water_device_control` VALUES (85, 1, 58, 2, 0, 1652754117, 1652754117, 0);
INSERT INTO `water_device_control` VALUES (86, 1, 58, 4, 0, 1652754146, 1652754146, 0);
INSERT INTO `water_device_control` VALUES (87, 1, 58, 2, 0, 1652754240, 1652754240, 0);
INSERT INTO `water_device_control` VALUES (88, 1, 58, 4, 0, 1652754247, 1652754247, 0);
INSERT INTO `water_device_control` VALUES (89, 1, 58, 2, 0, 1652754262, 1652754262, 0);
INSERT INTO `water_device_control` VALUES (90, 1, 58, 4, 0, 1652754523, 1652754523, 0);
INSERT INTO `water_device_control` VALUES (91, 1, 58, 2, 0, 1652754548, 1652754548, 0);
INSERT INTO `water_device_control` VALUES (92, 1, 58, 4, 0, 1652754656, 1652754656, 0);
INSERT INTO `water_device_control` VALUES (93, 1, 58, 2, 0, 1652754717, 1652754717, 0);
INSERT INTO `water_device_control` VALUES (94, 1, 58, 4, 0, 1652754733, 1652754733, 0);
INSERT INTO `water_device_control` VALUES (95, 1, 58, 2, 0, 1652754750, 1652754750, 0);
INSERT INTO `water_device_control` VALUES (96, 1, 58, 4, 0, 1652754783, 1652754783, 0);
INSERT INTO `water_device_control` VALUES (97, 1, 58, 2, 0, 1652754893, 1652754893, 0);
INSERT INTO `water_device_control` VALUES (98, 1, 58, 4, 0, 1652754984, 1652754984, 0);
INSERT INTO `water_device_control` VALUES (99, 1, 58, 2, 0, 1652755036, 1652755036, 0);
INSERT INTO `water_device_control` VALUES (100, 1, 58, 4, 0, 1652755080, 1652755080, 0);
INSERT INTO `water_device_control` VALUES (101, 1, 58, 2, 0, 1652755100, 1652755100, 0);
INSERT INTO `water_device_control` VALUES (102, 1, 58, 4, 0, 1652755111, 1652755111, 0);
INSERT INTO `water_device_control` VALUES (103, 1, 58, 2, 0, 1652755128, 1652755128, 0);
INSERT INTO `water_device_control` VALUES (104, 1, 58, 4, 0, 1652755140, 1652755140, 0);
INSERT INTO `water_device_control` VALUES (105, 1, 58, 2, 0, 1652755265, 1652755265, 0);
INSERT INTO `water_device_control` VALUES (106, 1, 59, 4, 0, 1652755762, 1652755762, 0);
INSERT INTO `water_device_control` VALUES (107, 1, 59, 4, 0, 1652755762, 1652755762, 0);
INSERT INTO `water_device_control` VALUES (108, 1, 59, 2, 0, 1652756149, 1652756149, 0);
INSERT INTO `water_device_control` VALUES (109, 1, 59, 4, 0, 1652756155, 1652756155, 0);
INSERT INTO `water_device_control` VALUES (110, 1, 59, 2, 0, 1652756164, 1652756164, 0);
INSERT INTO `water_device_control` VALUES (111, 1, 59, 4, 0, 1652756172, 1652756172, 0);
INSERT INTO `water_device_control` VALUES (112, 1, 59, 2, 0, 1652756182, 1652756182, 0);
INSERT INTO `water_device_control` VALUES (113, 1, 59, 4, 0, 1652756192, 1652756192, 0);
INSERT INTO `water_device_control` VALUES (114, 1, 59, 2, 0, 1652756300, 1652756300, 0);
INSERT INTO `water_device_control` VALUES (115, 1, 59, 4, 0, 1652756307, 1652756307, 0);
INSERT INTO `water_device_control` VALUES (116, 1, 59, 2, 0, 1652756323, 1652756323, 0);
INSERT INTO `water_device_control` VALUES (117, 1, 59, 4, 0, 1652756367, 1652756367, 0);
INSERT INTO `water_device_control` VALUES (118, 1, 59, 2, 0, 1652756415, 1652756415, 0);
INSERT INTO `water_device_control` VALUES (119, 1, 59, 4, 0, 1652756426, 1652756426, 0);
INSERT INTO `water_device_control` VALUES (120, 1, 59, 2, 0, 1652756443, 1652756443, 0);
INSERT INTO `water_device_control` VALUES (121, 1, 59, 4, 0, 1652756627, 1652756627, 0);
INSERT INTO `water_device_control` VALUES (122, 1, 59, 2, 0, 1652756632, 1652756632, 0);
INSERT INTO `water_device_control` VALUES (123, 1, 59, 4, 0, 1652756695, 1652756695, 0);
INSERT INTO `water_device_control` VALUES (124, 1, 59, 2, 0, 1652767804, 1652767804, 0);
INSERT INTO `water_device_control` VALUES (125, 1, 59, 4, 0, 1652767810, 1652767810, 0);
INSERT INTO `water_device_control` VALUES (126, 1, 59, 2, 0, 1652767863, 1652767863, 0);
INSERT INTO `water_device_control` VALUES (127, 1, 60, 4, 0, 1652767929, 1652767929, 0);
INSERT INTO `water_device_control` VALUES (128, 1, 60, 2, 0, 1652767939, 1652767939, 0);
INSERT INTO `water_device_control` VALUES (129, 1, 61, 4, 0, 1652767969, 1652767969, 0);
INSERT INTO `water_device_control` VALUES (130, 1, 61, 2, 0, 1652767984, 1652767984, 0);
INSERT INTO `water_device_control` VALUES (131, 1, 62, 4, 0, 1652768025, 1652768025, 0);
INSERT INTO `water_device_control` VALUES (132, 1, 63, 2, 0, 1652768090, 1652768090, 0);
INSERT INTO `water_device_control` VALUES (133, 1, 64, 4, 0, 1652768126, 1652768126, 0);
INSERT INTO `water_device_control` VALUES (134, 1, 64, 2, 0, 1652768127, 1652768127, 0);
INSERT INTO `water_device_control` VALUES (135, 1, 64, 4, 0, 1652768237, 1652768237, 0);
INSERT INTO `water_device_control` VALUES (136, 1, 64, 2, 0, 1652768267, 1652768267, 0);
INSERT INTO `water_device_control` VALUES (137, 1, 64, 4, 0, 1652768512, 1652768512, 0);
INSERT INTO `water_device_control` VALUES (138, 1, 65, 2, 0, 1652768513, 1652768513, 0);
INSERT INTO `water_device_control` VALUES (139, 1, 65, 4, 0, 1652771245, 1652771245, 0);
INSERT INTO `water_device_control` VALUES (140, 1, 65, 2, 0, 1652771400, 1652771400, 0);
INSERT INTO `water_device_control` VALUES (141, 1, 65, 4, 0, 1652771830, 1652771830, 0);
INSERT INTO `water_device_control` VALUES (142, 1, 66, 2, 0, 1652771832, 1652771832, 0);
INSERT INTO `water_device_control` VALUES (143, 1, 66, 4, 0, 1652771862, 1652771862, 0);
INSERT INTO `water_device_control` VALUES (144, 1, 66, 2, 0, 1652771869, 1652771869, 0);
INSERT INTO `water_device_control` VALUES (145, 1, 66, 4, 0, 1652772362, 1652772362, 0);
INSERT INTO `water_device_control` VALUES (146, 1, 66, 2, 0, 1652772368, 1652772368, 0);
INSERT INTO `water_device_control` VALUES (147, 1, 66, 4, 0, 1652773914, 1652773914, 0);
INSERT INTO `water_device_control` VALUES (148, 1, 66, 2, 0, 1652773914, 1652773914, 0);
INSERT INTO `water_device_control` VALUES (149, 1, 66, 4, 0, 1652773928, 1652773928, 0);
INSERT INTO `water_device_control` VALUES (150, 1, 66, 2, 0, 1652774074, 1652774074, 0);
INSERT INTO `water_device_control` VALUES (151, 1, 66, 4, 0, 1652774088, 1652774088, 0);
INSERT INTO `water_device_control` VALUES (152, 1, 66, 2, 0, 1652774120, 1652774120, 0);
INSERT INTO `water_device_control` VALUES (153, 1, 66, 4, 0, 1652774134, 1652774134, 0);
INSERT INTO `water_device_control` VALUES (154, 1, 66, 2, 0, 1652774326, 1652774326, 0);
INSERT INTO `water_device_control` VALUES (155, 1, 66, 4, 0, 1652774350, 1652774350, 0);
INSERT INTO `water_device_control` VALUES (156, 1, 66, 2, 0, 1652775966, 1652775966, 0);
INSERT INTO `water_device_control` VALUES (157, 1, 66, 4, 0, 1652776182, 1652776182, 0);
INSERT INTO `water_device_control` VALUES (158, 1, 66, 2, 0, 1652776194, 1652776194, 0);
INSERT INTO `water_device_control` VALUES (159, 1, 66, 4, 0, 1652776211, 1652776211, 0);
INSERT INTO `water_device_control` VALUES (160, 1, 66, 2, 0, 1652776383, 1652776383, 0);
INSERT INTO `water_device_control` VALUES (161, 1, 66, 4, 0, 1652776437, 1652776437, 0);
INSERT INTO `water_device_control` VALUES (162, 1, 66, 2, 0, 1652776462, 1652776462, 0);
INSERT INTO `water_device_control` VALUES (163, 1, 66, 4, 0, 1652776742, 1652776742, 0);
INSERT INTO `water_device_control` VALUES (164, 1, 66, 2, 0, 1652776849, 1652776849, 0);
INSERT INTO `water_device_control` VALUES (165, 1, 66, 3, 0, 1652776898, 1652776898, 0);
INSERT INTO `water_device_control` VALUES (166, 1, 66, 4, 0, 1652777046, 1652777046, 0);
INSERT INTO `water_device_control` VALUES (167, 1, 66, 2, 0, 1652777048, 1652777048, 0);
INSERT INTO `water_device_control` VALUES (168, 1, 66, 4, 0, 1652777093, 1652777093, 0);
INSERT INTO `water_device_control` VALUES (169, 1, 66, 2, 0, 1652777154, 1652777154, 0);
INSERT INTO `water_device_control` VALUES (170, 1, 66, 3, 0, 1652777165, 1652777165, 0);
INSERT INTO `water_device_control` VALUES (171, 1, 66, 2, 0, 1652777172, 1652777172, 0);
INSERT INTO `water_device_control` VALUES (172, 1, 66, 3, 0, 1652777217, 1652777217, 0);
INSERT INTO `water_device_control` VALUES (173, 1, 66, 2, 0, 1652777246, 1652777246, 0);
INSERT INTO `water_device_control` VALUES (174, 1, 66, 4, 0, 1652777354, 1652777354, 0);
INSERT INTO `water_device_control` VALUES (175, 1, 67, 2, 0, 1652777917, 1652777917, 0);
INSERT INTO `water_device_control` VALUES (176, 1, 67, 3, 0, 1652777930, 1652777930, 0);
INSERT INTO `water_device_control` VALUES (177, 1, 67, 2, 0, 1652777936, 1652777936, 0);
INSERT INTO `water_device_control` VALUES (178, 1, 67, 3, 0, 1652777951, 1652777951, 0);
INSERT INTO `water_device_control` VALUES (179, 1, 67, 2, 0, 1652777963, 1652777963, 0);
INSERT INTO `water_device_control` VALUES (180, 1, 67, 4, 0, 1652778976, 1652778976, 0);
INSERT INTO `water_device_control` VALUES (181, 1, 67, 2, 0, 1652779119, 1652779119, 0);
INSERT INTO `water_device_control` VALUES (182, 1, 67, 3, 0, 1652779125, 1652779125, 0);
INSERT INTO `water_device_control` VALUES (183, 1, 67, 2, 0, 1652779137, 1652779137, 0);
INSERT INTO `water_device_control` VALUES (184, 1, 67, 3, 0, 1652779188, 1652779188, 0);
INSERT INTO `water_device_control` VALUES (185, 1, 67, 2, 0, 1652779197, 1652779197, 0);
INSERT INTO `water_device_control` VALUES (186, 1, 67, 3, 0, 1652779225, 1652779225, 0);
INSERT INTO `water_device_control` VALUES (187, 1, 67, 2, 0, 1652779236, 1652779236, 0);
INSERT INTO `water_device_control` VALUES (188, 1, 67, 4, 0, 1652779250, 1652779250, 0);
INSERT INTO `water_device_control` VALUES (189, 1, 67, 2, 0, 1652779298, 1652779298, 0);
INSERT INTO `water_device_control` VALUES (190, 1, 67, 3, 0, 1652779318, 1652779318, 0);
INSERT INTO `water_device_control` VALUES (191, 1, 67, 2, 0, 1652779319, 1652779319, 0);
INSERT INTO `water_device_control` VALUES (192, 1, 67, 3, 0, 1652779335, 1652779335, 0);
INSERT INTO `water_device_control` VALUES (193, 1, 67, 2, 0, 1652779341, 1652779341, 0);
INSERT INTO `water_device_control` VALUES (194, 1, 67, 4, 0, 1652779371, 1652779371, 0);
INSERT INTO `water_device_control` VALUES (195, 1, 67, 2, 0, 1652781565, 1652781565, 0);
INSERT INTO `water_device_control` VALUES (196, 1, 67, 3, 0, 1652781898, 1652781898, 0);
INSERT INTO `water_device_control` VALUES (197, 1, 67, 2, 0, 1652781898, 1652781898, 0);
INSERT INTO `water_device_control` VALUES (198, 1, 67, 4, 0, 1652781906, 1652781906, 0);
INSERT INTO `water_device_control` VALUES (199, 1, 67, 2, 0, 1652781907, 1652781907, 0);
INSERT INTO `water_device_control` VALUES (200, 1, 67, 3, 0, 1652781922, 1652781922, 0);
INSERT INTO `water_device_control` VALUES (201, 1, 67, 2, 0, 1652781922, 1652781922, 0);
INSERT INTO `water_device_control` VALUES (202, 1, 67, 4, 0, 1652781938, 1652781938, 0);
INSERT INTO `water_device_control` VALUES (203, 1, 67, 2, 0, 1652781938, 1652781938, 0);
INSERT INTO `water_device_control` VALUES (204, 1, 67, 4, 0, 1652781943, 1652781943, 0);
INSERT INTO `water_device_control` VALUES (205, 1, 67, 2, 0, 1652781944, 1652781944, 0);
INSERT INTO `water_device_control` VALUES (206, 1, 67, 4, 0, 1652781976, 1652781976, 0);
INSERT INTO `water_device_control` VALUES (207, 1, 67, 2, 0, 1652781977, 1652781977, 0);
INSERT INTO `water_device_control` VALUES (208, 1, 67, 4, 0, 1652782141, 1652782141, 0);
INSERT INTO `water_device_control` VALUES (209, 1, 67, 2, 0, 1652782146, 1652782146, 0);
INSERT INTO `water_device_control` VALUES (210, 1, 67, 3, 0, 1652782159, 1652782159, 0);
INSERT INTO `water_device_control` VALUES (211, 1, 67, 2, 0, 1652782170, 1652782170, 0);
INSERT INTO `water_device_control` VALUES (212, 1, 67, 4, 0, 1652782184, 1652782184, 0);
INSERT INTO `water_device_control` VALUES (213, 1, 67, 2, 0, 1652782188, 1652782188, 0);
INSERT INTO `water_device_control` VALUES (214, 1, 67, 4, 0, 1652782680, 1652782680, 0);
INSERT INTO `water_device_control` VALUES (215, 1, 67, 2, 0, 1652782681, 1652782681, 0);
INSERT INTO `water_device_control` VALUES (216, 1, 67, 4, 0, 1652782717, 1652782717, 0);
INSERT INTO `water_device_control` VALUES (217, 1, 67, 2, 0, 1652782718, 1652782718, 0);
INSERT INTO `water_device_control` VALUES (218, 1, 67, 4, 0, 1652924315, 1652924315, 0);
INSERT INTO `water_device_control` VALUES (219, 1, 72, 2, 0, 1652924317, 1652924317, 0);
INSERT INTO `water_device_control` VALUES (220, 1, 72, 4, 0, 1652924352, 1652924352, 0);
INSERT INTO `water_device_control` VALUES (221, 1, 72, 2, 0, 1653028880, 1653028880, 0);
INSERT INTO `water_device_control` VALUES (222, 1, 72, 4, 0, 1653290222, 1653290222, 0);
INSERT INTO `water_device_control` VALUES (223, 1, 73, 2, 0, 1653290225, 1653290225, 0);
INSERT INTO `water_device_control` VALUES (224, 1, 73, 4, 0, 1653290240, 1653290240, 0);
INSERT INTO `water_device_control` VALUES (225, 1, 73, 2, 0, 1653292892, 1653292892, 0);
INSERT INTO `water_device_control` VALUES (226, 1, 73, 3, 0, 1653292896, 1653292896, 0);
INSERT INTO `water_device_control` VALUES (227, 1, 73, 2, 0, 1653292898, 1653292898, 0);
INSERT INTO `water_device_control` VALUES (228, 1, 73, 3, 0, 1653292965, 1653292965, 0);
INSERT INTO `water_device_control` VALUES (229, 1, 73, 2, 0, 1653292966, 1653292966, 0);
INSERT INTO `water_device_control` VALUES (230, 1, 73, 3, 0, 1653293066, 1653293066, 0);
INSERT INTO `water_device_control` VALUES (231, 1, 73, 2, 0, 1653293067, 1653293067, 0);
INSERT INTO `water_device_control` VALUES (232, 1, 73, 3, 0, 1653293073, 1653293073, 0);
INSERT INTO `water_device_control` VALUES (233, 1, 73, 2, 0, 1653293074, 1653293074, 0);
INSERT INTO `water_device_control` VALUES (234, 1, 73, 4, 0, 1653293078, 1653293078, 0);
INSERT INTO `water_device_control` VALUES (235, 1, 73, 2, 0, 1653293155, 1653293155, 0);
INSERT INTO `water_device_control` VALUES (236, 1, 73, 3, 0, 1653293158, 1653293158, 0);
INSERT INTO `water_device_control` VALUES (237, 1, 73, 2, 0, 1653293159, 1653293159, 0);
INSERT INTO `water_device_control` VALUES (238, 1, 73, 3, 0, 1653293171, 1653293171, 0);
INSERT INTO `water_device_control` VALUES (239, 1, 73, 4, 0, 1653293200, 1653293200, 0);
INSERT INTO `water_device_control` VALUES (240, 1, 73, 2, 0, 1653294272, 1653294272, 0);
INSERT INTO `water_device_control` VALUES (241, 1, 73, 4, 0, 1653294275, 1653294275, 0);
INSERT INTO `water_device_control` VALUES (242, 1, 73, 2, 0, 1653297163, 1653297163, 0);
INSERT INTO `water_device_control` VALUES (243, 1, 73, 4, 0, 1653297482, 1653297482, 0);
INSERT INTO `water_device_control` VALUES (244, 1, 73, 2, 0, 1653297605, 1653297605, 0);
INSERT INTO `water_device_control` VALUES (245, 1, 73, 4, 0, 1653297611, 1653297611, 0);
INSERT INTO `water_device_control` VALUES (246, 1, 73, 2, 0, 1653297617, 1653297617, 0);
INSERT INTO `water_device_control` VALUES (247, 1, 73, 4, 0, 1653297620, 1653297620, 0);
INSERT INTO `water_device_control` VALUES (248, 1, 73, 2, 0, 1653297627, 1653297627, 0);
INSERT INTO `water_device_control` VALUES (249, 1, 73, 4, 0, 1653297631, 1653297631, 0);
INSERT INTO `water_device_control` VALUES (250, 1, 73, 2, 0, 1653297652, 1653297652, 0);
INSERT INTO `water_device_control` VALUES (251, 1, 73, 4, 0, 1653297656, 1653297656, 0);
INSERT INTO `water_device_control` VALUES (252, 1, 73, 2, 0, 1653297845, 1653297845, 0);
INSERT INTO `water_device_control` VALUES (253, 1, 73, 4, 0, 1653297852, 1653297852, 0);
INSERT INTO `water_device_control` VALUES (254, 1, 73, 2, 0, 1653298249, 1653298249, 0);
INSERT INTO `water_device_control` VALUES (255, 1, 73, 4, 0, 1653298259, 1653298259, 0);
INSERT INTO `water_device_control` VALUES (256, 1, 73, 2, 0, 1653298308, 1653298308, 0);
INSERT INTO `water_device_control` VALUES (257, 1, 73, 4, 0, 1653298314, 1653298314, 0);
INSERT INTO `water_device_control` VALUES (258, 1, 73, 2, 0, 1653298319, 1653298319, 0);
INSERT INTO `water_device_control` VALUES (259, 1, 73, 4, 0, 1653298329, 1653298329, 0);
INSERT INTO `water_device_control` VALUES (260, 1, 73, 2, 0, 1653300693, 1653300693, 0);
INSERT INTO `water_device_control` VALUES (261, 1, 73, 4, 0, 1653300811, 1653300811, 0);
INSERT INTO `water_device_control` VALUES (262, 1, 74, 2, 0, 1653356516, 1653356516, 0);
INSERT INTO `water_device_control` VALUES (263, 1, 74, 3, 0, 1653356532, 1653356532, 0);
INSERT INTO `water_device_control` VALUES (264, 1, 74, 4, 0, 1653356535, 1653356535, 0);
INSERT INTO `water_device_control` VALUES (265, 1, 76, 2, 0, 1653375460, 1653375460, 0);
INSERT INTO `water_device_control` VALUES (266, 1, 76, 4, 0, 1653375464, 1653375464, 0);
INSERT INTO `water_device_control` VALUES (267, 1, 76, 2, 0, 1653375465, 1653375465, 0);
INSERT INTO `water_device_control` VALUES (268, 1, 76, 4, 0, 1653375469, 1653375469, 0);
INSERT INTO `water_device_control` VALUES (269, 1, 76, 2, 0, 1653375471, 1653375471, 0);
INSERT INTO `water_device_control` VALUES (270, 1, 76, 4, 0, 1653375475, 1653375475, 0);
INSERT INTO `water_device_control` VALUES (271, 1, 76, 2, 0, 1653375476, 1653375476, 0);
INSERT INTO `water_device_control` VALUES (272, 1, 76, 4, 0, 1653375480, 1653375480, 0);
INSERT INTO `water_device_control` VALUES (273, 1, 76, 2, 0, 1653375482, 1653375482, 0);
INSERT INTO `water_device_control` VALUES (274, 1, 76, 4, 0, 1653375488, 1653375488, 0);
INSERT INTO `water_device_control` VALUES (275, 1, 76, 2, 0, 1653375490, 1653375490, 0);
INSERT INTO `water_device_control` VALUES (276, 1, 76, 4, 0, 1653375494, 1653375494, 0);
INSERT INTO `water_device_control` VALUES (277, 1, 76, 2, 0, 1653375496, 1653375496, 0);
INSERT INTO `water_device_control` VALUES (278, 1, 76, 4, 0, 1653375501, 1653375501, 0);
INSERT INTO `water_device_control` VALUES (279, 1, 76, 2, 0, 1653375502, 1653375502, 0);
INSERT INTO `water_device_control` VALUES (280, 1, 76, 4, 0, 1653375506, 1653375506, 0);
INSERT INTO `water_device_control` VALUES (281, 1, 76, 2, 0, 1653375507, 1653375507, 0);
INSERT INTO `water_device_control` VALUES (282, 1, 76, 4, 0, 1653375518, 1653375518, 0);
INSERT INTO `water_device_control` VALUES (283, 1, 76, 2, 0, 1653375519, 1653375519, 0);
INSERT INTO `water_device_control` VALUES (284, 1, 76, 4, 0, 1653375523, 1653375523, 0);
INSERT INTO `water_device_control` VALUES (285, 1, 76, 2, 0, 1653375525, 1653375525, 0);
INSERT INTO `water_device_control` VALUES (286, 1, 76, 4, 0, 1653375529, 1653375529, 0);
INSERT INTO `water_device_control` VALUES (287, 1, 76, 2, 0, 1653375530, 1653375530, 0);
INSERT INTO `water_device_control` VALUES (288, 1, 76, 4, 0, 1653375534, 1653375534, 0);
INSERT INTO `water_device_control` VALUES (289, 1, 76, 2, 0, 1653375535, 1653375535, 0);
INSERT INTO `water_device_control` VALUES (290, 1, 76, 4, 0, 1653375539, 1653375539, 0);
INSERT INTO `water_device_control` VALUES (291, 1, 76, 2, 0, 1653375540, 1653375540, 0);
INSERT INTO `water_device_control` VALUES (292, 1, 76, 4, 0, 1653375581, 1653375581, 0);
INSERT INTO `water_device_control` VALUES (293, 1, 76, 2, 0, 1653375653, 1653375653, 0);
INSERT INTO `water_device_control` VALUES (294, 1, 76, 4, 0, 1653379379, 1653379379, 0);
INSERT INTO `water_device_control` VALUES (295, 1, 76, 2, 0, 1653381858, 1653381858, 0);
INSERT INTO `water_device_control` VALUES (296, 1, 78, 4, 0, 1653382097, 1653382097, 0);
INSERT INTO `water_device_control` VALUES (297, 1, 78, 2, 0, 1653382454, 1653382454, 0);
INSERT INTO `water_device_control` VALUES (298, 1, 78, 4, 0, 1653382707, 1653382707, 0);
INSERT INTO `water_device_control` VALUES (299, 1, 78, 2, 0, 1653383132, 1653383132, 0);
INSERT INTO `water_device_control` VALUES (300, 1, 78, 4, 0, 1653383864, 1653383864, 0);
INSERT INTO `water_device_control` VALUES (301, 1, 79, 2, 0, 1653442621, 1653442621, 0);
INSERT INTO `water_device_control` VALUES (302, 1, 79, 4, 0, 1653442706, 1653442706, 0);
INSERT INTO `water_device_control` VALUES (303, 1, 79, 2, 0, 1653443169, 1653443169, 0);
INSERT INTO `water_device_control` VALUES (304, 1, 79, 4, 0, 1653443261, 1653443261, 0);
INSERT INTO `water_device_control` VALUES (305, 1, 79, 2, 0, 1653443522, 1653443522, 0);
INSERT INTO `water_device_control` VALUES (306, 1, 79, 4, 0, 1653443612, 1653443612, 0);
INSERT INTO `water_device_control` VALUES (307, 1, 79, 2, 0, 1653444153, 1653444153, 0);
INSERT INTO `water_device_control` VALUES (308, 1, 79, 4, 0, 1653444209, 1653444209, 0);
INSERT INTO `water_device_control` VALUES (309, 1, 81, 2, 0, 1653444568, 1653444568, 0);
INSERT INTO `water_device_control` VALUES (310, 1, 81, 4, 0, 1653444652, 1653444652, 0);
INSERT INTO `water_device_control` VALUES (311, 1, 81, 2, 0, 1653445172, 1653445172, 0);
INSERT INTO `water_device_control` VALUES (312, 1, 81, 4, 0, 1653445268, 1653445268, 0);
INSERT INTO `water_device_control` VALUES (313, 1, 79, 2, 0, 1653445628, 1653445628, 0);
INSERT INTO `water_device_control` VALUES (314, 1, 79, 4, 0, 1653445652, 1653445652, 0);
INSERT INTO `water_device_control` VALUES (315, 1, 79, 2, 0, 1653445737, 1653445737, 0);
INSERT INTO `water_device_control` VALUES (316, 1, 79, 4, 0, 1653445787, 1653445787, 0);
INSERT INTO `water_device_control` VALUES (317, 1, 79, 2, 0, 1653445985, 1653445985, 0);
INSERT INTO `water_device_control` VALUES (318, 1, 79, 4, 0, 1653446274, 1653446274, 0);
INSERT INTO `water_device_control` VALUES (319, 1, 79, 2, 0, 1653446516, 1653446516, 0);
INSERT INTO `water_device_control` VALUES (320, 1, 79, 4, 0, 1653446590, 1653446590, 0);
INSERT INTO `water_device_control` VALUES (321, 1, 79, 2, 0, 1653446865, 1653446865, 0);
INSERT INTO `water_device_control` VALUES (322, 1, 79, 4, 0, 1653446961, 1653446961, 0);
INSERT INTO `water_device_control` VALUES (323, 1, 1, 1, 0, 1653470805, 1653470805, 0);
INSERT INTO `water_device_control` VALUES (324, 1, 1, 5, 0, 1654831442, 1654831442, 0);
INSERT INTO `water_device_control` VALUES (325, 1, 1, 4, 0, 1654831491, 1654831491, 0);
INSERT INTO `water_device_control` VALUES (326, 1, 97, 2, 0, 1654831491, 1654831491, 0);
INSERT INTO `water_device_control` VALUES (327, 1, 97, 3, 0, 1654831511, 1654831511, 0);
INSERT INTO `water_device_control` VALUES (328, 1, 97, 2, 0, 1654831553, 1654831553, 0);
INSERT INTO `water_device_control` VALUES (329, 1, 97, 3, 0, 1654831686, 1654831686, 0);
INSERT INTO `water_device_control` VALUES (330, 1, 97, 2, 0, 1654831692, 1654831692, 0);
INSERT INTO `water_device_control` VALUES (331, 1, 97, 3, 0, 1654831815, 1654831815, 0);
INSERT INTO `water_device_control` VALUES (332, 1, 97, 2, 0, 1654831825, 1654831825, 0);
INSERT INTO `water_device_control` VALUES (333, 1, 97, 4, 0, 1654831863, 1654831863, 0);
INSERT INTO `water_device_control` VALUES (334, 1, 97, 2, 0, 1654831986, 1654831986, 0);
INSERT INTO `water_device_control` VALUES (335, 1, 97, 3, 0, 1654832022, 1654832022, 0);
INSERT INTO `water_device_control` VALUES (336, 1, 97, 2, 0, 1654832027, 1654832027, 0);
INSERT INTO `water_device_control` VALUES (337, 1, 97, 3, 0, 1654832039, 1654832039, 0);
INSERT INTO `water_device_control` VALUES (338, 1, 97, 2, 0, 1654832043, 1654832043, 0);
INSERT INTO `water_device_control` VALUES (339, 1, 97, 4, 0, 1654832050, 1654832050, 0);
INSERT INTO `water_device_control` VALUES (340, 1, 93, 1, 0, 1654910958, 1654910958, 0);
INSERT INTO `water_device_control` VALUES (341, 1, 93, 5, 0, 1654912160, 1654912160, 0);
INSERT INTO `water_device_control` VALUES (342, 1, 93, 1, 0, 1654912165, 1654912165, 0);
INSERT INTO `water_device_control` VALUES (343, 1, 93, 1, 0, 1656058269, 1656058269, 0);
INSERT INTO `water_device_control` VALUES (344, 1, 93, 3, 0, 1656058269, 1656059192, 0);
INSERT INTO `water_device_control` VALUES (358, 1, 93, 4, 0, 1656121101, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (359, 1, 93, 3, 0, 1656121101, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (360, 1, 93, 3, 0, 1656121102, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (361, 1, 93, 4, 0, 1656125713, 1656125713, 0);
INSERT INTO `water_device_control` VALUES (362, 1, 93, 3, 0, 1656121103, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (363, 1, 93, 3, 0, 1656125714, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (364, 1, 93, 4, 0, 1656125784, 1656125784, 0);
INSERT INTO `water_device_control` VALUES (365, 1, 93, 3, 0, 1656125714, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (366, 1, 93, 4, 0, 1656125891, 1656125891, 0);
INSERT INTO `water_device_control` VALUES (367, 1, 93, 3, 0, 1656125714, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (368, 1, 93, 4, 0, 1656125917, 1656125917, 0);
INSERT INTO `water_device_control` VALUES (369, 1, 93, 3, 0, 1656125714, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (370, 1, 93, 4, 0, 1656125928, 1656125928, 0);
INSERT INTO `water_device_control` VALUES (371, 1, 93, 3, 0, 1656125714, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (372, 1, 93, 4, 0, 1656126072, 1656126072, 0);
INSERT INTO `water_device_control` VALUES (373, 1, 93, 3, 0, 1656125714, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (374, 1, 93, 4, 0, 1656126244, 1656126244, 0);
INSERT INTO `water_device_control` VALUES (375, 1, 93, 3, 0, 1656125714, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (376, 1, 93, 4, 0, 1656126254, 1656126254, 0);
INSERT INTO `water_device_control` VALUES (377, 1, 93, 3, 0, 1656125714, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (378, 1, 93, 4, 0, 1656126268, 1656126268, 0);
INSERT INTO `water_device_control` VALUES (379, 1, 93, 3, 0, 1656125714, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (380, 1, 93, 4, 0, 1656126276, 1656126276, 0);
INSERT INTO `water_device_control` VALUES (381, 1, 93, 3, 0, 1656125714, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (382, 1, 93, 4, 0, 1656126287, 1656126287, 0);
INSERT INTO `water_device_control` VALUES (383, 1, 93, 3, 0, 1656125714, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (384, 1, 93, 4, 0, 1656126305, 1656126305, 0);
INSERT INTO `water_device_control` VALUES (385, 1, 93, 3, 0, 1656125714, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (386, 1, 93, 4, 0, 1656126347, 1656126347, 0);
INSERT INTO `water_device_control` VALUES (387, 1, 93, 3, 0, 1656125714, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (388, 1, 93, 4, 0, 1656126400, 1656126400, 0);
INSERT INTO `water_device_control` VALUES (389, 1, 112, 2, 0, 1656126765, 1656126765, 0);
INSERT INTO `water_device_control` VALUES (390, 1, 112, 3, 0, 1656126774, 1656126774, 0);
INSERT INTO `water_device_control` VALUES (391, 1, 112, 4, 0, 1656126795, 1656126795, 0);
INSERT INTO `water_device_control` VALUES (392, 1, 112, 2, 0, 1656126862, 1656126862, 0);
INSERT INTO `water_device_control` VALUES (393, 1, 112, 3, 0, 1656126869, 1656126869, 0);
INSERT INTO `water_device_control` VALUES (394, 1, 112, 4, 0, 1656126898, 1656126898, 0);
INSERT INTO `water_device_control` VALUES (395, 1, 112, 2, 0, 1656126910, 1656126910, 0);
INSERT INTO `water_device_control` VALUES (396, 1, 112, 3, 0, 1656126913, 1656126913, 0);
INSERT INTO `water_device_control` VALUES (397, 1, 93, 3, 0, 1656125714, 1656121101, 0);
INSERT INTO `water_device_control` VALUES (398, 1, 112, 4, 0, 1656126978, 1656126978, 0);
INSERT INTO `water_device_control` VALUES (399, 1, 112, 2, 0, 1656127089, 1656127089, 0);
INSERT INTO `water_device_control` VALUES (400, 1, 112, 3, 0, 1656127098, 1656127098, 0);
INSERT INTO `water_device_control` VALUES (401, 1, 112, 4, 0, 1656127153, 1656127153, 0);
INSERT INTO `water_device_control` VALUES (402, 1, 112, 2, 0, 1656127188, 1656127188, 0);
INSERT INTO `water_device_control` VALUES (403, 1, 112, 3, 0, 1656127193, 1656127193, 0);
INSERT INTO `water_device_control` VALUES (404, 1, 112, 4, 0, 1656127241, 1656127241, 0);
INSERT INTO `water_device_control` VALUES (405, 1, 112, 2, 0, 1656127247, 1656127247, 0);
INSERT INTO `water_device_control` VALUES (406, 1, 112, 3, 0, 1656127252, 1656127252, 0);
INSERT INTO `water_device_control` VALUES (407, 1, 112, 4, 0, 1656127259, 1656127259, 0);
INSERT INTO `water_device_control` VALUES (408, 1, 112, 2, 0, 1656141807, 1656141807, 0);
INSERT INTO `water_device_control` VALUES (409, 1, 112, 3, 0, 1656141834, 1656141834, 0);
INSERT INTO `water_device_control` VALUES (410, 1, 112, 4, 0, 1656141851, 1656141851, 0);
INSERT INTO `water_device_control` VALUES (411, 1, 112, 2, 0, 1656143208, 1656143208, 0);
INSERT INTO `water_device_control` VALUES (412, 1, 112, 4, 0, 1656143236, 1656143236, 0);
INSERT INTO `water_device_control` VALUES (413, 1, 112, 2, 0, 1656143357, 1656143357, 0);
INSERT INTO `water_device_control` VALUES (414, 1, 112, 3, 0, 1656143362, 1656143362, 0);
INSERT INTO `water_device_control` VALUES (415, 1, 112, 2, 0, 1656143374, 1656143374, 0);
INSERT INTO `water_device_control` VALUES (416, 1, 112, 4, 0, 1656143400, 1656143400, 0);
INSERT INTO `water_device_control` VALUES (420, 1, 5, 4, 0, 1656470818, 1656470818, 0);
INSERT INTO `water_device_control` VALUES (424, 1, 5, 1, 0, 1656471705, 1656471705, 0);
INSERT INTO `water_device_control` VALUES (425, 1, 5, 4, 0, 1656472092, 1656472092, 0);
INSERT INTO `water_device_control` VALUES (426, 1, 5, 1, 0, 1656472429, 1656472429, 0);
INSERT INTO `water_device_control` VALUES (427, 1, 5, 4, 0, 1656472677, 1656472677, 0);
INSERT INTO `water_device_control` VALUES (428, 1, 130, 2, 0, 1656644238, 1656644238, 0);
INSERT INTO `water_device_control` VALUES (429, 1, 130, 3, 0, 1656644272, 1656644272, 0);
INSERT INTO `water_device_control` VALUES (430, 1, 130, 4, 0, 1656644297, 1656644297, 0);
INSERT INTO `water_device_control` VALUES (431, 1, 130, 2, 0, 1656644615, 1656644615, 0);
INSERT INTO `water_device_control` VALUES (432, 1, 130, 4, 0, 1656644627, 1656644627, 0);
INSERT INTO `water_device_control` VALUES (433, 1, 130, 2, 0, 1656644742, 1656644742, 0);
INSERT INTO `water_device_control` VALUES (434, 1, 130, 3, 0, 1656644745, 1656644745, 0);
INSERT INTO `water_device_control` VALUES (435, 1, 130, 2, 0, 1656644769, 1656644769, 0);
INSERT INTO `water_device_control` VALUES (436, 1, 130, 2, 0, 1656644787, 1656644787, 0);
INSERT INTO `water_device_control` VALUES (437, 1, 130, 2, 0, 1656985348, 1656985348, 0);
INSERT INTO `water_device_control` VALUES (438, 1, 130, 2, 0, 1656985398, 1656985398, 0);
INSERT INTO `water_device_control` VALUES (439, 1, 130, 4, 0, 1656985463, 1656985463, 0);

-- ----------------------------
-- Table structure for water_device_repair
-- ----------------------------
DROP TABLE IF EXISTS `water_device_repair`;
CREATE TABLE `water_device_repair`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '故障标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '故障内容',
  `device_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '设备ID',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 0待处理 1：处理中 2：处理完成',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '提交故障的用户',
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理',
  `repair_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '运维人员',
  `mark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `device_id`(`device_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE,
  INDEX `repair_user_id`(`repair_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备故障报修' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_device_repair
-- ----------------------------
INSERT INTO `water_device_repair` VALUES (1, '报修标题', '机器发生了故障~！', 3, 0, 0, 1, 0, '', 1654572414, 1654572414, 0);
INSERT INTO `water_device_repair` VALUES (2, '报修标题', '机器发生了故障~！', 3, 0, 0, 1, 0, '', 1654572831, 1654572831, 0);
INSERT INTO `water_device_repair` VALUES (3, '报修标题', '机器发生了故障~！', 1, 0, 0, 1, 0, '', 1654574212, 1654574212, 0);
INSERT INTO `water_device_repair` VALUES (4, '报修标题', '机器发生了故障~！', 1, 0, 0, 1, 0, '', 1654575728, 1654575728, 0);
INSERT INTO `water_device_repair` VALUES (5, '报修标题', '机器发生了故障~！', 5, 0, 0, 105, 0, '', 1655774267, 1655774963, 1655774963);

-- ----------------------------
-- Table structure for water_device_tip
-- ----------------------------
DROP TABLE IF EXISTS `water_device_tip`;
CREATE TABLE `water_device_tip`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tip1` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `tip2` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `tip3` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `tip4` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `device_id`(`device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_device_tip
-- ----------------------------
INSERT INTO `water_device_tip` VALUES (1, 6, '', '', '', '', 1655691664, 1655718048, 1655718048);
INSERT INTO `water_device_tip` VALUES (2, 7, '', '', '', '', 1656569680, 1656569680, 0);
INSERT INTO `water_device_tip` VALUES (3, 9, '欢饮使用xxx加水机', 'tip2~!!!', '', '', 1656570241, 1656570241, 0);
INSERT INTO `water_device_tip` VALUES (4, 10, '欢饮使用xxx加水机', 'tip2~!!!', '', '', 1656570305, 1656570305, 0);
INSERT INTO `water_device_tip` VALUES (5, 11, '欢饮使用xxx加水机', 'tip2~!!!', '', '', 1656570397, 1656570397, 0);

-- ----------------------------
-- Table structure for water_flow
-- ----------------------------
DROP TABLE IF EXISTS `water_flow`;
CREATE TABLE `water_flow`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `device_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flow` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `site_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '站点',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `device_id`(`device_id`) USING BTREE,
  INDEX `site_id`(`site_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_flow
-- ----------------------------

-- ----------------------------
-- Table structure for water_order
-- ----------------------------
DROP TABLE IF EXISTS `water_order`;
CREATE TABLE `water_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `order_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `outer_trade_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付平台订单号',
  `channel_trade_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '渠道的订单号 例如 支付宝 微信',
  `money` decimal(8, 2) UNSIGNED NOT NULL COMMENT '充值金额',
  `flow` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '充值流量',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '订单金额',
  `pay_price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '实际支付的金额',
  `refund_money` decimal(8, 2) UNSIGNED NOT NULL COMMENT '退款金额',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0：待支付 1：已支付 2：已取消 3：订单支付超时 4：退款中 5：已退款',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `product_snap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品快照',
  `pay_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '调用的支付类型 例如通联',
  `channel_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付渠道类型 例如微信、支付宝',
  `pay_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付时间',
  `coupon_card_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用的优惠券ID',
  `mark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '订单类型 1：充值订单 2：代理服务费',
  `allow_refund` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单是否支持退款',
  `device_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '设备ID',
  `is_recharged` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已经充值过了',
  `refund_mark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '退款备注',
  `refund_error_mark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '退款失败备注',
  `is_clear` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已清空流量',
  `is_vip` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'VIP套餐',
  `site_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '站点',
  `extend_data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '扩展数据',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_no`(`order_no`) USING BTREE,
  INDEX `outer_trade_no`(`outer_trade_no`) USING BTREE,
  INDEX `channel_trade_no`(`channel_trade_no`) USING BTREE,
  INDEX `user`(`user_id`) USING BTREE,
  INDEX `product`(`product_id`) USING BTREE,
  INDEX `device_id`(`device_id`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `site_id`(`site_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_order
-- ----------------------------
INSERT INTO `water_order` VALUES (25, '1分钱购', '20220412153837335473', '220412117620351139', '4200001307202204129130330916', 100.00, 100, 0.01, 0.01, 0.00, 5, 1, 1, 7, '{\"name\":\"1分钱购\",\"price\":\"0.01\",\"give_money\":\"100.00\"}', 'allInPay', 'wx', 1649749128, 0, '', 1, 0, 1, 1, '', '', 0, 0, 1, '', 1649907189, 1656472429, 0);
INSERT INTO `water_order` VALUES (26, '1分钱购', '20220407153333434014', '220407118019754544', '', 100.00, 0, 0.01, 0.01, 0.00, 1, 0, 1, 7, '{\"name\":\"1分钱购\",\"price\":\"0.01\",\"give_money\":\"100.00\"}', 'allInPay', '', 0, 0, '', 1, 0, 1, 0, '', '', 0, 0, 1, '', 1653027870, 1652437166, 0);
INSERT INTO `water_order` VALUES (27, '1分钱购', '20220523151727912441', '', '', 0.00, 200, 0.01, 0.01, 0.00, 73, 0, 0, 7, '{\"name\":\"1分钱购\",\"price\":\"0.01\",\"flow\":100,\"give_flow\":100,\"status_desc\":\"启用\"}', 'allInPay', '', 0, 0, '', 1, 1, 1, 0, '', '', 0, 0, 1, '', 1653290247, 1653290247, 0);
INSERT INTO `water_order` VALUES (28, '', '20220609113806887841', '', '', 0.00, 0, 0.00, 0.00, 0.00, 0, 0, 1, 7, '', '', '', 0, 0, '', 1, 0, 1, 0, '', '', 0, 0, 1, '', 1654745886, 1654745886, 0);
INSERT INTO `water_order` VALUES (29, '', '20220609113950726185', '', '', 0.00, 0, 0.00, 0.00, 0.00, 0, 1, 1, 7, '', '', '', 0, 0, '', 1, 0, 1, 0, '', '', 0, 0, 1, '', 1654745990, 1654745990, 0);
INSERT INTO `water_order` VALUES (30, 'ceshi ', '20220609114002357438', '', '', 0.00, 0, 0.00, 0.00, 0.00, 0, 1, 1, 7, '', '', '', 0, 0, '', 1, 0, 1, 0, '', '', 0, 0, 1, '', 1654746002, 1654746002, 0);
INSERT INTO `water_order` VALUES (31, '服务费', '20220610144518958541', '', '', 0.00, 0, 1.00, 1.00, 0.00, 1, 1, 0, 0, '', 'allInPay', '', 0, 0, '', 2, 0, 0, 0, '', '', 0, 0, 1, '1', 1654843518, 1654843518, 0);
INSERT INTO `water_order` VALUES (32, '服务费', '20220610151903628279', '', '', 0.00, 0, 1.00, 1.00, 0.00, 1, 1, 0, 0, '', 'allInPay', '', 0, 0, '', 2, 0, 0, 0, '', '', 0, 0, 1, '1', 1654845543, 1654845543, 0);
INSERT INTO `water_order` VALUES (33, '服务费', '20220610153753178995', '', '', 0.00, 0, 1.00, 1.00, 0.00, 1, 1, 0, 0, '', 'allInPay', '', 0, 0, '', 2, 0, 0, 0, '', '', 0, 0, 1, '1', 1654846673, 1654846673, 0);
INSERT INTO `water_order` VALUES (34, '六月服务费', '20220610163746694733', '', '', 0.00, 0, 1.00, 1.00, 0.00, 1, 1, 0, 0, '', 'allInPay', '', 0, 0, '', 2, 0, 1, 0, '', '', 0, 0, 1, '1', 1654850266, 1654850266, 0);
INSERT INTO `water_order` VALUES (35, '六月服务费', '20220610164254785655', '', '', 0.00, 0, 1.00, 1.00, 0.00, 1, 1, 0, 0, '', 'allInPay', '', 0, 0, '', 2, 0, 1, 0, '', '', 0, 0, 1, '1', 1654850574, 1654850574, 0);
INSERT INTO `water_order` VALUES (36, 'ceshi ', '20220610175544475785', '', '', 0.00, 0, 99.99, 99.99, 0.00, 93, 1, 1, 12, '{\"name\":\"9999升套餐\",\"price\":\"99.99\",\"status_desc\":\"启用\"}', '', '', 0, 0, '', 1, 0, 1, 0, '', '', 0, 0, 1, '', 1654854944, 1654854944, 0);
INSERT INTO `water_order` VALUES (37, 'ceshi ', '20220610175733951778', '', '', 0.00, 0, 99.99, 99.99, 0.00, 93, 1, 1, 12, '{\"name\":\"9999升套餐\",\"price\":\"99.99\",\"status_desc\":\"启用\"}', '', '', 0, 0, '', 1, 0, 1, 0, '', '', 0, 0, 1, '', 1654855053, 1654855053, 0);
INSERT INTO `water_order` VALUES (38, 'ceshi ', '20220610175755439508', '20220610175755439508', '', 0.00, 0, 99.99, 99.99, 0.00, 93, 1, 1, 12, '{\"name\":\"9999升套餐\",\"price\":\"99.99\",\"status_desc\":\"启用\"}', '', 'add', 0, 0, '', 1, 0, 1, 1, '', '', 0, 0, 1, '', 1654855075, 1654855075, 0);
INSERT INTO `water_order` VALUES (39, 'ceshi ', '20220611092918763701', '20220611092918763701', '', 0.00, 0, 99.99, 99.99, 0.00, 93, 1, 1, 12, '{\"name\":\"9999升套餐\",\"price\":\"99.99\",\"status_desc\":\"启用\"}', '', 'add', 0, 0, '', 1, 0, 1, 1, '', '', 0, 0, 1, '', 1654910958, 1654910958, 0);
INSERT INTO `water_order` VALUES (40, 'ceshi ', '20220611093356788351', '20220611093356788351', '', 0.00, 0, 99.99, 99.99, 0.00, 93, 1, 1, 12, '{\"name\":\"9999升套餐\",\"price\":\"99.99\",\"status_desc\":\"启用\"}', '', 'add', 0, 0, '', 1, 0, 1, 1, '', '', 0, 0, 1, '', 1654911236, 1654911236, 0);
INSERT INTO `water_order` VALUES (41, 'ceshi ', '20220611094920595170', '20220611094920595170', '', 0.00, 0, 99.99, 99.99, 0.00, 93, 1, 1, 12, '{\"name\":\"9999升套餐\",\"allow_refund\":0,\"price\":\"99.99\",\"flow\":9999,\"give_flow\":0,\"is_vip\":0,\"status_desc\":\"启用\"}', '', 'add', 0, 0, '', 1, 0, 1, 1, '', '', 0, 0, 1, '', 1654912160, 1654912160, 0);
INSERT INTO `water_order` VALUES (42, '六月服务费', '20220611103607291253', '220611114827557817', '', 0.00, 0, 1.00, 1.00, 0.00, 1, 1, 0, 0, '', 'allInPay', '', 0, 0, '', 2, 0, 1, 0, '', '', 0, 0, 1, '1', 1654913773, 1654915457, 0);
INSERT INTO `water_order` VALUES (43, '1分钱购', '20220624170328649062', '', '', 0.00, 200, 0.01, 0.01, 0.00, 111, 0, 0, 7, '{\"name\":\"1分钱购\",\"allow_refund\":0,\"price\":\"0.01\",\"flow\":100,\"give_flow\":100,\"is_vip\":0,\"status_desc\":\"status on\"}', 'allInPay', '', 0, 0, '', 1, 0, 1, 0, '', '', 0, 0, 1, '', 1656061408, 1656061408, 0);
INSERT INTO `water_order` VALUES (44, '1分钱购', '20220625152226371199', '', '', 0.00, 200, 0.01, 0.01, 0.00, 112, 1, 0, 7, '{\"name\":\"1分钱购\",\"allow_refund\":0,\"price\":\"0.01\",\"flow\":100,\"give_flow\":100,\"is_vip\":0,\"status_desc\":\"启用\"}', 'allInPay', '', 0, 0, '', 1, 0, 1, 0, '', '', 0, 0, 1, '', 1656141746, 1656141746, 0);
INSERT INTO `water_order` VALUES (45, '1分钱购', '20220625152412816557', '', '', 0.00, 200, 0.01, 0.01, 0.00, 114, 1, 0, 7, '{\"name\":\"1分钱购\",\"allow_refund\":0,\"price\":\"0.01\",\"flow\":100,\"give_flow\":100,\"is_vip\":0,\"status_desc\":\"启用\"}', 'allInPay', '', 0, 0, '', 1, 0, 1, 0, '', '', 0, 0, 1, '', 1656141852, 1656141852, 0);
INSERT INTO `water_order` VALUES (46, '1分钱购', '20220625154504293200', '', '', 0.00, 200, 0.01, 0.01, 0.00, 112, 1, 0, 7, '{\"name\":\"1分钱购\",\"allow_refund\":0,\"price\":\"0.01\",\"flow\":100,\"give_flow\":100,\"is_vip\":0,\"status_desc\":\"启用\"}', 'allInPay', '', 0, 0, '', 1, 0, 1, 0, '', '', 0, 0, 1, '', 1656143104, 1656143104, 0);
INSERT INTO `water_order` VALUES (47, '1分钱购', '20220625154543371581', '', '', 0.00, 200, 0.01, 0.01, 0.00, 116, 1, 0, 7, '{\"name\":\"1分钱购\",\"allow_refund\":0,\"price\":\"0.01\",\"flow\":100,\"give_flow\":100,\"is_vip\":0,\"status_desc\":\"启用\"}', 'allInPay', '', 0, 0, '', 1, 0, 1, 0, '', '', 0, 0, 1, '', 1656143143, 1656143143, 0);
INSERT INTO `water_order` VALUES (48, 'ceshi ', '20220611092918763702', '20220611092918763702', '', 0.00, 666, 99.99, 99.99, 0.00, 93, 119, 1, 12, '{\"name\":\"9999升套餐\",\"price\":\"99.99\",\"status_desc\":\"启用\"}', '', 'add', 0, 0, '', 1, 0, 1, 1, '', '', 0, 0, 1, '', 1656578150, 1656578150, 0);

-- ----------------------------
-- Table structure for water_product
-- ----------------------------
DROP TABLE IF EXISTS `water_product`;
CREATE TABLE `water_product`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `allow_refund` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可以退',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '现价',
  `money` decimal(8, 2) UNSIGNED NOT NULL COMMENT '充值金额',
  `flow` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '流量',
  `give_flow` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '赠送流量',
  `minute` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '加水的时间',
  `device_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '机器id',
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 有关联的订单则不能删除套餐，只能设置状态',
  `mark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `buy_total` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已购买数量',
  `is_vip` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为VIP套餐',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `device`(`device_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `user`(`agent_id`) USING BTREE,
  INDEX `vip`(`is_vip`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_product
-- ----------------------------
INSERT INTO `water_product` VALUES (1, '50升套餐', 0, 50.00, 0.00, 50, 0, 0, 0, 1, 1, '', 0, 0, 1647503365, 1655199283, 0);
INSERT INTO `water_product` VALUES (2, '100升套餐', 0, 100.00, 0.00, 100, 0, 0, 0, 1, 1, '', 0, 0, 1647503365, 1647503365, 0);
INSERT INTO `water_product` VALUES (3, '150升套餐', 0, 150.00, 0.00, 150, 0, 0, 0, 1, 1, '', 0, 0, 1647503365, 1647503365, 0);
INSERT INTO `water_product` VALUES (4, '200升套餐', 0, 200.00, 0.00, 200, 0, 0, 0, 1, 1, '', 0, 0, 1647503365, 1647503365, 0);
INSERT INTO `water_product` VALUES (5, '300升套餐', 0, 300.00, 0.00, 300, 0, 0, 0, 1, 1, '', 1, 0, 1647503365, 1647503365, 0);
INSERT INTO `water_product` VALUES (6, '500升套餐', 0, 500.00, 0.00, 500, 0, 0, 0, 1, 0, '', 0, 0, 1647503365, 1647503365, 0);
INSERT INTO `water_product` VALUES (7, '1分钱购', 0, 0.01, 0.00, 100, 100, 0, 0, 1, 1, '', 61, 0, 1647503365, 1647503365, 0);
INSERT INTO `water_product` VALUES (12, '9999升套餐', 0, 99.99, 0.00, 9999, 0, 0, 0, 1, 1, '', 4, 0, 1654854898, 1654854898, 0);
INSERT INTO `water_product` VALUES (13, '9999升套餐', 0, 99.99, 0.00, 9999, 0, 0, 0, 118, 1, '', 0, 0, 1656576386, 1656576386, 0);

-- ----------------------------
-- Table structure for water_service_charge
-- ----------------------------
DROP TABLE IF EXISTS `water_service_charge`;
CREATE TABLE `water_service_charge`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理',
  `amount` decimal(8, 2) UNSIGNED NOT NULL COMMENT '服务费',
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '服务费时间',
  `pay_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付时间',
  `expire_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '到期时间',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联支付的订单ID',
  `is_pay` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已经支付',
  `mark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `device_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '设备',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE,
  INDEX `time`(`time`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `is_pay`(`is_pay`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理服务费' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_service_charge
-- ----------------------------
INSERT INTO `water_service_charge` VALUES (1, '六月服务费', 1, 1.99, 1654755104, 0, 0, 0, 0, '', 1, 1654755104, 0, 0);
INSERT INTO `water_service_charge` VALUES (2, '六月服务费', 119, 0.01, 1654755104, 0, 0, 0, 0, '', 6, 1654755104, 0, 0);
INSERT INTO `water_service_charge` VALUES (3, '六月服务费', 119, 0.01, 1654755104, 0, 0, 0, 0, '', 6, 1654755104, 0, 0);
INSERT INTO `water_service_charge` VALUES (4, '六月服务费', 119, 0.01, 1654755104, 0, 0, 0, 0, '', 6, 1654755104, 0, 0);
INSERT INTO `water_service_charge` VALUES (5, '六月服务费', 119, 0.01, 1654755104, 0, 0, 0, 0, '', 6, 1654755104, 0, 0);
INSERT INTO `water_service_charge` VALUES (6, '六月服务费', 119, 0.01, 1654755104, 0, 0, 0, 0, '', 6, 1654755104, 0, 0);
INSERT INTO `water_service_charge` VALUES (7, '六月服务费', 119, 0.01, 1654755104, 0, 0, 0, 0, '', 6, 1654755104, 0, 0);
INSERT INTO `water_service_charge` VALUES (8, '六月服务费', 119, 0.01, 1654755104, 0, 0, 0, 0, '', 6, 1654755104, 0, 0);
INSERT INTO `water_service_charge` VALUES (9, '六月服务费', 119, 0.01, 1654755104, 0, 0, 0, 0, '', 6, 1654755104, 0, 0);

-- ----------------------------
-- Table structure for water_statistics
-- ----------------------------
DROP TABLE IF EXISTS `water_statistics`;
CREATE TABLE `water_statistics`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for water_system_auth
-- ----------------------------
DROP TABLE IF EXISTS `water_system_auth`;
CREATE TABLE `water_system_auth`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `route` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '页面地址',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模块',
  `is_menu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `sort` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `mark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `route`(`route`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 396 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_system_auth
-- ----------------------------
INSERT INTO `water_system_auth` VALUES (1, '登录管理', 'admin/login', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (2, '管理员管理', 'admin/admin', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (3, '广告管理', 'admin/adverts', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (4, '运营商管理', 'admin/agent', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (5, '通联支付管理', 'admin/all_in_pay', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (6, '附件管理', 'admin/attachment', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (7, 'IC卡管理', 'admin/card', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (8, '现金券管理', 'admin/cash_coupon', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (9, '现金券领取管理', 'admin/cash_coupon_card', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (10, '取水客户管理', 'admin/customer', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (11, '设备管理', 'admin/device', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (12, '设备操作记录管理', 'admin/device_control', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (13, '出厂设置员管理', 'admin/factory_user', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (14, '订单管理', 'admin/order', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (15, '套餐管理', 'admin/product', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (16, '运营商维护员管理', 'admin/repair_user', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (17, '服务费管理', 'admin/service_charge', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (18, '系统权限管理', 'admin/system_auth', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (19, '系统配置管理', 'admin/system_config', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (20, '系统配置分类管理', 'admin/system_config_tab', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (21, '系统日志管理', 'admin/system_log', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (22, '角色管理', 'admin/system_role', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (23, '用户管理', 'admin/user', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (24, '第三方授权管理', 'admin/user_oauth', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (25, '水务公司管理', 'admin/water_company', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (26, '取水员管理', 'admin/water_fetcher', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (27, '水厂管理', 'admin/waterworks', '', 1, 'admin', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (28, '登录管理', 'agent/login', '', 1, 'agent', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (29, '广告管理', 'agent/adverts', '', 1, 'agent', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (30, '运营商管理', 'agent/agent', '', 1, 'agent', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (31, '附件管理', 'agent/attachment', '', 1, 'agent', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (32, '现金券管理', 'agent/cash_coupon', '', 1, 'agent', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (33, '现金券领取管理', 'agent/cash_coupon_card', '', 1, 'agent', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (34, '优惠券管理员管理', 'agent/coupon_user', '', 1, 'agent', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (35, '设备管理', 'agent/device', '', 1, 'agent', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (36, '设备报修管理', 'agent/device_repair', '', 1, 'agent', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (37, '订单管理', 'agent/order', '', 1, 'agent', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (38, '套餐管理', 'agent/product', '', 1, 'agent', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (39, '运维员管理', 'agent/repair_user', '', 1, 'agent', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (40, '服务费管理', 'agent/service_charge', '', 1, 'agent', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (41, '用户管理', 'agent/user', '', 1, 'agent', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (42, '登录管理', 'api/login', '', 1, 'api', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (43, '设备管理', 'api/device', '', 1, 'api', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (44, '订单管理', 'api/order', '', 1, 'api', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (45, '支付管理', 'api/pay', '', 1, 'api', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (46, '用户管理', 'api/user', '', 1, 'api', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (47, 'event管理', 'api/wechat', '', 1, 'api', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (48, '登录管理', 'coupon_user/login', '', 1, 'coupon_user', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (49, '现金券管理', 'coupon_user/cash_coupon', '', 1, 'coupon_user', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (50, '现金券领取管理', 'coupon_user/cash_coupon_card', '', 1, 'coupon_user', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (51, '商户管理', 'coupon_user/coupon_user', '', 1, 'coupon_user', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (52, '登录管理', 'repair_user/login', '', 1, 'repair_user', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (53, '设备管理', 'repair_user/device', '', 1, 'repair_user', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (54, '设备控制测试管理', 'repair_user/device_control_test', '', 1, 'repair_user', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (55, '设备报修管理', 'repair_user/device_repair', '', 1, 'repair_user', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (56, '运维员管理', 'repair_user/repair_user', '', 1, 'repair_user', 1, '', 0, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (57, '后台登录', 'admin/login/login', 'login/login', 1, 'admin', 0, '', 1, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (58, '后台登出', 'admin/login/logout', 'login/logout', 1, 'admin', 0, '', 1, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (59, '个人信息', 'admin/admin/info', 'admin/info', 1, 'admin', 0, '', 2, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (60, '管理员列表', 'admin/admin/index', 'admin/index', 1, 'admin', 1, '', 2, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (61, '获取管理员详情', 'admin/admin/read', 'admin/read', 1, 'admin', 0, '', 2, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (62, '添加或修改获取管理员详情', 'admin/admin/edit', 'admin/edit', 1, 'admin', 0, '', 2, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (63, '添加管理员', 'admin/admin/save', 'admin/save', 1, 'admin', 0, '', 2, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (64, '修改管理员', 'admin/admin/update', 'admin/update', 1, 'admin', 0, '', 2, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (65, '修改管理员字段值', 'admin/admin/change', 'admin/change', 1, 'admin', 0, '', 2, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (66, '删除管理员', 'admin/admin/delete', 'admin/delete', 1, 'admin', 0, '', 2, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (67, '广告列表', 'admin/adverts/index', 'adverts/index', 1, 'admin', 1, '', 3, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (68, '获取广告详情', 'admin/adverts/read', 'adverts/read', 1, 'admin', 0, '', 3, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (69, '添加或修改获取广告详情', 'admin/adverts/edit', 'adverts/edit', 1, 'admin', 0, '', 3, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (70, '添加广告', 'admin/adverts/save', 'adverts/save', 1, 'admin', 0, '', 3, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (71, '修改广告', 'admin/adverts/update', 'adverts/update', 1, 'admin', 0, '', 3, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (72, '修改广告字段值', 'admin/adverts/change', 'adverts/change', 1, 'admin', 0, '', 3, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (73, '删除广告', 'admin/adverts/delete', 'adverts/delete', 1, 'admin', 0, '', 3, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (74, '运营商列表', 'admin/agent/index', 'agent/index', 1, 'admin', 1, '', 4, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (75, '获取运营商详情', 'admin/agent/read', 'agent/read', 1, 'admin', 0, '', 4, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (76, '添加或修改获取运营商详情', 'admin/agent/edit', 'agent/edit', 1, 'admin', 0, '', 4, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (77, '添加运营商', 'admin/agent/save', 'agent/save', 1, 'admin', 0, '', 4, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (78, '修改运营商', 'admin/agent/update', 'agent/update', 1, 'admin', 0, '', 4, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (79, '修改运营商字段值', 'admin/agent/change', 'agent/change', 1, 'admin', 0, '', 4, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (80, '删除运营商', 'admin/agent/delete', 'agent/delete', 1, 'admin', 0, '', 4, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (81, '通联支付列表', 'admin/all_in_pay/index', 'all_in_pay/index', 1, 'admin', 1, '', 5, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (82, '获取通联支付详情', 'admin/all_in_pay/read', 'all_in_pay/read', 1, 'admin', 0, '', 5, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (83, '添加或修改获取通联支付详情', 'admin/all_in_pay/edit', 'all_in_pay/edit', 1, 'admin', 0, '', 5, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (84, '添加通联支付', 'admin/all_in_pay/save', 'all_in_pay/save', 1, 'admin', 0, '', 5, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (85, '修改通联支付', 'admin/all_in_pay/update', 'all_in_pay/update', 1, 'admin', 0, '', 5, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (86, '修改通联支付字段值', 'admin/all_in_pay/change', 'all_in_pay/change', 1, 'admin', 0, '', 5, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (87, '删除通联支付', 'admin/all_in_pay/delete', 'all_in_pay/delete', 1, 'admin', 0, '', 5, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (88, '附件列表', 'admin/attachment/index', 'attachment/index', 1, 'admin', 1, '', 6, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (89, '获取附件详情', 'admin/attachment/read', 'attachment/read', 1, 'admin', 0, '', 6, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (90, '添加或修改获取附件详情', 'admin/attachment/edit', 'attachment/edit', 1, 'admin', 0, '', 6, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (91, '添加附件', 'admin/attachment/save', 'attachment/save', 1, 'admin', 0, '', 6, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (92, '修改附件', 'admin/attachment/update', 'attachment/update', 1, 'admin', 0, '', 6, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (93, '修改附件字段值', 'admin/attachment/change', 'attachment/change', 1, 'admin', 0, '', 6, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (94, '删除附件', 'admin/attachment/delete', 'attachment/delete', 1, 'admin', 0, '', 6, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (95, 'IC卡列表', 'admin/card/index', 'card/index', 1, 'admin', 1, '', 7, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (96, '获取IC卡详情', 'admin/card/read', 'card/read', 1, 'admin', 0, '', 7, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (97, '添加或修改获取IC卡详情', 'admin/card/edit', 'card/edit', 1, 'admin', 0, '', 7, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (98, '添加IC卡', 'admin/card/save', 'card/save', 1, 'admin', 0, '', 7, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (99, '修改IC卡', 'admin/card/update', 'card/update', 1, 'admin', 0, '', 7, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (100, '修改IC卡字段值', 'admin/card/change', 'card/change', 1, 'admin', 0, '', 7, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (101, '删除IC卡', 'admin/card/delete', 'card/delete', 1, 'admin', 0, '', 7, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (102, '现金券列表', 'admin/cash_coupon/index', 'cash_coupon/index', 1, 'admin', 1, '', 8, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (103, '获取现金券详情', 'admin/cash_coupon/read', 'cash_coupon/read', 1, 'admin', 0, '', 8, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (104, '添加或修改获取现金券详情', 'admin/cash_coupon/edit', 'cash_coupon/edit', 1, 'admin', 0, '', 8, 0, '', 1657245104, 1657245104, 0);
INSERT INTO `water_system_auth` VALUES (105, '添加现金券', 'admin/cash_coupon/save', 'cash_coupon/save', 1, 'admin', 0, '', 8, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (106, '修改现金券', 'admin/cash_coupon/update', 'cash_coupon/update', 1, 'admin', 0, '', 8, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (107, '修改现金券字段值', 'admin/cash_coupon/change', 'cash_coupon/change', 1, 'admin', 0, '', 8, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (108, '删除现金券', 'admin/cash_coupon/delete', 'cash_coupon/delete', 1, 'admin', 0, '', 8, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (109, '现金券领取列表', 'admin/cash_coupon_card/index', 'cash_coupon_card/index', 1, 'admin', 1, '', 9, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (110, '获取现金券领取详情', 'admin/cash_coupon_card/read', 'cash_coupon_card/read', 1, 'admin', 0, '', 9, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (111, '添加或修改获取现金券领取详情', 'admin/cash_coupon_card/edit', 'cash_coupon_card/edit', 1, 'admin', 0, '', 9, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (112, '添加现金券领取', 'admin/cash_coupon_card/save', 'cash_coupon_card/save', 1, 'admin', 0, '', 9, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (113, '修改现金券领取', 'admin/cash_coupon_card/update', 'cash_coupon_card/update', 1, 'admin', 0, '', 9, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (114, '修改现金券领取字段值', 'admin/cash_coupon_card/change', 'cash_coupon_card/change', 1, 'admin', 0, '', 9, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (115, '删除现金券领取', 'admin/cash_coupon_card/delete', 'cash_coupon_card/delete', 1, 'admin', 0, '', 9, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (116, '取水客户列表', 'admin/customer/index', 'customer/index', 1, 'admin', 1, '', 10, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (117, '获取取水客户详情', 'admin/customer/read', 'customer/read', 1, 'admin', 0, '', 10, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (118, '添加或修改获取取水客户详情', 'admin/customer/edit', 'customer/edit', 1, 'admin', 0, '', 10, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (119, '添加取水客户', 'admin/customer/save', 'customer/save', 1, 'admin', 0, '', 10, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (120, '修改取水客户', 'admin/customer/update', 'customer/update', 1, 'admin', 0, '', 10, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (121, '修改取水客户字段值', 'admin/customer/change', 'customer/change', 1, 'admin', 0, '', 10, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (122, '删除取水客户', 'admin/customer/delete', 'customer/delete', 1, 'admin', 0, '', 10, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (123, '获取设备使用状态', 'admin/device/state', 'device/state', 1, 'admin', 0, '', 11, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (124, '设备列表', 'admin/device/index', 'device/index', 1, 'admin', 1, '', 11, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (125, '获取设备详情', 'admin/device/read', 'device/read', 1, 'admin', 0, '', 11, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (126, '添加或修改获取设备详情', 'admin/device/edit', 'device/edit', 1, 'admin', 0, '', 11, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (127, '添加设备', 'admin/device/save', 'device/save', 1, 'admin', 0, '', 11, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (128, '修改设备', 'admin/device/update', 'device/update', 1, 'admin', 0, '', 11, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (129, '修改设备字段值', 'admin/device/change', 'device/change', 1, 'admin', 0, '', 11, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (130, '删除设备', 'admin/device/delete', 'device/delete', 1, 'admin', 0, '', 11, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (131, '设备操作记录列表', 'admin/device_control/index', 'device_control/index', 1, 'admin', 1, '', 12, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (132, '获取设备操作记录详情', 'admin/device_control/read', 'device_control/read', 1, 'admin', 0, '', 12, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (133, '添加或修改获取设备操作记录详情', 'admin/device_control/edit', 'device_control/edit', 1, 'admin', 0, '', 12, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (134, '添加设备操作记录', 'admin/device_control/save', 'device_control/save', 1, 'admin', 0, '', 12, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (135, '修改设备操作记录', 'admin/device_control/update', 'device_control/update', 1, 'admin', 0, '', 12, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (136, '修改设备操作记录字段值', 'admin/device_control/change', 'device_control/change', 1, 'admin', 0, '', 12, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (137, '删除设备操作记录', 'admin/device_control/delete', 'device_control/delete', 1, 'admin', 0, '', 12, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (138, '出厂设置员列表', 'admin/factory_user/index', 'factory_user/index', 1, 'admin', 1, '', 13, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (139, '获取出厂设置员详情', 'admin/factory_user/read', 'factory_user/read', 1, 'admin', 0, '', 13, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (140, '添加或修改获取出厂设置员详情', 'admin/factory_user/edit', 'factory_user/edit', 1, 'admin', 0, '', 13, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (141, '添加出厂设置员', 'admin/factory_user/save', 'factory_user/save', 1, 'admin', 0, '', 13, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (142, '修改出厂设置员', 'admin/factory_user/update', 'factory_user/update', 1, 'admin', 0, '', 13, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (143, '修改出厂设置员字段值', 'admin/factory_user/change', 'factory_user/change', 1, 'admin', 0, '', 13, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (144, '删除出厂设置员', 'admin/factory_user/delete', 'factory_user/delete', 1, 'admin', 0, '', 13, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (145, '退款', 'admin/order/refund', 'order/refund', 1, 'admin', 0, '', 14, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (146, '订单列表', 'admin/order/index', 'order/index', 1, 'admin', 1, '', 14, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (147, '获取订单详情', 'admin/order/read', 'order/read', 1, 'admin', 0, '', 14, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (148, '添加或修改获取订单详情', 'admin/order/edit', 'order/edit', 1, 'admin', 0, '', 14, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (149, '添加订单', 'admin/order/save', 'order/save', 1, 'admin', 0, '', 14, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (150, '修改订单', 'admin/order/update', 'order/update', 1, 'admin', 0, '', 14, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (151, '修改订单字段值', 'admin/order/change', 'order/change', 1, 'admin', 0, '', 14, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (152, '删除订单', 'admin/order/delete', 'order/delete', 1, 'admin', 0, '', 14, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (153, '套餐列表', 'admin/product/index', 'product/index', 1, 'admin', 1, '', 15, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (154, '获取套餐详情', 'admin/product/read', 'product/read', 1, 'admin', 0, '', 15, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (155, '添加或修改获取套餐详情', 'admin/product/edit', 'product/edit', 1, 'admin', 0, '', 15, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (156, '添加套餐', 'admin/product/save', 'product/save', 1, 'admin', 0, '', 15, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (157, '修改套餐', 'admin/product/update', 'product/update', 1, 'admin', 0, '', 15, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (158, '修改套餐字段值', 'admin/product/change', 'product/change', 1, 'admin', 0, '', 15, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (159, '删除套餐', 'admin/product/delete', 'product/delete', 1, 'admin', 0, '', 15, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (160, '运营商维护员列表', 'admin/repair_user/index', 'repair_user/index', 1, 'admin', 1, '', 16, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (161, '获取运营商维护员详情', 'admin/repair_user/read', 'repair_user/read', 1, 'admin', 0, '', 16, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (162, '添加或修改获取运营商维护员详情', 'admin/repair_user/edit', 'repair_user/edit', 1, 'admin', 0, '', 16, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (163, '添加运营商维护员', 'admin/repair_user/save', 'repair_user/save', 1, 'admin', 0, '', 16, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (164, '修改运营商维护员', 'admin/repair_user/update', 'repair_user/update', 1, 'admin', 0, '', 16, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (165, '修改运营商维护员字段值', 'admin/repair_user/change', 'repair_user/change', 1, 'admin', 0, '', 16, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (166, '删除运营商维护员', 'admin/repair_user/delete', 'repair_user/delete', 1, 'admin', 0, '', 16, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (167, '服务费列表', 'admin/service_charge/index', 'service_charge/index', 1, 'admin', 1, '', 17, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (168, '获取服务费详情', 'admin/service_charge/read', 'service_charge/read', 1, 'admin', 0, '', 17, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (169, '添加或修改获取服务费详情', 'admin/service_charge/edit', 'service_charge/edit', 1, 'admin', 0, '', 17, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (170, '添加服务费', 'admin/service_charge/save', 'service_charge/save', 1, 'admin', 0, '', 17, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (171, '修改服务费', 'admin/service_charge/update', 'service_charge/update', 1, 'admin', 0, '', 17, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (172, '修改服务费字段值', 'admin/service_charge/change', 'service_charge/change', 1, 'admin', 0, '', 17, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (173, '删除服务费', 'admin/service_charge/delete', 'service_charge/delete', 1, 'admin', 0, '', 17, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (174, '刷新系统权限', 'admin/system_auth/flush', 'system_auth/flush', 1, 'admin', 0, '', 18, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (175, '系统权限列表', 'admin/system_auth/index', 'system_auth/index', 1, 'admin', 1, '', 18, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (176, '获取系统权限详情', 'admin/system_auth/read', 'system_auth/read', 1, 'admin', 0, '', 18, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (177, '添加或修改获取系统权限详情', 'admin/system_auth/edit', 'system_auth/edit', 1, 'admin', 0, '', 18, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (178, '添加系统权限', 'admin/system_auth/save', 'system_auth/save', 1, 'admin', 0, '', 18, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (179, '修改系统权限', 'admin/system_auth/update', 'system_auth/update', 1, 'admin', 0, '', 18, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (180, '修改系统权限字段值', 'admin/system_auth/change', 'system_auth/change', 1, 'admin', 0, '', 18, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (181, '删除系统权限', 'admin/system_auth/delete', 'system_auth/delete', 1, 'admin', 0, '', 18, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (182, '系统配置列表', 'admin/system_config/index', 'system_config/index', 1, 'admin', 1, '', 19, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (183, '获取系统配置详情', 'admin/system_config/read', 'system_config/read', 1, 'admin', 0, '', 19, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (184, '添加或修改获取系统配置详情', 'admin/system_config/edit', 'system_config/edit', 1, 'admin', 0, '', 19, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (185, '添加系统配置', 'admin/system_config/save', 'system_config/save', 1, 'admin', 0, '', 19, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (186, '修改系统配置', 'admin/system_config/update', 'system_config/update', 1, 'admin', 0, '', 19, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (187, '修改系统配置字段值', 'admin/system_config/change', 'system_config/change', 1, 'admin', 0, '', 19, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (188, '删除系统配置', 'admin/system_config/delete', 'system_config/delete', 1, 'admin', 0, '', 19, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (189, '系统配置分类列表', 'admin/system_config_tab/index', 'system_config_tab/index', 1, 'admin', 1, '', 20, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (190, '获取系统配置分类详情', 'admin/system_config_tab/read', 'system_config_tab/read', 1, 'admin', 0, '', 20, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (191, '添加或修改获取系统配置分类详情', 'admin/system_config_tab/edit', 'system_config_tab/edit', 1, 'admin', 0, '', 20, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (192, '添加系统配置分类', 'admin/system_config_tab/save', 'system_config_tab/save', 1, 'admin', 0, '', 20, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (193, '修改系统配置分类', 'admin/system_config_tab/update', 'system_config_tab/update', 1, 'admin', 0, '', 20, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (194, '修改系统配置分类字段值', 'admin/system_config_tab/change', 'system_config_tab/change', 1, 'admin', 0, '', 20, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (195, '删除系统配置分类', 'admin/system_config_tab/delete', 'system_config_tab/delete', 1, 'admin', 0, '', 20, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (196, '系统日志列表', 'admin/system_log/index', 'system_log/index', 1, 'admin', 1, '', 21, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (197, '获取系统日志详情', 'admin/system_log/read', 'system_log/read', 1, 'admin', 0, '', 21, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (198, '删除系统日志', 'admin/system_log/delete', 'system_log/delete', 1, 'admin', 0, '', 21, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (199, '获取菜单', 'admin/system_role/menu', 'system_role/menu', 1, 'admin', 0, '', 22, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (200, '获取角色', 'admin/system_role/role', 'system_role/role', 1, 'admin', 0, '', 22, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (201, '角色列表', 'admin/system_role/index', 'system_role/index', 1, 'admin', 1, '', 22, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (202, '获取角色详情', 'admin/system_role/read', 'system_role/read', 1, 'admin', 0, '', 22, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (203, '添加或修改获取角色详情', 'admin/system_role/edit', 'system_role/edit', 1, 'admin', 0, '', 22, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (204, '添加角色', 'admin/system_role/save', 'system_role/save', 1, 'admin', 0, '', 22, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (205, '修改角色', 'admin/system_role/update', 'system_role/update', 1, 'admin', 0, '', 22, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (206, '修改角色字段值', 'admin/system_role/change', 'system_role/change', 1, 'admin', 0, '', 22, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (207, '删除角色', 'admin/system_role/delete', 'system_role/delete', 1, 'admin', 0, '', 22, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (208, '用户列表', 'admin/user/index', 'user/index', 1, 'admin', 1, '', 23, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (209, '获取用户详情', 'admin/user/read', 'user/read', 1, 'admin', 0, '', 23, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (210, '添加或修改获取用户详情', 'admin/user/edit', 'user/edit', 1, 'admin', 0, '', 23, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (211, '添加用户', 'admin/user/save', 'user/save', 1, 'admin', 0, '', 23, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (212, '修改用户', 'admin/user/update', 'user/update', 1, 'admin', 0, '', 23, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (213, '修改用户字段值', 'admin/user/change', 'user/change', 1, 'admin', 0, '', 23, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (214, '删除用户', 'admin/user/delete', 'user/delete', 1, 'admin', 0, '', 23, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (215, '第三方授权列表', 'admin/user_oauth/index', 'user_oauth/index', 1, 'admin', 1, '', 24, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (216, '获取第三方授权详情', 'admin/user_oauth/read', 'user_oauth/read', 1, 'admin', 0, '', 24, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (217, '修改第三方授权字段值', 'admin/user_oauth/change', 'user_oauth/change', 1, 'admin', 0, '', 24, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (218, '删除第三方授权', 'admin/user_oauth/delete', 'user_oauth/delete', 1, 'admin', 0, '', 24, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (219, '水务公司列表', 'admin/water_company/index', 'water_company/index', 1, 'admin', 1, '', 25, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (220, '获取水务公司详情', 'admin/water_company/read', 'water_company/read', 1, 'admin', 0, '', 25, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (221, '添加或修改获取水务公司详情', 'admin/water_company/edit', 'water_company/edit', 1, 'admin', 0, '', 25, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (222, '添加水务公司', 'admin/water_company/save', 'water_company/save', 1, 'admin', 0, '', 25, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (223, '修改水务公司', 'admin/water_company/update', 'water_company/update', 1, 'admin', 0, '', 25, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (224, '修改水务公司字段值', 'admin/water_company/change', 'water_company/change', 1, 'admin', 0, '', 25, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (225, '删除水务公司', 'admin/water_company/delete', 'water_company/delete', 1, 'admin', 0, '', 25, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (226, '取水员列表', 'admin/water_fetcher/index', 'water_fetcher/index', 1, 'admin', 1, '', 26, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (227, '获取取水员详情', 'admin/water_fetcher/read', 'water_fetcher/read', 1, 'admin', 0, '', 26, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (228, '添加或修改获取取水员详情', 'admin/water_fetcher/edit', 'water_fetcher/edit', 1, 'admin', 0, '', 26, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (229, '添加取水员', 'admin/water_fetcher/save', 'water_fetcher/save', 1, 'admin', 0, '', 26, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (230, '修改取水员', 'admin/water_fetcher/update', 'water_fetcher/update', 1, 'admin', 0, '', 26, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (231, '修改取水员字段值', 'admin/water_fetcher/change', 'water_fetcher/change', 1, 'admin', 0, '', 26, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (232, '删除取水员', 'admin/water_fetcher/delete', 'water_fetcher/delete', 1, 'admin', 0, '', 26, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (233, '水厂列表', 'admin/waterworks/index', 'waterworks/index', 1, 'admin', 1, '', 27, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (234, '获取水厂详情', 'admin/waterworks/read', 'waterworks/read', 1, 'admin', 0, '', 27, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (235, '添加或修改获取水厂详情', 'admin/waterworks/edit', 'waterworks/edit', 1, 'admin', 0, '', 27, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (236, '添加水厂', 'admin/waterworks/save', 'waterworks/save', 1, 'admin', 0, '', 27, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (237, '修改水厂', 'admin/waterworks/update', 'waterworks/update', 1, 'admin', 0, '', 27, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (238, '修改水厂字段值', 'admin/waterworks/change', 'waterworks/change', 1, 'admin', 0, '', 27, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (239, '删除水厂', 'admin/waterworks/delete', 'waterworks/delete', 1, 'admin', 0, '', 27, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (240, 'agent/Login/login', 'agent/login/login', 'login/login', 1, 'agent', 0, '', 28, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (241, '登出', 'agent/login/logout', 'login/logout', 1, 'agent', 0, '', 28, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (242, '广告列表', 'agent/adverts/index', 'adverts/index', 1, 'agent', 1, '', 29, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (243, '获取广告详情', 'agent/adverts/read', 'adverts/read', 1, 'agent', 0, '', 29, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (244, '添加或修改获取广告详情', 'agent/adverts/edit', 'adverts/edit', 1, 'agent', 0, '', 29, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (245, '添加广告', 'agent/adverts/save', 'adverts/save', 1, 'agent', 0, '', 29, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (246, '修改广告', 'agent/adverts/update', 'adverts/update', 1, 'agent', 0, '', 29, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (247, '修改广告字段值', 'agent/adverts/change', 'adverts/change', 1, 'agent', 0, '', 29, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (248, '删除广告', 'agent/adverts/delete', 'adverts/delete', 1, 'agent', 0, '', 29, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (249, '详情', 'agent/agent/detail', 'agent/detail', 1, 'agent', 0, '', 30, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (250, 'agent/v1.Agent/profile', 'agent/agent/profile', 'agent/profile', 1, 'agent', 0, '', 30, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (251, '附件列表', 'agent/attachment/index', 'attachment/index', 1, 'agent', 1, '', 31, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (252, '获取附件详情', 'agent/attachment/read', 'attachment/read', 1, 'agent', 0, '', 31, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (253, '添加或修改获取附件详情', 'agent/attachment/edit', 'attachment/edit', 1, 'agent', 0, '', 31, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (254, '添加附件', 'agent/attachment/save', 'attachment/save', 1, 'agent', 0, '', 31, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (255, '修改附件', 'agent/attachment/update', 'attachment/update', 1, 'agent', 0, '', 31, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (256, '修改附件字段值', 'agent/attachment/change', 'attachment/change', 1, 'agent', 0, '', 31, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (257, '删除附件', 'agent/attachment/delete', 'attachment/delete', 1, 'agent', 0, '', 31, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (258, '现金券列表', 'agent/cash_coupon/index', 'cash_coupon/index', 1, 'agent', 1, '', 32, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (259, '获取现金券详情', 'agent/cash_coupon/read', 'cash_coupon/read', 1, 'agent', 0, '', 32, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (260, '添加或修改获取现金券详情', 'agent/cash_coupon/edit', 'cash_coupon/edit', 1, 'agent', 0, '', 32, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (261, '添加现金券', 'agent/cash_coupon/save', 'cash_coupon/save', 1, 'agent', 0, '', 32, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (262, '修改现金券', 'agent/cash_coupon/update', 'cash_coupon/update', 1, 'agent', 0, '', 32, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (263, '修改现金券字段值', 'agent/cash_coupon/change', 'cash_coupon/change', 1, 'agent', 0, '', 32, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (264, '删除现金券', 'agent/cash_coupon/delete', 'cash_coupon/delete', 1, 'agent', 0, '', 32, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (265, '现金券领取列表', 'agent/cash_coupon_card/index', 'cash_coupon_card/index', 1, 'agent', 1, '', 33, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (266, '获取现金券领取详情', 'agent/cash_coupon_card/read', 'cash_coupon_card/read', 1, 'agent', 0, '', 33, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (267, '添加或修改获取现金券领取详情', 'agent/cash_coupon_card/edit', 'cash_coupon_card/edit', 1, 'agent', 0, '', 33, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (268, '添加现金券领取', 'agent/cash_coupon_card/save', 'cash_coupon_card/save', 1, 'agent', 0, '', 33, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (269, '修改现金券领取', 'agent/cash_coupon_card/update', 'cash_coupon_card/update', 1, 'agent', 0, '', 33, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (270, '修改现金券领取字段值', 'agent/cash_coupon_card/change', 'cash_coupon_card/change', 1, 'agent', 0, '', 33, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (271, '删除现金券领取', 'agent/cash_coupon_card/delete', 'cash_coupon_card/delete', 1, 'agent', 0, '', 33, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (272, '优惠券管理员列表', 'agent/coupon_user/index', 'coupon_user/index', 1, 'agent', 1, '', 34, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (273, '获取优惠券管理员详情', 'agent/coupon_user/read', 'coupon_user/read', 1, 'agent', 0, '', 34, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (274, '添加或修改获取优惠券管理员详情', 'agent/coupon_user/edit', 'coupon_user/edit', 1, 'agent', 0, '', 34, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (275, '添加优惠券管理员', 'agent/coupon_user/save', 'coupon_user/save', 1, 'agent', 0, '', 34, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (276, '修改优惠券管理员', 'agent/coupon_user/update', 'coupon_user/update', 1, 'agent', 0, '', 34, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (277, '修改优惠券管理员字段值', 'agent/coupon_user/change', 'coupon_user/change', 1, 'agent', 0, '', 34, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (278, '删除优惠券管理员', 'agent/coupon_user/delete', 'coupon_user/delete', 1, 'agent', 0, '', 34, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (279, 'agent/v1.Device/state', 'agent/device/state', 'device/state', 1, 'agent', 0, '', 35, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (280, '设备列表', 'agent/device/index', 'device/index', 1, 'agent', 1, '', 35, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (281, '获取设备详情', 'agent/device/read', 'device/read', 1, 'agent', 0, '', 35, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (282, '添加或修改获取设备详情', 'agent/device/edit', 'device/edit', 1, 'agent', 0, '', 35, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (283, '添加设备', 'agent/device/save', 'device/save', 1, 'agent', 0, '', 35, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (284, '修改设备', 'agent/device/update', 'device/update', 1, 'agent', 0, '', 35, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (285, '修改设备字段值', 'agent/device/change', 'device/change', 1, 'agent', 0, '', 35, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (286, '删除设备', 'agent/device/delete', 'device/delete', 1, 'agent', 0, '', 35, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (287, '设备报修列表', 'agent/device_repair/index', 'device_repair/index', 1, 'agent', 1, '', 36, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (288, '获取设备报修详情', 'agent/device_repair/read', 'device_repair/read', 1, 'agent', 0, '', 36, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (289, '添加或修改获取设备报修详情', 'agent/device_repair/edit', 'device_repair/edit', 1, 'agent', 0, '', 36, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (290, '添加设备报修', 'agent/device_repair/save', 'device_repair/save', 1, 'agent', 0, '', 36, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (291, '修改设备报修', 'agent/device_repair/update', 'device_repair/update', 1, 'agent', 0, '', 36, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (292, '修改设备报修字段值', 'agent/device_repair/change', 'device_repair/change', 1, 'agent', 0, '', 36, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (293, '删除设备报修', 'agent/device_repair/delete', 'device_repair/delete', 1, 'agent', 0, '', 36, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (294, 'agent/v1.Order/history', 'agent/order/history', 'order/history', 1, 'agent', 0, '', 37, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (295, 'agent/v1.Order/detail', 'agent/order/detail', 'order/detail', 1, 'agent', 0, '', 37, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (296, 'agent/v1.Order/status', 'agent/order/status', 'order/status', 1, 'agent', 0, '', 37, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (297, 'agent/v1.Order/create', 'agent/order/create', 'order/create', 1, 'agent', 0, '', 37, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (298, 'agent/v1.Order/pay', 'agent/order/pay', 'order/pay', 1, 'agent', 0, '', 37, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (299, 'agent/v1.Order/callback', 'agent/order/callback', 'order/callback', 1, 'agent', 0, '', 37, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (300, '订单列表', 'agent/order/index', 'order/index', 1, 'agent', 1, '', 37, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (301, '获取订单详情', 'agent/order/read', 'order/read', 1, 'agent', 0, '', 37, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (302, '添加或修改获取订单详情', 'agent/order/edit', 'order/edit', 1, 'agent', 0, '', 37, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (303, '添加订单', 'agent/order/save', 'order/save', 1, 'agent', 0, '', 37, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (304, '修改订单', 'agent/order/update', 'order/update', 1, 'agent', 0, '', 37, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (305, '修改订单字段值', 'agent/order/change', 'order/change', 1, 'agent', 0, '', 37, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (306, '删除订单', 'agent/order/delete', 'order/delete', 1, 'agent', 0, '', 37, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (307, '套餐列表', 'agent/product/index', 'product/index', 1, 'agent', 1, '', 38, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (308, '获取套餐详情', 'agent/product/read', 'product/read', 1, 'agent', 0, '', 38, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (309, '添加或修改获取套餐详情', 'agent/product/edit', 'product/edit', 1, 'agent', 0, '', 38, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (310, '添加套餐', 'agent/product/save', 'product/save', 1, 'agent', 0, '', 38, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (311, '修改套餐', 'agent/product/update', 'product/update', 1, 'agent', 0, '', 38, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (312, '修改套餐字段值', 'agent/product/change', 'product/change', 1, 'agent', 0, '', 38, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (313, '删除套餐', 'agent/product/delete', 'product/delete', 1, 'agent', 0, '', 38, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (314, '运维员列表', 'agent/repair_user/index', 'repair_user/index', 1, 'agent', 1, '', 39, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (315, '获取运维员详情', 'agent/repair_user/read', 'repair_user/read', 1, 'agent', 0, '', 39, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (316, '添加或修改获取运维员详情', 'agent/repair_user/edit', 'repair_user/edit', 1, 'agent', 0, '', 39, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (317, '添加运维员', 'agent/repair_user/save', 'repair_user/save', 1, 'agent', 0, '', 39, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (318, '修改运维员', 'agent/repair_user/update', 'repair_user/update', 1, 'agent', 0, '', 39, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (319, '修改运维员字段值', 'agent/repair_user/change', 'repair_user/change', 1, 'agent', 0, '', 39, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (320, '删除运维员', 'agent/repair_user/delete', 'repair_user/delete', 1, 'agent', 0, '', 39, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (321, 'agent/v1.ServiceCharge/pay', 'agent/service_charge/pay', 'service_charge/pay', 1, 'agent', 0, '', 40, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (322, '服务费列表', 'agent/service_charge/index', 'service_charge/index', 1, 'agent', 1, '', 40, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (323, '获取服务费详情', 'agent/service_charge/read', 'service_charge/read', 1, 'agent', 0, '', 40, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (324, '用户列表', 'agent/user/index', 'user/index', 1, 'agent', 1, '', 41, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (325, '获取用户详情', 'agent/user/read', 'user/read', 1, 'agent', 0, '', 41, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (326, '添加或修改获取用户详情', 'agent/user/edit', 'user/edit', 1, 'agent', 0, '', 41, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (327, '添加用户', 'agent/user/save', 'user/save', 1, 'agent', 0, '', 41, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (328, '修改用户', 'agent/user/update', 'user/update', 1, 'agent', 0, '', 41, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (329, '修改用户字段值', 'agent/user/change', 'user/change', 1, 'agent', 0, '', 41, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (330, '删除用户', 'agent/user/delete', 'user/delete', 1, 'agent', 0, '', 41, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (331, '游客登录', 'api/login/tourist', 'login/tourist', 1, 'api', 0, '', 42, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (332, '登出', 'api/login/logout', 'login/logout', 1, 'api', 0, '', 42, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (333, 'api/Login/register', 'api/login/register', 'login/register', 1, 'api', 0, '', 42, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (334, '详情', 'api/device/detail', 'device/detail', 1, 'api', 0, '', 43, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (335, '待启动', 'api/device/wait', 'device/wait', 1, 'api', 0, '', 43, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (336, '启动设备', 'api/device/start', 'device/start', 1, 'api', 0, '', 43, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (337, '暂停设备', 'api/device/pause', 'device/pause', 1, 'api', 0, '', 43, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (338, '停止设备', 'api/device/finish', 'device/finish', 1, 'api', 0, '', 43, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (339, '设置设备', 'api/device/setting', 'device/setting', 1, 'api', 0, '', 43, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (340, '获取设备状态', 'api/device/useing', 'device/useing', 1, 'api', 0, '', 43, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (341, '生成订单', 'api/order/create', 'order/create', 1, 'api', 0, '', 44, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (342, '订单详情', 'api/order/detail', 'order/detail', 1, 'api', 0, '', 44, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (343, '订单状态', 'api/order/status', 'order/status', 1, 'api', 0, '', 44, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (344, '支付', 'api/pay/pay', 'pay/pay', 1, 'api', 0, '', 45, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (345, '异步通知', 'api/pay/notify', 'pay/notify', 1, 'api', 0, '', 45, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (346, '同步通知', 'api/pay/callback', 'pay/callback', 1, 'api', 0, '', 45, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (347, '退款', 'api/pay/refund', 'pay/refund', 1, 'api', 0, '', 45, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (348, '详情', 'api/user/detail', 'user/detail', 1, 'api', 0, '', 46, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (349, 'api/v1.Wechat/event', 'api/wechat/event', 'wechat/event', 1, 'api', 0, '', 47, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (350, 'coupon_user/Login/login', 'coupon_user/login/login', 'login/login', 1, 'coupon_user', 0, '', 48, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (351, '登出', 'coupon_user/login/logout', 'login/logout', 1, 'coupon_user', 0, '', 48, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (352, '现金券列表', 'coupon_user/cash_coupon/index', 'cash_coupon/index', 1, 'coupon_user', 1, '', 49, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (353, '获取现金券详情', 'coupon_user/cash_coupon/read', 'cash_coupon/read', 1, 'coupon_user', 0, '', 49, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (354, '添加或修改获取现金券详情', 'coupon_user/cash_coupon/edit', 'cash_coupon/edit', 1, 'coupon_user', 0, '', 49, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (355, '添加现金券', 'coupon_user/cash_coupon/save', 'cash_coupon/save', 1, 'coupon_user', 0, '', 49, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (356, '修改现金券', 'coupon_user/cash_coupon/update', 'cash_coupon/update', 1, 'coupon_user', 0, '', 49, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (357, '修改现金券字段值', 'coupon_user/cash_coupon/change', 'cash_coupon/change', 1, 'coupon_user', 0, '', 49, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (358, '删除现金券', 'coupon_user/cash_coupon/delete', 'cash_coupon/delete', 1, 'coupon_user', 0, '', 49, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (359, '现金券领取列表', 'coupon_user/cash_coupon_card/index', 'cash_coupon_card/index', 1, 'coupon_user', 1, '', 50, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (360, '获取现金券领取详情', 'coupon_user/cash_coupon_card/read', 'cash_coupon_card/read', 1, 'coupon_user', 0, '', 50, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (361, '删除现金券领取', 'coupon_user/cash_coupon_card/delete', 'cash_coupon_card/delete', 1, 'coupon_user', 0, '', 50, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (362, '详情', 'coupon_user/coupon_user/detail', 'coupon_user/detail', 1, 'coupon_user', 0, '', 51, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (363, 'coupon_user/v1.CouponUser/profile', 'coupon_user/coupon_user/profile', 'coupon_user/profile', 1, 'coupon_user', 0, '', 51, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (364, 'repair_user/Login/login', 'repair_user/login/login', 'login/login', 1, 'repair_user', 0, '', 52, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (365, '登出', 'repair_user/login/logout', 'login/logout', 1, 'repair_user', 0, '', 52, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (366, 'repair_user/v1.Device/flow', 'repair_user/device/flow', 'device/flow', 1, 'repair_user', 0, '', 53, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (367, 'repair_user/v1.Device/start', 'repair_user/device/start', 'device/start', 1, 'repair_user', 0, '', 53, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (368, 'repair_user/v1.Device/pause', 'repair_user/device/pause', 'device/pause', 1, 'repair_user', 0, '', 53, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (369, 'repair_user/v1.Device/finish', 'repair_user/device/finish', 'device/finish', 1, 'repair_user', 0, '', 53, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (370, 'repair_user/v1.Device/clear', 'repair_user/device/clear', 'device/clear', 1, 'repair_user', 0, '', 53, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (371, '设备列表', 'repair_user/device/index', 'device/index', 1, 'repair_user', 1, '', 53, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (372, '获取设备详情', 'repair_user/device/read', 'device/read', 1, 'repair_user', 0, '', 53, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (373, '添加或修改获取设备详情', 'repair_user/device/edit', 'device/edit', 1, 'repair_user', 0, '', 53, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (374, '添加设备', 'repair_user/device/save', 'device/save', 1, 'repair_user', 0, '', 53, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (375, '修改设备', 'repair_user/device/update', 'device/update', 1, 'repair_user', 0, '', 53, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (376, '修改设备字段值', 'repair_user/device/change', 'device/change', 1, 'repair_user', 0, '', 53, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (377, 'repair_user/v1.DeviceControlTest/clear', 'repair_user/device_control_test/clear', 'device_control_test/clear', 1, 'repair_user', 0, '', 54, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (378, 'repair_user/v1.DeviceControlTest/flow', 'repair_user/device_control_test/flow', 'device_control_test/flow', 1, 'repair_user', 0, '', 54, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (379, 'repair_user/v1.DeviceControlTest/temperature', 'repair_user/device_control_test/temperature', 'device_control_test/temperature', 1, 'repair_user', 0, '', 54, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (380, 'repair_user/v1.DeviceControlTest/pulse', 'repair_user/device_control_test/pulse', 'device_control_test/pulse', 1, 'repair_user', 0, '', 54, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (381, 'repair_user/v1.DeviceControlTest/start', 'repair_user/device_control_test/start', 'device_control_test/start', 1, 'repair_user', 0, '', 54, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (382, 'repair_user/v1.DeviceControlTest/pause', 'repair_user/device_control_test/pause', 'device_control_test/pause', 1, 'repair_user', 0, '', 54, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (383, 'repair_user/v1.DeviceControlTest/finish', 'repair_user/device_control_test/finish', 'device_control_test/finish', 1, 'repair_user', 0, '', 54, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (384, 'repair_user/v1.DeviceControlTest/qrcode', 'repair_user/device_control_test/qrcode', 'device_control_test/qrcode', 1, 'repair_user', 0, '', 54, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (385, 'repair_user/v1.DeviceControlTest/deviceNo', 'repair_user/device_control_test/device_no', 'device_control_test/device_no', 1, 'repair_user', 0, '', 54, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (386, 'repair_user/v1.DeviceControlTest/advertsLight', 'repair_user/device_control_test/adverts_light', 'device_control_test/adverts_light', 1, 'repair_user', 0, '', 54, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (387, '设备报修列表', 'repair_user/device_repair/index', 'device_repair/index', 1, 'repair_user', 1, '', 55, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (388, '获取设备报修详情', 'repair_user/device_repair/read', 'device_repair/read', 1, 'repair_user', 0, '', 55, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (389, '添加或修改获取设备报修详情', 'repair_user/device_repair/edit', 'device_repair/edit', 1, 'repair_user', 0, '', 55, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (390, '添加设备报修', 'repair_user/device_repair/save', 'device_repair/save', 1, 'repair_user', 0, '', 55, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (391, '修改设备报修', 'repair_user/device_repair/update', 'device_repair/update', 1, 'repair_user', 0, '', 55, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (392, '修改设备报修字段值', 'repair_user/device_repair/change', 'device_repair/change', 1, 'repair_user', 0, '', 55, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (393, 'repair_user/v1.RepairUser/detail', 'repair_user/repair_user/detail', 'repair_user/detail', 1, 'repair_user', 0, '', 56, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (394, 'repair_user/v1.RepairUser/profile', 'repair_user/repair_user/profile', 'repair_user/profile', 1, 'repair_user', 0, '', 56, 0, '', 1657245105, 1657245105, 0);
INSERT INTO `water_system_auth` VALUES (395, '测hi是~！', 'test/aaa', '', 1, 'api', 0, '', 27, 0, '111', 1657250690, 1657250690, 0);

-- ----------------------------
-- Table structure for water_system_city
-- ----------------------------
DROP TABLE IF EXISTS `water_system_city`;
CREATE TABLE `water_system_city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL DEFAULT 0 COMMENT '城市id',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '省市级别',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父级id',
  `area_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '区号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `merger_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '合并名称',
  `lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '经度',
  `lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '纬度',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否展示',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3975 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '城市表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_system_city
-- ----------------------------
INSERT INTO `water_system_city` VALUES (1, 1, 0, 0, '110000000000', '北京市', '北京', '116.407526', '39.904030', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2, 7362, 0, 0, '120000000000', '天津市', '天津', '117.200983', '39.084158', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3, 13267, 0, 0, '130000000000', '河北省', '河北', '114.468664', '38.037057', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (4, 67747, 0, 0, '140000000000', '山西省', '山西', '112.562398', '37.873531', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (5, 99537, 0, 0, '150000000000', '内蒙古自治区', '内蒙古', '111.765617', '40.817498', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (6, 115224, 0, 0, '210000000000', '辽宁省', '辽宁', '123.429440', '41.835441', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (7, 133208, 0, 0, '220000000000', '吉林省', '吉林', '125.325990', '43.896536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (8, 145665, 0, 0, '230000000000', '黑龙江省', '黑龙江', '126.661669', '45.742347', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (9, 161792, 0, 0, '310000000000', '上海市', '上海', '121.473701', '31.230416', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (10, 167904, 0, 0, '320000000000', '江苏省', '江苏', '118.763232', '32.061707', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (11, 191019, 0, 0, '330000000000', '浙江省', '浙江', '120.152791', '30.267446', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (12, 224649, 0, 0, '340000000000', '安徽省', '安徽', '117.284922', '31.861184', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (13, 244377, 0, 0, '350000000000', '福建省', '福建', '119.295144', '26.100779', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (14, 262698, 0, 0, '360000000000', '江西省', '江西', '115.909228', '28.675696', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (15, 285860, 0, 0, '370000000000', '山东省', '山东', '117.020359', '36.668530', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (16, 367395, 0, 0, '410000000000', '河南省', '河南', '113.753602', '34.765515', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (17, 420824, 0, 0, '420000000000', '湖北省', '湖北', '114.341861', '30.546498', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (18, 452123, 0, 0, '430000000000', '湖南省', '湖南', '112.983810', '28.112444', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (19, 483250, 0, 0, '440000000000', '广东省', '广东', '113.266530', '23.132191', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (20, 511462, 0, 0, '450000000000', '广西壮族自治区', '广西', '108.327546', '22.815478', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (21, 529344, 0, 0, '460000000000', '海南省', '海南', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (22, 533328, 0, 0, '500000000000', '重庆市', '重庆', '106.551556', '29.563009', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (23, 545532, 0, 0, '510000000000', '四川省', '四川', '104.075931', '30.651651', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (24, 604131, 0, 0, '520000000000', '贵州省', '贵州', '106.707410', '26.598194', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (25, 624372, 0, 0, '530000000000', '云南省', '云南', '102.710002', '25.045806', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (26, 640332, 0, 0, '540000000000', '西藏自治区', '西藏', '91.117212', '29.646922', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (27, 646578, 0, 0, '610000000000', '陕西省', '陕西', '108.954239', '34.265472', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (28, 671119, 0, 0, '620000000000', '甘肃省', '甘肃', '103.826308', '36.059421', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (29, 690094, 0, 0, '630000000000', '青海省', '青海', '101.780199', '36.620901', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (30, 695259, 0, 0, '640000000000', '宁夏回族自治区', '宁夏', '106.258754', '38.471317', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (31, 698440, 0, 0, '650000000000', '新疆维吾尔自治区', '新疆', '87.627704', '43.793026', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (32, 714368, 0, 0, '0', '香港特别行政区', '香港', '114.173355', '22.320048', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (33, 714390, 0, 0, '0', '澳门特别行政区', '澳门', '113.549090', '22.198951', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (34, 714401, 0, 0, '0', '台湾', '台湾', '121.509062', '25.044332', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (35, 2, 1, 1, '110100000000', '北京市', '北京', '116.407526', '39.904030', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (36, 7363, 1, 7362, '120100000000', '天津市', '天津', '117.200983', '39.084158', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (37, 13268, 1, 13267, '130100000000', '石家庄市', '河北,石家庄', '114.514859', '38.042306', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (38, 18128, 1, 13267, '130200000000', '唐山市', '河北,唐山', '118.180193', '39.630867', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (39, 24371, 1, 13267, '130300000000', '秦皇岛市', '河北,秦皇岛', '119.600492', '39.935385', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (40, 26779, 1, 13267, '130400000000', '邯郸市', '河北,邯郸', '114.538961', '36.625657', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (41, 32688, 1, 13267, '130500000000', '邢台市', '河北,邢台', '114.504844', '37.070589', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (42, 38160, 1, 13267, '130600000000', '保定市', '河北,保定', '115.464806', '38.873891', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (43, 44570, 1, 13267, '130700000000', '张家口市', '河北,张家口', '114.887543', '40.824418', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (44, 49190, 1, 13267, '130800000000', '承德市', '河北,承德', '117.962410', '40.954071', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (45, 52018, 1, 13267, '130900000000', '沧州市', '河北,沧州', '116.838834', '38.304477', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (46, 58247, 1, 13267, '131000000000', '廊坊市', '河北,廊坊', '116.683752', '39.538047', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (47, 61804, 1, 13267, '131100000000', '衡水市', '河北,衡水', '115.670177', '37.738920', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (48, 66813, 1, 13267, '139000000000', '直辖县', '河北', '114.468664', '38.037057', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (49, 67748, 1, 67747, '140100000000', '太原市', '山西,太原', '112.548879', '37.870590', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (50, 69390, 1, 67747, '140200000000', '大同市', '山西,大同', '113.612440', '40.040295', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (51, 71850, 1, 67747, '140300000000', '阳泉市', '山西,阳泉', '113.580519', '37.856971', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (52, 72975, 1, 67747, '140400000000', '长治市', '山西,长治', '113.116255', '36.195386', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (53, 76726, 1, 67747, '140500000000', '晋城市', '山西,晋城', '112.851831', '35.490701', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (54, 79163, 1, 67747, '140600000000', '朔州市', '山西,朔州', '112.432825', '39.331595', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (55, 81000, 1, 67747, '140700000000', '晋中市', '山西,晋中', '112.752694', '37.687024', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (56, 84092, 1, 67747, '140800000000', '运城市', '山西,运城', '111.007528', '35.026412', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (57, 87613, 1, 67747, '140900000000', '忻州市', '山西,忻州', '112.734174', '38.416663', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (58, 92738, 1, 67747, '141000000000', '临汾市', '山西,临汾', '111.518976', '36.088005', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (59, 96064, 1, 67747, '141100000000', '吕梁市', '山西,吕梁', '111.144319', '37.518314', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (60, 99538, 1, 99537, '150100000000', '呼和浩特市', '内蒙古,呼和浩特', '111.749180', '40.842585', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (61, 100904, 1, 99537, '150200000000', '包头市', '内蒙古,包头', '109.840347', '40.657449', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (62, 101772, 1, 99537, '150300000000', '乌海市', '内蒙古,乌海', '106.794249', '39.655388', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (63, 101884, 1, 99537, '150400000000', '赤峰市', '内蒙古,赤峰', '118.886856', '42.257817', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (64, 104457, 1, 99537, '150500000000', '通辽市', '内蒙古,通辽', '122.243444', '43.652890', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (65, 107065, 1, 99537, '150600000000', '鄂尔多斯市', '内蒙古,鄂尔多斯', '109.781327', '39.608266', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (66, 108166, 1, 99537, '150700000000', '呼伦贝尔市', '内蒙古,呼伦贝尔', '119.765744', '49.211574', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (67, 109847, 1, 99537, '150800000000', '巴彦淖尔市', '内蒙古,巴彦淖尔', '107.387657', '40.743213', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (68, 110889, 1, 99537, '150900000000', '乌兰察布市', '内蒙古,乌兰察布', '113.132585', '40.994785', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (69, 112552, 1, 99537, '152200000000', '兴安盟', '内蒙古,兴安', '122.067042', '46.077561', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (70, 113777, 1, 99537, '152500000000', '锡林郭勒盟', '内蒙古,锡林郭勒', '116.048222', '43.933454', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (71, 114940, 1, 99537, '152900000000', '阿拉善盟', '内蒙古,阿拉善', '105.728969', '38.851892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (72, 115225, 1, 115224, '210100000000', '沈阳市', '辽宁,沈阳', '123.431474', '41.805698', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (73, 117932, 1, 115224, '210200000000', '大连市', '辽宁,大连', '121.614682', '38.914003', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (74, 119789, 1, 115224, '210300000000', '鞍山市', '辽宁,鞍山', '122.994329', '41.108647', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (75, 121081, 1, 115224, '210400000000', '抚顺市', '辽宁,抚顺', '123.957208', '41.880872', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (76, 122142, 1, 115224, '210500000000', '本溪市', '辽宁,本溪', '123.766485', '41.294175', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (77, 122730, 1, 115224, '210600000000', '丹东市', '辽宁,丹东', '124.354706', '40.000499', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (78, 123698, 1, 115224, '210700000000', '锦州市', '辽宁,锦州', '121.127003', '41.095119', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (79, 125249, 1, 115224, '210800000000', '营口市', '辽宁,营口', '122.235417', '40.667012', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (80, 126156, 1, 115224, '210900000000', '阜新市', '辽宁,阜新', '121.670323', '42.021619', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (81, 127070, 1, 115224, '211000000000', '辽阳市', '辽宁,辽阳', '123.236944', '41.267244', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (82, 127834, 1, 115224, '211100000000', '盘锦市', '辽宁,盘锦', '122.070714', '41.119997', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (83, 128421, 1, 115224, '211200000000', '铁岭市', '辽宁,铁岭', '123.726166', '42.223769', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (84, 129977, 1, 115224, '211300000000', '朝阳市', '辽宁,朝阳', '120.389862', '41.497767', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (85, 131738, 1, 115224, '211400000000', '葫芦岛市', '辽宁,葫芦岛', '120.836932', '40.711052', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (86, 133209, 1, 133208, '220100000000', '长春市', '吉林,长春', '125.323544', '43.817071', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (87, 135392, 1, 133208, '220200000000', '吉林市', '吉林,吉林', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (88, 137206, 1, 133208, '220300000000', '四平市', '吉林,四平', '124.350398', '43.166419', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (89, 138721, 1, 133208, '220400000000', '辽源市', '吉林,辽源', '125.143532', '42.887918', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (90, 139340, 1, 133208, '220500000000', '通化市', '吉林,通化', '125.939697', '41.728401', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (91, 140601, 1, 133208, '220600000000', '白山市', '吉林,白山', '126.423587', '41.939994', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (92, 141361, 1, 133208, '220700000000', '松原市', '吉林,松原', '124.825117', '45.141789', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (93, 142786, 1, 133208, '220800000000', '白城市', '吉林,白城', '122.839024', '45.619641', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (94, 143990, 1, 133208, '222400000000', '延边朝鲜族自治州', '吉林,延边', '129.508946', '42.891253', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (95, 145666, 1, 145665, '230100000000', '哈尔滨市', '黑龙江,哈尔滨', '126.534967', '45.803775', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (96, 149079, 1, 145665, '230200000000', '齐齐哈尔市', '黑龙江,齐齐哈尔', '123.918186', '47.354348', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (97, 150915, 1, 145665, '230300000000', '鸡西市', '黑龙江,鸡西', '130.969333', '45.295075', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (98, 151830, 1, 145665, '230400000000', '鹤岗市', '黑龙江,鹤岗', '130.297964', '47.349916', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (99, 152413, 1, 145665, '230500000000', '双鸭山市', '黑龙江,双鸭山', '131.159133', '46.646508', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (100, 153313, 1, 145665, '230600000000', '大庆市', '黑龙江,大庆', '125.103784', '46.589309', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (101, 154201, 1, 145665, '230700000000', '伊春市', '黑龙江,伊春', '128.841147', '47.727536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (102, 155076, 1, 145665, '230800000000', '佳木斯市', '黑龙江,佳木斯', '130.318917', '46.799922', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (103, 156713, 1, 145665, '230900000000', '七台河市', '黑龙江,七台河', '131.003138', '45.771726', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (104, 157130, 1, 145665, '231000000000', '牡丹江市', '黑龙江,牡丹江', '129.633168', '44.551653', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (105, 158623, 1, 145665, '231100000000', '黑河市', '黑龙江,黑河', '127.528560', '50.245329', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (106, 159769, 1, 145665, '231200000000', '绥化市', '黑龙江,绥化', '126.968887', '46.653845', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (107, 161651, 1, 145665, '232700000000', '大兴安岭地区', '黑龙江,大兴安岭', '124.711080', '52.335206', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (108, 161793, 1, 161792, '310100000000', '上海市', '上海', '121.473701', '31.230416', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (109, 167905, 1, 167904, '320100000000', '南京市', '江苏,南京', '118.796877', '32.060255', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (110, 169375, 1, 167904, '320200000000', '无锡市', '江苏,无锡', '120.311910', '31.491169', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (111, 170724, 1, 167904, '320300000000', '徐州市', '江苏,徐州', '117.284124', '34.205768', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (112, 173635, 1, 167904, '320400000000', '常州市', '江苏,常州', '119.973987', '31.810689', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (113, 174764, 1, 167904, '320500000000', '苏州市', '江苏,苏州', '120.585315', '31.298886', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (114, 176920, 1, 167904, '320600000000', '南通市', '江苏,南通', '120.894291', '31.980171', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (115, 178999, 1, 167904, '320700000000', '连云港市', '江苏,连云港', '119.221611', '34.596653', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (116, 180743, 1, 167904, '320800000000', '淮安市', '江苏,淮安', '119.015285', '33.610353', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (117, 182538, 1, 167904, '320900000000', '盐城市', '江苏,盐城', '120.163561', '33.347382', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (118, 185201, 1, 167904, '321000000000', '扬州市', '江苏,扬州', '119.412966', '32.394210', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (119, 186657, 1, 167904, '321100000000', '镇江市', '江苏,镇江', '119.425836', '32.187849', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (120, 187441, 1, 167904, '321200000000', '泰州市', '江苏,泰州', '119.923116', '32.455778', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (121, 189402, 1, 167904, '321300000000', '宿迁市', '江苏,宿迁', '118.275198', '33.963232', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (122, 191020, 1, 191019, '330100000000', '杭州市', '浙江,杭州', '120.155070', '30.274084', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (123, 194395, 1, 191019, '330200000000', '宁波市', '浙江,宁波', '121.550357', '29.874556', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (124, 197850, 1, 191019, '330300000000', '温州市', '浙江,温州', '120.699366', '27.994267', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (125, 203852, 1, 191019, '330400000000', '嘉兴市', '浙江,嘉兴', '120.755486', '30.746129', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (126, 205101, 1, 191019, '330500000000', '湖州市', '浙江,湖州', '120.086823', '30.894348', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (127, 206438, 1, 191019, '330600000000', '绍兴市', '浙江,绍兴', '120.580232', '30.029752', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (128, 209250, 1, 191019, '330700000000', '金华市', '浙江,金华', '119.647444', '29.079059', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (129, 214260, 1, 191019, '330800000000', '衢州市', '浙江,衢州', '118.859457', '28.970079', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (130, 215955, 1, 191019, '330900000000', '舟山市', '浙江,舟山', '122.207215', '29.985295', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (131, 216449, 1, 191019, '331000000000', '台州市', '浙江,台州', '121.420757', '28.656386', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (132, 221610, 1, 191019, '331100000000', '丽水市', '浙江,丽水', '119.922796', '28.467630', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (133, 224650, 1, 224649, '340100000000', '合肥市', '安徽,合肥', '117.227239', '31.820586', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (134, 226469, 1, 224649, '340200000000', '芜湖市', '安徽,芜湖', '118.432941', '31.352859', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (135, 227482, 1, 224649, '340300000000', '蚌埠市', '安徽,蚌埠', '117.389719', '32.916287', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (136, 228630, 1, 224649, '340400000000', '淮南市', '安徽,淮南', '116.999932', '32.625478', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (137, 229844, 1, 224649, '340500000000', '马鞍山市', '安徽,马鞍山', '118.506759', '31.670452', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (138, 230476, 1, 224649, '340600000000', '淮北市', '安徽,淮北', '116.798265', '33.955844', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (139, 230981, 1, 224649, '340700000000', '铜陵市', '安徽,铜陵', '117.812079', '30.945429', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (140, 231499, 1, 224649, '340800000000', '安庆市', '安徽,安庆', '117.063754', '30.543494', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (141, 233236, 1, 224649, '341000000000', '黄山市', '安徽,黄山', '118.337481', '29.714655', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (142, 234109, 1, 224649, '341100000000', '滁州市', '安徽,滁州', '118.317106', '32.301556', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (143, 235483, 1, 224649, '341200000000', '阜阳市', '安徽,阜阳', '115.814204', '32.890124', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (144, 237607, 1, 224649, '341300000000', '宿州市', '安徽,宿州', '116.964356', '33.646373', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (145, 239084, 1, 224649, '341500000000', '六安市', '安徽,六安', '116.521854', '31.733699', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (146, 241180, 1, 224649, '341600000000', '亳州市', '安徽,亳州', '115.778676', '33.844582', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (147, 242634, 1, 224649, '341700000000', '池州市', '安徽,池州', '117.491568', '30.664800', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (148, 243399, 1, 224649, '341800000000', '宣城市', '安徽,宣城', '118.758816', '30.940718', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (149, 244378, 1, 244377, '350100000000', '福州市', '福建,福州', '119.296494', '26.074507', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (150, 247478, 1, 244377, '350200000000', '厦门市', '福建,厦门', '118.089425', '24.479833', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (151, 248059, 1, 244377, '350300000000', '莆田市', '福建,莆田', '119.007777', '25.454084', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (152, 249098, 1, 244377, '350400000000', '三明市', '福建,三明', '117.638678', '26.263406', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (153, 251197, 1, 244377, '350500000000', '泉州市', '福建,泉州', '118.675675', '24.874132', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (154, 253905, 1, 244377, '350600000000', '漳州市', '福建,漳州', '117.647481', '24.512948', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (155, 256112, 1, 244377, '350700000000', '南平市', '福建,南平', '118.177708', '26.641768', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (156, 258160, 1, 244377, '350800000000', '龙岩市', '福建,龙岩', '117.017536', '25.075123', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (157, 260230, 1, 244377, '350900000000', '宁德市', '福建,宁德', '119.547932', '26.665617', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (158, 262699, 1, 262698, '360100000000', '南昌市', '江西,南昌', '115.858197', '28.682892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (159, 264862, 1, 262698, '360200000000', '景德镇市', '江西,景德镇', '117.178419', '29.268835', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (160, 265677, 1, 262698, '360300000000', '萍乡市', '江西,萍乡', '113.854556', '27.622768', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (161, 266521, 1, 262698, '360400000000', '九江市', '江西,九江', '116.001930', '29.705077', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (162, 269107, 1, 262698, '360500000000', '新余市', '江西,新余', '114.917346', '27.817808', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (163, 269654, 1, 262698, '360600000000', '鹰潭市', '江西,鹰潭', '117.069202', '28.260189', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (164, 270222, 1, 262698, '360700000000', '赣州市', '江西,赣州', '114.935029', '25.831829', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (165, 274444, 1, 262698, '360800000000', '吉安市', '江西,吉安', '114.992509', '27.113443', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (166, 277615, 1, 262698, '360900000000', '宜春市', '江西,宜春', '114.416778', '27.815619', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (167, 280562, 1, 262698, '361000000000', '抚州市', '江西,抚州', '116.358181', '27.949217', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (168, 282841, 1, 262698, '361100000000', '上饶市', '江西,上饶', '117.943433', '28.454862', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (169, 285861, 1, 285860, '370100000000', '济南市', '山东,济南', '117.119999', '36.651216', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (170, 291235, 1, 285860, '370200000000', '青岛市', '山东,青岛', '120.382639', '36.067082', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (171, 298025, 1, 285860, '370300000000', '淄博市', '山东,淄博', '118.054927', '36.813487', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (172, 301711, 1, 285860, '370400000000', '枣庄市', '山东,枣庄', '117.323725', '34.810487', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (173, 304309, 1, 285860, '370500000000', '东营市', '山东,东营', '118.674767', '37.434751', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (174, 306339, 1, 285860, '370600000000', '烟台市', '山东,烟台', '121.447935', '37.463822', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (175, 313063, 1, 285860, '370700000000', '潍坊市', '山东,潍坊', '119.161755', '36.706774', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (176, 320179, 1, 285860, '370800000000', '济宁市', '山东,济宁', '116.587098', '35.414921', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (177, 326706, 1, 285860, '370900000000', '泰安市', '山东,泰安', '117.087614', '36.200252', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (178, 330547, 1, 285860, '371000000000', '威海市', '山东,威海', '122.120419', '37.513068', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (179, 333140, 1, 285860, '371100000000', '日照市', '山东,日照', '119.526888', '35.416377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (180, 336050, 1, 285860, '371200000000', '莱芜市', '山东,莱芜', '117.676723', '36.213813', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (181, 337144, 1, 285860, '371300000000', '临沂市', '山东,临沂', '118.356448', '35.104672', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (182, 344133, 1, 285860, '371400000000', '德州市', '山东,德州', '116.357464', '37.434092', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (183, 349382, 1, 285860, '371500000000', '聊城市', '山东,聊城', '115.985371', '36.456703', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (184, 355972, 1, 285860, '371600000000', '滨州市', '山东,滨州', '117.970703', '37.381990', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (185, 361375, 1, 285860, '371700000000', '菏泽市', '山东,菏泽', '115.480656', '35.233750', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (186, 367396, 1, 367395, '410100000000', '郑州市', '河南,郑州', '113.625368', '34.746599', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (187, 370304, 1, 367395, '410200000000', '开封市', '河南,开封', '114.307581', '34.797239', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (188, 372971, 1, 367395, '410300000000', '洛阳市', '河南,洛阳', '112.454040', '34.619682', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (189, 376365, 1, 367395, '410400000000', '平顶山市', '河南,平顶山', '113.192661', '33.766169', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (190, 379245, 1, 367395, '410500000000', '安阳市', '河南,安阳', '114.392392', '36.097577', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (191, 382878, 1, 367395, '410600000000', '鹤壁市', '河南,鹤壁', '114.297272', '35.747225', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (192, 383890, 1, 367395, '410700000000', '新乡市', '河南,新乡', '113.926800', '35.303004', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (193, 387707, 1, 367395, '410800000000', '焦作市', '河南,焦作', '113.241823', '35.215892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (194, 389719, 1, 367395, '410900000000', '濮阳市', '河南,濮阳', '115.029215', '35.761829', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (195, 392737, 1, 367395, '411000000000', '许昌市', '河南,许昌', '113.852640', '34.035506', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (196, 395254, 1, 367395, '411100000000', '漯河市', '河南,漯河', '114.016539', '33.581412', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (197, 396611, 1, 367395, '411200000000', '三门峡市', '河南,三门峡', '111.200135', '34.772493', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (198, 398169, 1, 367395, '411300000000', '南阳市', '河南,南阳', '112.528321', '32.990833', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (199, 403311, 1, 367395, '411400000000', '商丘市', '河南,商丘', '115.656370', '34.414172', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (200, 408287, 1, 367395, '411500000000', '信阳市', '河南,信阳', '114.091023', '32.146983', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (201, 411925, 1, 367395, '411600000000', '周口市', '河南,周口', '114.696951', '33.626149', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (202, 417174, 1, 367395, '411700000000', '驻马店市', '河南,驻马店', '114.022298', '33.011529', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (203, 420258, 1, 367395, '419000000000', '直辖县', '河南', '113.753602', '34.765515', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (204, 420825, 1, 420824, '420100000000', '武汉市', '湖北,武汉', '114.305392', '30.593098', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (205, 424449, 1, 420824, '420200000000', '黄石市', '湖北,黄石', '115.038520', '30.199652', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (206, 425508, 1, 420824, '420300000000', '十堰市', '湖北,十堰', '110.797990', '32.629397', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (207, 427710, 1, 420824, '420500000000', '宜昌市', '湖北,宜昌', '111.286471', '30.691967', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (208, 429501, 1, 420824, '420600000000', '襄阳市', '湖北,襄阳', '112.122414', '32.008986', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (209, 432415, 1, 420824, '420700000000', '鄂州市', '湖北,鄂州', '114.894843', '30.391940', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (210, 432829, 1, 420824, '420800000000', '荆门市', '湖北,荆门', '112.199265', '31.035423', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (211, 434548, 1, 420824, '420900000000', '孝感市', '湖北,孝感', '113.916902', '30.924568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (212, 437779, 1, 420824, '421000000000', '荆州市', '湖北,荆州', '112.239741', '30.335165', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (213, 440639, 1, 420824, '421100000000', '黄冈市', '湖北,黄冈', '114.872316', '30.453905', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (214, 445040, 1, 420824, '421200000000', '咸宁市', '湖北,咸宁', '114.322492', '29.841443', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (215, 446212, 1, 420824, '421300000000', '随州市', '湖北,随州', '113.382458', '31.690215', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (216, 447268, 1, 420824, '422800000000', '恩施土家族苗族自治州', '湖北,恩施', '109.488172', '30.272156', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (217, 449865, 1, 420824, '429000000000', '直辖县', '湖北', '114.341861', '30.546498', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (218, 452124, 1, 452123, '430100000000', '长沙市', '湖南,长沙', '112.938814', '28.228209', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (219, 453799, 1, 452123, '430200000000', '株洲市', '湖南,株洲', '113.134002', '27.827550', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (220, 455283, 1, 452123, '430300000000', '湘潭市', '湖南,湘潭', '112.944049', '27.829738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (221, 456303, 1, 452123, '430400000000', '衡阳市', '湖南,衡阳', '112.571997', '26.893230', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (222, 459251, 1, 452123, '430500000000', '邵阳市', '湖南,邵阳', '111.467791', '27.238892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (223, 463141, 1, 452123, '430600000000', '岳阳市', '湖南,岳阳', '113.128958', '29.357104', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (224, 465105, 1, 452123, '430700000000', '常德市', '湖南,常德', '111.698497', '29.031673', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (225, 467562, 1, 452123, '430800000000', '张家界市', '湖南,张家界', '110.479191', '29.117096', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (226, 468660, 1, 452123, '430900000000', '益阳市', '湖南,益阳', '112.355180', '28.553860', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (227, 470123, 1, 452123, '431000000000', '郴州市', '湖南,郴州', '113.014717', '25.770509', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (228, 472709, 1, 452123, '431100000000', '永州市', '湖南,永州', '111.613445', '26.420394', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (229, 476148, 1, 452123, '431200000000', '怀化市', '湖南,怀化', '109.998488', '27.554978', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (230, 479103, 1, 452123, '431300000000', '娄底市', '湖南,娄底', '111.993497', '27.700062', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (231, 481319, 1, 452123, '433100000000', '湘西土家族苗族自治州', '湖南,湘西', '109.739172', '28.311947', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (232, 483251, 1, 483250, '440100000000', '广州市', '广东,广州', '113.264434', '23.129162', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (233, 486129, 1, 483250, '440200000000', '韶关市', '广东,韶关', '113.597522', '24.810403', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (234, 487721, 1, 483250, '440300000000', '深圳市', '广东,深圳', '114.057868', '22.543099', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (235, 488589, 1, 483250, '440400000000', '珠海市', '广东,珠海', '113.576726', '22.270715', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (236, 488954, 1, 483250, '440500000000', '汕头市', '广东,汕头', '116.681972', '23.354091', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (237, 490106, 1, 483250, '440600000000', '佛山市', '广东,佛山', '113.121416', '23.021548', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (238, 490919, 1, 483250, '440700000000', '江门市', '广东,江门', '113.081901', '22.578738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (239, 492341, 1, 483250, '440800000000', '湛江市', '广东,湛江', '110.359377', '21.270707', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (240, 494394, 1, 483250, '440900000000', '茂名市', '广东,茂名', '110.925456', '21.662999', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (241, 496438, 1, 483250, '441200000000', '肇庆市', '广东,肇庆', '112.465091', '23.047191', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (242, 498104, 1, 483250, '441300000000', '惠州市', '广东,惠州', '114.416196', '23.111847', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (243, 499489, 1, 483250, '441400000000', '梅州市', '广东,梅州', '116.122238', '24.288615', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (244, 501867, 1, 483250, '441500000000', '汕尾市', '广东,汕尾', '115.375278', '22.786211', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (245, 502828, 1, 483250, '441600000000', '河源市', '广东,河源', '114.700447', '23.743538', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (246, 504366, 1, 483250, '441700000000', '阳江市', '广东,阳江', '111.982232', '21.857958', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (247, 505298, 1, 483250, '441800000000', '清远市', '广东,清远', '113.056031', '23.681763', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (248, 506616, 1, 483250, '441900000000', '东莞市', '广东,东莞', '113.751765', '23.020536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (249, 507255, 1, 483250, '442000000000', '中山市', '广东,中山', '113.392782', '22.517645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (250, 507557, 1, 483250, '445100000000', '潮州市', '广东,潮州', '116.622603', '23.656950', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (251, 508648, 1, 483250, '445200000000', '揭阳市', '广东,揭阳', '116.372831', '23.549993', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (252, 510408, 1, 483250, '445300000000', '云浮市', '广东,云浮', '112.044491', '22.915094', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (253, 511463, 1, 511462, '450100000000', '南宁市', '广西,南宁', '108.366543', '22.817002', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (254, 513434, 1, 511462, '450200000000', '柳州市', '广西,柳州', '109.415953', '24.325502', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (255, 514790, 1, 511462, '450300000000', '桂林市', '广西,桂林', '110.290194', '25.273566', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (256, 516858, 1, 511462, '450400000000', '梧州市', '广西,梧州', '111.279115', '23.476962', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (257, 517933, 1, 511462, '450500000000', '北海市', '广西,北海', '109.119927', '21.481254', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (258, 518407, 1, 511462, '450600000000', '防城港市', '广西,防城港', '108.353846', '21.686860', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (259, 518808, 1, 511462, '450700000000', '钦州市', '广西,钦州', '108.654146', '21.979933', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (260, 519929, 1, 511462, '450800000000', '贵港市', '广西,贵港', '109.598926', '23.111530', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (261, 521166, 1, 511462, '450900000000', '玉林市', '广西,玉林', '110.164756', '22.636379', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (262, 522786, 1, 511462, '451000000000', '百色市', '广西,百色', '106.618201', '23.902333', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (263, 524814, 1, 511462, '451100000000', '贺州市', '广西,贺州', '111.566694', '24.403582', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (264, 525638, 1, 511462, '451200000000', '河池市', '广西,河池', '108.085261', '24.692931', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (265, 527443, 1, 511462, '451300000000', '来宾市', '广西,来宾', '109.221465', '23.750306', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (266, 528339, 1, 511462, '451400000000', '崇左市', '广西,崇左', '107.364711', '22.376532', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (267, 529345, 1, 529344, '460100000000', '海口市', '海南,海口', '110.198293', '20.044001', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (268, 529878, 1, 529344, '460200000000', '三亚市', '海南,三亚', '109.511909', '18.252847', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (269, 530060, 1, 529344, '460300000000', '三沙市', '海南,三沙', '112.338695', '16.831839', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (270, 530070, 1, 529344, '460400000000', '儋州市', '海南,儋州', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (271, 530468, 1, 529344, '469000000000', '省直辖县级行政区域', '海南', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (272, 533329, 1, 533328, '500100000000', '重庆市', '重庆', '106.551556', '29.563009', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (273, 540700, 1, 533328, '500200000000', '县', '重庆', '106.551556', '29.563009', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (274, 545533, 1, 545532, '510100000000', '成都市', '四川,成都', '104.066541', '30.572269', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (275, 550275, 1, 545532, '510300000000', '自贡市', '四川,自贡', '104.778442', '29.339030', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (276, 551809, 1, 545532, '510400000000', '攀枝花市', '四川,攀枝花', '101.718637', '26.582347', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (277, 552358, 1, 545532, '510500000000', '泸州市', '四川,泸州', '105.442258', '28.871810', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (278, 554142, 1, 545532, '510600000000', '德阳市', '四川,德阳', '104.397894', '31.126855', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (279, 556077, 1, 545532, '510700000000', '绵阳市', '四川,绵阳', '104.679114', '31.467450', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (280, 560191, 1, 545532, '510800000000', '广元市', '四川,广元', '105.843357', '32.435435', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (281, 563242, 1, 545532, '510900000000', '遂宁市', '四川,遂宁', '105.592898', '30.532847', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (282, 565735, 1, 545532, '511000000000', '内江市', '四川,内江', '105.058433', '29.580228', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (283, 568202, 1, 545532, '511100000000', '乐山市', '四川,乐山', '103.765568', '29.552106', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (284, 570733, 1, 545532, '511300000000', '南充市', '四川,南充', '106.110698', '30.837793', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (285, 576992, 1, 545532, '511400000000', '眉山市', '四川,眉山', '103.848538', '30.075439', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (286, 578485, 1, 545532, '511500000000', '宜宾市', '四川,宜宾', '104.643215', '28.751768', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (287, 581870, 1, 545532, '511600000000', '广安市', '四川,广安', '106.633212', '30.455961', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (288, 585049, 1, 545532, '511700000000', '达州市', '四川,达州', '107.468023', '31.209571', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (289, 588538, 1, 545532, '511800000000', '雅安市', '四川,雅安', '103.013261', '29.980537', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (290, 589779, 1, 545532, '511900000000', '巴中市', '四川,巴中', '106.747477', '31.867903', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (291, 592598, 1, 545532, '512000000000', '资阳市', '四川,资阳', '104.627636', '30.128901', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (292, 594864, 1, 545532, '513200000000', '阿坝藏族羌族自治州', '四川,阿坝', '102.224653', '31.899413', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (293, 596525, 1, 545532, '513300000000', '甘孜藏族自治州', '四川,甘孜', '101.962310', '30.049520', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (294, 599659, 1, 545532, '513400000000', '凉山彝族自治州', '四川,凉山', '102.267335', '27.881610', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (295, 604132, 1, 604131, '520100000000', '贵阳市', '贵州,贵阳', '106.630153', '26.647661', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (296, 605834, 1, 604131, '520200000000', '六盘水市', '贵州,六盘水', '104.830359', '26.592666', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (297, 607029, 1, 604131, '520300000000', '遵义市', '贵州,遵义', '106.927389', '27.725654', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (298, 609309, 1, 604131, '520400000000', '安顺市', '贵州,安顺', '105.947593', '26.253072', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (299, 610607, 1, 604131, '520500000000', '毕节市', '贵州,毕节', '105.283992', '27.302589', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (300, 614530, 1, 604131, '520600000000', '铜仁市', '贵州,铜仁', '109.189598', '27.731514', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (301, 617670, 1, 604131, '522300000000', '黔西南布依族苗族自治州', '贵州,黔西南', '104.906396', '25.087825', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (302, 619017, 1, 604131, '522600000000', '黔东南苗族侗族自治州', '贵州,黔东南', '107.982859', '26.583442', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (303, 622734, 1, 604131, '522700000000', '黔南布依族苗族自治州', '贵州,黔南', '107.522097', '26.254092', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (304, 624373, 1, 624372, '530100000000', '昆明市', '云南,昆明', '102.832891', '24.880095', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (305, 626181, 1, 624372, '530300000000', '曲靖市', '云南,曲靖', '103.796167', '25.489999', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (306, 627981, 1, 624372, '530400000000', '玉溪市', '云南,玉溪', '102.546543', '24.352036', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (307, 628776, 1, 624372, '530500000000', '保山市', '云南,保山', '99.161761', '25.112046', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (308, 629781, 1, 624372, '530600000000', '昭通市', '云南,昭通', '103.717465', '27.338257', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (309, 631276, 1, 624372, '530700000000', '丽江市', '云南,丽江', '100.227750', '26.855047', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (310, 631811, 1, 624372, '530800000000', '普洱市', '云南,普洱', '100.966512', '22.825065', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (311, 632971, 1, 624372, '530900000000', '临沧市', '云南,临沧', '100.079583', '23.877573', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (312, 634006, 1, 624372, '532300000000', '楚雄彝族自治州', '云南,楚雄', '101.528069', '25.045532', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (313, 635219, 1, 624372, '532500000000', '红河哈尼族彝族自治州', '云南,红河', '103.374799', '23.363130', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (314, 636688, 1, 624372, '532600000000', '文山壮族苗族自治州', '云南,文山', '104.216248', '23.400734', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (315, 637778, 1, 624372, '532800000000', '西双版纳傣族自治州', '云南,西双版纳', '100.797777', '22.007351', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (316, 638092, 1, 624372, '532900000000', '大理白族自治州', '云南,大理', '100.267639', '25.606485', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (317, 639368, 1, 624372, '533100000000', '德宏傣族景颇族自治州', '云南,德宏', '98.584895', '24.433353', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (318, 639802, 1, 624372, '533300000000', '怒江傈僳族自治州', '云南,怒江', '98.853097', '25.852547', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (319, 640107, 1, 624372, '533400000000', '迪庆藏族自治州', '云南,迪庆', '99.702234', '27.818882', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (320, 640333, 1, 640332, '540100000000', '拉萨市', '西藏,拉萨', '91.140856', '29.645554', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (321, 640675, 1, 640332, '540200000000', '日喀则市', '西藏,日喀则', '88.880583', '29.266869', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (322, 642571, 1, 640332, '540300000000', '昌都市', '西藏,昌都', '97.172020', '31.140969', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (323, 643863, 1, 640332, '540400000000', '林芝市', '西藏,林芝', '94.361490', '29.649128', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (324, 644423, 1, 640332, '540500000000', '山南市', '西藏,山南', '91.117212', '29.646922', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (325, 645076, 1, 640332, '542400000000', '那曲地区', '西藏,那曲', '92.051239', '31.476202', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (326, 646392, 1, 640332, '542500000000', '阿里地区', '西藏,阿里', '80.105804', '32.501111', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (327, 646579, 1, 646578, '610100000000', '西安市', '陕西,西安', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (328, 649979, 1, 646578, '610200000000', '铜川市', '陕西,铜川', '108.945233', '34.896756', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (329, 650575, 1, 646578, '610300000000', '宝鸡市', '陕西,宝鸡', '107.237974', '34.361979', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (330, 652581, 1, 646578, '610400000000', '咸阳市', '陕西,咸阳', '108.708991', '34.329605', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (331, 655295, 1, 646578, '610500000000', '渭南市', '陕西,渭南', '109.509786', '34.499995', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (332, 657848, 1, 646578, '610600000000', '延安市', '陕西,延安', '109.489727', '36.585455', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (333, 660643, 1, 646578, '610700000000', '汉中市', '陕西,汉中', '107.023323', '33.067480', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (334, 663046, 1, 646578, '610800000000', '榆林市', '陕西,榆林', '109.734589', '38.285390', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (335, 667681, 1, 646578, '610900000000', '安康市', '陕西,安康', '109.029022', '32.684714', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (336, 669707, 1, 646578, '611000000000', '商洛市', '陕西,商洛', '109.940477', '33.870422', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (337, 671120, 1, 671119, '620100000000', '兰州市', '甘肃,兰州', '103.834303', '36.061089', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (338, 672330, 1, 671119, '620200000000', '嘉峪关市', '甘肃,嘉峪关', '98.289152', '39.773130', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (339, 672385, 1, 671119, '620300000000', '金昌市', '甘肃,金昌', '102.188043', '38.520089', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (340, 672577, 1, 671119, '620400000000', '白银市', '甘肃,白银', '104.138559', '36.544756', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (341, 673463, 1, 671119, '620500000000', '天水市', '甘肃,天水', '105.724947', '34.580863', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (342, 676215, 1, 671119, '620600000000', '武威市', '甘肃,武威', '102.638011', '37.928264', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (343, 677568, 1, 671119, '620700000000', '张掖市', '甘肃,张掖', '100.449818', '38.925875', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (344, 678560, 1, 671119, '620800000000', '平凉市', '甘肃,平凉', '106.665240', '35.543051', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (345, 680191, 1, 671119, '620900000000', '酒泉市', '甘肃,酒泉', '98.494483', '39.732410', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (346, 680815, 1, 671119, '621000000000', '庆阳市', '甘肃,庆阳', '107.643631', '35.709077', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (347, 682322, 1, 671119, '621100000000', '定西市', '甘肃,定西', '104.626282', '35.580662', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (348, 684415, 1, 671119, '621200000000', '陇南市', '甘肃,陇南', '104.921841', '33.400684', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (349, 687916, 1, 671119, '622900000000', '临夏回族自治州', '甘肃,临夏', '103.210538', '35.601182', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (350, 689265, 1, 671119, '623000000000', '甘南藏族自治州', '甘肃,甘南', '102.911027', '34.983385', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (351, 690095, 1, 690094, '630100000000', '西宁市', '青海,西宁', '101.778228', '36.617144', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (352, 691278, 1, 690094, '630200000000', '海东市', '青海,海东', '102.104287', '36.502039', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (353, 693040, 1, 690094, '632200000000', '海北藏族自治州', '青海,海北', '100.900997', '36.954413', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (354, 693342, 1, 690094, '632300000000', '黄南藏族自治州', '青海,黄南', '102.015248', '35.519548', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (355, 693672, 1, 690094, '632500000000', '海南藏族自治州', '青海,海南', '101.780199', '36.620901', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (356, 694220, 1, 690094, '632600000000', '果洛藏族自治州', '青海,果洛', '100.244808', '34.471431', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (357, 694478, 1, 690094, '632700000000', '玉树藏族自治州', '青海,玉树', '97.091934', '33.011674', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (358, 694846, 1, 690094, '632800000000', '海西蒙古族藏族自治州', '青海,海西', '97.369751', '37.377139', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (359, 695260, 1, 695259, '640100000000', '银川市', '宁夏,银川', '106.230909', '38.487193', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (360, 695883, 1, 695259, '640200000000', '石嘴山市', '宁夏,石嘴山', '106.383303', '38.983236', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (361, 696252, 1, 695259, '640300000000', '吴忠市', '宁夏,吴忠', '106.198393', '37.997460', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (362, 696928, 1, 695259, '640400000000', '固原市', '宁夏,固原', '106.242610', '36.015855', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (363, 697887, 1, 695259, '640500000000', '中卫市', '宁夏,中卫', '105.196902', '37.499972', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (364, 698441, 1, 698440, '650100000000', '乌鲁木齐市', '新疆,乌鲁木齐', '87.616848', '43.825592', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (365, 699583, 1, 698440, '650200000000', '克拉玛依市', '新疆,克拉玛依', '84.889207', '45.579888', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (366, 699773, 1, 698440, '650400000000', '吐鲁番市', '新疆,吐鲁番', '89.189655', '42.951384', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (367, 700070, 1, 698440, '650500000000', '哈密市', '新疆,哈密', '93.514916', '42.818501', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (368, 700489, 1, 698440, '652300000000', '昌吉回族自治州', '新疆,昌吉', '87.308224', '44.011182', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (369, 701559, 1, 698440, '652700000000', '博尔塔拉蒙古自治州', '新疆,博尔塔拉', '82.066159', '44.905588', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (370, 702104, 1, 698440, '652800000000', '巴音郭楞蒙古自治州', '新疆,巴音郭楞', '86.145298', '41.764115', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (371, 703119, 1, 698440, '652900000000', '阿克苏地区', '新疆,阿克苏', '80.260605', '41.168779', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (372, 704779, 1, 698440, '653000000000', '克孜勒苏柯尔克孜自治州', '新疆,克孜勒苏', '76.167819', '39.714526', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (373, 705145, 1, 698440, '653100000000', '喀什地区', '新疆,喀什', '75.989755', '39.470400', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (374, 708117, 1, 698440, '653200000000', '和田地区', '新疆,和田', '79.922211', '37.114157', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (375, 709792, 1, 698440, '654000000000', '伊犁哈萨克自治州', '新疆,伊犁', '81.324136', '43.916823', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (376, 711218, 1, 698440, '654200000000', '塔城地区', '新疆,塔城', '82.980316', '46.745364', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (377, 712893, 1, 698440, '654300000000', '阿勒泰地区', '新疆,阿勒泰', '88.141253', '47.844924', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (378, 713697, 1, 698440, '659000000000', '直辖县', '新疆', '87.627704', '43.793026', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (385, 714402, 1, 714401, '0', '彰化县', '台湾,彰化', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (386, 717531, 1, 714401, '0', '新北市', '台湾,新北', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (387, 719868, 1, 714401, '0', '澎湖县', '台湾,澎湖', '119.566417', '23.569733', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (388, 720118, 1, 714401, '0', '屏东县', '台湾,屏东', '120.487928', '22.682802', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (389, 722024, 1, 714401, '0', '臺中市', '台湾,臺中', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (390, 725488, 1, 714401, '0', '臺南市', '台湾,臺南', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (391, 727730, 1, 714401, '0', '臺北市', '台湾,臺北', '121.517057', '25.048074', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (392, 729928, 1, 714401, '0', '臺东县', '台湾,臺东', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (393, 730843, 1, 714401, '0', '桃园市', '台湾,桃园', '121.083000', '25.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (394, 734179, 1, 714401, '0', '宜兰县', '台湾,宜兰', '121.500000', '24.600000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (395, 736051, 1, 714401, '0', '南投县', '台湾,南投', '120.830000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (396, 737856, 1, 714401, '0', '南海岛', '台湾,南海岛', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (397, 737861, 1, 714401, '0', '苗栗县', '台湾,苗栗', '120.818985', '24.561601', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (398, 739957, 1, 714401, '0', '嘉义市', '台湾,嘉义', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (399, 740510, 1, 714401, '0', '嘉义县', '台湾,嘉义', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (400, 742126, 1, 714401, '0', '新竹市', '台湾,新竹', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (401, 742636, 1, 714401, '0', '新竹县', '台湾,新竹', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (402, 743938, 1, 714401, '0', '花莲县', '台湾,花莲', '121.300000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (403, 745674, 1, 714401, '0', '高雄市', '台湾,高雄', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (404, 748553, 1, 714401, '0', '基隆市', '台湾,基隆', '121.746248', '25.130741', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (405, 749571, 1, 714401, '0', '金门县', '台湾,金门', '118.317089', '24.432706', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (406, 749930, 1, 714401, '0', '连江县', '台湾,连江', '119.539704', '26.197364', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (407, 749957, 1, 714401, '0', '云林县', '台湾,云林', '120.527173', '23.696887', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (408, 3, 2, 2, '110101000000', '东城区', '北京,东城', '116.416357', '39.928353', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (409, 203, 2, 2, '110102000000', '西城区', '北京,西城', '116.365868', '39.912289', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (410, 480, 2, 2, '110105000000', '朝阳区', '北京,朝阳', '116.443108', '39.921470', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (411, 1122, 2, 2, '110106000000', '丰台区', '北京,丰台', '116.287149', '39.858427', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (412, 1533, 2, 2, '110107000000', '石景山区', '北京,石景山', '116.222982', '39.906611', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (413, 1692, 2, 2, '110108000000', '海淀区', '北京,海淀', '116.298056', '39.959912', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (414, 2376, 2, 2, '110109000000', '门头沟区', '北京,门头沟', '116.102009', '39.940646', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (415, 2689, 2, 2, '110111000000', '房山区', '北京,房山', '116.143267', '39.749144', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (416, 3324, 2, 2, '110112000000', '通州区', '北京,通州', '116.656435', '39.909946', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (417, 3927, 2, 2, '110113000000', '顺义区', '北京,顺义', '116.654651', '40.130347', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (418, 4498, 2, 2, '110114000000', '昌平区', '北京,昌平', '116.231204', '40.220660', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (419, 5042, 2, 2, '110115000000', '大兴区', '北京,大兴', '116.341395', '39.726929', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (420, 5800, 2, 2, '110116000000', '怀柔区', '北京,怀柔', '116.642349', '40.315704', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (421, 6138, 2, 2, '110117000000', '平谷区', '北京,平谷', '117.121383', '40.140701', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (422, 6466, 2, 2, '110118000000', '密云区', '北京,密云', '116.843177', '40.376834', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (423, 6921, 2, 2, '110119000000', '延庆区', '北京,延庆', '115.974848', '40.456951', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (424, 7364, 2, 7363, '120101000000', '和平区', '天津,和平', '117.214510', '39.116949', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (425, 7434, 2, 7363, '120102000000', '河东区', '天津,河东', '117.251587', '39.128291', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (426, 7607, 2, 7363, '120103000000', '河西区', '天津,河西', '117.223372', '39.109563', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (427, 7763, 2, 7363, '120104000000', '南开区', '天津,南开', '117.150738', '39.138203', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (428, 7954, 2, 7363, '120105000000', '河北区', '天津,河北', '117.200983', '39.084158', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (429, 8079, 2, 7363, '120106000000', '红桥区', '天津,红桥', '117.151533', '39.167345', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (430, 8298, 2, 7363, '120110000000', '东丽区', '天津,东丽', '117.314324', '39.086569', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (431, 8563, 2, 7363, '120111000000', '西青区', '天津,西青', '117.008827', '39.141152', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (432, 8835, 2, 7363, '120112000000', '津南区', '天津,津南', '117.357260', '38.937928', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (433, 9102, 2, 7363, '120113000000', '北辰区', '天津,北辰', '117.135488', '39.224792', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (434, 9378, 2, 7363, '120114000000', '武清区', '天津,武清', '117.044388', '39.384119', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (435, 10143, 2, 7363, '120115000000', '宝坻区', '天津,宝坻', '117.309863', '39.717379', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (436, 10983, 2, 7363, '120116000000', '滨海新区', '天津,滨海', '117.517969', '38.719936', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (437, 11454, 2, 7363, '120117000000', '宁河区', '天津,宁河', '117.826625', '39.329858', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (438, 11795, 2, 7363, '120118000000', '静海区', '天津,静海', '116.974130', '38.947512', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (439, 12251, 2, 7363, '120119000000', '蓟州区', '天津,蓟州', '117.200983', '39.084158', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (440, 13269, 2, 13268, '130101000000', '市辖区', '河北,石家庄', '114.514859', '38.042306', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (441, 13270, 2, 13268, '130102000000', '长安区', '河北,石家庄,长安', '114.539060', '38.036654', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (442, 13444, 2, 13268, '130104000000', '桥西区', '河北,石家庄,桥西', '114.461154', '38.004043', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (443, 13601, 2, 13268, '130105000000', '新华区', '河北,石家庄,新华', '114.463347', '38.051060', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (444, 13728, 2, 13268, '130107000000', '井陉矿区', '河北,石家庄,井陉', '114.145240', '38.032148', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (445, 13788, 2, 13268, '130108000000', '裕华区', '河北,石家庄,裕华', '114.531362', '38.006453', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (446, 13895, 2, 13268, '130109000000', '藁城区', '河北,石家庄,藁城', '114.847075', '38.021567', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (447, 14142, 2, 13268, '130110000000', '鹿泉区', '河北,石家庄,鹿泉', '114.313724', '38.085958', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (448, 14377, 2, 13268, '130111000000', '栾城区', '河北,石家庄,栾城', '114.648318', '37.900200', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (449, 14562, 2, 13268, '130121000000', '井陉县', '河北,石家庄,井陉', '114.145240', '38.032148', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (450, 14902, 2, 13268, '130123000000', '正定县', '河北,石家庄,正定', '114.570941', '38.146445', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (451, 15100, 2, 13268, '130125000000', '行唐县', '河北,石家庄,行唐', '114.552692', '38.438411', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (452, 15447, 2, 13268, '130126000000', '灵寿县', '河北,石家庄,灵寿', '114.382645', '38.308628', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (453, 15747, 2, 13268, '130127000000', '高邑县', '河北,石家庄,高邑', '114.611433', '37.615159', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (454, 15860, 2, 13268, '130128000000', '深泽县', '河北,石家庄,深泽', '115.200910', '38.184072', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (455, 15993, 2, 13268, '130129000000', '赞皇县', '河北,石家庄,赞皇', '114.386155', '37.665576', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (456, 16218, 2, 13268, '130130000000', '无极县', '河北,石家庄,无极', '114.976337', '38.179141', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (457, 16447, 2, 13268, '130131000000', '平山县', '河北,石家庄,平山', '114.199134', '38.247144', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (458, 17188, 2, 13268, '130132000000', '元氏县', '河北,石家庄,元氏', '114.525580', '37.766651', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (459, 17417, 2, 13268, '130133000000', '赵县', '河北,石家庄,赵县', '114.776187', '37.756498', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (460, 17710, 2, 13268, '130183000000', '晋州市', '河北,石家庄,晋州', '115.044185', '38.033629', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (461, 17945, 2, 13268, '130184000000', '新乐市', '河北,石家庄,新乐', '114.684014', '38.343296', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (462, 18129, 2, 18128, '130201000000', '市辖区', '河北,唐山', '118.180193', '39.630867', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (463, 18130, 2, 18128, '130202000000', '路南区', '河北,唐山,路南', '118.154354', '39.625059', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (464, 18297, 2, 18128, '130203000000', '路北区', '河北,唐山,路北', '118.200692', '39.624437', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (465, 18542, 2, 18128, '130204000000', '古冶区', '河北,唐山,古冶', '118.447635', '39.733578', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (466, 18754, 2, 18128, '130205000000', '开平区', '河北,唐山,开平', '118.261842', '39.671001', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (467, 18938, 2, 18128, '130207000000', '丰南区', '河北,唐山,丰南', '118.085169', '39.576031', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (468, 19436, 2, 18128, '130208000000', '丰润区', '河北,唐山,丰润', '118.162216', '39.832582', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (469, 19987, 2, 18128, '130209000000', '曹妃甸区', '河北,唐山,曹妃甸', '118.460379', '39.273070', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (470, 20152, 2, 18128, '130223000000', '滦县', '河北,唐山,滦县', '118.703598', '39.740593', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (471, 20696, 2, 18128, '130224000000', '滦南县', '河北,唐山,滦南', '118.682379', '39.518997', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (472, 21321, 2, 18128, '130225000000', '乐亭县', '河北,唐山,乐亭', '118.912571', '39.425608', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (473, 21825, 2, 18128, '130227000000', '迁西县', '河北,唐山,迁西', '118.314715', '40.141500', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (474, 22273, 2, 18128, '130229000000', '玉田县', '河北,唐山,玉田', '117.738658', '39.900401', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (475, 23067, 2, 18128, '130281000000', '遵化市', '河北,唐山,遵化', '117.965892', '40.189202', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (476, 23787, 2, 18128, '130283000000', '迁安市', '河北,唐山,迁安', '118.701144', '39.999175', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (477, 24372, 2, 24371, '130301000000', '市辖区', '河北,秦皇岛', '119.600492', '39.935385', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (478, 24373, 2, 24371, '130302000000', '海港区', '河北,秦皇岛,海港', '119.564962', '39.947560', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (479, 24760, 2, 24371, '130303000000', '山海关区', '河北,秦皇岛,山海关', '119.775799', '39.978849', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (480, 24891, 2, 24371, '130304000000', '北戴河区', '河北,秦皇岛,北戴河', '119.488914', '39.834751', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (481, 24951, 2, 24371, '130306000000', '抚宁区', '河北,秦皇岛,抚宁', '119.244848', '39.876254', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (482, 25332, 2, 24371, '130321000000', '青龙满族自治县', '河北,秦皇岛,青龙', '118.949684', '40.407578', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (483, 25758, 2, 24371, '130322000000', '昌黎县', '河北,秦皇岛,昌黎', '119.162694', '39.712813', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (484, 26216, 2, 24371, '130324000000', '卢龙县', '河北,秦皇岛,卢龙', '118.892986', '39.891947', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (485, 26780, 2, 26779, '130401000000', '市辖区', '河北,邯郸', '114.538961', '36.625657', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (486, 26781, 2, 26779, '130402000000', '邯山区', '河北,邯郸,邯山', '114.490431', '36.580358', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (487, 26877, 2, 26779, '130403000000', '丛台区', '河北,邯郸,丛台', '114.492897', '36.636410', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (488, 27018, 2, 26779, '130404000000', '复兴区', '河北,邯郸,复兴', '114.462058', '36.639022', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (489, 27135, 2, 26779, '130406000000', '峰峰矿区', '河北,邯郸,峰峰', '114.214634', '36.472281', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (490, 27372, 2, 26779, '130421000000', '邯郸县', '河北,邯郸,邯郸', '114.530925', '36.593881', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (491, 27538, 2, 26779, '130423000000', '临漳县', '河北,邯郸,临漳', '114.619544', '36.335300', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (492, 27978, 2, 26779, '130424000000', '成安县', '河北,邯郸,成安', '114.670032', '36.444317', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (493, 28222, 2, 26779, '130425000000', '大名县', '河北,邯郸,大名', '115.147814', '36.285616', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (494, 28894, 2, 26779, '130426000000', '涉县', '河北,邯郸,涉县', '113.691401', '36.584995', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (495, 29226, 2, 26779, '130427000000', '磁县', '河北,邯郸,磁县', '114.373947', '36.374012', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (496, 29613, 2, 26779, '130428000000', '肥乡县', '河北,邯郸,肥乡', '114.800166', '36.548132', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (497, 29888, 2, 26779, '130429000000', '永年县', '河北,邯郸,永年', '114.543804', '36.744120', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (498, 30335, 2, 26779, '130430000000', '邱县', '河北,邯郸,邱县', '115.186792', '36.811133', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (499, 30568, 2, 26779, '130431000000', '鸡泽县', '河北,邯郸,鸡泽', '114.878299', '36.920350', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (500, 30747, 2, 26779, '130432000000', '广平县', '河北,邯郸,广平', '114.948607', '36.483484', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (501, 30924, 2, 26779, '130433000000', '馆陶县', '河北,邯郸,馆陶', '115.282468', '36.547557', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (502, 31210, 2, 26779, '130434000000', '魏县', '河北,邯郸,魏县', '114.938921', '36.359869', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (503, 31793, 2, 26779, '130435000000', '曲周县', '河北,邯郸,曲周', '114.945113', '36.780175', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (504, 32146, 2, 26779, '130481000000', '武安市', '河北,邯郸,武安', '114.203697', '36.696506', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (505, 32689, 2, 32688, '130501000000', '市辖区', '河北,邢台', '114.504844', '37.070589', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (506, 32690, 2, 32688, '130502000000', '桥东区', '河北,邢台,桥东', '114.507254', '37.068017', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (507, 32795, 2, 32688, '130503000000', '桥西区', '河北,邢台,桥西', '114.468435', '37.059882', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (508, 32922, 2, 32688, '130521000000', '邢台县', '河北,邢台,邢台', '114.561132', '37.050730', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (509, 33459, 2, 32688, '130522000000', '临城县', '河北,邢台,临城', '114.498762', '37.444499', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (510, 33688, 2, 32688, '130523000000', '内丘县', '河北,邢台,内丘', '114.512128', '37.286669', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (511, 34011, 2, 32688, '130524000000', '柏乡县', '河北,邢台,柏乡', '114.693426', '37.482423', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (512, 34139, 2, 32688, '130525000000', '隆尧县', '河北,邢台,隆尧', '114.770419', '37.350173', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (513, 34431, 2, 32688, '130526000000', '任县', '河北,邢台,任县', '114.671936', '37.120983', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (514, 34635, 2, 32688, '130527000000', '南和县', '河北,邢台,南和', '114.683762', '37.005041', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (515, 34866, 2, 32688, '130528000000', '宁晋县', '河北,邢台,宁晋', '114.919301', '37.619886', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (516, 35240, 2, 32688, '130529000000', '巨鹿县', '河北,邢台,巨鹿', '115.037478', '37.221112', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (517, 35542, 2, 32688, '130530000000', '新河县', '河北,邢台,新河', '115.242070', '37.528719', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (518, 35718, 2, 32688, '130531000000', '广宗县', '河北,邢台,广宗', '115.142607', '37.074660', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (519, 35940, 2, 32688, '130532000000', '平乡县', '河北,邢台,平乡', '115.030076', '37.063148', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (520, 36202, 2, 32688, '130533000000', '威县', '河北,邢台,威县', '115.266780', '36.975377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (521, 36748, 2, 32688, '130534000000', '清河县', '河北,邢台,清河', '115.667576', '37.040087', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (522, 37086, 2, 32688, '130535000000', '临西县', '河北,邢台,临西', '115.501048', '36.870813', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (523, 37403, 2, 32688, '130581000000', '南宫市', '河北,邢台,南宫', '115.408748', '37.359264', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (524, 37883, 2, 32688, '130582000000', '沙河市', '河北,邢台,沙河', '114.503335', '36.854922', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (525, 38161, 2, 38160, '130601000000', '市辖区', '河北,保定', '115.464806', '38.873891', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (526, 38162, 2, 38160, '130602000000', '竞秀区', '河北,保定,竞秀', '115.458669', '38.877561', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (527, 38327, 2, 38160, '130606000000', '莲池区', '河北,保定,莲池', '115.497342', '38.883209', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (528, 38578, 2, 38160, '130607000000', '满城区', '河北,保定,满城', '115.322351', '38.948955', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (529, 38786, 2, 38160, '130608000000', '清苑区', '河北,保定,清苑', '115.489968', '38.765041', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (530, 39082, 2, 38160, '130609000000', '徐水区', '河北,保定,徐水', '115.655778', '39.018737', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (531, 39426, 2, 38160, '130623000000', '涞水县', '河北,保定,涞水', '115.713905', '39.394317', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (532, 39736, 2, 38160, '130624000000', '阜平县', '河北,保定,阜平', '114.195104', '38.849152', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (533, 39960, 2, 38160, '130626000000', '定兴县', '河北,保定,定兴', '115.808175', '39.263018', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (534, 40258, 2, 38160, '130627000000', '唐县', '河北,保定,唐县', '114.982972', '38.748204', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (535, 40632, 2, 38160, '130628000000', '高阳县', '河北,保定,高阳', '115.778965', '38.700088', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (536, 40825, 2, 38160, '130629000000', '容城县', '河北,保定,容城', '115.861657', '39.042784', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (537, 40961, 2, 38160, '130630000000', '涞源县', '河北,保定,涞源', '114.694284', '39.360247', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (538, 41272, 2, 38160, '130631000000', '望都县', '河北,保定,望都', '115.154511', '38.695736', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (539, 41433, 2, 38160, '130632000000', '安新县', '河北,保定,安新', '115.935603', '38.935369', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (540, 41658, 2, 38160, '130633000000', '易县', '河北,保定,易县', '115.497457', '39.349393', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (541, 42155, 2, 38160, '130634000000', '曲阳县', '河北,保定,曲阳', '114.744926', '38.622244', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (542, 42550, 2, 38160, '130635000000', '蠡县', '河北,保定,蠡县', '115.583855', '38.488056', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (543, 42802, 2, 38160, '130636000000', '顺平县', '河北,保定,顺平', '115.135470', '38.837487', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (544, 43054, 2, 38160, '130637000000', '博野县', '河北,保定,博野', '115.464380', '38.457364', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (545, 43196, 2, 38160, '130638000000', '雄县', '河北,保定,雄县', '116.108650', '38.994550', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (546, 43441, 2, 38160, '130681000000', '涿州市', '河北,保定,涿州', '115.974422', '39.485283', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (547, 43905, 2, 38160, '130683000000', '安国市', '河北,保定,安国', '115.326647', '38.418440', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (548, 44124, 2, 38160, '130684000000', '高碑店市', '河北,保定,高碑店', '115.873758', '39.326521', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (549, 44571, 2, 44570, '130701000000', '市辖区', '河北,张家口', '114.887543', '40.824418', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (550, 44572, 2, 44570, '130702000000', '桥东区', '河北,张家口,桥东', '114.894341', '40.788457', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (551, 44634, 2, 44570, '130703000000', '桥西区', '河北,张家口,桥西', '114.869407', '40.819564', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (552, 44704, 2, 44570, '130705000000', '宣化区', '河北,张家口,宣化', '115.099510', '40.608726', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (553, 45133, 2, 44570, '130706000000', '下花园区', '河北,张家口,下花园', '115.287352', '40.502652', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (554, 45197, 2, 44570, '130708000000', '万全区', '河北,张家口,万全', '114.740560', '40.766898', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (555, 45395, 2, 44570, '130709000000', '崇礼区', '河北,张家口,崇礼', '115.282669', '40.974676', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (556, 45623, 2, 44570, '130722000000', '张北县', '河北,张家口,张北', '114.720086', '41.158557', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (557, 46018, 2, 44570, '130723000000', '康保县', '河北,张家口,康保', '114.600404', '41.852368', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (558, 46371, 2, 44570, '130724000000', '沽源县', '河北,张家口,沽源', '115.688692', '41.669668', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (559, 46619, 2, 44570, '130725000000', '尚义县', '河北,张家口,尚义', '113.969619', '41.076227', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (560, 46812, 2, 44570, '130726000000', '蔚县', '河北,张家口,蔚县', '114.588903', '39.840843', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (561, 47396, 2, 44570, '130727000000', '阳原县', '河北,张家口,阳原', '114.150388', '40.103742', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (562, 47718, 2, 44570, '130728000000', '怀安县', '河北,张家口,怀安', '114.385791', '40.674193', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (563, 48013, 2, 44570, '130730000000', '怀来县', '河北,张家口,怀来', '115.517862', '40.415343', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (564, 48331, 2, 44570, '130731000000', '涿鹿县', '河北,张家口,涿鹿', '115.205345', '40.379563', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (565, 48731, 2, 44570, '130732000000', '赤城县', '河北,张家口,赤城', '115.831499', '40.912921', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (566, 49191, 2, 49190, '130801000000', '市辖区', '河北,承德', '117.962410', '40.954071', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (567, 49192, 2, 49190, '130802000000', '双桥区', '河北,承德,双桥', '117.943348', '40.974650', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (568, 49328, 2, 49190, '130803000000', '双滦区', '河北,承德,双滦', '117.799912', '40.959196', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (569, 49425, 2, 49190, '130804000000', '鹰手营子矿区', '河北,承德,鹰手营子', '117.663471', '40.546436', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (570, 49456, 2, 49190, '130821000000', '承德县', '河北,承德,承德', '118.173825', '40.768238', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (571, 49866, 2, 49190, '130822000000', '兴隆县', '河北,承德,兴隆', '117.500558', '40.417358', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (572, 50185, 2, 49190, '130823000000', '平泉县', '河北,承德,平泉', '118.701951', '41.018405', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (573, 50455, 2, 49190, '130824000000', '滦平县', '河北,承德,滦平', '117.332801', '40.941482', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (574, 50690, 2, 49190, '130825000000', '隆化县', '河北,承德,隆化', '117.738938', '41.313791', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (575, 51081, 2, 49190, '130826000000', '丰宁满族自治县', '河北,承德,丰宁', '117.962410', '40.954071', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (576, 51428, 2, 49190, '130827000000', '宽城满族自治县', '河北,承德,宽城', '118.485313', '40.611391', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (577, 51657, 2, 49190, '130828000000', '围场满族蒙古族自治县', '河北,承德,围场', '117.760159', '41.938529', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (578, 52019, 2, 52018, '130901000000', '市辖区', '河北,沧州', '116.838834', '38.304477', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (579, 52020, 2, 52018, '130902000000', '新华区', '河北,沧州,新华', '116.866284', '38.314416', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (580, 52086, 2, 52018, '130903000000', '运河区', '河北,沧州,运河', '116.832276', '38.310143', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (581, 52214, 2, 52018, '130921000000', '沧县', '河北,沧州,沧县', '117.007478', '38.219856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (582, 52753, 2, 52018, '130922000000', '青县', '河北,沧州,青县', '116.804306', '38.583021', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (583, 53128, 2, 52018, '130923000000', '东光县', '河北,沧州,东光', '116.537067', '37.888248', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (584, 53595, 2, 52018, '130924000000', '海兴县', '河北,沧州,海兴', '117.496606', '38.141582', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (585, 53810, 2, 52018, '130925000000', '盐山县', '河北,沧州,盐山', '117.230603', '38.058088', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (586, 54277, 2, 52018, '130926000000', '肃宁县', '河北,沧州,肃宁', '115.829758', '38.422802', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (587, 54547, 2, 52018, '130927000000', '南皮县', '河北,沧州,南皮', '116.708104', '38.038584', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (588, 54875, 2, 52018, '130928000000', '吴桥县', '河北,沧州,吴桥', '116.391508', '37.627661', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (589, 55369, 2, 52018, '130929000000', '献县', '河北,沧州,献县', '116.122802', '38.190144', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (590, 55902, 2, 52018, '130930000000', '孟村回族自治县', '河北,沧州,孟村', '117.104298', '38.053409', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (591, 56037, 2, 52018, '130981000000', '泊头市', '河北,沧州,泊头', '116.578368', '38.083437', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (592, 56764, 2, 52018, '130982000000', '任丘市', '河北,沧州,任丘', '116.082918', '38.683592', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (593, 57238, 2, 52018, '130983000000', '黄骅市', '河北,沧州,黄骅', '117.330048', '38.371383', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (594, 57596, 2, 52018, '130984000000', '河间市', '河北,沧州,河间', '116.099518', '38.446624', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (595, 58248, 2, 58247, '131001000000', '市辖区', '河北,廊坊', '116.683752', '39.538047', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (596, 58249, 2, 58247, '131002000000', '安次区', '河北,廊坊,安次', '116.694544', '39.502569', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (597, 58567, 2, 58247, '131003000000', '广阳区', '河北,廊坊,广阳', '116.710690', '39.522786', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (598, 58789, 2, 58247, '131022000000', '固安县', '河北,廊坊,固安', '116.298657', '39.438214', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (599, 59228, 2, 58247, '131023000000', '永清县', '河北,廊坊,永清', '116.499028', '39.321794', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (600, 59639, 2, 58247, '131024000000', '香河县', '河北,廊坊,香河', '117.006093', '39.761424', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (601, 59963, 2, 58247, '131025000000', '大城县', '河北,廊坊,大城', '116.653794', '38.705449', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (602, 60378, 2, 58247, '131026000000', '文安县', '河北,廊坊,文安', '116.457858', '38.873281', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (603, 60784, 2, 58247, '131028000000', '大厂回族自治县', '河北,廊坊,大厂', '116.970154', '39.897785', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (604, 60904, 2, 58247, '131081000000', '霸州市', '河北,廊坊,霸州', '116.391386', '39.125898', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (605, 61311, 2, 58247, '131082000000', '三河市', '河北,廊坊,三河', '117.078295', '39.982718', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (606, 61805, 2, 61804, '131101000000', '市辖区', '河北,衡水', '115.670177', '37.738920', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (607, 61806, 2, 61804, '131102000000', '桃城区', '河北,衡水,桃城', '115.675422', '37.735369', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (608, 62086, 2, 61804, '131103000000', '冀州区', '河北,衡水,冀州', '115.670177', '37.738920', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (609, 62479, 2, 61804, '131121000000', '枣强县', '河北,衡水,枣强', '115.724260', '37.513417', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (610, 63050, 2, 61804, '131122000000', '武邑县', '河北,衡水,武邑', '115.887655', '37.801658', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (611, 63584, 2, 61804, '131123000000', '武强县', '河北,衡水,武强', '115.982461', '38.041368', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (612, 63832, 2, 61804, '131124000000', '饶阳县', '河北,衡水,饶阳', '115.725833', '38.235892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (613, 64040, 2, 61804, '131125000000', '安平县', '河北,衡水,安平', '115.519216', '38.234510', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (614, 64281, 2, 61804, '131126000000', '故城县', '河北,衡水,故城', '115.965874', '37.347410', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (615, 64833, 2, 61804, '131127000000', '景县', '河北,衡水,景县', '116.270648', '37.692290', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (616, 65702, 2, 61804, '131128000000', '阜城县', '河北,衡水,阜城', '116.144418', '37.868872', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (617, 66323, 2, 61804, '131182000000', '深州市', '河北,衡水,深州', '115.559574', '38.001536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (618, 66814, 2, 66813, '139001000000', '定州市', '河北,定州', '114.990159', '38.516174', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (619, 67371, 2, 66813, '139002000000', '辛集市', '河北,辛集', '115.218057', '37.943315', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (620, 67749, 2, 67748, '140101000000', '市辖区', '山西,太原', '112.548879', '37.870590', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (621, 67750, 2, 67748, '140105000000', '小店区', '山西,太原,小店', '112.565659', '37.736526', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (622, 67921, 2, 67748, '140106000000', '迎泽区', '山西,太原,迎泽', '112.563400', '37.863451', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (623, 68043, 2, 67748, '140107000000', '杏花岭区', '山西,太原,杏花岭', '112.570605', '37.893955', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (624, 68203, 2, 67748, '140108000000', '尖草坪区', '山西,太原,尖草坪', '112.486691', '37.940387', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (625, 68368, 2, 67748, '140109000000', '万柏林区', '山西,太原,万柏林', '112.515748', '37.859447', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (626, 68542, 2, 67748, '140110000000', '晋源区', '山西,太原,晋源', '112.477940', '37.715193', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (627, 68671, 2, 67748, '140121000000', '清徐县', '山西,太原,清徐', '112.358667', '37.607443', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (628, 68893, 2, 67748, '140122000000', '阳曲县', '山西,太原,阳曲', '112.672953', '38.058489', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (629, 69032, 2, 67748, '140123000000', '娄烦县', '山西,太原,娄烦', '111.797083', '38.067932', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (630, 69190, 2, 67748, '140181000000', '古交市', '山西,太原,古交', '112.175875', '37.907109', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (631, 69391, 2, 69390, '140201000000', '市辖区', '山西,大同', '113.612440', '40.040295', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (632, 69392, 2, 69390, '140202000000', '城区', '山西,大同,城区', '113.298027', '40.075667', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (633, 69546, 2, 69390, '140203000000', '矿区', '山西,大同,矿区', '113.612440', '40.040295', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (634, 69691, 2, 69390, '140211000000', '南郊区', '山西,大同,南郊', '113.149693', '40.005405', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (635, 69891, 2, 69390, '140212000000', '新荣区', '山西,大同,新荣', '113.140005', '40.255866', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (636, 70045, 2, 69390, '140221000000', '阳高县', '山西,大同,阳高', '113.748945', '40.361060', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (637, 70336, 2, 69390, '140222000000', '天镇县', '山西,大同,天镇', '114.090867', '40.420237', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (638, 70582, 2, 69390, '140223000000', '广灵县', '山西,大同,广灵', '114.282758', '39.760281', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (639, 70778, 2, 69390, '140224000000', '灵丘县', '山西,大同,灵丘', '114.234350', '39.442406', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (640, 71059, 2, 69390, '140225000000', '浑源县', '山西,大同,浑源', '113.699475', '39.693407', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (641, 71402, 2, 69390, '140226000000', '左云县', '山西,大同,左云', '112.703008', '40.013442', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (642, 71649, 2, 69390, '140227000000', '大同县', '山西,大同,大同', '113.397170', '40.067276', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (643, 71851, 2, 71850, '140301000000', '市辖区', '山西,阳泉', '113.580519', '37.856971', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (644, 71852, 2, 71850, '140302000000', '城区', '山西,阳泉,城区', '113.600670', '37.847437', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (645, 71905, 2, 71850, '140303000000', '矿区', '山西,阳泉,矿区', '113.580519', '37.856971', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (646, 71950, 2, 71850, '140311000000', '郊区', '山西,阳泉,郊区', '113.594164', '37.944679', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (647, 72145, 2, 71850, '140321000000', '平定县', '山西,阳泉,平定', '113.657841', '37.786653', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (648, 72497, 2, 71850, '140322000000', '盂县', '山西,阳泉,盂县', '113.412330', '38.085619', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (649, 72976, 2, 72975, '140401000000', '市辖区', '山西,长治', '113.116255', '36.195386', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (650, 72977, 2, 72975, '140402000000', '城区', '山西,长治,城区', '113.123085', '36.203519', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (651, 73071, 2, 72975, '140411000000', '郊区', '山西,长治,郊区', '113.101211', '36.218388', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (652, 73222, 2, 72975, '140421000000', '长治县', '山西,长治,长治', '113.051407', '36.052858', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (653, 73495, 2, 72975, '140423000000', '襄垣县', '山西,长治,襄垣', '113.051491', '36.535817', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (654, 73840, 2, 72975, '140424000000', '屯留县', '山西,长治,屯留', '112.892151', '36.315929', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (655, 74151, 2, 72975, '140425000000', '平顺县', '山西,长治,平顺', '113.435961', '36.200179', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (656, 74429, 2, 72975, '140426000000', '黎城县', '山西,长治,黎城', '113.387155', '36.502328', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (657, 74694, 2, 72975, '140427000000', '壶关县', '山西,长治,壶关', '113.207049', '36.115449', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (658, 75101, 2, 72975, '140428000000', '长子县', '山西,长治,长子', '112.877900', '36.122334', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (659, 75515, 2, 72975, '140429000000', '武乡县', '山西,长治,武乡', '112.864562', '36.837625', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (660, 75911, 2, 72975, '140430000000', '沁县', '山西,长治,沁县', '112.699226', '36.756064', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (661, 76237, 2, 72975, '140431000000', '沁源县', '山西,长治,沁源', '112.337446', '36.500200', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (662, 76512, 2, 72975, '140481000000', '潞城市', '山西,长治,潞城', '113.228852', '36.334104', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (663, 76727, 2, 76726, '140501000000', '市辖区', '山西,晋城', '112.851831', '35.490701', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (664, 76728, 2, 76726, '140502000000', '城区', '山西,晋城,城区', '112.853555', '35.501572', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (665, 76874, 2, 76726, '140521000000', '沁水县', '山西,晋城,沁水', '112.186739', '35.690141', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (666, 77140, 2, 76726, '140522000000', '阳城县', '山西,晋城,阳城', '112.414738', '35.486029', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (667, 77632, 2, 76726, '140524000000', '陵川县', '山西,晋城,陵川', '113.280688', '35.775685', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (668, 78024, 2, 76726, '140525000000', '泽州县', '山西,晋城,泽州', '112.899137', '35.617221', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (669, 78678, 2, 76726, '140581000000', '高平市', '山西,晋城,高平', '112.923920', '35.797997', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (670, 79164, 2, 79163, '140601000000', '市辖区', '山西,朔州', '112.432825', '39.331595', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (671, 79165, 2, 79163, '140602000000', '朔城区', '山西,朔州,朔城', '112.432250', '39.318940', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (672, 79533, 2, 79163, '140603000000', '平鲁区', '山西,朔州,平鲁', '112.288331', '39.512155', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (673, 79843, 2, 79163, '140621000000', '山阴县', '山西,朔州,山阴', '112.816600', '39.526227', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (674, 80134, 2, 79163, '140622000000', '应县', '山西,朔州,应县', '113.191099', '39.554247', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (675, 80454, 2, 79163, '140623000000', '右玉县', '山西,朔州,右玉', '112.466989', '39.989064', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (676, 80799, 2, 79163, '140624000000', '怀仁县', '山西,朔州,怀仁', '113.099958', '39.827916', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (677, 81001, 2, 81000, '140701000000', '市辖区', '山西,晋中', '112.752694', '37.687024', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (678, 81002, 2, 81000, '140702000000', '榆次区', '山西,晋中,榆次', '112.708241', '37.697792', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (679, 81361, 2, 81000, '140721000000', '榆社县', '山西,晋中,榆社', '112.975287', '37.070788', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (680, 81649, 2, 81000, '140722000000', '左权县', '山西,晋中,左权', '113.379372', '37.082681', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (681, 81872, 2, 81000, '140723000000', '和顺县', '山西,晋中,和顺', '113.570438', '37.329664', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (682, 82183, 2, 81000, '140724000000', '昔阳县', '山西,晋中,昔阳', '113.706875', '37.611210', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (683, 82535, 2, 81000, '140725000000', '寿阳县', '山西,晋中,寿阳', '113.176434', '37.895325', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (684, 82765, 2, 81000, '140726000000', '太谷县', '山西,晋中,太谷', '112.551357', '37.421308', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (685, 82986, 2, 81000, '140727000000', '祁县', '山西,晋中,祁县', '112.335297', '37.358317', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (686, 83165, 2, 81000, '140728000000', '平遥县', '山西,晋中,平遥', '112.176273', '37.189559', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (687, 83472, 2, 81000, '140729000000', '灵石县', '山西,晋中,灵石', '111.778685', '36.847860', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (688, 83810, 2, 81000, '140781000000', '介休市', '山西,晋中,介休', '111.916712', '37.026945', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (689, 84093, 2, 84092, '140801000000', '市辖区', '山西,运城', '111.007528', '35.026412', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (690, 84094, 2, 84092, '140802000000', '盐湖区', '山西,运城,盐湖', '111.007528', '35.026412', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (691, 84483, 2, 84092, '140821000000', '临猗县', '山西,运城,临猗', '110.774547', '35.144277', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (692, 84893, 2, 84092, '140822000000', '万荣县', '山西,运城,万荣', '110.838024', '35.415254', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (693, 85194, 2, 84092, '140823000000', '闻喜县', '山西,运城,闻喜', '111.224720', '35.356644', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (694, 85569, 2, 84092, '140824000000', '稷山县', '山西,运城,稷山', '110.983333', '35.604025', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (695, 85780, 2, 84092, '140825000000', '新绛县', '山西,运城,新绛', '111.224778', '35.616288', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (696, 86023, 2, 84092, '140826000000', '绛县', '山西,运城,绛县', '111.568236', '35.491190', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (697, 86238, 2, 84092, '140827000000', '垣曲县', '山西,运城,垣曲', '111.669917', '35.297620', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (698, 86448, 2, 84092, '140828000000', '夏县', '山西,运城,夏县', '111.220456', '35.141363', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (699, 86706, 2, 84092, '140829000000', '平陆县', '山西,运城,平陆', '111.194133', '34.829260', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (700, 86949, 2, 84092, '140830000000', '芮城县', '山西,运城,芮城', '110.694369', '34.693580', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (701, 87129, 2, 84092, '140881000000', '永济市', '山西,运城,永济', '110.447549', '34.867050', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (702, 87434, 2, 84092, '140882000000', '河津市', '山西,运城,河津', '110.712063', '35.596383', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (703, 87614, 2, 87613, '140901000000', '市辖区', '山西,忻州', '112.734174', '38.416663', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (704, 87615, 2, 87613, '140902000000', '忻府区', '山西,忻州,忻府', '112.746046', '38.404243', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (705, 88061, 2, 87613, '140921000000', '定襄县', '山西,忻州,定襄', '112.957215', '38.473548', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (706, 88227, 2, 87613, '140922000000', '五台县', '山西,忻州,五台', '113.255309', '38.728315', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (707, 88754, 2, 87613, '140923000000', '代县', '山西,忻州,代县', '112.960282', '39.066917', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (708, 89144, 2, 87613, '140924000000', '繁峙县', '山西,忻州,繁峙', '113.265564', '39.188811', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (709, 89570, 2, 87613, '140925000000', '宁武县', '山西,忻州,宁武', '112.304722', '39.001524', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (710, 90066, 2, 87613, '140926000000', '静乐县', '山西,忻州,静乐', '111.939440', '38.359036', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (711, 90462, 2, 87613, '140927000000', '神池县', '山西,忻州,神池', '112.211297', '39.090553', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (712, 90715, 2, 87613, '140928000000', '五寨县', '山西,忻州,五寨', '111.846905', '38.910726', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (713, 90978, 2, 87613, '140929000000', '岢岚县', '山西,忻州,岢岚', '111.572850', '38.704180', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (714, 91193, 2, 87613, '140930000000', '河曲县', '山西,忻州,河曲', '111.138472', '39.384482', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (715, 91548, 2, 87613, '140931000000', '保德县', '山西,忻州,保德', '111.086564', '39.022488', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (716, 91912, 2, 87613, '140932000000', '偏关县', '山西,忻州,偏关', '111.508831', '39.436306', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (717, 92172, 2, 87613, '140981000000', '原平市', '山西,忻州,原平', '112.711059', '38.731402', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (718, 92739, 2, 92738, '141001000000', '市辖区', '山西,临汾', '111.518976', '36.088005', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (719, 92740, 2, 92738, '141002000000', '尧都区', '山西,临汾,尧都', '111.579554', '36.078841', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (720, 93208, 2, 92738, '141021000000', '曲沃县', '山西,临汾,曲沃', '111.475861', '35.641087', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (721, 93375, 2, 92738, '141022000000', '翼城县', '山西,临汾,翼城', '111.718951', '35.738576', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (722, 93604, 2, 92738, '141023000000', '襄汾县', '山西,临汾,襄汾', '111.441725', '35.876293', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (723, 93972, 2, 92738, '141024000000', '洪洞县', '山西,临汾,洪洞', '111.674966', '36.253748', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (724, 94457, 2, 92738, '141025000000', '古县', '山西,临汾,古县', '111.920466', '36.266914', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (725, 94580, 2, 92738, '141026000000', '安泽县', '山西,临汾,安泽', '112.250144', '36.147787', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (726, 94696, 2, 92738, '141027000000', '浮山县', '山西,临汾,浮山', '111.848883', '35.968124', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (727, 94893, 2, 92738, '141028000000', '吉县', '山西,临汾,吉县', '110.681763', '36.098188', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (728, 94981, 2, 92738, '141029000000', '乡宁县', '山西,临汾,乡宁', '110.847021', '35.970389', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (729, 95181, 2, 92738, '141030000000', '大宁县', '山西,临汾,大宁', '110.752903', '36.465133', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (730, 95272, 2, 92738, '141031000000', '隰县', '山西,临汾,隰县', '110.940638', '36.693331', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (731, 95381, 2, 92738, '141032000000', '永和县', '山西,临汾,永和', '110.632007', '36.759507', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (732, 95472, 2, 92738, '141033000000', '蒲县', '山西,临汾,蒲县', '111.096439', '36.411827', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (733, 95579, 2, 92738, '141034000000', '汾西县', '山西,临汾,汾西', '111.563951', '36.652854', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (734, 95715, 2, 92738, '141081000000', '侯马市', '山西,临汾,侯马', '111.372002', '35.619105', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (735, 95828, 2, 92738, '141082000000', '霍州市', '山西,临汾,霍州', '111.755398', '36.568931', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (736, 96065, 2, 96064, '141101000000', '市辖区', '山西,吕梁', '111.144319', '37.518314', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (737, 96066, 2, 96064, '141102000000', '离石区', '山西,吕梁,离石', '111.150733', '37.517641', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (738, 96332, 2, 96064, '141121000000', '文水县', '山西,吕梁,文水', '112.028866', '37.438102', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (739, 96548, 2, 96064, '141122000000', '交城县', '山西,吕梁,交城', '112.155841', '37.551970', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (740, 96711, 2, 96064, '141123000000', '兴县', '山西,吕梁,兴县', '111.127668', '38.462390', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (741, 97113, 2, 96064, '141124000000', '临县', '山西,吕梁,临县', '110.992094', '37.950758', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (742, 97779, 2, 96064, '141125000000', '柳林县', '山西,吕梁,柳林', '110.889071', '37.429832', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (743, 98056, 2, 96064, '141126000000', '石楼县', '山西,吕梁,石楼', '110.834561', '36.997412', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (744, 98201, 2, 96064, '141127000000', '岚县', '山西,吕梁,岚县', '111.671917', '38.279299', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (745, 98383, 2, 96064, '141128000000', '方山县', '山西,吕梁,方山', '111.244098', '37.894631', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (746, 98562, 2, 96064, '141129000000', '中阳县', '山西,吕梁,中阳', '111.179657', '37.357058', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (747, 98670, 2, 96064, '141130000000', '交口县', '山西,吕梁,交口', '111.181151', '36.982186', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (748, 98774, 2, 96064, '141181000000', '孝义市', '山西,吕梁,孝义', '111.778818', '37.146294', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (749, 99219, 2, 96064, '141182000000', '汾阳市', '山西,吕梁,汾阳', '111.769894', '37.261564', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (750, 99539, 2, 99538, '150101000000', '市辖区', '内蒙古,呼和浩特', '111.749180', '40.842585', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (751, 99540, 2, 99538, '150102000000', '新城区', '内蒙古,呼和浩特,新城', '111.665544', '40.858289', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (752, 99624, 2, 99538, '150103000000', '回民区', '内蒙古,呼和浩特,回民', '111.623692', '40.808608', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (753, 99696, 2, 99538, '150104000000', '玉泉区', '内蒙古,呼和浩特,玉泉', '111.673881', '40.753655', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (754, 99807, 2, 99538, '150105000000', '赛罕区', '内蒙古,呼和浩特,赛罕', '111.701857', '40.792097', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (755, 100011, 2, 99538, '150121000000', '土默特左旗', '内蒙古,呼和浩特,土默特左旗', '111.163902', '40.729573', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (756, 100358, 2, 99538, '150122000000', '托克托县', '内蒙古,呼和浩特,托克托', '111.194313', '40.277431', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (757, 100502, 2, 99538, '150123000000', '和林格尔县', '内蒙古,呼和浩特,和林格尔', '111.821843', '40.378787', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (758, 100672, 2, 99538, '150124000000', '清水河县', '内蒙古,呼和浩特,清水河', '111.647609', '39.921095', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (759, 100790, 2, 99538, '150125000000', '武川县', '内蒙古,呼和浩特,武川', '111.451303', '41.096471', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (760, 100905, 2, 100904, '150201000000', '市辖区', '内蒙古,包头', '109.840347', '40.657449', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (761, 100906, 2, 100904, '150202000000', '东河区', '内蒙古,包头,东河', '110.044142', '40.575948', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (762, 101033, 2, 100904, '150203000000', '昆都仑区', '内蒙古,包头,昆都仑', '109.838178', '40.642236', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (763, 101148, 2, 100904, '150204000000', '青山区', '内蒙古,包头,青山', '109.901572', '40.643246', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (764, 101235, 2, 100904, '150205000000', '石拐区', '内蒙古,包头,石拐', '110.060686', '40.676645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (765, 101268, 2, 100904, '150206000000', '白云鄂博矿区', '内蒙古,包头,白云鄂博', '109.840347', '40.657449', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (766, 101275, 2, 100904, '150207000000', '九原区', '内蒙古,包头,九原', '109.968122', '40.600581', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (767, 101359, 2, 100904, '150221000000', '土默特右旗', '内蒙古,包头,土默特右旗', '110.524263', '40.569426', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (768, 101583, 2, 100904, '150222000000', '固阳县', '内蒙古,包头,固阳', '110.060514', '41.034106', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (769, 101673, 2, 100904, '150223000000', '达尔罕茂明安联合旗', '内蒙古,包头,达尔罕茂明安联合旗', '110.432626', '41.698992', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (770, 101773, 2, 101772, '150301000000', '市辖区', '内蒙古,乌海', '106.794249', '39.655388', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (771, 101774, 2, 101772, '150302000000', '海勃湾区', '内蒙古,乌海,海勃湾', '106.822779', '39.691156', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (772, 101824, 2, 101772, '150303000000', '海南区', '内蒙古,乌海,海南', '106.891424', '39.441364', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (773, 101850, 2, 101772, '150304000000', '乌达区', '内蒙古,乌海,乌达', '106.726099', '39.505925', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (774, 101885, 2, 101884, '150401000000', '市辖区', '内蒙古,赤峰', '118.886856', '42.257817', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (775, 101886, 2, 101884, '150402000000', '红山区', '内蒙古,赤峰,红山', '118.955528', '42.295818', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (776, 101986, 2, 101884, '150403000000', '元宝山区', '内蒙古,赤峰,元宝山', '119.288611', '42.038902', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (777, 102110, 2, 101884, '150404000000', '松山区', '内蒙古,赤峰,松山', '118.931962', '42.286873', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (778, 102434, 2, 101884, '150421000000', '阿鲁科尔沁旗', '内蒙古,赤峰,阿鲁科尔沁旗', '120.065700', '43.872299', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (779, 102714, 2, 101884, '150422000000', '巴林左旗', '内蒙古,赤峰,巴林左旗', '119.379490', '43.971126', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (780, 102913, 2, 101884, '150423000000', '巴林右旗', '内蒙古,赤峰,巴林右旗', '118.665180', '43.534414', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (781, 103097, 2, 101884, '150424000000', '林西县', '内蒙古,赤峰,林西', '118.055450', '43.618120', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (782, 103225, 2, 101884, '150425000000', '克什克腾旗', '内蒙古,赤峰,克什克腾旗', '117.545798', '43.264989', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (783, 103385, 2, 101884, '150426000000', '翁牛特旗', '内蒙古,赤峰,翁牛特旗', '119.006580', '42.936188', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (784, 103647, 2, 101884, '150428000000', '喀喇沁旗', '内蒙古,赤峰,喀喇沁旗', '118.701938', '41.927364', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (785, 103835, 2, 101884, '150429000000', '宁城县', '内蒙古,赤峰,宁城', '119.318876', '41.601375', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (786, 104189, 2, 101884, '150430000000', '敖汉旗', '内蒙古,赤峰,敖汉旗', '119.921604', '42.290782', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (787, 104458, 2, 104457, '150501000000', '市辖区', '内蒙古,通辽', '122.243444', '43.652890', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (788, 104459, 2, 104457, '150502000000', '科尔沁区', '内蒙古,通辽,科尔沁', '122.255675', '43.623077', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (789, 104954, 2, 104457, '150521000000', '科尔沁左翼中旗', '内蒙古,通辽,科尔沁左翼中旗', '123.312265', '44.126626', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (790, 105531, 2, 104457, '150522000000', '科尔沁左翼后旗', '内蒙古,通辽,科尔沁左翼后旗', '122.356749', '42.935159', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (791, 105865, 2, 104457, '150523000000', '开鲁县', '内蒙古,通辽,开鲁', '121.319309', '43.601244', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (792, 106150, 2, 104457, '150524000000', '库伦旗', '内蒙古,通辽,库伦旗', '121.810701', '42.735657', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (793, 106356, 2, 104457, '150525000000', '奈曼旗', '内蒙古,通辽,奈曼旗', '120.658283', '42.867226', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (794, 106746, 2, 104457, '150526000000', '扎鲁特旗', '内蒙古,通辽,扎鲁特旗', '120.911676', '44.556389', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (795, 107028, 2, 104457, '150581000000', '霍林郭勒市', '内蒙古,通辽,霍林郭勒', '119.663534', '45.531726', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (796, 107066, 2, 107065, '150601000000', '市辖区', '内蒙古,鄂尔多斯', '109.781327', '39.608266', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (797, 107067, 2, 107065, '150602000000', '东胜区', '内蒙古,鄂尔多斯,东胜', '109.963339', '39.822507', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (798, 107193, 2, 107065, '150603000000', '康巴什区', '内蒙古,鄂尔多斯,康巴什', '109.999325', '39.809941', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (799, 107213, 2, 107065, '150621000000', '达拉特旗', '内蒙古,鄂尔多斯,达拉特旗', '110.033833', '40.412438', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (800, 107388, 2, 107065, '150622000000', '准格尔旗', '内蒙古,鄂尔多斯,准格尔旗', '111.240171', '39.864362', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (801, 107593, 2, 107065, '150623000000', '鄂托克前旗', '内蒙古,鄂尔多斯,鄂托克前旗', '107.477515', '38.182362', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (802, 107684, 2, 107065, '150624000000', '鄂托克旗', '内蒙古,鄂尔多斯,鄂托克旗', '107.976161', '39.089650', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (803, 107792, 2, 107065, '150625000000', '杭锦旗', '内蒙古,鄂尔多斯,杭锦旗', '108.736208', '39.833309', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (804, 107892, 2, 107065, '150626000000', '乌审旗', '内蒙古,鄂尔多斯,乌审旗', '108.817607', '38.604136', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (805, 107982, 2, 107065, '150627000000', '伊金霍洛旗', '内蒙古,鄂尔多斯,伊金霍洛旗', '109.747740', '39.564660', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (806, 108167, 2, 108166, '150701000000', '市辖区', '内蒙古,呼伦贝尔', '119.765744', '49.211574', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (807, 108168, 2, 108166, '150702000000', '海拉尔区', '内蒙古,呼伦贝尔,海拉尔', '119.736279', '49.212189', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (808, 108232, 2, 108166, '150703000000', '扎赉诺尔区', '内蒙古,呼伦贝尔,扎赉诺尔', '117.670248', '49.510375', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (809, 108260, 2, 108166, '150721000000', '阿荣旗', '内蒙古,呼伦贝尔,阿荣旗', '123.459050', '48.126585', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (810, 108483, 2, 108166, '150722000000', '莫力达瓦达斡尔族自治旗', '内蒙古,呼伦贝尔,莫力达瓦', '123.810423', '48.852112', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (811, 108785, 2, 108166, '150723000000', '鄂伦春自治旗', '内蒙古,呼伦贝尔,鄂伦春自治旗', '123.726201', '50.591842', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (812, 109030, 2, 108166, '150724000000', '鄂温克族自治旗', '内蒙古,呼伦贝尔,鄂温克族自治旗', '119.755213', '49.146588', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (813, 109113, 2, 108166, '150725000000', '陈巴尔虎旗', '内蒙古,呼伦贝尔,陈巴尔虎旗', '119.424026', '49.328916', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (814, 109205, 2, 108166, '150726000000', '新巴尔虎左旗', '内蒙古,呼伦贝尔,新巴尔虎左旗', '118.269820', '48.218241', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (815, 109281, 2, 108166, '150727000000', '新巴尔虎右旗', '内蒙古,呼伦贝尔,新巴尔虎右旗', '116.823690', '48.672101', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (816, 109355, 2, 108166, '150781000000', '满洲里市', '内蒙古,呼伦贝尔,满洲里', '117.378530', '49.597841', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (817, 109393, 2, 108166, '150782000000', '牙克石市', '内蒙古,呼伦贝尔,牙克石', '120.711770', '49.285568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (818, 109490, 2, 108166, '150783000000', '扎兰屯市', '内蒙古,呼伦贝尔,扎兰屯', '122.737467', '48.013733', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (819, 109738, 2, 108166, '150784000000', '额尔古纳市', '内蒙古,呼伦贝尔,额尔古纳', '120.180506', '50.243102', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (820, 109813, 2, 108166, '150785000000', '根河市', '内蒙古,呼伦贝尔,根河', '121.520388', '50.780345', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (821, 109848, 2, 109847, '150801000000', '市辖区', '内蒙古,巴彦淖尔', '107.387657', '40.743213', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (822, 109849, 2, 109847, '150802000000', '临河区', '内蒙古,巴彦淖尔,临河', '107.363919', '40.751187', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (823, 110095, 2, 109847, '150821000000', '五原县', '内蒙古,巴彦淖尔,五原', '108.267562', '41.088422', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (824, 110255, 2, 109847, '150822000000', '磴口县', '内蒙古,巴彦淖尔,磴口', '107.008248', '40.330524', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (825, 110372, 2, 109847, '150823000000', '乌拉特前旗', '内蒙古,巴彦淖尔,乌拉特前旗', '108.652119', '40.737030', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (826, 110557, 2, 109847, '150824000000', '乌拉特中旗', '内蒙古,巴彦淖尔,乌拉特中旗', '108.513645', '41.587732', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (827, 110676, 2, 109847, '150825000000', '乌拉特后旗', '内蒙古,巴彦淖尔,乌拉特后旗', '107.074621', '41.084283', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (828, 110743, 2, 109847, '150826000000', '杭锦后旗', '内蒙古,巴彦淖尔,杭锦后旗', '107.150909', '40.885896', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (829, 110890, 2, 110889, '150901000000', '市辖区', '内蒙古,乌兰察布', '113.132585', '40.994785', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (830, 110891, 2, 110889, '150902000000', '集宁区', '内蒙古,乌兰察布,集宁', '113.123779', '40.990689', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (831, 110998, 2, 110889, '150921000000', '卓资县', '内蒙古,乌兰察布,卓资', '112.577528', '40.894692', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (832, 111127, 2, 110889, '150922000000', '化德县', '内蒙古,乌兰察布,化德', '114.010438', '41.904560', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (833, 111237, 2, 110889, '150923000000', '商都县', '内蒙古,乌兰察布,商都', '113.577816', '41.562113', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (834, 111481, 2, 110889, '150924000000', '兴和县', '内蒙古,乌兰察布,兴和', '113.834173', '40.872301', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (835, 111666, 2, 110889, '150925000000', '凉城县', '内蒙古,乌兰察布,凉城', '112.503971', '40.531555', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (836, 111824, 2, 110889, '150926000000', '察哈尔右翼前旗', '内蒙古,乌兰察布,察哈尔右翼前旗', '113.214733', '40.785631', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (837, 111969, 2, 110889, '150927000000', '察哈尔右翼中旗', '内蒙古,乌兰察布,察哈尔右翼中旗', '112.635577', '41.277462', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (838, 112164, 2, 110889, '150928000000', '察哈尔右翼后旗', '内蒙古,乌兰察布,察哈尔右翼后旗', '113.191035', '41.436069', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (839, 112277, 2, 110889, '150929000000', '四子王旗', '内蒙古,乌兰察布,四子王旗', '111.706618', '41.533462', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (840, 112427, 2, 110889, '150981000000', '丰镇市', '内蒙古,乌兰察布,丰镇', '113.109892', '40.436983', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (841, 112553, 2, 112552, '152201000000', '乌兰浩特市', '内蒙古,兴安,乌兰浩特', '122.093123', '46.072732', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (842, 112694, 2, 112552, '152202000000', '阿尔山市', '内蒙古,兴安,阿尔山', '119.943575', '47.177440', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (843, 112734, 2, 112552, '152221000000', '科尔沁右翼前旗', '内蒙古,兴安,科尔沁右翼前旗', '121.952550', '46.079810', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (844, 113051, 2, 112552, '152222000000', '科尔沁右翼中旗', '内蒙古,兴安,科尔沁右翼中旗', '121.476530', '45.060837', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (845, 113294, 2, 112552, '152223000000', '扎赉特旗', '内蒙古,兴安,扎赉特旗', '122.899656', '46.723237', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (846, 113554, 2, 112552, '152224000000', '突泉县', '内蒙古,兴安,突泉', '121.593799', '45.381930', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (847, 113778, 2, 113777, '152501000000', '二连浩特市', '内蒙古,锡林郭勒,二连浩特', '111.977943', '43.653170', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (848, 113796, 2, 113777, '152502000000', '锡林浩特市', '内蒙古,锡林郭勒,锡林浩特', '116.086032', '43.933411', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (849, 113912, 2, 113777, '152522000000', '阿巴嘎旗', '内蒙古,锡林郭勒,阿巴嘎旗', '114.950248', '44.022995', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (850, 113999, 2, 113777, '152523000000', '苏尼特左旗', '内蒙古,锡林郭勒,苏尼特左旗', '113.667248', '43.859880', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (851, 114065, 2, 113777, '152524000000', '苏尼特右旗', '内蒙古,锡林郭勒,苏尼特右旗', '112.641783', '42.742892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (852, 114152, 2, 113777, '152525000000', '东乌珠穆沁旗', '内蒙古,锡林郭勒,东乌珠穆沁旗', '116.974494', '45.498221', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (853, 114239, 2, 113777, '152526000000', '西乌珠穆沁旗', '内蒙古,锡林郭勒,西乌珠穆沁旗', '117.608911', '44.587882', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (854, 114358, 2, 113777, '152527000000', '太仆寺旗', '内蒙古,锡林郭勒,太仆寺旗', '115.282986', '41.877136', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (855, 114557, 2, 113777, '152528000000', '镶黄旗', '内蒙古,锡林郭勒,镶黄旗', '113.847287', '42.232371', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (856, 114628, 2, 113777, '152529000000', '正镶白旗', '内蒙古,锡林郭勒,正镶白旗', '115.029849', '42.287471', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (857, 114722, 2, 113777, '152530000000', '正蓝旗', '内蒙古,锡林郭勒,正蓝旗', '115.992470', '42.241638', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (858, 114859, 2, 113777, '152531000000', '多伦县', '内蒙古,锡林郭勒,多伦', '116.485556', '42.203591', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (859, 114941, 2, 114940, '152921000000', '阿拉善左旗', '内蒙古,阿拉善,阿拉善左旗', '105.666293', '38.833411', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (860, 115132, 2, 114940, '152922000000', '阿拉善右旗', '内蒙古,阿拉善,阿拉善右旗', '101.666917', '39.216186', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (861, 115189, 2, 114940, '152923000000', '额济纳旗', '内蒙古,阿拉善,额济纳旗', '101.055590', '41.954347', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (862, 115226, 2, 115225, '210101000000', '市辖区', '辽宁,沈阳', '123.431474', '41.805698', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (863, 115227, 2, 115225, '210102000000', '和平区', '辽宁,沈阳,和平', '123.420382', '41.789809', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (864, 115347, 2, 115225, '210103000000', '沈河区', '辽宁,沈阳,沈河', '123.458897', '41.795655', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (865, 115474, 2, 115225, '210104000000', '大东区', '辽宁,沈阳,大东', '123.469949', '41.805137', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (866, 115612, 2, 115225, '210105000000', '皇姑区', '辽宁,沈阳,皇姑', '123.441970', '41.824796', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (867, 115752, 2, 115225, '210106000000', '铁西区', '辽宁,沈阳,铁西', '123.376301', '41.802914', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (868, 115964, 2, 115225, '210111000000', '苏家屯区', '辽宁,沈阳,苏家屯', '123.344031', '41.664757', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (869, 116159, 2, 115225, '210112000000', '浑南区', '辽宁,沈阳,浑南', '123.449715', '41.714914', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (870, 116399, 2, 115225, '210113000000', '沈北新区', '辽宁,沈阳,沈北', '123.431474', '41.805698', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (871, 116614, 2, 115225, '210114000000', '于洪区', '辽宁,沈阳,于洪', '123.308136', '41.793743', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (872, 116820, 2, 115225, '210115000000', '辽中区', '辽宁,沈阳,辽中', '122.765409', '41.516827', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (873, 117075, 2, 115225, '210123000000', '康平县', '辽宁,沈阳,康平', '123.355701', '42.741005', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (874, 117268, 2, 115225, '210124000000', '法库县', '辽宁,沈阳,法库', '123.440495', '42.500730', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (875, 117530, 2, 115225, '210181000000', '新民市', '辽宁,沈阳,新民', '122.836726', '41.985193', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (876, 117933, 2, 117932, '210201000000', '市辖区', '辽宁,大连', '121.614682', '38.914003', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (877, 117934, 2, 117932, '210202000000', '中山区', '辽宁,大连,中山', '121.644927', '38.918574', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (878, 117997, 2, 117932, '210203000000', '西岗区', '辽宁,大连,西岗', '121.612325', '38.914687', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (879, 118050, 2, 117932, '210204000000', '沙河口区', '辽宁,大连,沙河口', '121.594200', '38.904808', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (880, 118150, 2, 117932, '210211000000', '甘井子区', '辽宁,大连,甘井子', '121.525461', '38.953351', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (881, 118405, 2, 117932, '210212000000', '旅顺口区', '辽宁,大连,旅顺口', '121.261953', '38.851705', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (882, 118523, 2, 117932, '210213000000', '金州区', '辽宁,大连,金州', '121.782769', '39.050460', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (883, 118884, 2, 117932, '210214000000', '普兰店区', '辽宁,大连,普兰店', '121.970512', '39.401551', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (884, 119090, 2, 117932, '210224000000', '长海县', '辽宁,大连,长海', '122.588494', '39.272728', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (885, 119126, 2, 117932, '210281000000', '瓦房店市', '辽宁,大连,瓦房店', '121.979603', '39.627114', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (886, 119483, 2, 117932, '210283000000', '庄河市', '辽宁,大连,庄河', '122.967328', '39.680811', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (887, 119790, 2, 119789, '210301000000', '市辖区', '辽宁,鞍山', '122.994329', '41.108647', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (888, 119791, 2, 119789, '210302000000', '铁东区', '辽宁,鞍山,铁东', '122.991052', '41.089933', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (889, 119915, 2, 119789, '210303000000', '铁西区', '辽宁,鞍山,铁西', '122.969630', '41.119885', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (890, 120021, 2, 119789, '210304000000', '立山区', '辽宁,鞍山,立山', '123.029091', '41.150401', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (891, 120150, 2, 119789, '210311000000', '千山区', '辽宁,鞍山,千山', '122.949298', '41.068909', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (892, 120221, 2, 119789, '210321000000', '台安县', '辽宁,鞍山,台安', '122.436196', '41.412768', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (893, 120401, 2, 119789, '210323000000', '岫岩满族自治县', '辽宁,鞍山,岫岩', '123.280935', '40.290880', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (894, 120634, 2, 119789, '210381000000', '海城市', '辽宁,鞍山,海城', '122.685217', '40.882377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (895, 121082, 2, 121081, '210401000000', '市辖区', '辽宁,抚顺', '123.957208', '41.880872', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (896, 121083, 2, 121081, '210402000000', '新抚区', '辽宁,抚顺,新抚', '123.912861', '41.862080', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (897, 121181, 2, 121081, '210403000000', '东洲区', '辽宁,抚顺,东洲', '124.038685', '41.853192', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (898, 121326, 2, 121081, '210404000000', '望花区', '辽宁,抚顺,望花', '123.784206', '41.853646', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (899, 121484, 2, 121081, '210411000000', '顺城区', '辽宁,抚顺,顺城', '123.945040', '41.883375', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (900, 121604, 2, 121081, '210421000000', '抚顺县', '辽宁,抚顺,抚顺', '124.097979', '41.922644', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (901, 121710, 2, 121081, '210422000000', '新宾满族自治县', '辽宁,抚顺,新宾', '125.039978', '41.734256', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (902, 121920, 2, 121081, '210423000000', '清原满族自治县', '辽宁,抚顺,清原', '124.924083', '42.100539', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (903, 122143, 2, 122142, '210501000000', '市辖区', '辽宁,本溪', '123.766485', '41.294175', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (904, 122144, 2, 122142, '210502000000', '平山区', '辽宁,本溪,平山', '123.768926', '41.299702', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (905, 122216, 2, 122142, '210503000000', '溪湖区', '辽宁,本溪,溪湖', '123.767647', '41.329219', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (906, 122310, 2, 122142, '210504000000', '明山区', '辽宁,本溪,明山', '123.817212', '41.308710', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (907, 122400, 2, 122142, '210505000000', '南芬区', '辽宁,本溪,南芬', '123.744802', '41.100445', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (908, 122444, 2, 122142, '210521000000', '本溪满族自治县', '辽宁,本溪,本溪', '124.120436', '41.301892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (909, 122591, 2, 122142, '210522000000', '桓仁满族自治县', '辽宁,本溪,桓仁', '125.361007', '41.267128', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (910, 122731, 2, 122730, '210601000000', '市辖区', '辽宁,丹东', '124.354706', '40.000499', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (911, 122732, 2, 122730, '210602000000', '元宝区', '辽宁,丹东,元宝', '124.395757', '40.136520', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (912, 122785, 2, 122730, '210603000000', '振兴区', '辽宁,丹东,振兴', '124.360264', '40.105194', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (913, 122886, 2, 122730, '210604000000', '振安区', '辽宁,丹东,振安', '124.428162', '40.158267', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (914, 122958, 2, 122730, '210624000000', '宽甸满族自治县', '辽宁,丹东,宽甸', '124.783660', '40.731317', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (915, 123177, 2, 122730, '210681000000', '东港市', '辽宁,丹东,东港', '124.152705', '39.863008', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (916, 123438, 2, 122730, '210682000000', '凤城市', '辽宁,丹东,凤城', '124.066919', '40.452298', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (917, 123699, 2, 123698, '210701000000', '市辖区', '辽宁,锦州', '121.127003', '41.095119', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (918, 123700, 2, 123698, '210702000000', '古塔区', '辽宁,锦州,古塔', '121.128279', '41.117245', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (919, 123778, 2, 123698, '210703000000', '凌河区', '辽宁,锦州,凌河', '121.150877', '41.114990', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (920, 123869, 2, 123698, '210711000000', '太和区', '辽宁,锦州,太和', '121.103892', '41.109147', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (921, 124044, 2, 123698, '210726000000', '黑山县', '辽宁,锦州,黑山', '122.123443', '41.666028', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (922, 124398, 2, 123698, '210727000000', '义县', '辽宁,锦州,义县', '121.239080', '41.533087', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (923, 124670, 2, 123698, '210781000000', '凌海市', '辽宁,锦州,凌海', '121.357730', '41.173400', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (924, 124980, 2, 123698, '210782000000', '北镇市', '辽宁,锦州,北镇', '121.795962', '41.598764', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (925, 125250, 2, 125249, '210801000000', '市辖区', '辽宁,营口', '122.235417', '40.667012', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (926, 125251, 2, 125249, '210802000000', '站前区', '辽宁,营口,站前', '122.258961', '40.672670', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (927, 125305, 2, 125249, '210803000000', '西市区', '辽宁,营口,西市', '122.206414', '40.666408', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (928, 125353, 2, 125249, '210804000000', '鲅鱼圈区', '辽宁,营口,鲅鱼圈', '122.107814', '40.230636', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (929, 125454, 2, 125249, '210811000000', '老边区', '辽宁,营口,老边', '122.379967', '40.680303', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (930, 125520, 2, 125249, '210881000000', '盖州市', '辽宁,营口,盖州', '122.348936', '40.400611', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (931, 125849, 2, 125249, '210882000000', '大石桥市', '辽宁,营口,大石桥', '122.509131', '40.644622', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (932, 126157, 2, 126156, '210901000000', '市辖区', '辽宁,阜新', '121.670323', '42.021619', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (933, 126158, 2, 126156, '210902000000', '海州区', '辽宁,阜新,海州', '121.656255', '42.013242', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (934, 126236, 2, 126156, '210903000000', '新邱区', '辽宁,阜新,新邱', '121.792535', '42.087632', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (935, 126264, 2, 126156, '210904000000', '太平区', '辽宁,阜新,太平', '121.678512', '42.010600', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (936, 126314, 2, 126156, '210905000000', '清河门区', '辽宁,阜新,清河门', '121.416105', '41.783100', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (937, 126349, 2, 126156, '210911000000', '细河区', '辽宁,阜新,细河', '121.680540', '42.025495', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (938, 126417, 2, 126156, '210921000000', '阜新蒙古族自治县', '辽宁,阜新,阜新', '121.757901', '42.065175', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (939, 126845, 2, 126156, '210922000000', '彰武县', '辽宁,阜新,彰武', '122.538793', '42.386544', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (940, 127071, 2, 127070, '211001000000', '市辖区', '辽宁,辽阳', '123.236944', '41.267244', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (941, 127072, 2, 127070, '211002000000', '白塔区', '辽宁,辽阳,白塔', '123.174325', '41.270347', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (942, 127152, 2, 127070, '211003000000', '文圣区', '辽宁,辽阳,文圣', '123.185386', '41.262608', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (943, 127218, 2, 127070, '211004000000', '宏伟区', '辽宁,辽阳,宏伟', '123.196672', '41.217649', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (944, 127266, 2, 127070, '211005000000', '弓长岭区', '辽宁,辽阳,弓长岭', '123.419804', '41.151847', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (945, 127305, 2, 127070, '211011000000', '太子河区', '辽宁,辽阳,太子河', '123.181782', '41.253277', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (946, 127386, 2, 127070, '211021000000', '辽阳县', '辽宁,辽阳,辽阳', '123.105695', '41.205329', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (947, 127612, 2, 127070, '211081000000', '灯塔市', '辽宁,辽阳,灯塔', '123.339312', '41.426372', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (948, 127835, 2, 127834, '211101000000', '市辖区', '辽宁,盘锦', '122.070714', '41.119997', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (949, 127836, 2, 127834, '211102000000', '双台子区', '辽宁,盘锦,双台子', '122.060112', '41.190606', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (950, 127896, 2, 127834, '211103000000', '兴隆台区', '辽宁,盘锦,兴隆台', '122.069897', '41.158678', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (951, 128037, 2, 127834, '211104000000', '大洼区', '辽宁,盘锦,大洼', '122.082575', '41.002279', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (952, 128231, 2, 127834, '211122000000', '盘山县', '辽宁,盘锦,盘山', '121.996499', '41.242873', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (953, 128422, 2, 128421, '211201000000', '市辖区', '辽宁,铁岭', '123.726166', '42.223769', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (954, 128423, 2, 128421, '211202000000', '银州区', '辽宁,铁岭,银州', '123.842305', '42.286130', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (955, 128530, 2, 128421, '211204000000', '清河区', '辽宁,铁岭,清河', '123.726166', '42.223769', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (956, 128591, 2, 128421, '211221000000', '铁岭县', '辽宁,铁岭,铁岭', '123.729004', '42.223383', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (957, 128839, 2, 128421, '211223000000', '西丰县', '辽宁,铁岭,西丰', '124.727393', '42.738030', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (958, 129043, 2, 128421, '211224000000', '昌图县', '辽宁,铁岭,昌图', '124.111100', '42.785791', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (959, 129592, 2, 128421, '211281000000', '调兵山市', '辽宁,铁岭,调兵山', '123.567117', '42.467521', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (960, 129661, 2, 128421, '211282000000', '开原市', '辽宁,铁岭,开原', '124.038268', '42.546307', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (961, 129978, 2, 129977, '211301000000', '市辖区', '辽宁,朝阳', '120.389862', '41.497767', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (962, 129979, 2, 129977, '211302000000', '双塔区', '辽宁,朝阳,双塔', '120.453744', '41.565628', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (963, 130102, 2, 129977, '211303000000', '龙城区', '辽宁,朝阳,龙城', '120.413376', '41.576749', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (964, 130205, 2, 129977, '211321000000', '朝阳县', '辽宁,朝阳,朝阳', '120.389862', '41.497767', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (965, 130534, 2, 129977, '211322000000', '建平县', '辽宁,朝阳,建平', '119.643280', '41.403128', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (966, 130860, 2, 129977, '211324000000', '喀喇沁左翼蒙古族自治县', '辽宁,朝阳,喀喇沁左翼', '120.389862', '41.497767', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (967, 131089, 2, 129977, '211381000000', '北票市', '辽宁,朝阳,北票', '120.770730', '41.800684', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (968, 131425, 2, 129977, '211382000000', '凌源市', '辽宁,朝阳,凌源', '119.401574', '41.245445', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (969, 131739, 2, 131738, '211401000000', '市辖区', '辽宁,葫芦岛', '120.836932', '40.711052', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (970, 131740, 2, 131738, '211402000000', '连山区', '辽宁,葫芦岛,连山', '120.869231', '40.774461', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (971, 131976, 2, 131738, '211403000000', '龙港区', '辽宁,葫芦岛,龙港', '120.893786', '40.735519', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (972, 132073, 2, 131738, '211404000000', '南票区', '辽宁,葫芦岛,南票', '120.749728', '41.107108', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (973, 132258, 2, 131738, '211421000000', '绥中县', '辽宁,葫芦岛,绥中', '120.344229', '40.325659', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (974, 132590, 2, 131738, '211422000000', '建昌县', '辽宁,葫芦岛,建昌', '119.837124', '40.824368', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (975, 132912, 2, 131738, '211481000000', '兴城市', '辽宁,葫芦岛,兴城', '120.728310', '40.614762', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (976, 133210, 2, 133209, '220101000000', '市辖区', '吉林,长春', '125.323544', '43.817071', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (977, 133211, 2, 133209, '220102000000', '南关区', '吉林,长春,南关', '125.350173', '43.863989', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (978, 133289, 2, 133209, '220103000000', '宽城区', '吉林,长春,宽城', '125.326578', '43.943614', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (979, 133453, 2, 133209, '220104000000', '朝阳区', '吉林,长春,朝阳', '125.288319', '43.833513', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (980, 133543, 2, 133209, '220105000000', '二道区', '吉林,长春,二道', '125.374217', '43.865596', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (981, 133631, 2, 133209, '220106000000', '绿园区', '吉林,长春,绿园', '125.256136', '43.880975', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (982, 133719, 2, 133209, '220112000000', '双阳区', '吉林,长春,双阳', '125.664662', '43.525311', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (983, 133881, 2, 133209, '220113000000', '九台区', '吉林,长春,九台', '125.839574', '44.151742', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (984, 134236, 2, 133209, '220122000000', '农安县', '吉林,长春,农安', '125.184742', '44.432889', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (985, 134628, 2, 133209, '220182000000', '榆树市', '吉林,长春,榆树', '126.533146', '44.840288', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (986, 135061, 2, 133209, '220183000000', '德惠市', '吉林,长春,德惠', '125.728620', '44.521785', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (987, 135393, 2, 135392, '220201000000', '市辖区', '吉林,吉林', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (988, 135394, 2, 135392, '220202000000', '昌邑区', '吉林,吉林,昌邑', '126.574710', '43.881818', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (989, 135568, 2, 135392, '220203000000', '龙潭区', '吉林,吉林,龙潭', '126.562197', '43.910803', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (990, 135755, 2, 135392, '220204000000', '船营区', '吉林,吉林,船营', '126.540966', '43.833445', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (991, 135885, 2, 135392, '220211000000', '丰满区', '吉林,吉林,丰满', '126.562274', '43.821601', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (992, 135986, 2, 135392, '220221000000', '永吉县', '吉林,吉林,永吉', '126.497741', '43.672582', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (993, 136136, 2, 135392, '220281000000', '蛟河市', '吉林,吉林,蛟河', '127.344501', '43.723713', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (994, 136439, 2, 135392, '220282000000', '桦甸市', '吉林,吉林,桦甸', '126.746310', '42.972097', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (995, 136629, 2, 135392, '220283000000', '舒兰市', '吉林,吉林,舒兰', '126.965607', '44.406106', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (996, 136889, 2, 135392, '220284000000', '磐石市', '吉林,吉林,磐石', '126.060427', '42.946285', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (997, 137207, 2, 137206, '220301000000', '市辖区', '吉林,四平', '124.350398', '43.166419', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (998, 137208, 2, 137206, '220302000000', '铁西区', '吉林,四平,铁西', '124.345722', '43.146155', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (999, 137275, 2, 137206, '220303000000', '铁东区', '吉林,四平,铁东', '124.409622', '43.162048', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1000, 137386, 2, 137206, '220322000000', '梨树县', '吉林,四平,梨树', '124.335390', '43.307060', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1001, 137756, 2, 137206, '220323000000', '伊通满族自治县', '吉林,四平,伊通', '125.305394', '43.345754', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1002, 137973, 2, 137206, '220381000000', '公主岭市', '吉林,四平,公主岭', '124.822830', '43.504687', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1003, 138477, 2, 137206, '220382000000', '双辽市', '吉林,四平,双辽', '123.502724', '43.518302', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1004, 138722, 2, 138721, '220401000000', '市辖区', '吉林,辽源', '125.143532', '42.887918', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1005, 138723, 2, 138721, '220402000000', '龙山区', '吉林,辽源,龙山', '125.136452', '42.901534', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1006, 138780, 2, 138721, '220403000000', '西安区', '吉林,辽源,西安', '125.149283', '42.927265', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1007, 138818, 2, 138721, '220421000000', '东丰县', '吉林,辽源,东丰', '125.530991', '42.676935', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1008, 139072, 2, 138721, '220422000000', '东辽县', '吉林,辽源,东辽', '124.991521', '42.926331', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1009, 139341, 2, 139340, '220501000000', '市辖区', '吉林,通化', '125.939697', '41.728401', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1010, 139342, 2, 139340, '220502000000', '东昌区', '吉林,通化,东昌', '125.955102', '41.728498', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1011, 139405, 2, 139340, '220503000000', '二道江区', '吉林,通化,二道江', '126.042535', '41.774053', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1012, 139453, 2, 139340, '220521000000', '通化县', '吉林,通化,通化', '125.759259', '41.679808', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1013, 139654, 2, 139340, '220523000000', '辉南县', '吉林,通化,辉南', '126.046912', '42.684993', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1014, 139824, 2, 139340, '220524000000', '柳河县', '吉林,通化,柳河', '125.744735', '42.284606', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1015, 140077, 2, 139340, '220581000000', '梅河口市', '吉林,通化,梅河口', '125.683832', '42.530341', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1016, 140432, 2, 139340, '220582000000', '集安市', '吉林,通化,集安', '126.194031', '41.125307', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1017, 140602, 2, 140601, '220601000000', '市辖区', '吉林,白山', '126.423587', '41.939994', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1018, 140603, 2, 140601, '220602000000', '浑江区', '吉林,白山,浑江', '126.416094', '41.945409', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1019, 140714, 2, 140601, '220605000000', '江源区', '吉林,白山,江源', '126.591144', '42.056773', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1020, 140816, 2, 140601, '220621000000', '抚松县', '吉林,白山,抚松', '127.449764', '42.221208', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1021, 141003, 2, 140601, '220622000000', '靖宇县', '吉林,白山,靖宇', '126.813625', '42.388760', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1022, 141140, 2, 140601, '220623000000', '长白朝鲜族自治县', '吉林,白山,长白', '128.200789', '41.420018', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1023, 141237, 2, 140601, '220681000000', '临江市', '吉林,白山,临江', '126.918087', '41.811979', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1024, 141362, 2, 141361, '220701000000', '市辖区', '吉林,松原', '124.825117', '45.141789', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1025, 141363, 2, 141361, '220702000000', '宁江区', '吉林,松原,宁江', '124.817054', '45.171792', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1026, 141560, 2, 141361, '220721000000', '前郭尔罗斯蒙古族自治县', '吉林,松原,前郭尔罗斯', '124.823242', '45.118030', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1027, 141870, 2, 141361, '220722000000', '长岭县', '吉林,松原,长岭', '123.967484', '44.275895', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1028, 142157, 2, 141361, '220723000000', '乾安县', '吉林,松原,乾安', '124.041139', '45.003774', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1029, 142353, 2, 141361, '220781000000', '扶余市', '吉林,松原,扶余', '126.049774', '44.988449', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1030, 142787, 2, 142786, '220801000000', '市辖区', '吉林,白城', '122.839024', '45.619641', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1031, 142788, 2, 142786, '220802000000', '洮北区', '吉林,白城,洮北', '122.851029', '45.621716', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1032, 143021, 2, 142786, '220821000000', '镇赉县', '吉林,白城,镇赉', '123.199890', '45.847435', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1033, 143209, 2, 142786, '220822000000', '通榆县', '吉林,白城,通榆', '123.088239', '44.812911', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1034, 143428, 2, 142786, '220881000000', '洮南市', '吉林,白城,洮南', '122.783779', '45.339113', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1035, 143702, 2, 142786, '220882000000', '大安市', '吉林,白城,大安', '124.292626', '45.506996', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1036, 143991, 2, 143990, '222401000000', '延吉市', '吉林,延边,延吉', '129.508946', '42.891255', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1037, 144147, 2, 143990, '222402000000', '图们市', '吉林,延边,图们', '129.843710', '42.968044', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1038, 144226, 2, 143990, '222403000000', '敦化市', '吉林,延边,敦化', '128.232013', '43.372413', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1039, 144665, 2, 143990, '222404000000', '珲春市', '吉林,延边,珲春', '130.366036', '42.862821', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1040, 144844, 2, 143990, '222405000000', '龙井市', '吉林,延边,龙井', '129.427066', '42.766311', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1041, 144953, 2, 143990, '222406000000', '和龙市', '吉林,延边,和龙', '129.010106', '42.546675', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1042, 145096, 2, 143990, '222424000000', '汪清县', '吉林,延边,汪清', '129.771607', '43.312522', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1043, 145421, 2, 143990, '222426000000', '安图县', '吉林,延边,安图', '128.899807', '43.111964', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1044, 145667, 2, 145666, '230101000000', '市辖区', '黑龙江,哈尔滨', '126.534967', '45.803775', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1045, 145668, 2, 145666, '230102000000', '道里区', '黑龙江,哈尔滨,道里', '126.616957', '45.755777', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1046, 145864, 2, 145666, '230103000000', '南岗区', '黑龙江,哈尔滨,南岗', '126.668788', '45.759970', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1047, 146071, 2, 145666, '230104000000', '道外区', '黑龙江,哈尔滨,道外', '126.649451', '45.792113', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1048, 146266, 2, 145666, '230108000000', '平房区', '黑龙江,哈尔滨,平房', '126.534967', '45.803775', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1049, 146313, 2, 145666, '230109000000', '松北区', '黑龙江,哈尔滨,松北', '126.510275', '45.802756', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1050, 146399, 2, 145666, '230110000000', '香坊区', '黑龙江,哈尔滨,香坊', '126.662593', '45.707716', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1051, 146587, 2, 145666, '230111000000', '呼兰区', '黑龙江,哈尔滨,呼兰', '126.587709', '45.889427', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1052, 146825, 2, 145666, '230112000000', '阿城区', '黑龙江,哈尔滨,阿城', '126.958098', '45.548670', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1053, 147032, 2, 145666, '230113000000', '双城区', '黑龙江,哈尔滨,双城', '126.312745', '45.383263', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1054, 147391, 2, 145666, '230123000000', '依兰县', '黑龙江,哈尔滨,依兰', '129.567985', '46.324534', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1055, 147571, 2, 145666, '230124000000', '方正县', '黑龙江,哈尔滨,方正', '128.829536', '45.851695', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1056, 147676, 2, 145666, '230125000000', '宾县', '黑龙江,哈尔滨,宾县', '127.466634', '45.745918', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1057, 147884, 2, 145666, '230126000000', '巴彦县', '黑龙江,哈尔滨,巴彦', '127.403182', '46.085379', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1058, 148060, 2, 145666, '230127000000', '木兰县', '黑龙江,哈尔滨,木兰', '128.043466', '45.950582', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1059, 148178, 2, 145666, '230128000000', '通河县', '黑龙江,哈尔滨,通河', '128.749352', '45.972425', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1060, 148351, 2, 145666, '230129000000', '延寿县', '黑龙江,哈尔滨,延寿', '128.331644', '45.451897', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1061, 148502, 2, 145666, '230183000000', '尚志市', '黑龙江,哈尔滨,尚志', '128.009895', '45.209586', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1062, 148755, 2, 145666, '230184000000', '五常市', '黑龙江,哈尔滨,五常', '127.167619', '44.931992', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1063, 149080, 2, 149079, '230201000000', '市辖区', '黑龙江,齐齐哈尔', '123.918186', '47.354348', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1064, 149081, 2, 149079, '230202000000', '龙沙区', '黑龙江,齐齐哈尔,龙沙', '123.957531', '47.317309', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1065, 149129, 2, 149079, '230203000000', '建华区', '黑龙江,齐齐哈尔,建华', '123.955464', '47.354364', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1066, 149173, 2, 149079, '230204000000', '铁锋区', '黑龙江,齐齐哈尔,铁锋', '123.978293', '47.340518', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1067, 149231, 2, 149079, '230205000000', '昂昂溪区', '黑龙江,齐齐哈尔,昂昂溪', '123.822401', '47.155160', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1068, 149266, 2, 149079, '230206000000', '富拉尔基区', '黑龙江,齐齐哈尔,富拉尔基', '123.629190', '47.208843', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1069, 149317, 2, 149079, '230207000000', '碾子山区', '黑龙江,齐齐哈尔,碾子山', '122.887775', '47.516872', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1070, 149338, 2, 149079, '230208000000', '梅里斯达斡尔族区', '黑龙江,齐齐哈尔,梅里斯', '123.752910', '47.309537', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1071, 149404, 2, 149079, '230221000000', '龙江县', '黑龙江,齐齐哈尔,龙江', '123.205323', '47.338665', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1072, 149588, 2, 149079, '230223000000', '依安县', '黑龙江,齐齐哈尔,依安', '125.306279', '47.893548', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1073, 149767, 2, 149079, '230224000000', '泰来县', '黑龙江,齐齐哈尔,泰来', '123.416631', '46.393694', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1074, 149896, 2, 149079, '230225000000', '甘南县', '黑龙江,齐齐哈尔,甘南', '123.507429', '47.922406', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1075, 150046, 2, 149079, '230227000000', '富裕县', '黑龙江,齐齐哈尔,富裕', '124.473793', '47.774347', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1076, 150168, 2, 149079, '230229000000', '克山县', '黑龙江,齐齐哈尔,克山', '125.875705', '48.037031', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1077, 150337, 2, 149079, '230230000000', '克东县', '黑龙江,齐齐哈尔,克东', '126.248721', '48.042060', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1078, 150471, 2, 149079, '230231000000', '拜泉县', '黑龙江,齐齐哈尔,拜泉', '126.100213', '47.595851', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1079, 150680, 2, 149079, '230281000000', '讷河市', '黑龙江,齐齐哈尔,讷河', '124.884244', '48.484099', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1080, 150916, 2, 150915, '230301000000', '市辖区', '黑龙江,鸡西', '130.969333', '45.295075', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1081, 150917, 2, 150915, '230302000000', '鸡冠区', '黑龙江,鸡西,鸡冠', '130.980894', '45.304073', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1082, 150984, 2, 150915, '230303000000', '恒山区', '黑龙江,鸡西,恒山', '130.904963', '45.210668', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1083, 151039, 2, 150915, '230304000000', '滴道区', '黑龙江,鸡西,滴道', '130.843613', '45.348764', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1084, 151084, 2, 150915, '230305000000', '梨树区', '黑龙江,鸡西,梨树', '130.696990', '45.092046', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1085, 151113, 2, 150915, '230306000000', '城子河区', '黑龙江,鸡西,城子河', '131.011304', '45.336970', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1086, 151154, 2, 150915, '230307000000', '麻山区', '黑龙江,鸡西,麻山', '130.478187', '45.212088', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1087, 151177, 2, 150915, '230321000000', '鸡东县', '黑龙江,鸡西,鸡东', '131.124080', '45.260412', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1088, 151347, 2, 150915, '230381000000', '虎林市', '黑龙江,鸡西,虎林', '132.937210', '45.762686', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1089, 151577, 2, 150915, '230382000000', '密山市', '黑龙江,鸡西,密山', '131.846636', '45.529775', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1090, 151831, 2, 151830, '230401000000', '市辖区', '黑龙江,鹤岗', '130.297964', '47.349916', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1091, 151832, 2, 151830, '230402000000', '向阳区', '黑龙江,鹤岗,向阳', '130.294309', '47.342478', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1092, 151855, 2, 151830, '230403000000', '工农区', '黑龙江,鹤岗,工农', '130.274684', '47.318781', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1093, 151880, 2, 151830, '230404000000', '南山区', '黑龙江,鹤岗,南山', '130.287057', '47.315127', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1094, 151912, 2, 151830, '230405000000', '兴安区', '黑龙江,鹤岗,兴安', '130.239245', '47.252850', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1095, 151947, 2, 151830, '230406000000', '东山区', '黑龙江,鹤岗,东山', '130.317062', '47.338535', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1096, 152026, 2, 151830, '230407000000', '兴山区', '黑龙江,鹤岗,兴山', '130.303574', '47.357666', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1097, 152047, 2, 151830, '230421000000', '萝北县', '黑龙江,鹤岗,萝北', '130.828626', '47.577495', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1098, 152237, 2, 151830, '230422000000', '绥滨县', '黑龙江,鹤岗,绥滨', '131.852759', '47.289116', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1099, 152414, 2, 152413, '230501000000', '市辖区', '黑龙江,双鸭山', '131.159133', '46.646508', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1100, 152415, 2, 152413, '230502000000', '尖山区', '黑龙江,双鸭山,尖山', '131.158416', '46.646350', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1101, 152469, 2, 152413, '230503000000', '岭东区', '黑龙江,双鸭山,岭东', '131.164724', '46.592721', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1102, 152508, 2, 152413, '230505000000', '四方台区', '黑龙江,双鸭山,四方台', '131.334503', '46.594316', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1103, 152544, 2, 152413, '230506000000', '宝山区', '黑龙江,双鸭山,宝山', '131.401589', '46.577167', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1104, 152590, 2, 152413, '230521000000', '集贤县', '黑龙江,双鸭山,集贤', '131.140483', '46.728377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1105, 152810, 2, 152413, '230522000000', '友谊县', '黑龙江,双鸭山,友谊', '131.808064', '46.767299', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1106, 152910, 2, 152413, '230523000000', '宝清县', '黑龙江,双鸭山,宝清', '132.197243', '46.326925', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1107, 153142, 2, 152413, '230524000000', '饶河县', '黑龙江,双鸭山,饶河', '134.013872', '46.798164', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1108, 153314, 2, 153313, '230601000000', '市辖区', '黑龙江,大庆', '125.103784', '46.589309', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1109, 153315, 2, 153313, '230602000000', '萨尔图区', '黑龙江,大庆,萨尔图', '125.114643', '46.596356', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1110, 153371, 2, 153313, '230603000000', '龙凤区', '黑龙江,大庆,龙凤', '125.135326', '46.562247', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1111, 153423, 2, 153313, '230604000000', '让胡路区', '黑龙江,大庆,让胡路', '124.870597', '46.652358', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1112, 153513, 2, 153313, '230605000000', '红岗区', '黑龙江,大庆,红岗', '124.891039', '46.398418', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1113, 153561, 2, 153313, '230606000000', '大同区', '黑龙江,大庆,大同', '124.812364', '46.039828', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1114, 153659, 2, 153313, '230621000000', '肇州县', '黑龙江,大庆,肇州', '125.268643', '45.699066', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1115, 153791, 2, 153313, '230622000000', '肇源县', '黑龙江,大庆,肇源', '125.078223', '45.519320', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1116, 153974, 2, 153313, '230623000000', '林甸县', '黑龙江,大庆,林甸', '124.863603', '47.171717', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1117, 154082, 2, 153313, '230624000000', '杜尔伯特蒙古族自治县', '黑龙江,大庆,杜尔伯特', '124.446705', '46.866580', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1118, 154202, 2, 154201, '230701000000', '市辖区', '黑龙江,伊春', '128.841147', '47.727536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1119, 154203, 2, 154201, '230702000000', '伊春区', '黑龙江,伊春,伊春', '128.907303', '47.728171', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1120, 154252, 2, 154201, '230703000000', '南岔区', '黑龙江,伊春,南岔', '129.283467', '47.138035', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1121, 154342, 2, 154201, '230704000000', '友好区', '黑龙江,伊春,友好', '128.840750', '47.853778', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1122, 154389, 2, 154201, '230705000000', '西林区', '黑龙江,伊春,西林', '129.312851', '47.480735', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1123, 154404, 2, 154201, '230706000000', '翠峦区', '黑龙江,伊春,翠峦', '128.669859', '47.726728', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1124, 154434, 2, 154201, '230707000000', '新青区', '黑龙江,伊春,新青', '129.533600', '48.290455', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1125, 154473, 2, 154201, '230708000000', '美溪区', '黑龙江,伊春,美溪', '129.129314', '47.635090', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1126, 154511, 2, 154201, '230709000000', '金山屯区', '黑龙江,伊春,金山屯', '129.429117', '47.413074', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1127, 154547, 2, 154201, '230710000000', '五营区', '黑龙江,伊春,五营', '129.245344', '48.107910', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1128, 154579, 2, 154201, '230711000000', '乌马河区', '黑龙江,伊春,乌马河', '128.799478', '47.727687', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1129, 154616, 2, 154201, '230712000000', '汤旺河区', '黑龙江,伊春,汤旺河', '129.571108', '48.454651', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1130, 154659, 2, 154201, '230713000000', '带岭区', '黑龙江,伊春,带岭', '129.020793', '47.028397', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1131, 154695, 2, 154201, '230714000000', '乌伊岭区', '黑龙江,伊春,乌伊岭', '129.437920', '48.590323', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1132, 154729, 2, 154201, '230715000000', '红星区', '黑龙江,伊春,红星', '129.390983', '48.239432', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1133, 154759, 2, 154201, '230716000000', '上甘岭区', '黑龙江,伊春,上甘岭', '129.024260', '47.974708', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1134, 154793, 2, 154201, '230722000000', '嘉荫县', '黑龙江,伊春,嘉荫', '130.403564', '48.889109', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1135, 154899, 2, 154201, '230781000000', '铁力市', '黑龙江,伊春,铁力', '128.032422', '46.986640', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1136, 155077, 2, 155076, '230801000000', '市辖区', '黑龙江,佳木斯', '130.318917', '46.799922', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1137, 155078, 2, 155076, '230803000000', '向阳区', '黑龙江,佳木斯,向阳', '130.365346', '46.807790', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1138, 155166, 2, 155076, '230804000000', '前进区', '黑龙江,佳木斯,前进', '130.375063', '46.814103', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1139, 155191, 2, 155076, '230805000000', '东风区', '黑龙江,佳木斯,东风', '130.403664', '46.822572', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1140, 155254, 2, 155076, '230811000000', '郊区', '黑龙江,佳木斯,郊区', '130.327195', '46.810086', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1141, 155435, 2, 155076, '230822000000', '桦南县', '黑龙江,佳木斯,桦南', '130.553343', '46.239185', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1142, 155702, 2, 155076, '230826000000', '桦川县', '黑龙江,佳木斯,桦川', '130.719081', '47.023001', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1143, 155838, 2, 155076, '230828000000', '汤原县', '黑龙江,佳木斯,汤原', '129.905072', '46.730706', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1144, 156034, 2, 155076, '230881000000', '同江市', '黑龙江,佳木斯,同江', '132.510919', '47.642707', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1145, 156209, 2, 155076, '230882000000', '富锦市', '黑龙江,佳木斯,富锦', '132.037686', '47.250108', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1146, 156599, 2, 155076, '230883000000', '抚远市', '黑龙江,佳木斯,抚远', '134.307884', '48.364687', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1147, 156714, 2, 156713, '230901000000', '市辖区', '黑龙江,七台河', '131.003138', '45.771726', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1148, 156715, 2, 156713, '230902000000', '新兴区', '黑龙江,七台河,新兴', '130.932143', '45.815930', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1149, 156815, 2, 156713, '230903000000', '桃山区', '黑龙江,七台河,桃山', '131.020275', '45.765594', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1150, 156865, 2, 156713, '230904000000', '茄子河区', '黑龙江,七台河,茄子河', '131.068075', '45.785215', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1151, 156956, 2, 156713, '230921000000', '勃利县', '黑龙江,七台河,勃利', '130.592093', '45.755507', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1152, 157131, 2, 157130, '231001000000', '市辖区', '黑龙江,牡丹江', '129.633168', '44.551653', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1153, 157132, 2, 157130, '231002000000', '东安区', '黑龙江,牡丹江,东安', '129.626642', '44.581360', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1154, 157170, 2, 157130, '231003000000', '阳明区', '黑龙江,牡丹江,阳明', '129.635615', '44.596104', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1155, 157273, 2, 157130, '231004000000', '爱民区', '黑龙江,牡丹江,爱民', '129.591657', '44.596053', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1156, 157321, 2, 157130, '231005000000', '西安区', '黑龙江,牡丹江,西安', '129.616121', '44.577625', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1157, 157406, 2, 157130, '231025000000', '林口县', '黑龙江,牡丹江,林口', '130.284033', '45.278046', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1158, 157646, 2, 157130, '231081000000', '绥芬河市', '黑龙江,牡丹江,绥芬河', '131.152546', '44.412309', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1159, 157678, 2, 157130, '231083000000', '海林市', '黑龙江,牡丹江,海林', '129.380482', '44.594213', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1160, 157911, 2, 157130, '231084000000', '宁安市', '黑龙江,牡丹江,宁安', '129.482851', '44.340720', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1161, 158233, 2, 157130, '231085000000', '穆棱市', '黑龙江,牡丹江,穆棱', '130.524437', '44.918813', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1162, 158470, 2, 157130, '231086000000', '东宁市', '黑龙江,牡丹江,东宁', '131.122915', '44.087585', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1163, 158624, 2, 158623, '231101000000', '市辖区', '黑龙江,黑河', '127.528560', '50.245329', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1164, 158625, 2, 158623, '231102000000', '爱辉区', '黑龙江,黑河,爱辉', '127.500451', '50.252106', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1165, 158797, 2, 158623, '231121000000', '嫩江县', '黑龙江,黑河,嫩江', '125.221192', '49.185766', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1166, 159105, 2, 158623, '231123000000', '逊克县', '黑龙江,黑河,逊克', '128.478750', '49.564252', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1167, 159220, 2, 158623, '231124000000', '孙吴县', '黑龙江,黑河,孙吴', '127.336304', '49.425652', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1168, 159359, 2, 158623, '231181000000', '北安市', '黑龙江,黑河,北安', '126.491199', '48.241374', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1169, 159526, 2, 158623, '231182000000', '五大连池市', '黑龙江,黑河,五大连池', '126.205516', '48.517257', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1170, 159770, 2, 159769, '231201000000', '市辖区', '黑龙江,绥化', '126.968887', '46.653845', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1171, 159771, 2, 159769, '231202000000', '北林区', '黑龙江,绥化,北林', '126.985593', '46.637344', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1172, 159985, 2, 159769, '231221000000', '望奎县', '黑龙江,绥化,望奎', '126.486076', '46.832719', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1173, 160128, 2, 159769, '231222000000', '兰西县', '黑龙江,绥化,兰西', '126.288113', '46.252447', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1174, 160271, 2, 159769, '231223000000', '青冈县', '黑龙江,绥化,青冈', '126.113860', '46.689671', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1175, 160478, 2, 159769, '231224000000', '庆安县', '黑龙江,绥化,庆安', '127.507825', '46.880102', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1176, 160610, 2, 159769, '231225000000', '明水县', '黑龙江,绥化,明水', '125.906301', '47.173426', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1177, 160744, 2, 159769, '231226000000', '绥棱县', '黑龙江,绥化,绥棱', '127.114832', '47.236015', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1178, 160910, 2, 159769, '231281000000', '安达市', '黑龙江,绥化,安达', '125.352188', '46.423508', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1179, 161079, 2, 159769, '231282000000', '肇东市', '黑龙江,绥化,肇东', '125.961814', '46.051126', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1180, 161331, 2, 159769, '231283000000', '海伦市', '黑龙江,绥化,海伦', '126.973143', '47.461971', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1181, 161652, 2, 161651, '232721000000', '呼玛县', '黑龙江,大兴安岭,呼玛', '126.665319', '51.725637', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1182, 161720, 2, 161651, '232722000000', '塔河县', '黑龙江,大兴安岭,塔河', '124.709996', '52.334457', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1183, 161754, 2, 161651, '232723000000', '漠河县', '黑龙江,大兴安岭,漠河', '122.538592', '52.972272', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1184, 161794, 2, 161793, '310101000000', '黄浦区', '上海,黄浦', '121.484443', '31.231763', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1185, 161988, 2, 161793, '310104000000', '徐汇区', '上海,徐汇', '121.436525', '31.188523', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1186, 162309, 2, 161793, '310105000000', '长宁区', '上海,长宁', '121.424624', '31.220367', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1187, 162505, 2, 161793, '310106000000', '静安区', '上海,静安', '121.459384', '31.247105', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1188, 162794, 2, 161793, '310107000000', '普陀区', '上海,普陀', '121.395555', '31.249840', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1189, 163069, 2, 161793, '310109000000', '虹口区', '上海,虹口', '121.505133', '31.264600', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1190, 163290, 2, 161793, '310110000000', '杨浦区', '上海,杨浦', '121.526077', '31.259541', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1191, 163621, 2, 161793, '310112000000', '闵行区', '上海,闵行', '121.381709', '31.112813', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1192, 164194, 2, 161793, '310113000000', '宝山区', '上海,宝山', '121.489612', '31.405457', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1193, 164682, 2, 161793, '310114000000', '嘉定区', '上海,嘉定', '121.265300', '31.375602', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1194, 165026, 2, 161793, '310115000000', '浦东新区', '上海,浦东', '121.544379', '31.221517', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1195, 166350, 2, 161793, '310116000000', '金山区', '上海,金山', '121.341970', '30.741991', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1196, 166585, 2, 161793, '310117000000', '松江区', '上海,松江', '121.227747', '31.032243', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1197, 166927, 2, 161793, '310118000000', '青浦区', '上海,青浦', '121.124178', '31.150681', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1198, 167228, 2, 161793, '310120000000', '奉贤区', '上海,奉贤', '121.474042', '30.917795', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1199, 167533, 2, 161793, '310151000000', '崇明区', '上海,崇明', '121.473701', '31.230416', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1200, 167906, 2, 167905, '320101000000', '市辖区', '江苏,南京', '118.796877', '32.060255', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1201, 167907, 2, 167905, '320102000000', '玄武区', '江苏,南京,玄武', '118.797861', '32.048687', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1202, 167974, 2, 167905, '320104000000', '秦淮区', '江苏,南京,秦淮', '118.794744', '32.039133', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1203, 168104, 2, 167905, '320105000000', '建邺区', '江苏,南京,建邺', '118.731694', '32.003552', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1204, 168174, 2, 167905, '320106000000', '鼓楼区', '江苏,南京,鼓楼', '118.769790', '32.066336', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1205, 168310, 2, 167905, '320111000000', '浦口区', '江苏,南京,浦口', '118.627895', '32.059093', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1206, 168451, 2, 167905, '320113000000', '栖霞区', '江苏,南京,栖霞', '118.909246', '32.096228', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1207, 168604, 2, 167905, '320114000000', '雨花台区', '江苏,南京,雨花台', '118.779073', '31.991347', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1208, 168704, 2, 167905, '320115000000', '江宁区', '江苏,南京,江宁', '118.839685', '31.953702', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1209, 168925, 2, 167905, '320116000000', '六合区', '江苏,南京,六合', '118.821401', '32.322247', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1210, 169096, 2, 167905, '320117000000', '溧水区', '江苏,南京,溧水', '119.028296', '31.651125', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1211, 169214, 2, 167905, '320118000000', '高淳区', '江苏,南京,高淳', '118.892085', '31.328471', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1212, 169376, 2, 169375, '320201000000', '市辖区', '江苏,无锡', '120.311910', '31.491169', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1213, 169377, 2, 169375, '320205000000', '锡山区', '江苏,无锡,锡山', '120.357858', '31.589715', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1214, 169507, 2, 169375, '320206000000', '惠山区', '江苏,无锡,惠山', '120.298500', '31.681012', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1215, 169628, 2, 169375, '320211000000', '滨湖区', '江苏,无锡,滨湖', '120.282692', '31.527954', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1216, 169751, 2, 169375, '320213000000', '梁溪区', '江苏,无锡,梁溪', '120.296591', '31.575719', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1217, 169924, 2, 169375, '320214000000', '新吴区', '江苏,无锡,新吴', '120.352778', '31.550957', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1218, 170064, 2, 169375, '320281000000', '江阴市', '江苏,无锡,江阴', '120.284939', '31.920658', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1219, 170390, 2, 169375, '320282000000', '宜兴市', '江苏,无锡,宜兴', '119.823308', '31.340637', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1220, 170725, 2, 170724, '320301000000', '市辖区', '江苏,徐州', '117.284124', '34.205768', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1221, 170726, 2, 170724, '320302000000', '鼓楼区', '江苏,徐州,鼓楼', '117.185591', '34.288511', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1222, 170800, 2, 170724, '320303000000', '云龙区', '江苏,徐州,云龙', '117.251560', '34.253167', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1223, 170886, 2, 170724, '320305000000', '贾汪区', '江苏,徐州,贾汪', '117.466687', '34.435506', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1224, 171049, 2, 170724, '320311000000', '泉山区', '江苏,徐州,泉山', '117.193805', '34.244258', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1225, 171182, 2, 170724, '320312000000', '铜山区', '江苏,徐州,铜山', '117.169421', '34.180700', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1226, 171537, 2, 170724, '320321000000', '丰县', '江苏,徐州,丰县', '116.595391', '34.693906', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1227, 171966, 2, 170724, '320322000000', '沛县', '江苏,徐州,沛县', '116.937532', '34.721656', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1228, 172381, 2, 170724, '320324000000', '睢宁县', '江苏,徐州,睢宁', '117.941563', '33.912598', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1229, 172804, 2, 170724, '320381000000', '新沂市', '江苏,徐州,新沂', '118.354537', '34.369580', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1230, 173105, 2, 170724, '320382000000', '邳州市', '江苏,徐州,邳州', '118.012531', '34.338888', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1231, 173636, 2, 173635, '320401000000', '市辖区', '江苏,常州', '119.973987', '31.810689', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1232, 173637, 2, 173635, '320402000000', '天宁区', '江苏,常州,天宁', '119.974991', '31.779619', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1233, 173773, 2, 173635, '320404000000', '钟楼区', '江苏,常州,钟楼', '119.902112', '31.802192', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1234, 173891, 2, 173635, '320411000000', '新北区', '江苏,常州,新北', '119.972182', '31.830641', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1235, 174038, 2, 173635, '320412000000', '武进区', '江苏,常州,武进', '119.942437', '31.701188', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1236, 174347, 2, 173635, '320413000000', '金坛区', '江苏,常州,金坛', '119.597897', '31.723247', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1237, 174508, 2, 173635, '320481000000', '溧阳市', '江苏,常州,溧阳', '119.484211', '31.416911', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1238, 174765, 2, 174764, '320501000000', '市辖区', '江苏,苏州', '120.585315', '31.298886', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1239, 174766, 2, 174764, '320505000000', '虎丘区', '江苏,苏州,虎丘', '120.566833', '31.294845', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1240, 174872, 2, 174764, '320506000000', '吴中区', '江苏,苏州,吴中', '120.631898', '31.264212', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1241, 175088, 2, 174764, '320507000000', '相城区', '江苏,苏州,相城', '120.642663', '31.369088', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1242, 175247, 2, 174764, '320508000000', '姑苏区', '江苏,苏州,姑苏', '120.617296', '31.336392', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1243, 175444, 2, 174764, '320509000000', '吴江区', '江苏,苏州,吴江', '120.645158', '31.138677', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1244, 175765, 2, 174764, '320581000000', '常熟市', '江苏,苏州,常熟', '120.752481', '31.654376', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1245, 176120, 2, 174764, '320582000000', '张家港市', '江苏,苏州,张家港', '120.553200', '31.870405', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1246, 176424, 2, 174764, '320583000000', '昆山市', '江苏,苏州,昆山', '120.980737', '31.385598', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1247, 176763, 2, 174764, '320585000000', '太仓市', '江苏,苏州,太仓', '121.130550', '31.457735', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1248, 176921, 2, 176920, '320601000000', '市辖区', '江苏,南通', '120.894291', '31.980171', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1249, 176922, 2, 176920, '320602000000', '崇川区', '江苏,南通,崇川', '120.857434', '32.009875', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1250, 177040, 2, 176920, '320611000000', '港闸区', '江苏,南通,港闸', '120.818527', '32.032442', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1251, 177119, 2, 176920, '320612000000', '通州区', '江苏,南通,通州', '121.075087', '32.064161', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1252, 177415, 2, 176920, '320621000000', '海安县', '江苏,南通,海安', '120.467370', '32.533549', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1253, 177665, 2, 176920, '320623000000', '如东县', '江苏,南通,如东', '121.185201', '32.331766', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1254, 177946, 2, 176920, '320681000000', '启东市', '江苏,南通,启东', '121.657441', '31.808026', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1255, 178291, 2, 176920, '320682000000', '如皋市', '江苏,南通,如皋', '120.574946', '32.370557', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1256, 178669, 2, 176920, '320684000000', '海门市', '江苏,南通,海门', '121.181615', '31.871173', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1257, 179000, 2, 178999, '320701000000', '市辖区', '江苏,连云港', '119.221611', '34.596653', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1258, 179001, 2, 178999, '320703000000', '连云区', '江苏,连云港,连云', '119.338788', '34.760249', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1259, 179081, 2, 178999, '320706000000', '海州区', '江苏,连云港,海州', '119.193710', '34.606756', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1260, 179296, 2, 178999, '320707000000', '赣榆区', '江苏,连云港,赣榆', '119.173331', '34.841349', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1261, 179786, 2, 178999, '320722000000', '东海县', '江苏,连云港,东海', '118.752842', '34.542309', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1262, 180136, 2, 178999, '320723000000', '灌云县', '江苏,连云港,灌云', '119.239381', '34.284381', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1263, 180493, 2, 178999, '320724000000', '灌南县', '江苏,连云港,灌南', '119.315651', '34.087135', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1264, 180744, 2, 180743, '320801000000', '市辖区', '江苏,淮安', '119.015285', '33.610353', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1265, 180745, 2, 180743, '320803000000', '淮安区', '江苏,淮安,淮安', '119.141099', '33.502869', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1266, 181117, 2, 180743, '320804000000', '淮阴区', '江苏,淮安,淮阴', '119.034725', '33.631893', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1267, 181401, 2, 180743, '320812000000', '清江浦区', '江苏,淮安,清江浦', '119.028099', '33.624341', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1268, 181547, 2, 180743, '320813000000', '洪泽区', '江苏,淮安,洪泽', '119.015285', '33.610353', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1269, 181681, 2, 180743, '320826000000', '涟水县', '江苏,淮安,涟水', '119.260335', '33.780960', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1270, 182092, 2, 180743, '320830000000', '盱眙县', '江苏,淮安,盱眙', '118.544360', '33.011971', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1271, 182372, 2, 180743, '320831000000', '金湖县', '江苏,淮安,金湖', '119.020585', '33.025433', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1272, 182539, 2, 182538, '320901000000', '市辖区', '江苏,盐城', '120.163561', '33.347382', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1273, 182540, 2, 182538, '320902000000', '亭湖区', '江苏,盐城,亭湖', '120.197358', '33.390536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1274, 182762, 2, 182538, '320903000000', '盐都区', '江苏,盐城,盐都', '120.153898', '33.338094', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1275, 183048, 2, 182538, '320904000000', '大丰区', '江苏,盐城,大丰', '120.500858', '33.200331', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1276, 183334, 2, 182538, '320921000000', '响水县', '江苏,盐城,响水', '119.578364', '34.199479', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1277, 183510, 2, 182538, '320922000000', '滨海县', '江苏,盐城,滨海', '119.820831', '33.990334', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1278, 183829, 2, 182538, '320923000000', '阜宁县', '江苏,盐城,阜宁', '119.802527', '33.759325', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1279, 184188, 2, 182538, '320924000000', '射阳县', '江苏,盐城,射阳', '120.258053', '33.774806', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1280, 184485, 2, 182538, '320925000000', '建湖县', '江苏,盐城,建湖', '119.798581', '33.464204', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1281, 184748, 2, 182538, '320981000000', '东台市', '江苏,盐城,东台', '120.320331', '32.868440', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1282, 185202, 2, 185201, '321001000000', '市辖区', '江苏,扬州', '119.412966', '32.394210', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1283, 185203, 2, 185201, '321002000000', '广陵区', '江苏,扬州,广陵', '119.431849', '32.394720', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1284, 185360, 2, 185201, '321003000000', '邗江区', '江苏,扬州,邗江', '119.398015', '32.377528', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1285, 185555, 2, 185201, '321012000000', '江都区', '江苏,扬州,江都', '119.569989', '32.434672', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1286, 185905, 2, 185201, '321023000000', '宝应县', '江苏,扬州,宝应', '119.360729', '33.240392', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1287, 186203, 2, 185201, '321081000000', '仪征市', '江苏,扬州,仪征', '119.184766', '32.272258', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1288, 186414, 2, 185201, '321084000000', '高邮市', '江苏,扬州,高邮', '119.459161', '32.781659', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1289, 186658, 2, 186657, '321101000000', '市辖区', '江苏,镇江', '119.425836', '32.187849', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1290, 186659, 2, 186657, '321102000000', '京口区', '江苏,镇江,京口', '119.470160', '32.198280', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1291, 186734, 2, 186657, '321111000000', '润州区', '江苏,镇江,润州', '119.411945', '32.195333', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1292, 186817, 2, 186657, '321112000000', '丹徒区', '江苏,镇江,丹徒', '119.433854', '32.131962', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1293, 186919, 2, 186657, '321181000000', '丹阳市', '江苏,镇江,丹阳', '119.606536', '32.010117', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1294, 187149, 2, 186657, '321182000000', '扬中市', '江苏,镇江,扬中', '119.797635', '32.234831', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1295, 187235, 2, 186657, '321183000000', '句容市', '江苏,镇江,句容', '119.168695', '31.944999', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1296, 187442, 2, 187441, '321201000000', '市辖区', '江苏,泰州', '119.923116', '32.455778', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1297, 187443, 2, 187441, '321202000000', '海陵区', '江苏,泰州,海陵', '119.919425', '32.491016', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1298, 187593, 2, 187441, '321203000000', '高港区', '江苏,泰州,高港', '119.881717', '32.318822', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1299, 187693, 2, 187441, '321204000000', '姜堰区', '江苏,泰州,姜堰', '120.127934', '32.509155', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1300, 188035, 2, 187441, '321281000000', '兴化市', '江苏,泰州,兴化', '119.852541', '32.910459', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1301, 188752, 2, 187441, '321282000000', '靖江市', '江苏,泰州,靖江', '120.277138', '31.982751', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1302, 189026, 2, 187441, '321283000000', '泰兴市', '江苏,泰州,泰兴', '120.051744', '32.171854', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1303, 189403, 2, 189402, '321301000000', '市辖区', '江苏,宿迁', '118.275198', '33.963232', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1304, 189404, 2, 189402, '321302000000', '宿城区', '江苏,宿迁,宿城', '118.242534', '33.963029', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1305, 189637, 2, 189402, '321311000000', '宿豫区', '江苏,宿迁,宿豫', '118.330782', '33.946822', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1306, 189850, 2, 189402, '321322000000', '沭阳县', '江苏,宿迁,沭阳', '118.804784', '34.111022', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1307, 190377, 2, 189402, '321323000000', '泗阳县', '江苏,宿迁,泗阳', '118.703038', '33.723140', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1308, 190642, 2, 189402, '321324000000', '泗洪县', '江苏,宿迁,泗洪', '118.223591', '33.476051', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1309, 191021, 2, 191020, '330101000000', '市辖区', '浙江,杭州', '120.155070', '30.274084', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1310, 191022, 2, 191020, '330102000000', '上城区', '浙江,杭州,上城', '120.169329', '30.242312', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1311, 191083, 2, 191020, '330103000000', '下城区', '浙江,杭州,下城', '120.180895', '30.281714', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1312, 191166, 2, 191020, '330104000000', '江干区', '浙江,杭州,江干', '120.205001', '30.257012', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1313, 191360, 2, 191020, '330105000000', '拱墅区', '浙江,杭州,拱墅', '120.141406', '30.319037', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1314, 191479, 2, 191020, '330106000000', '西湖区', '浙江,杭州,西湖', '120.130203', '30.259324', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1315, 191693, 2, 191020, '330108000000', '滨江区', '浙江,杭州,滨江', '120.211816', '30.208560', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1316, 191756, 2, 191020, '330109000000', '萧山区', '浙江,杭州,萧山', '120.264253', '30.183806', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1317, 192388, 2, 191020, '330110000000', '余杭区', '浙江,杭州,余杭', '120.299402', '30.419045', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1318, 192753, 2, 191020, '330111000000', '富阳区', '浙江,杭州,富阳', '119.960076', '30.048692', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1319, 193085, 2, 191020, '330122000000', '桐庐县', '浙江,杭州,桐庐', '119.691434', '29.793535', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1320, 193304, 2, 191020, '330127000000', '淳安县', '浙江,杭州,淳安', '119.041864', '29.608772', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1321, 193766, 2, 191020, '330182000000', '建德市', '浙江,杭州,建德', '119.281164', '29.474871', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1322, 194060, 2, 191020, '330185000000', '临安市', '浙江,杭州,临安', '119.724733', '30.233873', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1323, 194396, 2, 194395, '330201000000', '市辖区', '浙江,宁波', '121.550357', '29.874556', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1324, 194397, 2, 194395, '330203000000', '海曙区', '浙江,宁波,海曙', '121.551066', '29.859772', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1325, 194484, 2, 194395, '330204000000', '江东区', '浙江,宁波,江东', '121.570383', '29.866819', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1326, 194568, 2, 194395, '330205000000', '江北区', '浙江,宁波,江北', '121.555227', '29.886757', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1327, 194747, 2, 194395, '330206000000', '北仑区', '浙江,宁波,北仑', '121.844618', '29.899044', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1328, 195023, 2, 194395, '330211000000', '镇海区', '浙江,宁波,镇海', '121.716540', '29.948998', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1329, 195132, 2, 194395, '330212000000', '鄞州区', '浙江,宁波,鄞州', '121.546603', '29.816511', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1330, 195703, 2, 194395, '330225000000', '象山县', '浙江,宁波,象山', '121.869339', '29.476705', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1331, 196257, 2, 194395, '330226000000', '宁海县', '浙江,宁波,宁海', '121.429477', '29.287939', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1332, 196686, 2, 194395, '330281000000', '余姚市', '浙江,宁波,余姚', '121.154634', '30.037192', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1333, 197031, 2, 194395, '330282000000', '慈溪市', '浙江,宁波,慈溪', '121.266579', '30.169665', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1334, 197440, 2, 194395, '330283000000', '奉化市', '浙江,宁波,奉化', '121.406995', '29.655143', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1335, 197851, 2, 197850, '330301000000', '市辖区', '浙江,温州', '120.699366', '27.994267', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1336, 197852, 2, 197850, '330302000000', '鹿城区', '浙江,温州,鹿城', '120.655135', '28.015455', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1337, 198091, 2, 197850, '330303000000', '龙湾区', '浙江,温州,龙湾', '120.811213', '27.932747', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1338, 198210, 2, 197850, '330304000000', '瓯海区', '浙江,温州,瓯海', '120.614910', '27.966844', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1339, 198508, 2, 197850, '330305000000', '洞头区', '浙江,温州,洞头', '121.157249', '27.836154', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1340, 198619, 2, 197850, '330324000000', '永嘉县', '浙江,温州,永嘉', '120.682144', '28.150591', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1341, 199581, 2, 197850, '330326000000', '平阳县', '浙江,温州,平阳', '120.565793', '27.661918', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1342, 200239, 2, 197850, '330327000000', '苍南县', '浙江,温州,苍南', '120.425766', '27.518280', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1343, 201140, 2, 197850, '330328000000', '文成县', '浙江,温州,文成', '120.091498', '27.786996', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1344, 201556, 2, 197850, '330329000000', '泰顺县', '浙江,温州,泰顺', '119.717649', '27.556884', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1345, 201882, 2, 197850, '330381000000', '瑞安市', '浙江,温州,瑞安', '120.655148', '27.778657', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1346, 202864, 2, 197850, '330382000000', '乐清市', '浙江,温州,乐清', '120.967147', '28.116083', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1347, 203853, 2, 203852, '330401000000', '市辖区', '浙江,嘉兴', '120.755486', '30.746129', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1348, 203854, 2, 203852, '330402000000', '南湖区', '浙江,嘉兴,南湖', '120.783025', '30.747842', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1349, 204008, 2, 203852, '330411000000', '秀洲区', '浙江,嘉兴,秀洲', '120.709018', '30.765168', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1350, 204177, 2, 203852, '330421000000', '嘉善县', '浙江,嘉兴,嘉善', '120.925850', '30.830898', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1351, 204341, 2, 203852, '330424000000', '海盐县', '浙江,嘉兴,海盐', '120.946263', '30.526436', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1352, 204486, 2, 203852, '330481000000', '海宁市', '浙江,嘉兴,海宁', '120.680757', '30.510659', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1353, 204723, 2, 203852, '330482000000', '平湖市', '浙江,嘉兴,平湖', '121.015142', '30.677233', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1354, 204877, 2, 203852, '330483000000', '桐乡市', '浙江,嘉兴,桐乡', '120.565099', '30.630173', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1355, 205102, 2, 205101, '330501000000', '市辖区', '浙江,湖州', '120.086823', '30.894348', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1356, 205103, 2, 205101, '330502000000', '吴兴区', '浙江,湖州,吴兴', '120.185838', '30.857151', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1357, 205449, 2, 205101, '330503000000', '南浔区', '浙江,湖州,南浔', '120.418512', '30.849690', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1358, 205717, 2, 205101, '330521000000', '德清县', '浙江,湖州,德清', '119.977401', '30.542510', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1359, 205910, 2, 205101, '330522000000', '长兴县', '浙江,湖州,长兴', '119.910952', '31.026666', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1360, 206213, 2, 205101, '330523000000', '安吉县', '浙江,湖州,安吉', '119.680353', '30.638675', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1361, 206439, 2, 206438, '330601000000', '市辖区', '浙江,绍兴', '120.580232', '30.029752', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1362, 206440, 2, 206438, '330602000000', '越城区', '浙江,绍兴,越城', '120.582633', '29.988245', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1363, 206875, 2, 206438, '330603000000', '柯桥区', '浙江,绍兴,柯桥', '120.495065', '30.081942', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1364, 207247, 2, 206438, '330604000000', '上虞区', '浙江,绍兴,上虞', '120.868122', '30.033121', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1365, 207715, 2, 206438, '330624000000', '新昌县', '浙江,绍兴,新昌', '120.903866', '29.499832', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1366, 208171, 2, 206438, '330681000000', '诸暨市', '浙江,绍兴,诸暨', '120.246863', '29.708692', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1367, 208733, 2, 206438, '330683000000', '嵊州市', '浙江,绍兴,嵊州', '120.831025', '29.561410', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1368, 209251, 2, 209250, '330701000000', '市辖区', '浙江,金华', '119.647444', '29.079059', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1369, 209252, 2, 209250, '330702000000', '婺城区', '浙江,金华,婺城', '119.571633', '29.086221', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1370, 209949, 2, 209250, '330703000000', '金东区', '浙江,金华,金东', '119.692862', '29.099122', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1371, 210474, 2, 209250, '330723000000', '武义县', '浙江,金华,武义', '119.816318', '28.892721', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1372, 211047, 2, 209250, '330726000000', '浦江县', '浙江,金华,浦江', '119.892222', '29.452477', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1373, 211492, 2, 209250, '330727000000', '磐安县', '浙江,金华,磐安', '120.450178', '29.054048', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1374, 211883, 2, 209250, '330781000000', '兰溪市', '浙江,金华,兰溪', '119.460526', '29.208919', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1375, 212256, 2, 209250, '330782000000', '义乌市', '浙江,金华,义乌', '120.075058', '29.306841', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1376, 213076, 2, 209250, '330783000000', '东阳市', '浙江,金华,东阳', '120.241566', '29.289648', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1377, 213485, 2, 209250, '330784000000', '永康市', '浙江,金华,永康', '120.047651', '28.888555', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1378, 214261, 2, 214260, '330801000000', '市辖区', '浙江,衢州', '118.859457', '28.970079', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1379, 214262, 2, 214260, '330802000000', '柯城区', '浙江,衢州,柯城', '118.871333', '28.968504', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1380, 214536, 2, 214260, '330803000000', '衢江区', '浙江,衢州,衢江', '118.959460', '28.979780', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1381, 214843, 2, 214260, '330822000000', '常山县', '浙江,衢州,常山', '118.511287', '28.901343', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1382, 215051, 2, 214260, '330824000000', '开化县', '浙江,衢州,开化', '118.415495', '29.137337', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1383, 215332, 2, 214260, '330825000000', '龙游县', '浙江,衢州,龙游', '119.172304', '29.028319', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1384, 215624, 2, 214260, '330881000000', '江山市', '浙江,衢州,江山', '118.626974', '28.737223', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1385, 215956, 2, 215955, '330901000000', '市辖区', '浙江,舟山', '122.207215', '29.985295', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1386, 215957, 2, 215955, '330902000000', '定海区', '浙江,舟山,定海', '122.106773', '30.019858', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1387, 216139, 2, 215955, '330903000000', '普陀区', '浙江,舟山,普陀', '122.323867', '29.971760', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1388, 216290, 2, 215955, '330921000000', '岱山县', '浙江,舟山,岱山', '122.226237', '30.264139', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1389, 216394, 2, 215955, '330922000000', '嵊泗县', '浙江,舟山,嵊泗', '122.451382', '30.725686', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1390, 216450, 2, 216449, '331001000000', '市辖区', '浙江,台州', '121.420757', '28.656386', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1391, 216451, 2, 216449, '331002000000', '椒江区', '浙江,台州,椒江', '121.442676', '28.673726', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1392, 216788, 2, 216449, '331003000000', '黄岩区', '浙江,台州,黄岩', '121.261893', '28.650117', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1393, 217324, 2, 216449, '331004000000', '路桥区', '浙江,台州,路桥', '121.365123', '28.582655', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1394, 217666, 2, 216449, '331021000000', '玉环县', '浙江,台州,玉环', '121.231805', '28.135930', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1395, 217998, 2, 216449, '331022000000', '三门县', '浙江,台州,三门', '121.395777', '29.104873', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1396, 218534, 2, 216449, '331023000000', '天台县', '浙江,台州,天台', '121.006725', '29.144079', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1397, 219162, 2, 216449, '331024000000', '仙居县', '浙江,台州,仙居', '120.735081', '28.849213', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1398, 219609, 2, 216449, '331081000000', '温岭市', '浙江,台州,温岭', '121.385604', '28.372506', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1399, 220555, 2, 216449, '331082000000', '临海市', '浙江,台州,临海', '121.145047', '28.858457', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1400, 221611, 2, 221610, '331101000000', '市辖区', '浙江,丽水', '119.922796', '28.467630', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1401, 221612, 2, 221610, '331102000000', '莲都区', '浙江,丽水,莲都', '119.912612', '28.445836', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1402, 221903, 2, 221610, '331121000000', '青田县', '浙江,丽水,青田', '120.289597', '28.139059', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1403, 222380, 2, 221610, '331122000000', '缙云县', '浙江,丽水,缙云', '120.091573', '28.659279', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1404, 222658, 2, 221610, '331123000000', '遂昌县', '浙江,丽水,遂昌', '119.276104', '28.592119', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1405, 222890, 2, 221610, '331124000000', '松阳县', '浙江,丽水,松阳', '119.482015', '28.449171', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1406, 223324, 2, 221610, '331125000000', '云和县', '浙江,丽水,云和', '119.573397', '28.115790', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1407, 223512, 2, 221610, '331126000000', '庆元县', '浙江,丽水,庆元', '119.062590', '27.619220', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1408, 223885, 2, 221610, '331127000000', '景宁畲族自治县', '浙江,丽水,景宁', '119.635697', '27.973312', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1409, 224172, 2, 221610, '331181000000', '龙泉市', '浙江,丽水,龙泉', '119.141461', '28.074623', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1410, 224651, 2, 224650, '340101000000', '市辖区', '安徽,合肥', '117.227239', '31.820586', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1411, 224652, 2, 224650, '340102000000', '瑶海区', '安徽,合肥,瑶海', '117.309229', '31.858048', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1412, 224755, 2, 224650, '340103000000', '庐阳区', '安徽,合肥,庐阳', '117.264595', '31.878641', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1413, 224838, 2, 224650, '340104000000', '蜀山区', '安徽,合肥,蜀山', '117.260536', '31.851158', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1414, 224946, 2, 224650, '340111000000', '包河区', '安徽,合肥,包河', '117.309658', '31.793093', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1415, 225062, 2, 224650, '340121000000', '长丰县', '安徽,合肥,长丰', '117.167564', '32.478018', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1416, 225352, 2, 224650, '340122000000', '肥东县', '安徽,合肥,肥东', '117.469383', '31.887940', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1417, 225705, 2, 224650, '340123000000', '肥西县', '安徽,合肥,肥西', '117.157981', '31.706810', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1418, 225998, 2, 224650, '340124000000', '庐江县', '安徽,合肥,庐江', '117.287800', '31.255550', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1419, 226249, 2, 224650, '340181000000', '巢湖市', '安徽,合肥,巢湖', '117.861800', '31.598628', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1420, 226470, 2, 226469, '340201000000', '市辖区', '安徽,芜湖', '118.432941', '31.352859', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1421, 226471, 2, 226469, '340202000000', '镜湖区', '安徽,芜湖,镜湖', '118.385146', '31.340404', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1422, 226550, 2, 226469, '340203000000', '弋江区', '安徽,芜湖,弋江', '118.372655', '31.311757', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1423, 226612, 2, 226469, '340207000000', '鸠江区', '安徽,芜湖,鸠江', '118.391734', '31.369373', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1424, 226735, 2, 226469, '340208000000', '三山区', '安徽,芜湖,三山', '118.268101', '31.219568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1425, 226786, 2, 226469, '340221000000', '芜湖县', '安徽,芜湖,芜湖', '118.576124', '31.134809', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1426, 226891, 2, 226469, '340222000000', '繁昌县', '安徽,芜湖,繁昌', '118.201349', '31.080896', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1427, 226995, 2, 226469, '340223000000', '南陵县', '安徽,芜湖,南陵', '118.334360', '30.914923', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1428, 227183, 2, 226469, '340225000000', '无为县', '安徽,芜湖,无为', '117.902366', '31.303168', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1429, 227483, 2, 227482, '340301000000', '市辖区', '安徽,蚌埠', '117.389719', '32.916287', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1430, 227484, 2, 227482, '340302000000', '龙子湖区', '安徽,蚌埠,龙子湖', '117.393790', '32.943014', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1431, 227551, 2, 227482, '340303000000', '蚌山区', '安徽,蚌埠,蚌山', '117.367614', '32.944198', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1432, 227598, 2, 227482, '340304000000', '禹会区', '安徽,蚌埠,禹会', '117.342451', '32.929711', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1433, 227677, 2, 227482, '340311000000', '淮上区', '安徽,蚌埠,淮上', '117.359331', '32.965435', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1434, 227769, 2, 227482, '340321000000', '怀远县', '安徽,蚌埠,怀远', '117.205234', '32.970031', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1435, 228155, 2, 227482, '340322000000', '五河县', '安徽,蚌埠,五河', '117.879486', '33.127823', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1436, 228388, 2, 227482, '340323000000', '固镇县', '安徽,蚌埠,固镇', '117.316955', '33.316899', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1437, 228631, 2, 228630, '340401000000', '市辖区', '安徽,淮南', '116.999932', '32.625478', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1438, 228632, 2, 228630, '340402000000', '大通区', '安徽,淮南,大通', '117.053273', '32.631533', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1439, 228710, 2, 228630, '340403000000', '田家庵区', '安徽,淮南,田家庵', '117.017409', '32.647155', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1440, 228853, 2, 228630, '340404000000', '谢家集区', '安徽,淮南,谢家集', '116.859048', '32.599901', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1441, 228960, 2, 228630, '340405000000', '八公山区', '安徽,淮南,八公山', '116.833490', '32.631379', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1442, 229029, 2, 228630, '340406000000', '潘集区', '安徽,淮南,潘集', '116.834716', '32.772080', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1443, 229221, 2, 228630, '340421000000', '凤台县', '安徽,淮南,凤台', '116.711051', '32.709445', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1444, 229527, 2, 228630, '340422000000', '寿县', '安徽,淮南,寿县', '116.787141', '32.573306', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1445, 229845, 2, 229844, '340501000000', '市辖区', '安徽,马鞍山', '118.506759', '31.670452', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1446, 229846, 2, 229844, '340503000000', '花山区', '安徽,马鞍山,花山', '118.492562', '31.719710', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1447, 229922, 2, 229844, '340504000000', '雨山区', '安徽,马鞍山,雨山', '118.498560', '31.682208', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1448, 229992, 2, 229844, '340506000000', '博望区', '安徽,马鞍山,博望', '118.844538', '31.558471', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1449, 230041, 2, 229844, '340521000000', '当涂县', '安徽,马鞍山,当涂', '118.497972', '31.571213', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1450, 230213, 2, 229844, '340522000000', '含山县', '安徽,马鞍山,含山', '118.101421', '31.735599', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1451, 230345, 2, 229844, '340523000000', '和县', '安徽,马鞍山,和县', '118.351405', '31.741794', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1452, 230477, 2, 230476, '340601000000', '市辖区', '安徽,淮北', '116.798265', '33.955844', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1453, 230478, 2, 230476, '340602000000', '杜集区', '安徽,淮北,杜集', '116.828134', '33.991451', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1454, 230539, 2, 230476, '340603000000', '相山区', '安徽,淮北,相山', '116.794345', '33.959893', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1455, 230648, 2, 230476, '340604000000', '烈山区', '安徽,淮北,烈山', '116.813042', '33.895139', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1456, 230720, 2, 230476, '340621000000', '濉溪县', '安徽,淮北,濉溪', '116.766299', '33.915477', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1457, 230982, 2, 230981, '340701000000', '市辖区', '安徽,铜陵', '117.812079', '30.945429', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1458, 230983, 2, 230981, '340705000000', '铜官区', '安徽,铜陵,铜官', '117.816174', '30.927608', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1459, 231043, 2, 230981, '340706000000', '义安区', '安徽,铜陵,义安', '117.791544', '30.952823', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1460, 231171, 2, 230981, '340711000000', '郊区', '安徽,铜陵,郊区', '117.807070', '30.908927', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1461, 231216, 2, 230981, '340722000000', '枞阳县', '安徽,铜陵,枞阳', '117.220200', '30.700733', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1462, 231500, 2, 231499, '340801000000', '市辖区', '安徽,安庆', '117.063754', '30.543494', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1463, 231501, 2, 231499, '340802000000', '迎江区', '安徽,安庆,迎江', '117.091150', '30.511548', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1464, 231558, 2, 231499, '340803000000', '大观区', '安徽,安庆,大观', '117.021670', '30.553957', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1465, 231646, 2, 231499, '340811000000', '宜秀区', '安徽,安庆,宜秀', '117.070003', '30.541323', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1466, 231710, 2, 231499, '340822000000', '怀宁县', '安徽,安庆,怀宁', '116.829475', '30.733825', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1467, 231974, 2, 231499, '340824000000', '潜山县', '安徽,安庆,潜山', '116.581270', '30.631129', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1468, 232180, 2, 231499, '340825000000', '太湖县', '安徽,安庆,太湖', '116.308795', '30.454220', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1469, 232386, 2, 231499, '340826000000', '宿松县', '安徽,安庆,宿松', '116.129105', '30.153746', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1470, 232631, 2, 231499, '340827000000', '望江县', '安徽,安庆,望江', '116.694183', '30.124428', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1471, 232781, 2, 231499, '340828000000', '岳西县', '安徽,安庆,岳西', '116.359921', '30.849442', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1472, 232996, 2, 231499, '340881000000', '桐城市', '安徽,安庆,桐城', '116.974120', '31.035800', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1473, 233237, 2, 233236, '341001000000', '市辖区', '安徽,黄山', '118.337481', '29.714655', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1474, 233238, 2, 233236, '341002000000', '屯溪区', '安徽,黄山,屯溪', '118.315329', '29.696109', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1475, 233321, 2, 233236, '341003000000', '黄山区', '安徽,黄山,黄山', '118.141568', '30.272942', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1476, 233423, 2, 233236, '341004000000', '徽州区', '安徽,黄山,徽州', '118.336751', '29.827279', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1477, 233487, 2, 233236, '341021000000', '歙县', '安徽,黄山,歙县', '118.415356', '29.861308', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1478, 233714, 2, 233236, '341022000000', '休宁县', '安徽,黄山,休宁', '118.199179', '29.789095', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1479, 233894, 2, 233236, '341023000000', '黟县', '安徽,黄山,黟县', '117.938373', '29.924805', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1480, 233973, 2, 233236, '341024000000', '祁门县', '安徽,黄山,祁门', '117.717396', '29.854055', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1481, 234110, 2, 234109, '341101000000', '市辖区', '安徽,滁州', '118.317106', '32.301556', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1482, 234111, 2, 234109, '341102000000', '琅琊区', '安徽,滁州,琅琊', '118.305843', '32.294530', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1483, 234174, 2, 234109, '341103000000', '南谯区', '安徽,滁州,南谯', '118.296955', '32.329842', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1484, 234274, 2, 234109, '341122000000', '来安县', '安徽,滁州,来安', '118.435792', '32.452172', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1485, 234434, 2, 234109, '341124000000', '全椒县', '安徽,滁州,全椒', '118.273090', '32.085407', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1486, 234560, 2, 234109, '341125000000', '定远县', '安徽,滁州,定远', '117.698563', '32.530982', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1487, 234847, 2, 234109, '341126000000', '凤阳县', '安徽,滁州,凤阳', '117.531623', '32.874735', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1488, 235112, 2, 234109, '341181000000', '天长市', '安徽,滁州,天长', '119.004817', '32.667571', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1489, 235305, 2, 234109, '341182000000', '明光市', '安徽,滁州,明光', '118.018276', '32.781995', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1490, 235484, 2, 235483, '341201000000', '市辖区', '安徽,阜阳', '115.814204', '32.890124', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1491, 235485, 2, 235483, '341202000000', '颍州区', '安徽,阜阳,颍州', '115.806942', '32.883468', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1492, 235646, 2, 235483, '341203000000', '颍东区', '安徽,阜阳,颍东', '115.856687', '32.912478', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1493, 235778, 2, 235483, '341204000000', '颍泉区', '安徽,阜阳,颍泉', '115.808327', '32.924918', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1494, 235909, 2, 235483, '341221000000', '临泉县', '安徽,阜阳,临泉', '115.261473', '33.040261', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1495, 236338, 2, 235483, '341222000000', '太和县', '安徽,阜阳,太和', '115.621934', '33.160326', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1496, 236685, 2, 235483, '341225000000', '阜南县', '安徽,阜阳,阜南', '115.595644', '32.658297', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1497, 237046, 2, 235483, '341226000000', '颍上县', '安徽,阜阳,颍上', '116.256789', '32.653255', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1498, 237428, 2, 235483, '341282000000', '界首市', '安徽,阜阳,界首', '115.374564', '33.257013', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1499, 237608, 2, 237607, '341301000000', '市辖区', '安徽,宿州', '116.964356', '33.646373', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1500, 237609, 2, 237607, '341302000000', '埇桥区', '安徽,宿州,埇桥', '116.977463', '33.640061', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1501, 238022, 2, 237607, '341321000000', '砀山县', '安徽,宿州,砀山', '116.367095', '34.442561', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1502, 238207, 2, 237607, '341322000000', '萧县', '安徽,宿州,萧县', '116.947290', '34.188728', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1503, 238533, 2, 237607, '341323000000', '灵璧县', '安徽,宿州,灵璧', '117.552462', '33.552998', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1504, 238872, 2, 237607, '341324000000', '泗县', '安徽,宿州,泗县', '117.910629', '33.482982', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1505, 239085, 2, 239084, '341501000000', '市辖区', '安徽,六安', '116.521854', '31.733699', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1506, 239086, 2, 239084, '341502000000', '金安区', '安徽,六安,金安', '116.539679', '31.749265', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1507, 239450, 2, 239084, '341503000000', '裕安区', '安徽,六安,裕安', '116.479920', '31.737813', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1508, 239780, 2, 239084, '341504000000', '叶集区', '安徽,六安,叶集', '116.521854', '31.733699', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1509, 239834, 2, 239084, '341522000000', '霍邱县', '安徽,六安,霍邱', '116.277912', '32.353038', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1510, 240310, 2, 239084, '341523000000', '舒城县', '安徽,六安,舒城', '116.948623', '31.462027', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1511, 240759, 2, 239084, '341524000000', '金寨县', '安徽,六安,金寨', '115.934366', '31.727170', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1512, 241016, 2, 239084, '341525000000', '霍山县', '安徽,六安,霍山', '116.332951', '31.392786', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1513, 241181, 2, 241180, '341601000000', '市辖区', '安徽,亳州', '115.778676', '33.844582', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1514, 241182, 2, 241180, '341602000000', '谯城区', '安徽,亳州,谯城', '115.779025', '33.876235', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1515, 241517, 2, 241180, '341621000000', '涡阳县', '安徽,亳州,涡阳', '116.215665', '33.492921', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1516, 241927, 2, 241180, '341622000000', '蒙城县', '安徽,亳州,蒙城', '116.564248', '33.265831', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1517, 242245, 2, 241180, '341623000000', '利辛县', '安徽,亳州,利辛', '116.208635', '33.144724', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1518, 242635, 2, 242634, '341701000000', '市辖区', '安徽,池州', '117.491568', '30.664800', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1519, 242636, 2, 242634, '341702000000', '贵池区', '安徽,池州,贵池', '117.567379', '30.687181', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1520, 242888, 2, 242634, '341721000000', '东至县', '安徽,池州,东至', '117.027533', '30.111182', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1521, 243159, 2, 242634, '341722000000', '石台县', '安徽,池州,石台', '117.486306', '30.210313', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1522, 243254, 2, 242634, '341723000000', '青阳县', '安徽,池州,青阳', '117.847362', '30.639230', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1523, 243400, 2, 243399, '341801000000', '市辖区', '安徽,宣城', '118.758816', '30.940718', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1524, 243401, 2, 243399, '341802000000', '宣州区', '安徽,宣城,宣州', '118.756328', '30.946319', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1525, 243636, 2, 243399, '341821000000', '郎溪县', '安徽,宣城,郎溪', '119.179657', '31.126412', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1526, 243753, 2, 243399, '341822000000', '广德县', '安徽,宣城,广德', '119.420935', '30.877555', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1527, 243902, 2, 243399, '341823000000', '泾县', '安徽,宣城,泾县', '118.419864', '30.688578', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1528, 244058, 2, 243399, '341824000000', '绩溪县', '安徽,宣城,绩溪', '118.578519', '30.067533', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1529, 244153, 2, 243399, '341825000000', '旌德县', '安徽,宣城,旌德', '118.540487', '30.286350', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1530, 244232, 2, 243399, '341881000000', '宁国市', '安徽,宣城,宁国', '118.982915', '30.633571', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1531, 244379, 2, 244378, '350101000000', '市辖区', '福建,福州', '119.296494', '26.074507', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1532, 244380, 2, 244378, '350102000000', '鼓楼区', '福建,福州,鼓楼', '119.303822', '26.082294', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1533, 244460, 2, 244378, '350103000000', '台江区', '福建,福州,台江', '119.314054', '26.052842', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1534, 244523, 2, 244378, '350104000000', '仓山区', '福建,福州,仓山', '119.273546', '26.046744', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1535, 244713, 2, 244378, '350105000000', '马尾区', '福建,福州,马尾', '119.455589', '25.989500', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1536, 244793, 2, 244378, '350111000000', '晋安区', '福建,福州,晋安', '119.328515', '26.082105', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1537, 244987, 2, 244378, '350121000000', '闽侯县', '福建,福州,闽侯', '119.131725', '26.150047', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1538, 245329, 2, 244378, '350122000000', '连江县', '福建,福州,连江', '119.539704', '26.197364', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1539, 245633, 2, 244378, '350123000000', '罗源县', '福建,福州,罗源', '119.549776', '26.489559', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1540, 245845, 2, 244378, '350124000000', '闽清县', '福建,福州,闽清', '118.863361', '26.221198', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1541, 246154, 2, 244378, '350125000000', '永泰县', '福建,福州,永泰', '118.932592', '25.866695', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1542, 246443, 2, 244378, '350128000000', '平潭县', '福建,福州,平潭', '119.790168', '25.498720', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1543, 246667, 2, 244378, '350181000000', '福清市', '福建,福州,福清', '119.384334', '25.721143', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1544, 247200, 2, 244378, '350182000000', '长乐市', '福建,福州,长乐', '119.523266', '25.962888', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1545, 247479, 2, 247478, '350201000000', '市辖区', '福建,厦门', '118.089425', '24.479833', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1546, 247480, 2, 247478, '350203000000', '思明区', '福建,厦门,思明', '118.082658', '24.445567', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1547, 247590, 2, 247478, '350205000000', '海沧区', '福建,厦门,海沧', '118.032818', '24.484503', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1548, 247641, 2, 247478, '350206000000', '湖里区', '福建,厦门,湖里', '118.146769', '24.512905', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1549, 247704, 2, 247478, '350211000000', '集美区', '福建,厦门,集美', '118.097337', '24.575970', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1550, 247782, 2, 247478, '350212000000', '同安区', '福建,厦门,同安', '118.152149', '24.722747', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1551, 247933, 2, 247478, '350213000000', '翔安区', '福建,厦门,翔安', '118.248034', '24.618544', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1552, 248060, 2, 248059, '350301000000', '市辖区', '福建,莆田', '119.007777', '25.454084', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1553, 248061, 2, 248059, '350302000000', '城厢区', '福建,莆田,城厢', '118.993885', '25.419319', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1554, 248189, 2, 248059, '350303000000', '涵江区', '福建,莆田,涵江', '119.116290', '25.458720', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1555, 248403, 2, 248059, '350304000000', '荔城区', '福建,莆田,荔城', '119.015123', '25.431979', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1556, 248540, 2, 248059, '350305000000', '秀屿区', '福建,莆田,秀屿', '119.105528', '25.318672', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1557, 248753, 2, 248059, '350322000000', '仙游县', '福建,莆田,仙游', '118.691601', '25.362094', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1558, 249099, 2, 249098, '350401000000', '市辖区', '福建,三明', '117.638678', '26.263406', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1559, 249100, 2, 249098, '350402000000', '梅列区', '福建,三明,梅列', '117.645856', '26.271711', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1560, 249157, 2, 249098, '350403000000', '三元区', '福建,三明,三元', '117.608045', '26.234020', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1561, 249245, 2, 249098, '350421000000', '明溪县', '福建,三明,明溪', '117.201847', '26.357379', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1562, 249351, 2, 249098, '350423000000', '清流县', '福建,三明,清流', '116.816909', '26.177797', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1563, 249484, 2, 249098, '350424000000', '宁化县', '福建,三明,宁化', '116.654365', '26.261754', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1564, 249728, 2, 249098, '350425000000', '大田县', '福建,三明,大田', '117.847115', '25.692699', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1565, 250026, 2, 249098, '350426000000', '尤溪县', '福建,三明,尤溪', '118.190467', '26.170171', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1566, 250307, 2, 249098, '350427000000', '沙县', '福建,三明,沙县', '117.792450', '26.397300', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1567, 250512, 2, 249098, '350428000000', '将乐县', '福建,三明,将乐', '117.471373', '26.728953', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1568, 250680, 2, 249098, '350429000000', '泰宁县', '福建,三明,泰宁', '117.175740', '26.900259', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1569, 250809, 2, 249098, '350430000000', '建宁县', '福建,三明,建宁', '116.846084', '26.830902', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1570, 250920, 2, 249098, '350481000000', '永安市', '福建,三明,永安', '117.365053', '25.941937', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1571, 251198, 2, 251197, '350501000000', '市辖区', '福建,泉州', '118.675675', '24.874132', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1572, 251199, 2, 251197, '350502000000', '鲤城区', '福建,泉州,鲤城', '118.586884', '24.907581', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1573, 251289, 2, 251197, '350503000000', '丰泽区', '福建,泉州,丰泽', '118.613173', '24.891173', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1574, 251376, 2, 251197, '350504000000', '洛江区', '福建,泉州,洛江', '118.671193', '24.939796', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1575, 251470, 2, 251197, '350505000000', '泉港区', '福建,泉州,泉港', '118.916309', '25.119815', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1576, 251580, 2, 251197, '350521000000', '惠安县', '福建,泉州,惠安', '118.796605', '25.030781', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1577, 251897, 2, 251197, '350524000000', '安溪县', '福建,泉州,安溪', '118.186289', '25.055955', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1578, 252406, 2, 251197, '350525000000', '永春县', '福建,泉州,永春', '118.294048', '25.321565', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1579, 252665, 2, 251197, '350526000000', '德化县', '福建,泉州,德化', '118.241094', '25.491494', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1580, 252894, 2, 251197, '350527000000', '金门县', '福建,泉州,金门', '118.317089', '24.432706', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1581, 252895, 2, 251197, '350581000000', '石狮市', '福建,泉州,石狮', '118.648066', '24.732204', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1582, 253032, 2, 251197, '350582000000', '晋江市', '福建,泉州,晋江', '118.552365', '24.781681', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1583, 253454, 2, 251197, '350583000000', '南安市', '福建,泉州,南安', '118.386279', '24.960385', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1584, 253906, 2, 253905, '350601000000', '市辖区', '福建,漳州', '117.647481', '24.512948', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1585, 253907, 2, 253905, '350602000000', '芗城区', '福建,漳州,芗城', '117.653975', '24.510900', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1586, 254093, 2, 253905, '350603000000', '龙文区', '福建,漳州,龙文', '117.709755', '24.503113', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1587, 254170, 2, 253905, '350622000000', '云霄县', '福建,漳州,云霄', '117.339573', '23.957936', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1588, 254394, 2, 253905, '350623000000', '漳浦县', '福建,漳州,漳浦', '117.613808', '24.117102', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1589, 254747, 2, 253905, '350624000000', '诏安县', '福建,漳州,诏安', '117.175185', '23.711579', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1590, 255011, 2, 253905, '350625000000', '长泰县', '福建,漳州,长泰', '117.759153', '24.625449', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1591, 255105, 2, 253905, '350626000000', '东山县', '福建,漳州,东山', '117.430061', '23.701262', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1592, 255190, 2, 253905, '350627000000', '南靖县', '福建,漳州,南靖', '117.357321', '24.514654', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1593, 255405, 2, 253905, '350628000000', '平和县', '福建,漳州,平和', '117.314891', '24.363437', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1594, 255680, 2, 253905, '350629000000', '华安县', '福建,漳州,华安', '117.534103', '25.004425', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1595, 255789, 2, 253905, '350681000000', '龙海市', '福建,漳州,龙海', '117.818197', '24.446706', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1596, 256113, 2, 256112, '350701000000', '市辖区', '福建,南平', '118.177708', '26.641768', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1597, 256114, 2, 256112, '350702000000', '延平区', '福建,南平,延平', '118.181894', '26.637457', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1598, 256452, 2, 256112, '350703000000', '建阳区', '福建,南平,建阳', '118.120464', '27.331876', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1599, 256687, 2, 256112, '350721000000', '顺昌县', '福建,南平,顺昌', '117.810357', '26.793288', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1600, 256849, 2, 256112, '350722000000', '浦城县', '福建,南平,浦城', '118.541256', '27.917263', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1601, 257172, 2, 256112, '350723000000', '光泽县', '福建,南平,光泽', '117.334106', '27.540988', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1602, 257276, 2, 256112, '350724000000', '松溪县', '福建,南平,松溪', '118.785468', '27.526232', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1603, 257395, 2, 256112, '350725000000', '政和县', '福建,南平,政和', '118.857642', '27.366104', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1604, 257539, 2, 256112, '350781000000', '邵武市', '福建,南平,邵武', '117.492534', '27.340327', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1605, 257733, 2, 256112, '350782000000', '武夷山市', '福建,南平,武夷山', '118.035310', '27.756648', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1606, 257886, 2, 256112, '350783000000', '建瓯市', '福建,南平,建瓯', '118.304988', '27.022727', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1607, 258161, 2, 258160, '350801000000', '市辖区', '福建,龙岩', '117.017536', '25.075123', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1608, 258162, 2, 258160, '350802000000', '新罗区', '福建,龙岩,新罗', '117.037264', '25.098292', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1609, 258520, 2, 258160, '350803000000', '永定区', '福建,龙岩,永定', '116.732092', '24.723962', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1610, 258825, 2, 258160, '350821000000', '长汀县', '福建,龙岩,长汀', '116.357581', '25.833531', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1611, 259144, 2, 258160, '350823000000', '上杭县', '福建,龙岩,上杭', '116.420099', '25.049518', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1612, 259512, 2, 258160, '350824000000', '武平县', '福建,龙岩,武平', '116.100342', '25.095277', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1613, 259749, 2, 258160, '350825000000', '连城县', '福建,龙岩,连城', '116.754473', '25.710539', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1614, 260014, 2, 258160, '350881000000', '漳平市', '福建,龙岩,漳平', '117.419998', '25.290185', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1615, 260231, 2, 260230, '350901000000', '市辖区', '福建,宁德', '119.547932', '26.665617', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1616, 260232, 2, 260230, '350902000000', '蕉城区', '福建,宁德,蕉城', '119.526299', '26.660611', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1617, 260575, 2, 260230, '350921000000', '霞浦县', '福建,宁德,霞浦', '120.005643', '26.885204', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1618, 260905, 2, 260230, '350922000000', '古田县', '福建,宁德,古田', '118.746284', '26.577837', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1619, 261211, 2, 260230, '350923000000', '屏南县', '福建,宁德,屏南', '118.985895', '26.908276', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1620, 261382, 2, 260230, '350924000000', '寿宁县', '福建,宁德,寿宁', '119.514987', '27.454479', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1621, 261602, 2, 260230, '350925000000', '周宁县', '福建,宁德,周宁', '119.339025', '27.104591', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1622, 261759, 2, 260230, '350926000000', '柘荣县', '福建,宁德,柘荣', '119.900609', '27.233933', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1623, 261885, 2, 260230, '350981000000', '福安市', '福建,宁德,福安', '119.647770', '27.088049', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1624, 262395, 2, 260230, '350982000000', '福鼎市', '福建,宁德,福鼎', '120.216978', '27.324479', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1625, 262700, 2, 262699, '360101000000', '市辖区', '江西,南昌', '115.858197', '28.682892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1626, 262701, 2, 262699, '360102000000', '东湖区', '江西,南昌,东湖', '115.899262', '28.685085', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1627, 262889, 2, 262699, '360103000000', '西湖区', '江西,南昌,西湖', '115.877233', '28.657595', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1628, 263058, 2, 262699, '360104000000', '青云谱区', '江西,南昌,青云谱', '115.925749', '28.621169', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1629, 263152, 2, 262699, '360105000000', '湾里区', '江西,南昌,湾里', '115.730847', '28.714796', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1630, 263217, 2, 262699, '360111000000', '青山湖区', '江西,南昌,青山湖', '115.962144', '28.682985', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1631, 263496, 2, 262699, '360112000000', '新建区', '江西,南昌,新建', '115.815278', '28.692864', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1632, 263948, 2, 262699, '360121000000', '南昌县', '江西,南昌,南昌', '115.944304', '28.545602', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1633, 264375, 2, 262699, '360123000000', '安义县', '江西,南昌,安义', '115.549247', '28.844507', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1634, 264517, 2, 262699, '360124000000', '进贤县', '江西,南昌,进贤', '116.240924', '28.376918', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1635, 264863, 2, 264862, '360201000000', '市辖区', '江西,景德镇', '117.178419', '29.268835', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1636, 264864, 2, 264862, '360202000000', '昌江区', '江西,景德镇,昌江', '117.183748', '29.273435', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1637, 264962, 2, 264862, '360203000000', '珠山区', '江西,景德镇,珠山', '117.202893', '29.299923', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1638, 265083, 2, 264862, '360222000000', '浮梁县', '江西,景德镇,浮梁', '117.215086', '29.351681', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1639, 265297, 2, 264862, '360281000000', '乐平市', '江西,景德镇,乐平', '117.151796', '28.978440', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1640, 265678, 2, 265677, '360301000000', '市辖区', '江西,萍乡', '113.854556', '27.622768', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1641, 265679, 2, 265677, '360302000000', '安源区', '江西,萍乡,安源', '113.870730', '27.615202', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1642, 265826, 2, 265677, '360313000000', '湘东区', '江西,萍乡,湘东', '113.733047', '27.640075', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1643, 265994, 2, 265677, '360321000000', '莲花县', '江西,萍乡,莲花', '113.961465', '27.127669', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1644, 266171, 2, 265677, '360322000000', '上栗县', '江西,萍乡,上栗', '113.795311', '27.880302', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1645, 266356, 2, 265677, '360323000000', '芦溪县', '江西,萍乡,芦溪', '114.029828', '27.630806', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1646, 266522, 2, 266521, '360401000000', '市辖区', '江西,九江', '116.001930', '29.705077', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1647, 266523, 2, 266521, '360402000000', '濂溪区', '江西,九江,濂溪', '116.011380', '29.678540', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1648, 266665, 2, 266521, '360403000000', '浔阳区', '江西,九江,浔阳', '115.990301', '29.727593', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1649, 266781, 2, 266521, '360421000000', '九江县', '江西,九江,九江', '115.911323', '29.608431', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1650, 266946, 2, 266521, '360423000000', '武宁县', '江西,九江,武宁', '115.100578', '29.256323', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1651, 267168, 2, 266521, '360424000000', '修水县', '江西,九江,修水', '114.546702', '29.026022', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1652, 267613, 2, 266521, '360425000000', '永修县', '江西,九江,永修', '115.832453', '29.012297', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1653, 267868, 2, 266521, '360426000000', '德安县', '江西,九江,德安', '115.767484', '29.298738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1654, 267982, 2, 266521, '360428000000', '都昌县', '江西,九江,都昌', '116.204099', '29.273194', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1655, 268318, 2, 266521, '360429000000', '湖口县', '江西,九江,湖口', '116.251947', '29.731101', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1656, 268480, 2, 266521, '360430000000', '彭泽县', '江西,九江,彭泽', '116.549359', '29.896061', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1657, 268689, 2, 266521, '360481000000', '瑞昌市', '江西,九江,瑞昌', '115.681337', '29.675874', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1658, 268926, 2, 266521, '360482000000', '共青城市', '江西,九江,共青城', '115.808844', '29.248317', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1659, 268995, 2, 266521, '360483000000', '庐山市', '江西,九江,庐山', '116.045060', '29.448128', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1660, 269108, 2, 269107, '360501000000', '市辖区', '江西,新余', '114.917346', '27.817808', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1661, 269109, 2, 269107, '360502000000', '渝水区', '江西,新余,渝水', '114.944646', '27.800387', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1662, 269465, 2, 269107, '360521000000', '分宜县', '江西,新余,分宜', '114.692050', '27.814758', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1663, 269655, 2, 269654, '360601000000', '市辖区', '江西,鹰潭', '117.069202', '28.260189', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1664, 269656, 2, 269654, '360602000000', '月湖区', '江西,鹰潭,月湖', '117.037137', '28.239153', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1665, 269746, 2, 269654, '360622000000', '余江县', '江西,鹰潭,余江', '116.822763', '28.206177', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1666, 269942, 2, 269654, '360681000000', '贵溪市', '江西,鹰潭,贵溪', '117.245497', '28.292519', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1667, 270223, 2, 270222, '360701000000', '市辖区', '江西,赣州', '114.935029', '25.831829', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1668, 270224, 2, 270222, '360702000000', '章贡区', '江西,赣州,章贡', '114.921171', '25.817816', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1669, 270442, 2, 270222, '360703000000', '南康区', '江西,赣州,南康', '114.765403', '25.661471', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1670, 270780, 2, 270222, '360721000000', '赣县', '江西,赣州,赣县', '115.011561', '25.860691', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1671, 271095, 2, 270222, '360722000000', '信丰县', '江西,赣州,信丰', '114.922830', '25.386704', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1672, 271410, 2, 270222, '360723000000', '大余县', '江西,赣州,大余', '114.362112', '25.401314', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1673, 271541, 2, 270222, '360724000000', '上犹县', '江西,赣州,上犹', '114.551138', '25.785172', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1674, 271699, 2, 270222, '360725000000', '崇义县', '江西,赣州,崇义', '114.308267', '25.681784', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1675, 271848, 2, 270222, '360726000000', '安远县', '江西,赣州,安远', '115.393922', '25.136927', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1676, 272033, 2, 270222, '360727000000', '龙南县', '江西,赣州,龙南', '114.789873', '24.911069', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1677, 272156, 2, 270222, '360728000000', '定南县', '江西,赣州,定南', '115.027845', '24.784410', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1678, 272302, 2, 270222, '360729000000', '全南县', '江西,赣州,全南', '114.530125', '24.742403', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1679, 272408, 2, 270222, '360730000000', '宁都县', '江西,赣州,宁都', '116.009472', '26.470116', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1680, 272767, 2, 270222, '360731000000', '于都县', '江西,赣州,于都', '115.415508', '25.952069', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1681, 273183, 2, 270222, '360732000000', '兴国县', '江西,赣州,兴国', '115.363190', '26.337937', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1682, 273525, 2, 270222, '360733000000', '会昌县', '江西,赣州,会昌', '115.786057', '25.600272', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1683, 273820, 2, 270222, '360734000000', '寻乌县', '江西,赣州,寻乌', '115.646636', '24.963371', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1684, 274020, 2, 270222, '360735000000', '石城县', '江西,赣州,石城', '116.346995', '26.314775', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1685, 274184, 2, 270222, '360781000000', '瑞金市', '江西,赣州,瑞金', '116.027135', '25.885555', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1686, 274445, 2, 274444, '360801000000', '市辖区', '江西,吉安', '114.992509', '27.113443', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1687, 274446, 2, 274444, '360802000000', '吉州区', '江西,吉安,吉州', '114.994764', '27.143801', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1688, 274592, 2, 274444, '360803000000', '青原区', '江西,吉安,青原', '115.014812', '27.081977', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1689, 274736, 2, 274444, '360821000000', '吉安县', '江西,吉安,吉安', '114.907733', '27.039890', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1690, 275105, 2, 274444, '360822000000', '吉水县', '江西,吉安,吉水', '115.135507', '27.229632', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1691, 275406, 2, 274444, '360823000000', '峡江县', '江西,吉安,峡江', '115.316566', '27.582901', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1692, 275511, 2, 274444, '360824000000', '新干县', '江西,吉安,新干', '115.387052', '27.740192', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1693, 275694, 2, 274444, '360825000000', '永丰县', '江西,吉安,永丰', '115.444320', '27.318852', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1694, 275956, 2, 274444, '360826000000', '泰和县', '江西,吉安,泰和', '114.908869', '26.789960', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1695, 276331, 2, 274444, '360827000000', '遂川县', '江西,吉安,遂川', '114.520537', '26.313737', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1696, 276700, 2, 274444, '360828000000', '万安县', '江西,吉安,万安', '114.786182', '26.458254', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1697, 276874, 2, 274444, '360829000000', '安福县', '江西,吉安,安福', '114.619893', '27.392874', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1698, 277170, 2, 274444, '360830000000', '永新县', '江西,吉安,永新', '114.243096', '26.945002', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1699, 277459, 2, 274444, '360881000000', '井冈山市', '江西,吉安,井冈山', '114.289228', '26.748081', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1700, 277616, 2, 277615, '360901000000', '市辖区', '江西,宜春', '114.416778', '27.815619', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1701, 277617, 2, 277615, '360902000000', '袁州区', '江西,宜春,袁州', '114.424657', '27.798846', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1702, 278033, 2, 277615, '360921000000', '奉新县', '江西,宜春,奉新', '115.400491', '28.688423', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1703, 278249, 2, 277615, '360922000000', '万载县', '江西,宜春,万载', '114.445523', '28.106004', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1704, 278471, 2, 277615, '360923000000', '上高县', '江西,宜春,上高', '114.947594', '28.238509', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1705, 278710, 2, 277615, '360924000000', '宜丰县', '江西,宜春,宜丰', '114.803515', '28.393666', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1706, 278975, 2, 277615, '360925000000', '靖安县', '江西,宜春,靖安', '115.362629', '28.861479', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1707, 279095, 2, 277615, '360926000000', '铜鼓县', '江西,宜春,铜鼓', '114.371172', '28.520770', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1708, 279220, 2, 277615, '360981000000', '丰城市', '江西,宜春,丰城', '115.771094', '28.159142', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1709, 279845, 2, 277615, '360982000000', '樟树市', '江西,宜春,樟树', '115.546385', '28.054814', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1710, 280166, 2, 277615, '360983000000', '高安市', '江西,宜春,高安', '115.375616', '28.417255', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1711, 280563, 2, 280562, '361001000000', '市辖区', '江西,抚州', '116.358181', '27.949217', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1712, 280564, 2, 280562, '361002000000', '临川区', '江西,抚州,临川', '116.312167', '27.934573', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1713, 281098, 2, 280562, '361021000000', '南城县', '江西,抚州,南城', '116.637040', '27.569678', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1714, 281285, 2, 280562, '361022000000', '黎川县', '江西,抚州,黎川', '116.907681', '27.282333', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1715, 281443, 2, 280562, '361023000000', '南丰县', '江西,抚州,南丰', '116.525725', '27.218445', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1716, 281641, 2, 280562, '361024000000', '崇仁县', '江西,抚州,崇仁', '116.061101', '27.764394', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1717, 281827, 2, 280562, '361025000000', '乐安县', '江西,抚州,乐安', '115.830481', '27.428765', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1718, 282036, 2, 280562, '361026000000', '宜黄县', '江西,抚州,宜黄', '116.222128', '27.546146', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1719, 282206, 2, 280562, '361027000000', '金溪县', '江西,抚州,金溪', '116.755058', '27.918959', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1720, 282391, 2, 280562, '361028000000', '资溪县', '江西,抚州,资溪', '117.060264', '27.706102', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1721, 282482, 2, 280562, '361029000000', '东乡县', '江西,抚州,东乡县', '116.603560', '28.247697', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1722, 282684, 2, 280562, '361030000000', '广昌县', '江西,抚州,广昌', '116.325757', '26.837267', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1723, 282842, 2, 282841, '361101000000', '市辖区', '江西,上饶', '117.943433', '28.454862', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1724, 282843, 2, 282841, '361102000000', '信州区', '江西,上饶,信州', '117.966460', '28.431002', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1725, 282978, 2, 282841, '361103000000', '广丰区', '江西,上饶,广丰', '118.191240', '28.436286', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1726, 283240, 2, 282841, '361121000000', '上饶县', '江西,上饶,上饶', '117.907850', '28.448983', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1727, 283511, 2, 282841, '361123000000', '玉山县', '江西,上饶,玉山', '118.245124', '28.682055', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1728, 283769, 2, 282841, '361124000000', '铅山县', '江西,上饶,铅山', '117.709451', '28.315217', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1729, 283970, 2, 282841, '361125000000', '横峰县', '江西,上饶,横峰', '117.596452', '28.407118', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1730, 284066, 2, 282841, '361126000000', '弋阳县', '江西,上饶,弋阳', '117.449588', '28.378044', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1731, 284239, 2, 282841, '361127000000', '余干县', '江西,上饶,余干', '116.695647', '28.702302', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1732, 284706, 2, 282841, '361128000000', '鄱阳县', '江西,上饶,鄱阳', '116.699746', '29.011699', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1733, 285319, 2, 282841, '361129000000', '万年县', '江西,上饶,万年', '117.058445', '28.694582', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1734, 285488, 2, 282841, '361130000000', '婺源县', '江西,上饶,婺源', '117.861798', '29.248086', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1735, 285711, 2, 282841, '361181000000', '德兴市', '江西,上饶,德兴', '117.578713', '28.946464', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1736, 285862, 2, 285861, '370101000000', '市辖区', '山东,济南', '117.119999', '36.651216', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1737, 285863, 2, 285861, '370102000000', '历下区', '山东,济南,历下', '117.076455', '36.666412', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1738, 285991, 2, 285861, '370103000000', '市中区', '山东,济南,市中', '116.997777', '36.651474', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1739, 286215, 2, 285861, '370104000000', '槐荫区', '山东,济南,槐荫', '116.901224', '36.651441', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1740, 286404, 2, 285861, '370105000000', '天桥区', '山东,济南,天桥', '116.987492', '36.678016', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1741, 286683, 2, 285861, '370112000000', '历城区', '山东,济南,历城', '117.065237', '36.680017', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1742, 287424, 2, 285861, '370113000000', '长清区', '山东,济南,长清', '116.751937', '36.553571', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1743, 288084, 2, 285861, '370124000000', '平阴县', '山东,济南,平阴', '116.456187', '36.289265', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1744, 288448, 2, 285861, '370125000000', '济阳县', '山东,济南,济阳', '117.173525', '36.978537', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1745, 289313, 2, 285861, '370126000000', '商河县', '山东,济南,商河', '117.157183', '37.309045', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1746, 290291, 2, 285861, '370181000000', '章丘市', '山东,济南,章丘', '117.526228', '36.681259', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1747, 291236, 2, 291235, '370201000000', '市辖区', '山东,青岛', '120.382639', '36.067082', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1748, 291237, 2, 291235, '370202000000', '市南区', '山东,青岛,市南', '120.412392', '36.075651', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1749, 291313, 2, 291235, '370203000000', '市北区', '山东,青岛,市北', '120.374731', '36.087609', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1750, 291468, 2, 291235, '370211000000', '黄岛区', '山东,青岛,黄岛', '120.046190', '35.872664', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1751, 292713, 2, 291235, '370212000000', '崂山区', '山东,青岛,崂山', '120.468956', '36.107538', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1752, 292879, 2, 291235, '370213000000', '李沧区', '山东,青岛,李沧', '120.432697', '36.145463', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1753, 293008, 2, 291235, '370214000000', '城阳区', '山东,青岛,城阳', '120.396310', '36.307064', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1754, 293241, 2, 291235, '370281000000', '胶州市', '山东,青岛,胶州', '120.033382', '36.264680', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1755, 294138, 2, 291235, '370282000000', '即墨市', '山东,青岛,即墨', '120.447128', '36.389639', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1756, 295251, 2, 291235, '370283000000', '平度市', '山东,青岛,平度', '119.988420', '36.776358', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1757, 297121, 2, 291235, '370285000000', '莱西市', '山东,青岛,莱西', '120.517690', '36.889084', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1758, 298026, 2, 298025, '370301000000', '市辖区', '山东,淄博', '118.054927', '36.813487', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1759, 298027, 2, 298025, '370302000000', '淄川区', '山东,淄博,淄川', '117.966723', '36.643452', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1760, 298507, 2, 298025, '370303000000', '张店区', '山东,淄博,张店', '118.017913', '36.806674', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1761, 298821, 2, 298025, '370304000000', '博山区', '山东,淄博,博山', '117.861677', '36.494721', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1762, 299159, 2, 298025, '370305000000', '临淄区', '山东,淄博,临淄', '118.309118', '36.826981', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1763, 299652, 2, 298025, '370306000000', '周村区', '山东,淄博,周村', '117.869886', '36.803072', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1764, 299919, 2, 298025, '370321000000', '桓台县', '山东,淄博,桓台', '118.097923', '36.959804', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1765, 300276, 2, 298025, '370322000000', '高青县', '山东,淄博,高青', '117.826916', '37.171063', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1766, 301056, 2, 298025, '370323000000', '沂源县', '山东,淄博,沂源', '118.170856', '36.185038', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1767, 301712, 2, 301711, '370401000000', '市辖区', '山东,枣庄', '117.323725', '34.810487', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1768, 301713, 2, 301711, '370402000000', '市中区', '山东,枣庄,市中', '117.556123', '34.864114', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1769, 301888, 2, 301711, '370403000000', '薛城区', '山东,枣庄,薛城', '117.263164', '34.795063', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1770, 302179, 2, 301711, '370404000000', '峄城区', '山东,枣庄,峄城', '117.590816', '34.773263', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1771, 302532, 2, 301711, '370405000000', '台儿庄区', '山东,枣庄,台儿庄', '117.733832', '34.562528', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1772, 302750, 2, 301711, '370406000000', '山亭区', '山东,枣庄,山亭', '117.461517', '35.099528', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1773, 303037, 2, 301711, '370481000000', '滕州市', '山东,枣庄,滕州', '117.165824', '35.114156', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1774, 304310, 2, 304309, '370501000000', '市辖区', '山东,东营', '118.674767', '37.434751', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1775, 304311, 2, 304309, '370502000000', '东营区', '山东,东营,东营', '118.582184', '37.448963', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1776, 304647, 2, 304309, '370503000000', '河口区', '山东,东营,河口', '118.525543', '37.886162', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1777, 304845, 2, 304309, '370505000000', '垦利区', '山东,东营,垦利', '118.674767', '37.434751', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1778, 305208, 2, 304309, '370522000000', '利津县', '山东,东营,利津', '118.255273', '37.490260', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1779, 305747, 2, 304309, '370523000000', '广饶县', '山东,东营,广饶', '118.407107', '37.053555', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1780, 306340, 2, 306339, '370601000000', '市辖区', '山东,烟台', '121.447935', '37.463822', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1781, 306341, 2, 306339, '370602000000', '芝罘区', '山东,烟台,芝罘', '121.400031', '37.540687', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1782, 306496, 2, 306339, '370611000000', '福山区', '山东,烟台,福山', '121.267741', '37.498246', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1783, 306743, 2, 306339, '370612000000', '牟平区', '山东,烟台,牟平', '121.600512', '37.386901', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1784, 307348, 2, 306339, '370613000000', '莱山区', '山东,烟台,莱山', '121.445151', '37.511361', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1785, 307481, 2, 306339, '370634000000', '长岛县', '山东,烟台,长岛', '120.736580', '37.921368', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1786, 307530, 2, 306339, '370681000000', '龙口市', '山东,烟台,龙口', '120.477813', '37.646108', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1787, 308140, 2, 306339, '370682000000', '莱阳市', '山东,烟台,莱阳', '120.711673', '36.978941', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1788, 308953, 2, 306339, '370683000000', '莱州市', '山东,烟台,莱州', '119.942327', '37.177017', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1789, 309985, 2, 306339, '370684000000', '蓬莱市', '山东,烟台,蓬莱', '120.758848', '37.810661', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1790, 310581, 2, 306339, '370685000000', '招远市', '山东,烟台,招远', '120.434072', '37.355469', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1791, 311342, 2, 306339, '370686000000', '栖霞市', '山东,烟台,栖霞', '120.849675', '37.335123', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1792, 312312, 2, 306339, '370687000000', '海阳市', '山东,烟台,海阳', '121.158434', '36.776378', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1793, 313064, 2, 313063, '370701000000', '市辖区', '山东,潍坊', '119.161755', '36.706774', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1794, 313065, 2, 313063, '370702000000', '潍城区', '山东,潍坊,潍城', '119.024836', '36.728100', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1795, 313327, 2, 313063, '370703000000', '寒亭区', '山东,潍坊,寒亭', '119.219734', '36.775491', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1796, 313701, 2, 313063, '370704000000', '坊子区', '山东,潍坊,坊子', '119.166485', '36.654448', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1797, 314288, 2, 313063, '370705000000', '奎文区', '山东,潍坊,奎文', '119.132486', '36.707676', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1798, 314533, 2, 313063, '370724000000', '临朐县', '山东,潍坊,临朐', '118.542982', '36.512506', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1799, 314894, 2, 313063, '370725000000', '昌乐县', '山东,潍坊,昌乐', '118.829914', '36.706945', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1800, 315273, 2, 313063, '370781000000', '青州市', '山东,潍坊,青州', '118.479636', '36.684600', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1801, 316361, 2, 313063, '370782000000', '诸城市', '山东,潍坊,诸城', '119.410103', '35.995654', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1802, 316642, 2, 313063, '370783000000', '寿光市', '山东,潍坊,寿光', '118.790652', '36.855480', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1803, 317633, 2, 313063, '370784000000', '安丘市', '山东,潍坊,安丘', '119.218978', '36.478494', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1804, 318512, 2, 313063, '370785000000', '高密市', '山东,潍坊,高密', '119.755597', '36.382595', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1805, 319478, 2, 313063, '370786000000', '昌邑市', '山东,潍坊,昌邑', '119.398525', '36.858820', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1806, 320180, 2, 320179, '370801000000', '市辖区', '山东,济宁', '116.587098', '35.414921', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1807, 320181, 2, 320179, '370811000000', '任城区', '山东,济宁,任城', '116.595050', '35.406596', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1808, 320795, 2, 320179, '370812000000', '兖州区', '山东,济宁,兖州', '116.783834', '35.553144', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1809, 321246, 2, 320179, '370826000000', '微山县', '山东,济宁,微山', '117.128828', '34.806554', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1810, 321804, 2, 320179, '370827000000', '鱼台县', '山东,济宁,鱼台', '116.650608', '35.012749', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1811, 322209, 2, 320179, '370828000000', '金乡县', '山东,济宁,金乡', '116.311532', '35.066620', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1812, 322882, 2, 320179, '370829000000', '嘉祥县', '山东,济宁,嘉祥', '116.342442', '35.407829', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1813, 323607, 2, 320179, '370830000000', '汶上县', '山东,济宁,汶上', '116.489043', '35.732799', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1814, 324118, 2, 320179, '370831000000', '泗水县', '山东,济宁,泗水', '117.251195', '35.664323', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1815, 324729, 2, 320179, '370832000000', '梁山县', '山东,济宁,梁山', '116.096044', '35.802306', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1816, 325372, 2, 320179, '370881000000', '曲阜市', '山东,济宁,曲阜', '116.986503', '35.580996', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1817, 325791, 2, 320179, '370883000000', '邹城市', '山东,济宁,邹城', '117.003743', '35.405185', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1818, 326707, 2, 326706, '370901000000', '市辖区', '山东,泰安', '117.087614', '36.200252', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1819, 326708, 2, 326706, '370902000000', '泰山区', '山东,泰安,泰山', '117.135354', '36.192084', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1820, 326926, 2, 326706, '370911000000', '岱岳区', '山东,泰安,岱岳', '117.041582', '36.187990', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1821, 327655, 2, 326706, '370921000000', '宁阳县', '山东,泰安,宁阳', '116.805797', '35.758787', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1822, 328231, 2, 326706, '370923000000', '东平县', '山东,泰安,东平', '116.470304', '35.937102', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1823, 328962, 2, 326706, '370982000000', '新泰市', '山东,泰安,新泰', '117.767953', '35.909032', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1824, 329897, 2, 326706, '370983000000', '肥城市', '山东,泰安,肥城', '116.768358', '36.182572', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1825, 330548, 2, 330547, '371001000000', '市辖区', '山东,威海', '122.120419', '37.513068', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1826, 330549, 2, 330547, '371002000000', '环翠区', '山东,威海,环翠', '122.123444', '37.501991', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1827, 330748, 2, 330547, '371003000000', '文登区', '山东,威海,文登', '122.057941', '37.193886', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1828, 331529, 2, 330547, '371082000000', '荣成市', '山东,威海,荣成', '122.486658', '37.165160', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1829, 332496, 2, 330547, '371083000000', '乳山市', '山东,威海,乳山', '121.539765', '36.919816', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1830, 333141, 2, 333140, '371101000000', '市辖区', '山东,日照', '119.526888', '35.416377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1831, 333142, 2, 333140, '371102000000', '东港区', '山东,日照,东港', '119.462228', '35.425475', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1832, 333755, 2, 333140, '371103000000', '岚山区', '山东,日照,岚山', '119.318929', '35.121884', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1833, 334188, 2, 333140, '371121000000', '五莲县', '山东,日照,五莲', '119.206763', '35.751927', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1834, 334833, 2, 333140, '371122000000', '莒县', '山东,日照,莒县', '118.837064', '35.579868', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1835, 336051, 2, 336050, '371201000000', '市辖区', '山东,莱芜', '117.676723', '36.213813', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1836, 336052, 2, 336050, '371202000000', '莱城区', '山东,莱芜,莱城', '117.659884', '36.203180', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1837, 336908, 2, 336050, '371203000000', '钢城区', '山东,莱芜,钢城', '117.811355', '36.058572', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1838, 337145, 2, 337144, '371301000000', '市辖区', '山东,临沂', '118.356448', '35.104672', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1839, 337146, 2, 337144, '371302000000', '兰山区', '山东,临沂,兰山', '118.347731', '35.051734', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1840, 337621, 2, 337144, '371311000000', '罗庄区', '山东,临沂,罗庄', '118.284786', '34.996741', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1841, 337844, 2, 337144, '371312000000', '河东区', '山东,临沂,河东', '118.402893', '35.089917', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1842, 338188, 2, 337144, '371321000000', '沂南县', '山东,临沂,沂南', '118.465213', '35.549976', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1843, 338778, 2, 337144, '371322000000', '郯城县', '山东,临沂,郯城', '118.367263', '34.613557', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1844, 339408, 2, 337144, '371323000000', '沂水县', '山东,临沂,沂水', '118.627918', '35.790450', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1845, 340490, 2, 337144, '371324000000', '兰陵县', '山东,临沂,兰陵', '118.070650', '34.857149', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1846, 341532, 2, 337144, '371325000000', '费县', '山东,临沂,费县', '117.977325', '35.265961', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1847, 342020, 2, 337144, '371326000000', '平邑县', '山东,临沂,平邑', '117.640352', '35.505943', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1848, 342766, 2, 337144, '371327000000', '莒南县', '山东,临沂,莒南', '118.835163', '35.174846', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1849, 343361, 2, 337144, '371328000000', '蒙阴县', '山东,临沂,蒙阴', '117.945085', '35.710032', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1850, 343836, 2, 337144, '371329000000', '临沭县', '山东,临沂,临沭', '118.650782', '34.919852', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1851, 344134, 2, 344133, '371401000000', '市辖区', '山东,德州', '116.357464', '37.434092', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1852, 344135, 2, 344133, '371402000000', '德城区', '山东,德州,德城', '116.299471', '37.450805', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1853, 344244, 2, 344133, '371403000000', '陵城区', '山东,德州,陵城', '116.576092', '37.335794', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1854, 345248, 2, 344133, '371422000000', '宁津县', '山东,德州,宁津', '116.800306', '37.652190', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1855, 346117, 2, 344133, '371423000000', '庆云县', '山东,德州,庆云', '117.385257', '37.775350', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1856, 346518, 2, 344133, '371424000000', '临邑县', '山东,德州,临邑', '116.866800', '37.189798', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1857, 346715, 2, 344133, '371425000000', '齐河县', '山东,德州,齐河', '116.762810', '36.783415', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1858, 347749, 2, 344133, '371426000000', '平原县', '山东,德州,平原', '116.434056', '37.165314', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1859, 347943, 2, 344133, '371427000000', '夏津县', '山东,德州,夏津', '116.001726', '36.948371', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1860, 348268, 2, 344133, '371428000000', '武城县', '山东,德州,武城', '116.069302', '37.213311', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1861, 348472, 2, 344133, '371481000000', '乐陵市', '山东,德州,乐陵', '117.231935', '37.729907', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1862, 348980, 2, 344133, '371482000000', '禹城市', '山东,德州,禹城', '116.638327', '36.933812', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1863, 349383, 2, 349382, '371501000000', '市辖区', '山东,聊城', '115.985371', '36.456703', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1864, 349384, 2, 349382, '371502000000', '东昌府区', '山东,聊城,东昌府', '115.988491', '36.434645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1865, 350543, 2, 349382, '371521000000', '阳谷县', '山东,聊城,阳谷', '115.791820', '36.114392', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1866, 351436, 2, 349382, '371522000000', '莘县', '山东,聊城,莘县', '115.671191', '36.233598', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1867, 352587, 2, 349382, '371523000000', '茌平县', '山东,聊城,茌平', '115.985371', '36.456703', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1868, 353334, 2, 349382, '371524000000', '东阿县', '山东,聊城,东阿', '116.247580', '36.334917', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1869, 353863, 2, 349382, '371525000000', '冠县', '山东,聊城,冠县', '115.442740', '36.484009', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1870, 354643, 2, 349382, '371526000000', '高唐县', '山东,聊城,高唐', '116.230158', '36.846755', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1871, 355301, 2, 349382, '371581000000', '临清市', '山东,聊城,临清', '115.704881', '36.838277', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1872, 355973, 2, 355972, '371601000000', '市辖区', '山东,滨州', '117.970703', '37.381990', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1873, 355974, 2, 355972, '371602000000', '滨城区', '山东,滨州,滨城', '118.019326', '37.430724', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1874, 356960, 2, 355972, '371603000000', '沾化区', '山东,滨州,沾化', '118.098902', '37.699260', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1875, 357420, 2, 355972, '371621000000', '惠民县', '山东,滨州,惠民', '117.509921', '37.489877', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1876, 358556, 2, 355972, '371622000000', '阳信县', '山东,滨州,阳信', '117.578262', '37.641106', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1877, 359424, 2, 355972, '371623000000', '无棣县', '山东,滨州,无棣', '117.625696', '37.770260', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1878, 360038, 2, 355972, '371625000000', '博兴县', '山东,滨州,博兴', '118.131815', '37.150226', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1879, 360507, 2, 355972, '371626000000', '邹平县', '山东,滨州,邹平', '117.743109', '36.862989', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1880, 361376, 2, 361375, '371701000000', '市辖区', '山东,菏泽', '115.480656', '35.233750', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1881, 361377, 2, 361375, '371702000000', '牡丹区', '山东,菏泽,牡丹', '115.417827', '35.252512', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1882, 361988, 2, 361375, '371703000000', '定陶区', '山东,菏泽,定陶', '115.569619', '35.072701', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1883, 362368, 2, 361375, '371721000000', '曹县', '山东,菏泽,曹县', '115.542328', '34.825508', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1884, 363576, 2, 361375, '371722000000', '单县', '山东,菏泽,单县', '116.107428', '34.778808', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1885, 364107, 2, 361375, '371723000000', '成武县', '山东,菏泽,成武', '115.889765', '34.952459', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1886, 364606, 2, 361375, '371724000000', '巨野县', '山东,菏泽,巨野', '116.065396', '35.387374', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1887, 365498, 2, 361375, '371725000000', '郓城县', '山东,菏泽,郓城', '115.943613', '35.599758', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1888, 366562, 2, 361375, '371726000000', '鄄城县', '山东,菏泽,鄄城', '115.510193', '35.563408', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1889, 366971, 2, 361375, '371728000000', '东明县', '山东,菏泽,东明', '115.089905', '35.289368', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1890, 367397, 2, 367396, '410101000000', '市辖区', '河南,郑州', '113.625368', '34.746599', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1891, 367398, 2, 367396, '410102000000', '中原区', '河南,郑州,中原', '113.612850', '34.748257', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1892, 367563, 2, 367396, '410103000000', '二七区', '河南,郑州,二七', '113.640179', '34.723930', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1893, 367741, 2, 367396, '410104000000', '管城回族区', '河南,郑州,管城', '113.625368', '34.746599', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1894, 367877, 2, 367396, '410105000000', '金水区', '河南,郑州,金水', '113.660555', '34.800156', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1895, 368151, 2, 367396, '410106000000', '上街区', '河南,郑州,上街', '113.308961', '34.802780', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1896, 368217, 2, 367396, '410108000000', '惠济区', '河南,郑州,惠济', '113.616901', '34.867458', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1897, 368291, 2, 367396, '410122000000', '中牟县', '河南,郑州,中牟', '113.976254', '34.718937', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1898, 368635, 2, 367396, '410181000000', '巩义市', '河南,郑州,巩义', '113.022497', '34.747834', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1899, 368975, 2, 367396, '410182000000', '荥阳市', '河南,郑州,荥阳', '113.383221', '34.787375', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1900, 369293, 2, 367396, '410183000000', '新密市', '河南,郑州,新密', '113.390891', '34.539443', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1901, 369663, 2, 367396, '410184000000', '新郑市', '河南,郑州,新郑', '113.740529', '34.395562', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1902, 369963, 2, 367396, '410185000000', '登封市', '河南,郑州,登封', '113.050492', '34.453667', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1903, 370305, 2, 370304, '410201000000', '市辖区', '河南,开封', '114.307581', '34.797239', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1904, 370306, 2, 370304, '410202000000', '龙亭区', '河南,开封,龙亭', '114.354730', '34.815784', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1905, 370373, 2, 370304, '410203000000', '顺河回族区', '河南,开封,顺河', '114.369716', '34.811344', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1906, 370450, 2, 370304, '410204000000', '鼓楼区', '河南,开封,鼓楼', '114.348307', '34.788561', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1907, 370501, 2, 370304, '410205000000', '禹王台区', '河南,开封,禹王台', '114.348170', '34.777104', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1908, 370557, 2, 370304, '410211000000', '金明区', '河南,开封,金明', '114.307581', '34.797239', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1909, 370634, 2, 370304, '410212000000', '祥符区', '河南,开封,祥符', '114.441327', '34.756921', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1910, 370995, 2, 370304, '410221000000', '杞县', '河南,开封,杞县', '114.783041', '34.549166', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1911, 371618, 2, 370304, '410222000000', '通许县', '河南,开封,通许', '114.467467', '34.480433', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1912, 371942, 2, 370304, '410223000000', '尉氏县', '河南,开封,尉氏', '114.193081', '34.411494', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1913, 372481, 2, 370304, '410225000000', '兰考县', '河南,开封,兰考', '114.821348', '34.822211', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1914, 372972, 2, 372971, '410301000000', '市辖区', '河南,洛阳', '112.454040', '34.619682', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1915, 372973, 2, 372971, '410302000000', '老城区', '河南,洛阳,老城', '112.469024', '34.683646', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1916, 373030, 2, 372971, '410303000000', '西工区', '河南,洛阳,西工', '112.428413', '34.659900', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1917, 373105, 2, 372971, '410304000000', '瀍河回族区', '河南,洛阳,瀍河', '112.479653', '34.714976', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1918, 373143, 2, 372971, '410305000000', '涧西区', '河南,洛阳,涧西', '112.395756', '34.658034', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1919, 373227, 2, 372971, '410306000000', '吉利区', '河南,洛阳,吉利', '112.589052', '34.900889', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1920, 373268, 2, 372971, '410311000000', '洛龙区', '河南,洛阳,洛龙', '112.464173', '34.619404', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1921, 373554, 2, 372971, '410322000000', '孟津县', '河南,洛阳,孟津', '112.445252', '34.825307', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1922, 373799, 2, 372971, '410323000000', '新安县', '河南,洛阳,新安', '112.132488', '34.728584', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1923, 374121, 2, 372971, '410324000000', '栾川县', '河南,洛阳,栾川', '111.615769', '33.785698', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1924, 374349, 2, 372971, '410325000000', '嵩县', '河南,洛阳,嵩县', '112.085634', '34.134517', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1925, 374694, 2, 372971, '410326000000', '汝阳县', '河南,洛阳,汝阳', '112.473139', '34.153940', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1926, 374929, 2, 372971, '410327000000', '宜阳县', '河南,洛阳,宜阳', '112.179238', '34.514645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1927, 375308, 2, 372971, '410328000000', '洛宁县', '河南,洛阳,洛宁', '111.653039', '34.389414', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1928, 375717, 2, 372971, '410329000000', '伊川县', '河南,洛阳,伊川', '112.425651', '34.421460', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1929, 376105, 2, 372971, '410381000000', '偃师市', '河南,洛阳,偃师', '112.789535', '34.727220', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1930, 376366, 2, 376365, '410401000000', '市辖区', '河南,平顶山', '113.192661', '33.766169', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1931, 376367, 2, 376365, '410402000000', '新华区', '河南,平顶山,新华', '113.293999', '33.737365', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1932, 376442, 2, 376365, '410403000000', '卫东区', '河南,平顶山,卫东', '113.335193', '33.734707', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1933, 376513, 2, 376365, '410404000000', '石龙区', '河南,平顶山,石龙', '112.898818', '33.898713', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1934, 376532, 2, 376365, '410411000000', '湛河区', '河南,平顶山,湛河', '113.320873', '33.725681', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1935, 376643, 2, 376365, '410421000000', '宝丰县', '河南,平顶山,宝丰', '113.054754', '33.868441', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1936, 376984, 2, 376365, '410422000000', '叶县', '河南,平顶山,叶县', '113.357239', '33.626731', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1937, 377555, 2, 376365, '410423000000', '鲁山县', '河南,平顶山,鲁山', '112.908023', '33.738518', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1938, 378139, 2, 376365, '410425000000', '郏县', '河南,平顶山,郏县', '113.212609', '33.971787', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1939, 378532, 2, 376365, '410481000000', '舞钢市', '河南,平顶山,舞钢', '113.524794', '33.307776', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1940, 378764, 2, 376365, '410482000000', '汝州市', '河南,平顶山,汝州', '112.844517', '34.167030', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1941, 379246, 2, 379245, '410501000000', '市辖区', '河南,安阳', '114.392392', '36.097577', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1942, 379247, 2, 379245, '410502000000', '文峰区', '河南,安阳,文峰', '114.357082', '36.090468', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1943, 379400, 2, 379245, '410503000000', '北关区', '河南,安阳,北关', '114.355822', '36.107255', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1944, 379488, 2, 379245, '410505000000', '殷都区', '河南,安阳,殷都', '114.303410', '36.109890', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1945, 379584, 2, 379245, '410506000000', '龙安区', '河南,安阳,龙安', '114.323522', '36.095568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1946, 379742, 2, 379245, '410522000000', '安阳县', '河南,安阳,安阳', '114.130207', '36.130585', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1947, 380371, 2, 379245, '410523000000', '汤阴县', '河南,安阳,汤阴', '114.357763', '35.924515', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1948, 380688, 2, 379245, '410526000000', '滑县', '河南,安阳,滑县', '114.518997', '35.575002', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1949, 381731, 2, 379245, '410527000000', '内黄县', '河南,安阳,内黄', '114.901492', '35.971653', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1950, 382281, 2, 379245, '410581000000', '林州市', '河南,安阳,林州', '113.820130', '36.083047', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1951, 382879, 2, 382878, '410601000000', '市辖区', '河南,鹤壁', '114.297272', '35.747225', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1952, 382880, 2, 382878, '410602000000', '鹤山区', '河南,鹤壁,鹤山', '114.163367', '35.954582', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1953, 382969, 2, 382878, '410603000000', '山城区', '河南,鹤壁,山城', '114.184428', '35.897703', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1954, 383079, 2, 382878, '410611000000', '淇滨区', '河南,鹤壁,淇滨', '114.298694', '35.741296', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1955, 383228, 2, 382878, '410621000000', '浚县', '河南,鹤壁,浚县', '114.550813', '35.676240', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1956, 383704, 2, 382878, '410622000000', '淇县', '河南,鹤壁,淇县', '114.197651', '35.607762', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1957, 383891, 2, 383890, '410701000000', '市辖区', '河南,新乡', '113.926800', '35.303004', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1958, 383892, 2, 383890, '410702000000', '红旗区', '河南,新乡,红旗', '113.875245', '35.303851', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1959, 383978, 2, 383890, '410703000000', '卫滨区', '河南,新乡,卫滨', '113.865780', '35.302117', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1960, 384041, 2, 383890, '410704000000', '凤泉区', '河南,新乡,凤泉', '113.915184', '35.383978', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1961, 384093, 2, 383890, '410711000000', '牧野区', '河南,新乡,牧野', '113.908772', '35.315039', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1962, 384193, 2, 383890, '410721000000', '新乡县', '河南,新乡,新乡', '113.805205', '35.190836', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1963, 384380, 2, 383890, '410724000000', '获嘉县', '河南,新乡,获嘉', '113.657433', '35.259808', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1964, 384622, 2, 383890, '410725000000', '原阳县', '河南,新乡,原阳', '113.940115', '35.065587', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1965, 385122, 2, 383890, '410726000000', '延津县', '河南,新乡,延津', '114.205197', '35.141956', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1966, 385485, 2, 383890, '410727000000', '封丘县', '河南,新乡,封丘', '114.418882', '35.041198', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1967, 386113, 2, 383890, '410728000000', '长垣县', '河南,新乡,长垣', '114.668936', '35.201548', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1968, 386744, 2, 383890, '410781000000', '卫辉市', '河南,新乡,卫辉', '114.064907', '35.398494', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1969, 387125, 2, 383890, '410782000000', '辉县市', '河南,新乡,辉', '113.926800', '35.303004', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1970, 387708, 2, 387707, '410801000000', '市辖区', '河南,焦作', '113.241823', '35.215892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1971, 387709, 2, 387707, '410802000000', '解放区', '河南,焦作,解放', '113.230817', '35.240282', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1972, 387776, 2, 387707, '410803000000', '中站区', '河南,焦作,中站', '113.182946', '35.236820', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1973, 387836, 2, 387707, '410804000000', '马村区', '河南,焦作,马村', '113.322332', '35.256108', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1974, 387922, 2, 387707, '410811000000', '山阳区', '河南,焦作,山阳', '113.254881', '35.214507', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1975, 387985, 2, 387707, '410821000000', '修武县', '河南,焦作,修武', '113.447755', '35.223514', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1976, 388187, 2, 387707, '410822000000', '博爱县', '河南,焦作,博爱', '113.064379', '35.171045', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1977, 388415, 2, 387707, '410823000000', '武陟县', '河南,焦作,武陟', '113.401679', '35.099378', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1978, 388783, 2, 387707, '410825000000', '温县', '河南,焦作,温县', '113.080530', '34.940189', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1979, 389064, 2, 387707, '410882000000', '沁阳市', '河南,焦作,沁阳', '112.950716', '35.087539', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1980, 389418, 2, 387707, '410883000000', '孟州市', '河南,焦作,孟州', '112.789612', '34.907970', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1981, 389720, 2, 389719, '410901000000', '市辖区', '河南,濮阳', '115.029215', '35.761829', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1982, 389721, 2, 389719, '410902000000', '华龙区', '河南,濮阳,华龙', '115.074151', '35.777346', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1983, 389884, 2, 389719, '410922000000', '清丰县', '河南,濮阳,清丰', '115.104389', '35.885180', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1984, 390411, 2, 389719, '410923000000', '南乐县', '河南,濮阳,南乐', '115.204752', '36.069664', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1985, 390751, 2, 389719, '410926000000', '范县', '河南,濮阳,范县', '115.504201', '35.851907', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1986, 391345, 2, 389719, '410927000000', '台前县', '河南,濮阳,台前', '115.871906', '35.969390', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1987, 391730, 2, 389719, '410928000000', '濮阳县', '河南,濮阳,濮阳', '115.029078', '35.712193', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1988, 392738, 2, 392737, '411001000000', '市辖区', '河南,许昌', '113.852640', '34.035506', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1989, 392739, 2, 392737, '411002000000', '魏都区', '河南,许昌,魏都', '113.822647', '34.025342', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1990, 392850, 2, 392737, '411023000000', '许昌县', '河南,许昌,许昌', '113.822983', '34.124660', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1991, 393306, 2, 392737, '411024000000', '鄢陵县', '河南,许昌,鄢陵', '114.177400', '34.102332', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1992, 393705, 2, 392737, '411025000000', '襄城县', '河南,许昌,襄城', '113.482453', '33.846369', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1993, 394170, 2, 392737, '411081000000', '禹州市', '河南,许昌,禹州', '113.488478', '34.140701', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1994, 394863, 2, 392737, '411082000000', '长葛市', '河南,许昌,长葛', '113.819888', '34.194136', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1995, 395255, 2, 395254, '411101000000', '市辖区', '河南,漯河', '114.016539', '33.581412', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1996, 395256, 2, 395254, '411102000000', '源汇区', '河南,漯河,源汇', '114.017948', '33.565441', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1997, 395392, 2, 395254, '411103000000', '郾城区', '河南,漯河,郾城', '114.006944', '33.587409', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1998, 395601, 2, 395254, '411104000000', '召陵区', '河南,漯河,召陵', '114.093902', '33.586565', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (1999, 395816, 2, 395254, '411121000000', '舞阳县', '河南,漯河,舞阳', '113.609286', '33.437877', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2000, 396228, 2, 395254, '411122000000', '临颍县', '河南,漯河,临颍', '113.931203', '33.827304', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2001, 396612, 2, 396611, '411201000000', '市辖区', '河南,三门峡', '111.200135', '34.772493', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2002, 396613, 2, 396611, '411202000000', '湖滨区', '河南,三门峡,湖滨', '111.188398', '34.770886', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2003, 396710, 2, 396611, '411203000000', '陕州区', '河南,三门峡,陕州', '111.103563', '34.720548', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2004, 396996, 2, 396611, '411221000000', '渑池县', '河南,三门峡,渑池', '111.761504', '34.767244', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2005, 397257, 2, 396611, '411224000000', '卢氏县', '河南,三门峡,卢氏', '111.047858', '34.054324', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2006, 397644, 2, 396611, '411281000000', '义马市', '河南,三门峡,义马', '111.874393', '34.747129', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2007, 397687, 2, 396611, '411282000000', '灵宝市', '河南,三门峡,灵宝', '110.894220', '34.516828', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2008, 398170, 2, 398169, '411301000000', '市辖区', '河南,南阳', '112.528321', '32.990833', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2009, 398171, 2, 398169, '411302000000', '宛城区', '河南,南阳,宛城', '112.539559', '33.003784', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2010, 398437, 2, 398169, '411303000000', '卧龙区', '河南,南阳,卧龙', '112.528789', '32.989877', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2011, 398747, 2, 398169, '411321000000', '南召县', '河南,南阳,南召', '112.429133', '33.489877', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2012, 399117, 2, 398169, '411322000000', '方城县', '河南,南阳,方城', '113.012494', '33.254391', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2013, 399702, 2, 398169, '411323000000', '西峡县', '河南,南阳,西峡', '111.473530', '33.307294', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2014, 400021, 2, 398169, '411324000000', '镇平县', '河南,南阳,镇平', '112.234698', '33.034111', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2015, 400474, 2, 398169, '411325000000', '内乡县', '河南,南阳,内乡', '111.849392', '33.044865', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2016, 400787, 2, 398169, '411326000000', '淅川县', '河南,南阳,淅川', '111.490964', '33.137820', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2017, 401305, 2, 398169, '411327000000', '社旗县', '河南,南阳,社旗', '112.948245', '33.056109', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2018, 401579, 2, 398169, '411328000000', '唐河县', '河南,南阳,唐河', '112.807637', '32.681335', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2019, 402141, 2, 398169, '411329000000', '新野县', '河南,南阳,新野', '112.360026', '32.520805', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2020, 402429, 2, 398169, '411330000000', '桐柏县', '河南,南阳,桐柏', '113.428287', '32.380073', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2021, 402668, 2, 398169, '411381000000', '邓州市', '河南,南阳,邓州', '112.087278', '32.687938', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2022, 403312, 2, 403311, '411401000000', '市辖区', '河南,商丘', '115.656370', '34.414172', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2023, 403313, 2, 403311, '411402000000', '梁园区', '河南,商丘,梁园', '115.613965', '34.443893', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2024, 403577, 2, 403311, '411403000000', '睢阳区', '河南,商丘,睢阳', '115.653302', '34.388390', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2025, 403992, 2, 403311, '411421000000', '民权县', '河南,商丘,民权', '115.179594', '34.647758', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2026, 404572, 2, 403311, '411422000000', '睢县', '河南,商丘,睢县', '115.071879', '34.445656', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2027, 405150, 2, 403311, '411423000000', '宁陵县', '河南,商丘,宁陵', '115.313690', '34.460232', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2028, 405530, 2, 403311, '411424000000', '柘城县', '河南,商丘,柘城', '115.305843', '34.091045', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2029, 406070, 2, 403311, '411425000000', '虞城县', '河南,商丘,虞城', '115.840511', '34.402512', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2030, 406717, 2, 403311, '411426000000', '夏邑县', '河南,商丘,夏邑', '116.131447', '34.237554', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2031, 407487, 2, 403311, '411481000000', '永城市', '河南,商丘,永城', '116.449500', '33.929291', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2032, 408288, 2, 408287, '411501000000', '市辖区', '河南,信阳', '114.091023', '32.146983', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2033, 408289, 2, 408287, '411502000000', '浉河区', '河南,信阳,浉河', '114.058713', '32.116803', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2034, 408566, 2, 408287, '411503000000', '平桥区', '河南,信阳,平桥', '114.125656', '32.101031', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2035, 408914, 2, 408287, '411521000000', '罗山县', '河南,信阳,罗山', '114.513012', '32.203073', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2036, 409241, 2, 408287, '411522000000', '光山县', '河南,信阳,光山', '114.919033', '32.011103', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2037, 409621, 2, 408287, '411523000000', '新县', '河南,信阳,新县', '114.879239', '31.643918', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2038, 409844, 2, 408287, '411524000000', '商城县', '河南,信阳,商城', '115.406862', '31.798378', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2039, 410235, 2, 408287, '411525000000', '固始县', '河南,信阳,固始', '115.654482', '32.168137', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2040, 410916, 2, 408287, '411526000000', '潢川县', '河南,信阳,潢川', '115.051808', '32.131383', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2041, 411226, 2, 408287, '411527000000', '淮滨县', '河南,信阳,淮滨', '115.419538', '32.473258', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2042, 411541, 2, 408287, '411528000000', '息县', '河南,信阳,息县', '114.740456', '32.342792', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2043, 411926, 2, 411925, '411601000000', '市辖区', '河南,周口', '114.696951', '33.626149', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2044, 411927, 2, 411925, '411602000000', '川汇区', '河南,周口,川汇', '114.650628', '33.647598', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2045, 412097, 2, 411925, '411621000000', '扶沟县', '河南,周口,扶沟', '114.394915', '34.059862', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2046, 412526, 2, 411925, '411622000000', '西华县', '河南,周口,西华', '114.529756', '33.767408', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2047, 413030, 2, 411925, '411623000000', '商水县', '河南,周口,商水', '114.611596', '33.542480', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2048, 413644, 2, 411925, '411624000000', '沈丘县', '河南,周口,沈丘', '115.098583', '33.409369', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2049, 414239, 2, 411925, '411625000000', '郸城县', '河南,周口,郸城', '115.177189', '33.644743', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2050, 414779, 2, 411925, '411626000000', '淮阳县', '河南,周口,淮阳', '114.886154', '33.731561', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2051, 415271, 2, 411925, '411627000000', '太康县', '河南,周口,太康', '114.837887', '34.063798', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2052, 416070, 2, 411925, '411628000000', '鹿邑县', '河南,周口,鹿邑', '115.484454', '33.860000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2053, 416651, 2, 411925, '411681000000', '项城市', '河南,周口,项城', '114.875333', '33.465838', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2054, 417175, 2, 417174, '411701000000', '市辖区', '河南,驻马店', '114.022298', '33.011529', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2055, 417176, 2, 417174, '411702000000', '驿城区', '河南,驻马店,驿城', '113.993914', '32.973054', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2056, 417405, 2, 417174, '411721000000', '西平县', '河南,驻马店,西平', '114.021539', '33.387685', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2057, 417712, 2, 417174, '411722000000', '上蔡县', '河南,驻马店,上蔡', '114.264381', '33.262439', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2058, 418199, 2, 417174, '411723000000', '平舆县', '河南,驻马店,平舆', '114.619159', '32.962710', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2059, 418443, 2, 417174, '411724000000', '正阳县', '河南,驻马店,正阳', '114.392774', '32.605697', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2060, 418759, 2, 417174, '411725000000', '确山县', '河南,驻马店,确山', '114.026430', '32.802065', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2061, 418973, 2, 417174, '411726000000', '泌阳县', '河南,驻马店,泌阳', '113.327144', '32.723975', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2062, 419354, 2, 417174, '411727000000', '汝南县', '河南,驻马店,汝南', '114.362379', '33.006729', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2063, 419654, 2, 417174, '411728000000', '遂平县', '河南,驻马店,遂平', '114.013182', '33.145649', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2064, 419874, 2, 417174, '411729000000', '新蔡县', '河南,驻马店,新蔡', '114.965469', '32.744855', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2065, 420259, 2, 420258, '419001000000', '济源市', '河南,济源', '112.602341', '35.069031', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2066, 420826, 2, 420825, '420101000000', '市辖区', '湖北,武汉', '114.305392', '30.593098', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2067, 420827, 2, 420825, '420102000000', '江岸区', '湖北,武汉,江岸', '114.309091', '30.600064', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2068, 420996, 2, 420825, '420103000000', '江汉区', '湖北,武汉,江汉', '114.270871', '30.601430', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2069, 421122, 2, 420825, '420104000000', '硚口区', '湖北,武汉,硚口', '114.214920', '30.582202', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2070, 421270, 2, 420825, '420105000000', '汉阳区', '湖北,武汉,汉阳', '114.218724', '30.553905', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2071, 421400, 2, 420825, '420106000000', '武昌区', '湖北,武汉,武昌', '114.316223', '30.554235', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2072, 421559, 2, 420825, '420107000000', '青山区', '湖北,武汉,青山', '114.385539', '30.639630', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2073, 421676, 2, 420825, '420111000000', '洪山区', '湖北,武汉,洪山', '114.343913', '30.500317', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2074, 421983, 2, 420825, '420112000000', '东西湖区', '湖北,武汉,东西湖', '114.136886', '30.620020', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2075, 422149, 2, 420825, '420113000000', '汉南区', '湖北,武汉,汉南', '114.084445', '30.308856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2076, 422220, 2, 420825, '420114000000', '蔡甸区', '湖北,武汉,蔡甸', '114.029328', '30.582271', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2077, 422631, 2, 420825, '420115000000', '江夏区', '湖北,武汉,江夏', '114.321551', '30.375748', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2078, 423075, 2, 420825, '420116000000', '黄陂区', '湖北,武汉,黄陂', '114.375743', '30.882557', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2079, 423775, 2, 420825, '420117000000', '新洲区', '湖北,武汉,新洲', '114.801107', '30.841544', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2080, 424450, 2, 424449, '420201000000', '市辖区', '湖北,黄石', '115.038520', '30.199652', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2081, 424451, 2, 424449, '420202000000', '黄石港区', '湖北,黄石,黄石港', '115.065978', '30.223003', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2082, 424489, 2, 424449, '420203000000', '西塞山区', '湖北,黄石,西塞山', '115.109955', '30.204924', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2083, 424531, 2, 424449, '420204000000', '下陆区', '湖北,黄石,下陆', '114.961327', '30.173913', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2084, 424574, 2, 424449, '420205000000', '铁山区', '湖北,黄石,铁山', '114.901412', '30.206592', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2085, 424590, 2, 424449, '420222000000', '阳新县', '湖北,黄石,阳新', '115.215227', '29.830258', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2086, 425070, 2, 424449, '420281000000', '大冶市', '湖北,黄石,大冶', '114.979875', '30.095643', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2087, 425509, 2, 425508, '420301000000', '市辖区', '湖北,十堰', '110.797990', '32.629397', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2088, 425510, 2, 425508, '420302000000', '茅箭区', '湖北,十堰,茅箭', '110.813621', '32.591929', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2089, 425592, 2, 425508, '420303000000', '张湾区', '湖北,十堰,张湾', '110.769133', '32.652297', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2090, 425709, 2, 425508, '420304000000', '郧阳区', '湖北,十堰,郧阳', '110.812050', '32.834776', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2091, 426078, 2, 425508, '420322000000', '郧西县', '湖北,十堰,郧西', '110.425983', '32.993182', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2092, 426440, 2, 425508, '420323000000', '竹山县', '湖北,十堰,竹山', '110.228694', '32.224875', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2093, 426708, 2, 425508, '420324000000', '竹溪县', '湖北,十堰,竹溪', '109.715304', '32.318255', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2094, 427085, 2, 425508, '420325000000', '房县', '湖北,十堰,房县', '110.726670', '32.040085', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2095, 427420, 2, 425508, '420381000000', '丹江口市', '湖北,十堰,丹江口', '111.513127', '32.540157', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2096, 427711, 2, 427710, '420501000000', '市辖区', '湖北,宜昌', '111.286471', '30.691967', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2097, 427712, 2, 427710, '420502000000', '西陵区', '湖北,宜昌,西陵', '111.285646', '30.710782', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2098, 427828, 2, 427710, '420503000000', '伍家岗区', '湖北,宜昌,伍家岗', '111.361037', '30.644334', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2099, 427894, 2, 427710, '420504000000', '点军区', '湖北,宜昌,点军', '111.268120', '30.693247', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2100, 427953, 2, 427710, '420505000000', '猇亭区', '湖北,宜昌,猇亭', '111.434620', '30.530903', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2101, 427983, 2, 427710, '420506000000', '夷陵区', '湖北,宜昌,夷陵', '111.326380', '30.770006', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2102, 428194, 2, 427710, '420525000000', '远安县', '湖北,宜昌,远安', '111.640508', '31.060869', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2103, 428319, 2, 427710, '420526000000', '兴山县', '湖北,宜昌,兴山', '110.746805', '31.348196', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2104, 428424, 2, 427710, '420527000000', '秭归县', '湖北,宜昌,秭归', '110.977711', '30.825897', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2105, 428630, 2, 427710, '420528000000', '长阳土家族自治县', '湖北,宜昌,长阳', '111.207242', '30.472763', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2106, 428807, 2, 427710, '420529000000', '五峰土家族自治县', '湖北,宜昌,五峰', '110.674706', '30.199688', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2107, 428924, 2, 427710, '420581000000', '宜都市', '湖北,宜昌,宜都', '111.450006', '30.378327', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2108, 429089, 2, 427710, '420582000000', '当阳市', '湖北,宜昌,当阳', '111.788312', '30.821266', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2109, 429273, 2, 427710, '420583000000', '枝江市', '湖北,宜昌,枝江', '111.760530', '30.425940', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2110, 429502, 2, 429501, '420601000000', '市辖区', '湖北,襄阳', '112.122414', '32.008986', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2111, 429503, 2, 429501, '420602000000', '襄城区', '湖北,襄阳,襄城', '112.133974', '32.010351', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2112, 429687, 2, 429501, '420606000000', '樊城区', '湖北,襄阳,樊城', '112.135684', '32.044833', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2113, 429907, 2, 429501, '420607000000', '襄州区', '湖北,襄阳,襄州', '112.211899', '32.087298', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2114, 430402, 2, 429501, '420624000000', '南漳县', '湖北,襄阳,南漳', '111.838905', '31.774636', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2115, 430723, 2, 429501, '420625000000', '谷城县', '湖北,襄阳,谷城', '111.652982', '32.263849', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2116, 431025, 2, 429501, '420626000000', '保康县', '湖北,襄阳,保康', '111.261309', '31.878310', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2117, 431301, 2, 429501, '420682000000', '老河口市', '湖北,襄阳,老河口', '111.683861', '32.359068', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2118, 431575, 2, 429501, '420683000000', '枣阳市', '湖北,襄阳,枣阳', '112.771959', '32.128818', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2119, 432166, 2, 429501, '420684000000', '宜城市', '湖北,襄阳,宜城', '112.257788', '31.719806', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2120, 432416, 2, 432415, '420701000000', '市辖区', '湖北,鄂州', '114.894843', '30.391940', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2121, 432417, 2, 432415, '420702000000', '梁子湖区', '湖北,鄂州,梁子湖', '114.684731', '30.100141', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2122, 432510, 2, 432415, '420703000000', '华容区', '湖北,鄂州,华容', '114.729878', '30.534310', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2123, 432633, 2, 432415, '420704000000', '鄂城区', '湖北,鄂州,鄂城', '114.891615', '30.400572', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2124, 432830, 2, 432829, '420801000000', '市辖区', '湖北,荆门', '112.199265', '31.035423', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2125, 432831, 2, 432829, '420802000000', '东宝区', '湖北,荆门,东宝', '112.201493', '31.051852', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2126, 433052, 2, 432829, '420804000000', '掇刀区', '湖北,荆门,掇刀', '112.207833', '30.973431', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2127, 433182, 2, 432829, '420821000000', '京山县', '湖北,荆门,京山', '113.119566', '31.018457', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2128, 433634, 2, 432829, '420822000000', '沙洋县', '湖北,荆门,沙洋', '112.588581', '30.709221', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2129, 433944, 2, 432829, '420881000000', '钟祥市', '湖北,荆门,钟祥', '112.588121', '31.167820', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2130, 434549, 2, 434548, '420901000000', '市辖区', '湖北,孝感', '113.916902', '30.924568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2131, 434550, 2, 434548, '420902000000', '孝南区', '湖北,孝感,孝南', '113.910958', '30.916874', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2132, 435091, 2, 434548, '420921000000', '孝昌县', '湖北,孝感,孝昌', '113.998010', '31.258159', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2133, 435563, 2, 434548, '420922000000', '大悟县', '湖北,孝感,大悟', '114.127022', '31.561165', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2134, 435956, 2, 434548, '420923000000', '云梦县', '湖北,孝感,云梦', '113.753554', '31.020983', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2135, 436267, 2, 434548, '420981000000', '应城市', '湖北,孝感,应城', '113.572707', '30.928370', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2136, 436706, 2, 434548, '420982000000', '安陆市', '湖北,孝感,安陆', '113.688941', '31.255610', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2137, 437119, 2, 434548, '420984000000', '汉川市', '湖北,孝感,汉川', '113.839149', '30.661244', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2138, 437780, 2, 437779, '421001000000', '市辖区', '湖北,荆州', '112.239741', '30.335165', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2139, 437781, 2, 437779, '421002000000', '沙市区', '湖北,荆州,沙市', '112.255583', '30.311056', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2140, 437909, 2, 437779, '421003000000', '荆州区', '湖北,荆州,荆州', '112.190185', '30.352832', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2141, 438103, 2, 437779, '421022000000', '公安县', '湖北,荆州,公安', '112.229648', '30.058336', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2142, 438512, 2, 437779, '421023000000', '监利县', '湖北,荆州,监利', '112.897465', '29.811574', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2143, 439263, 2, 437779, '421024000000', '江陵县', '湖北,荆州,江陵', '112.424664', '30.041822', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2144, 439491, 2, 437779, '421081000000', '石首市', '湖北,荆州,石首', '112.425454', '29.720938', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2145, 439836, 2, 437779, '421083000000', '洪湖市', '湖北,荆州,洪湖', '113.475980', '29.825458', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2146, 440344, 2, 437779, '421087000000', '松滋市', '湖北,荆州,松滋', '111.756773', '30.174522', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2147, 440640, 2, 440639, '421101000000', '市辖区', '湖北,黄冈', '114.872316', '30.453905', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2148, 440641, 2, 440639, '421102000000', '黄州区', '湖北,黄冈,黄州', '114.879398', '30.434050', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2149, 440797, 2, 440639, '421121000000', '团风县', '湖北,黄冈,团风', '114.872191', '30.643569', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2150, 441110, 2, 440639, '421122000000', '红安县', '湖北,黄冈,红安', '114.618236', '31.288153', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2151, 441550, 2, 440639, '421123000000', '罗田县', '湖北,黄冈,罗田', '115.399492', '30.783100', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2152, 442017, 2, 440639, '421124000000', '英山县', '湖北,黄冈,英山', '115.681259', '30.734959', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2153, 442351, 2, 440639, '421125000000', '浠水县', '湖北,黄冈,浠水', '115.265535', '30.451867', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2154, 443040, 2, 440639, '421126000000', '蕲春县', '湖北,黄冈,蕲春', '115.437008', '30.225964', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2155, 443641, 2, 440639, '421127000000', '黄梅县', '湖北,黄冈,黄梅', '115.944219', '30.070454', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2156, 444186, 2, 440639, '421181000000', '麻城市', '湖北,黄冈,麻城', '115.008163', '31.172740', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2157, 444684, 2, 440639, '421182000000', '武穴市', '湖北,黄冈,武穴', '115.561217', '29.844107', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2158, 445041, 2, 445040, '421201000000', '市辖区', '湖北,咸宁', '114.322492', '29.841443', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2159, 445042, 2, 445040, '421202000000', '咸安区', '湖北,咸宁,咸安', '114.298711', '29.852892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2160, 445249, 2, 445040, '421221000000', '嘉鱼县', '湖北,咸宁,嘉鱼', '113.939277', '29.970737', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2161, 445363, 2, 445040, '421222000000', '通城县', '湖北,咸宁,通城', '113.816966', '29.245269', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2162, 445569, 2, 445040, '421223000000', '崇阳县', '湖北,咸宁,崇阳', '114.039828', '29.555605', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2163, 445786, 2, 445040, '421224000000', '通山县', '湖北,咸宁,通山', '114.482606', '29.605376', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2164, 446007, 2, 445040, '421281000000', '赤壁市', '湖北,咸宁,赤壁', '113.900628', '29.724692', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2165, 446213, 2, 446212, '421301000000', '市辖区', '湖北,随州', '113.382458', '31.690215', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2166, 446214, 2, 446212, '421303000000', '曾都区', '湖北,随州,曾都', '113.371121', '31.716280', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2167, 446433, 2, 446212, '421321000000', '随县', '湖北,随州,随县', '113.299528', '31.853833', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2168, 446847, 2, 446212, '421381000000', '广水市', '湖北,随州,广水', '113.825890', '31.616854', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2169, 447269, 2, 447268, '422801000000', '恩施市', '湖北,恩施,恩施', '109.479665', '30.294680', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2170, 447495, 2, 447268, '422802000000', '利川市', '湖北,恩施,利川', '108.936376', '30.290996', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2171, 448099, 2, 447268, '422822000000', '建始县', '湖北,恩施,建始', '109.726667', '30.601555', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2172, 448521, 2, 447268, '422823000000', '巴东县', '湖北,恩施,巴东', '110.340756', '31.042324', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2173, 448856, 2, 447268, '422825000000', '宣恩县', '湖北,恩施,宣恩', '109.491485', '29.986899', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2174, 449150, 2, 447268, '422826000000', '咸丰县', '湖北,恩施,咸丰', '109.139726', '29.665203', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2175, 449431, 2, 447268, '422827000000', '来凤县', '湖北,恩施,来凤', '109.407828', '29.493485', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2176, 449636, 2, 447268, '422828000000', '鹤峰县', '湖北,恩施,鹤峰', '110.033662', '29.890171', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2177, 449866, 2, 449865, '429004000000', '仙桃市', '湖北,仙桃', '113.442970', '30.328407', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2178, 450653, 2, 449865, '429005000000', '潜江市', '湖北,潜江', '112.900284', '30.401947', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2179, 451150, 2, 449865, '429006000000', '天门市', '湖北,天门', '113.166557', '30.663719', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2180, 452034, 2, 449865, '429021000000', '神农架林区', '湖北,神农架林', '110.675758', '31.744898', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2181, 452125, 2, 452124, '430101000000', '市辖区', '湖南,长沙', '112.938814', '28.228209', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2182, 452126, 2, 452124, '430102000000', '芙蓉区', '湖南,长沙,芙蓉', '113.032539', '28.185386', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2183, 452213, 2, 452124, '430103000000', '天心区', '湖南,长沙,天心', '112.989855', '28.112525', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2184, 452314, 2, 452124, '430104000000', '岳麓区', '湖南,长沙,岳麓', '112.931383', '28.235243', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2185, 452486, 2, 452124, '430105000000', '开福区', '湖南,长沙,开福', '112.985545', '28.257269', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2186, 452610, 2, 452124, '430111000000', '雨花区', '湖南,长沙,雨花', '113.038017', '28.137710', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2187, 452771, 2, 452124, '430112000000', '望城区', '湖南,长沙,望城', '112.819549', '28.347458', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2188, 452924, 2, 452124, '430121000000', '长沙县', '湖南,长沙,长沙', '113.080810', '28.246150', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2189, 453140, 2, 452124, '430124000000', '宁乡县', '湖南,长沙,宁乡', '112.551885', '28.277483', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2190, 453444, 2, 452124, '430181000000', '浏阳市', '湖南,长沙,浏阳', '113.643076', '28.162833', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2191, 453800, 2, 453799, '430201000000', '市辖区', '湖南,株洲', '113.134002', '27.827550', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2192, 453801, 2, 453799, '430202000000', '荷塘区', '湖南,株洲,荷塘', '113.173487', '27.855929', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2193, 453867, 2, 453799, '430203000000', '芦淞区', '湖南,株洲,芦淞', '113.152724', '27.785070', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2194, 453957, 2, 453799, '430204000000', '石峰区', '湖南,株洲,石峰', '113.117732', '27.875445', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2195, 454008, 2, 453799, '430211000000', '天元区', '湖南,株洲,天元', '113.082216', '27.826867', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2196, 454113, 2, 453799, '430221000000', '株洲县', '湖南,株洲,株洲', '113.144006', '27.699346', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2197, 454261, 2, 453799, '430223000000', '攸县', '湖南,株洲,攸县', '113.345309', '27.000227', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2198, 454580, 2, 453799, '430224000000', '茶陵县', '湖南,株洲,茶陵', '113.539280', '26.777492', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2199, 454845, 2, 453799, '430225000000', '炎陵县', '湖南,株洲,炎陵', '113.772655', '26.489902', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2200, 454989, 2, 453799, '430281000000', '醴陵市', '湖南,株洲,醴陵', '113.496894', '27.646130', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2201, 455284, 2, 455283, '430301000000', '市辖区', '湖南,湘潭', '112.944049', '27.829738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2202, 455285, 2, 455283, '430302000000', '雨湖区', '湖南,湘潭,雨湖', '112.907238', '27.856250', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2203, 455426, 2, 455283, '430304000000', '岳塘区', '湖南,湘潭,岳塘', '112.969480', '27.872028', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2204, 455515, 2, 455283, '430321000000', '湘潭县', '湖南,湘潭,湘潭', '112.950831', '27.778958', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2205, 455889, 2, 455283, '430381000000', '湘乡市', '湖南,湘潭,湘乡', '112.535028', '27.734120', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2206, 456260, 2, 455283, '430382000000', '韶山市', '湖南,湘潭,韶山', '112.526671', '27.915009', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2207, 456304, 2, 456303, '430401000000', '市辖区', '湖南,衡阳', '112.571997', '26.893230', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2208, 456305, 2, 456303, '430405000000', '珠晖区', '湖南,衡阳,珠晖', '112.620112', '26.894657', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2209, 456391, 2, 456303, '430406000000', '雁峰区', '湖南,衡阳,雁峰', '112.616546', '26.888666', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2210, 456449, 2, 456303, '430407000000', '石鼓区', '湖南,衡阳,石鼓', '112.598089', '26.943215', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2211, 456502, 2, 456303, '430408000000', '蒸湘区', '湖南,衡阳,蒸湘', '112.567064', '26.911404', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2212, 456558, 2, 456303, '430412000000', '南岳区', '湖南,衡阳,南岳', '112.738604', '27.232444', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2213, 456587, 2, 456303, '430421000000', '衡阳县', '湖南,衡阳,衡阳', '112.370532', '26.969635', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2214, 457104, 2, 456303, '430422000000', '衡南县', '湖南,衡阳,衡南', '112.677877', '26.738248', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2215, 457576, 2, 456303, '430423000000', '衡山县', '湖南,衡阳,衡山', '112.868268', '27.230291', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2216, 457742, 2, 456303, '430424000000', '衡东县', '湖南,衡阳,衡东', '112.953168', '27.081170', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2217, 458018, 2, 456303, '430426000000', '祁东县', '湖南,衡阳,祁东', '112.090357', '26.799896', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2218, 458411, 2, 456303, '430481000000', '耒阳市', '湖南,衡阳,耒阳', '112.859795', '26.422275', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2219, 458820, 2, 456303, '430482000000', '常宁市', '湖南,衡阳,常宁', '112.399995', '26.420932', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2220, 459252, 2, 459251, '430501000000', '市辖区', '湖南,邵阳', '111.467791', '27.238892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2221, 459253, 2, 459251, '430502000000', '双清区', '湖南,邵阳,双清', '111.496341', '27.232708', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2222, 459357, 2, 459251, '430503000000', '大祥区', '湖南,邵阳,大祥', '111.439091', '27.221452', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2223, 459470, 2, 459251, '430511000000', '北塔区', '湖南,邵阳,北塔', '111.452197', '27.246489', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2224, 459517, 2, 459251, '430521000000', '邵东县', '湖南,邵阳,邵东', '111.744258', '27.258942', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2225, 460126, 2, 459251, '430522000000', '新邵县', '湖南,邵阳,新邵', '111.458657', '27.320918', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2226, 460558, 2, 459251, '430523000000', '邵阳县', '湖南,邵阳,邵阳', '111.273806', '26.990637', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2227, 461014, 2, 459251, '430524000000', '隆回县', '湖南,邵阳,隆回', '111.032438', '27.113978', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2228, 461613, 2, 459251, '430525000000', '洞口县', '湖南,邵阳,洞口', '110.575846', '27.060321', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2229, 462000, 2, 459251, '430527000000', '绥宁县', '湖南,邵阳,绥宁', '110.155655', '26.581955', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2230, 462257, 2, 459251, '430528000000', '新宁县', '湖南,邵阳,新宁', '110.856623', '26.433418', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2231, 462600, 2, 459251, '430529000000', '城步苗族自治县', '湖南,邵阳,城步', '111.467791', '27.238892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2232, 462807, 2, 459251, '430581000000', '武冈市', '湖南,邵阳,武冈', '110.631884', '26.726599', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2233, 463142, 2, 463141, '430601000000', '市辖区', '湖南,岳阳', '113.128958', '29.357104', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2234, 463143, 2, 463141, '430602000000', '岳阳楼区', '湖南,岳阳,岳阳楼', '113.129702', '29.371903', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2235, 463333, 2, 463141, '430603000000', '云溪区', '湖南,岳阳,云溪', '113.272313', '29.472746', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2236, 463397, 2, 463141, '430611000000', '君山区', '湖南,岳阳,君山', '113.006435', '29.461106', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2237, 463489, 2, 463141, '430621000000', '岳阳县', '湖南,岳阳,岳阳', '113.116418', '29.144067', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2238, 463722, 2, 463141, '430623000000', '华容县', '湖南,岳阳,华容', '112.540463', '29.531057', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2239, 463961, 2, 463141, '430624000000', '湘阴县', '湖南,岳阳,湘阴', '112.909426', '28.689105', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2240, 464180, 2, 463141, '430626000000', '平江县', '湖南,岳阳,平江', '113.581234', '28.701868', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2241, 464747, 2, 463141, '430681000000', '汨罗市', '湖南,岳阳,汨罗', '113.067259', '28.806890', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2242, 464944, 2, 463141, '430682000000', '临湘市', '湖南,岳阳,临湘', '113.450423', '29.476849', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2243, 465106, 2, 465105, '430701000000', '市辖区', '湖南,常德', '111.698497', '29.031673', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2244, 465107, 2, 465105, '430702000000', '武陵区', '湖南,常德,武陵', '111.683153', '29.055163', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2245, 465295, 2, 465105, '430703000000', '鼎城区', '湖南,常德,鼎城', '111.680783', '29.018593', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2246, 465661, 2, 465105, '430721000000', '安乡县', '湖南,常德,安乡', '112.171131', '29.411309', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2247, 465844, 2, 465105, '430722000000', '汉寿县', '湖南,常德,汉寿', '111.970514', '28.906107', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2248, 466173, 2, 465105, '430723000000', '澧县', '湖南,常德,澧县', '111.758702', '29.633237', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2249, 466483, 2, 465105, '430724000000', '临澧县', '湖南,常德,临澧', '111.647518', '29.440793', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2250, 466654, 2, 465105, '430725000000', '桃源县', '湖南,常德,桃源', '111.488925', '28.902503', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2251, 467112, 2, 465105, '430726000000', '石门县', '湖南,常德,石门', '111.380014', '29.584293', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2252, 467471, 2, 465105, '430781000000', '津市市', '湖南,常德,津', '111.698497', '29.031673', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2253, 467563, 2, 467562, '430801000000', '市辖区', '湖南,张家界', '110.479191', '29.117096', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2254, 467564, 2, 467562, '430802000000', '永定区', '湖南,张家界,永定', '110.537138', '29.119856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2255, 467841, 2, 467562, '430811000000', '武陵源区', '湖南,张家界,武陵源', '110.550434', '29.345730', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2256, 467881, 2, 467562, '430821000000', '慈利县', '湖南,张家界,慈利', '111.139711', '29.429972', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2257, 468338, 2, 467562, '430822000000', '桑植县', '湖南,张家界,桑植', '110.204911', '29.414264', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2258, 468661, 2, 468660, '430901000000', '市辖区', '湖南,益阳', '112.355180', '28.553860', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2259, 468662, 2, 468660, '430902000000', '资阳区', '湖南,益阳,资阳', '112.324322', '28.590966', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2260, 468790, 2, 468660, '430903000000', '赫山区', '湖南,益阳,赫山', '112.374024', '28.579343', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2261, 469015, 2, 468660, '430921000000', '南县', '湖南,益阳,南县', '112.396241', '29.361338', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2262, 469192, 2, 468660, '430922000000', '桃江县', '湖南,益阳,桃江', '112.155822', '28.518085', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2263, 469452, 2, 468660, '430923000000', '安化县', '湖南,益阳,安化', '111.212846', '28.374107', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2264, 469909, 2, 468660, '430981000000', '沅江市', '湖南,益阳,沅江', '112.355954', '28.847045', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2265, 470124, 2, 470123, '431001000000', '市辖区', '湖南,郴州', '113.014717', '25.770509', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2266, 470125, 2, 470123, '431002000000', '北湖区', '湖南,郴州,北湖', '113.011035', '25.784054', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2267, 470300, 2, 470123, '431003000000', '苏仙区', '湖南,郴州,苏仙', '113.042441', '25.800370', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2268, 470500, 2, 470123, '431021000000', '桂阳县', '湖南,郴州,桂阳', '112.734176', '25.754167', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2269, 470894, 2, 470123, '431022000000', '宜章县', '湖南,郴州,宜章', '112.948772', '25.399792', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2270, 471178, 2, 470123, '431023000000', '永兴县', '湖南,郴州,永兴', '113.116528', '26.127151', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2271, 471473, 2, 470123, '431024000000', '嘉禾县', '湖南,郴州,嘉禾', '112.369021', '25.587520', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2272, 471685, 2, 470123, '431025000000', '临武县', '湖南,郴州,临武', '112.563456', '25.275560', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2273, 471908, 2, 470123, '431026000000', '汝城县', '湖南,郴州,汝城', '113.684727', '25.532816', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2274, 472174, 2, 470123, '431027000000', '桂东县', '湖南,郴州,桂东', '113.944614', '26.077616', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2275, 472301, 2, 470123, '431028000000', '安仁县', '湖南,郴州,安仁', '113.269441', '26.709056', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2276, 472477, 2, 470123, '431081000000', '资兴市', '湖南,郴州,资兴', '113.236146', '25.976243', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2277, 472710, 2, 472709, '431101000000', '市辖区', '湖南,永州', '111.613445', '26.420394', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2278, 472711, 2, 472709, '431102000000', '零陵区', '湖南,永州,零陵', '111.631109', '26.221936', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2279, 473062, 2, 472709, '431103000000', '冷水滩区', '湖南,永州,冷水滩', '111.592143', '26.461077', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2280, 473284, 2, 472709, '431121000000', '祁阳县', '湖南,永州,祁阳', '111.840657', '26.580120', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2281, 473871, 2, 472709, '431122000000', '东安县', '湖南,永州,东安', '111.314117', '26.394404', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2282, 474233, 2, 472709, '431123000000', '双牌县', '湖南,永州,双牌', '111.659967', '25.961910', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2283, 474367, 2, 472709, '431124000000', '道县', '湖南,永州,道县', '111.600796', '25.526438', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2284, 474761, 2, 472709, '431125000000', '江永县', '湖南,永州,江永', '111.343911', '25.273539', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2285, 474883, 2, 472709, '431126000000', '宁远县', '湖南,永州,宁远', '111.945805', '25.570976', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2286, 475326, 2, 472709, '431127000000', '蓝山县', '湖南,永州,蓝山', '112.196731', '25.369898', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2287, 475574, 2, 472709, '431128000000', '新田县', '湖南,永州,新田', '112.203287', '25.904305', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2288, 475819, 2, 472709, '431129000000', '江华瑶族自治县', '湖南,永州,江华', '111.579305', '25.185590', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2289, 476149, 2, 476148, '431201000000', '市辖区', '湖南,怀化', '109.998488', '27.554978', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2290, 476150, 2, 476148, '431202000000', '鹤城区', '湖南,怀化,鹤城', '110.040315', '27.578926', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2291, 476288, 2, 476148, '431221000000', '中方县', '湖南,怀化,中方', '109.944712', '27.440139', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2292, 476449, 2, 476148, '431222000000', '沅陵县', '湖南,怀化,沅陵', '110.393844', '28.452686', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2293, 476874, 2, 476148, '431223000000', '辰溪县', '湖南,怀化,辰溪', '110.183917', '28.006336', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2294, 477191, 2, 476148, '431224000000', '溆浦县', '湖南,怀化,溆浦', '110.594921', '27.908281', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2295, 477633, 2, 476148, '431225000000', '会同县', '湖南,怀化,会同', '109.735661', '26.887239', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2296, 477895, 2, 476148, '431226000000', '麻阳苗族自治县', '湖南,怀化,麻阳', '109.802587', '27.865548', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2297, 478135, 2, 476148, '431227000000', '新晃侗族自治县', '湖南,怀化,新晃', '109.174932', '27.352673', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2298, 478299, 2, 476148, '431228000000', '芷江侗族自治县', '湖南,怀化,芷江', '109.684629', '27.443499', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2299, 478536, 2, 476148, '431229000000', '靖州苗族侗族自治县', '湖南,怀化,靖州', '109.696311', '26.575052', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2300, 478685, 2, 476148, '431230000000', '通道侗族自治县', '湖南,怀化,通道', '109.784412', '26.158054', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2301, 478864, 2, 476148, '431281000000', '洪江市', '湖南,怀化,洪江', '109.836669', '27.208609', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2302, 479104, 2, 479103, '431301000000', '市辖区', '湖南,娄底', '111.993497', '27.700062', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2303, 479105, 2, 479103, '431302000000', '娄星区', '湖南,娄底,娄星', '112.001936', '27.729924', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2304, 479285, 2, 479103, '431321000000', '双峰县', '湖南,娄底,双峰', '112.175246', '27.456658', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2305, 479889, 2, 479103, '431322000000', '新化县', '湖南,娄底,新化', '111.327412', '27.726515', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2306, 480606, 2, 479103, '431381000000', '冷水江市', '湖南,娄底,冷水江', '111.435623', '27.685850', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2307, 480767, 2, 479103, '431382000000', '涟源市', '湖南,娄底,涟源', '111.664316', '27.692542', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2308, 481320, 2, 481319, '433101000000', '吉首市', '湖南,湘西,吉首', '109.698055', '28.262507', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2309, 481465, 2, 481319, '433122000000', '泸溪县', '湖南,湘西,泸溪', '110.219610', '28.216641', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2310, 481626, 2, 481319, '433123000000', '凤凰县', '湖南,湘西,凤凰', '109.598719', '27.948116', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2311, 481925, 2, 481319, '433124000000', '花垣县', '湖南,湘西,花垣', '109.482078', '28.572030', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2312, 482179, 2, 481319, '433125000000', '保靖县', '湖南,湘西,保靖', '109.660577', '28.699774', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2313, 482377, 2, 481319, '433126000000', '古丈县', '湖南,湘西,古丈', '109.950728', '28.616935', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2314, 482506, 2, 481319, '433127000000', '永顺县', '湖南,湘西,永顺', '109.851254', '29.001440', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2315, 482831, 2, 481319, '433130000000', '龙山县', '湖南,湘西,龙山', '109.443939', '29.457663', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2316, 483252, 2, 483251, '440101000000', '市辖区', '广东,广州', '113.264434', '23.129162', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2317, 483253, 2, 483251, '440103000000', '荔湾区', '广东,广州,荔湾', '113.244261', '23.125981', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2318, 483462, 2, 483251, '440104000000', '越秀区', '广东,广州,越秀', '113.266841', '23.128524', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2319, 483703, 2, 483251, '440105000000', '海珠区', '广东,广州,海珠', '113.317388', '23.083801', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2320, 483979, 2, 483251, '440106000000', '天河区', '广东,广州,天河', '113.361200', '23.124680', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2321, 484218, 2, 483251, '440111000000', '白云区', '广东,广州,白云', '113.273289', '23.157290', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2322, 484627, 2, 483251, '440112000000', '黄埔区', '广东,广州,黄埔', '113.459749', '23.106402', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2323, 484770, 2, 483251, '440113000000', '番禺区', '广东,广州,番禺', '113.384129', '22.937244', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2324, 485059, 2, 483251, '440114000000', '花都区', '广东,广州,花都', '113.220218', '23.404165', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2325, 485312, 2, 483251, '440115000000', '南沙区', '广东,广州,南沙', '113.525172', '22.801627', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2326, 485489, 2, 483251, '440117000000', '从化区', '广东,广州,从化', '113.586605', '23.548852', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2327, 485776, 2, 483251, '440118000000', '增城区', '广东,广州,增城', '113.810860', '23.261141', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2328, 486130, 2, 486129, '440201000000', '市辖区', '广东,韶关', '113.597522', '24.810403', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2329, 486131, 2, 486129, '440203000000', '武江区', '广东,韶关,武江', '113.587774', '24.792924', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2330, 486223, 2, 486129, '440204000000', '浈江区', '广东,韶关,浈江', '113.611098', '24.804381', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2331, 486345, 2, 486129, '440205000000', '曲江区', '广东,韶关,曲江', '113.604549', '24.682728', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2332, 486469, 2, 486129, '440222000000', '始兴县', '广东,韶关,始兴', '114.061789', '24.952977', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2333, 486609, 2, 486129, '440224000000', '仁化县', '广东,韶关,仁化', '113.749027', '25.085621', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2334, 486746, 2, 486129, '440229000000', '翁源县', '广东,韶关,翁源', '114.130342', '24.350347', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2335, 486929, 2, 486129, '440232000000', '乳源瑶族自治县', '广东,韶关,乳源', '113.275883', '24.776078', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2336, 487058, 2, 486129, '440233000000', '新丰县', '广东,韶关,新丰', '114.206867', '24.059760', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2337, 487223, 2, 486129, '440281000000', '乐昌市', '广东,韶关,乐昌', '113.347519', '25.130136', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2338, 487468, 2, 486129, '440282000000', '南雄市', '广东,韶关,南雄', '114.311982', '25.117753', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2339, 487722, 2, 487721, '440301000000', '市辖区', '广东,深圳', '114.057868', '22.543099', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2340, 487723, 2, 487721, '440303000000', '罗湖区', '广东,深圳,罗湖', '114.131764', '22.548171', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2341, 487849, 2, 487721, '440304000000', '福田区', '广东,深圳,福田', '114.055036', '22.521530', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2342, 487977, 2, 487721, '440305000000', '南山区', '广东,深圳,南山', '113.930476', '22.533013', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2343, 488090, 2, 487721, '440306000000', '宝安区', '广东,深圳,宝安', '113.884020', '22.555259', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2344, 488375, 2, 487721, '440307000000', '龙岗区', '广东,深圳,龙岗', '114.246899', '22.720968', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2345, 488558, 2, 487721, '440308000000', '盐田区', '广东,深圳,盐田', '114.236875', '22.556499', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2346, 488590, 2, 488589, '440401000000', '市辖区', '广东,珠海', '113.576726', '22.270715', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2347, 488591, 2, 488589, '440402000000', '香洲区', '广东,珠海,香洲', '113.543785', '22.265811', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2348, 488768, 2, 488589, '440403000000', '斗门区', '广东,珠海,斗门', '113.296467', '22.209200', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2349, 488905, 2, 488589, '440404000000', '金湾区', '广东,珠海,金湾', '113.363393', '22.146874', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2350, 488955, 2, 488954, '440501000000', '市辖区', '广东,汕头', '116.681972', '23.354091', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2351, 488956, 2, 488954, '440507000000', '龙湖区', '广东,汕头,龙湖', '116.716534', '23.371476', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2352, 489082, 2, 488954, '440511000000', '金平区', '广东,汕头,金平', '116.703426', '23.365613', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2353, 489270, 2, 488954, '440512000000', '濠江区', '广东,汕头,濠江', '116.726973', '23.286079', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2354, 489338, 2, 488954, '440513000000', '潮阳区', '广东,汕头,潮阳', '116.601515', '23.264936', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2355, 489624, 2, 488954, '440514000000', '潮南区', '广东,汕头,潮南', '116.433017', '23.250425', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2356, 489868, 2, 488954, '440515000000', '澄海区', '广东,汕头,澄海', '116.756092', '23.465960', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2357, 490064, 2, 488954, '440523000000', '南澳县', '广东,汕头,南澳', '117.023374', '23.421724', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2358, 490107, 2, 490106, '440601000000', '市辖区', '广东,佛山', '113.121416', '23.021548', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2359, 490108, 2, 490106, '440604000000', '禅城区', '广东,佛山,禅城', '113.122440', '23.009505', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2360, 490257, 2, 490106, '440605000000', '南海区', '广东,佛山,南海', '113.143441', '23.028956', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2361, 490531, 2, 490106, '440606000000', '顺德区', '广东,佛山,顺德', '113.293359', '22.805240', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2362, 490746, 2, 490106, '440607000000', '三水区', '广东,佛山,三水', '112.896668', '23.156065', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2363, 490834, 2, 490106, '440608000000', '高明区', '广东,佛山,高明', '112.892578', '22.900182', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2364, 490920, 2, 490919, '440701000000', '市辖区', '广东,江门', '113.081901', '22.578738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2365, 490921, 2, 490919, '440703000000', '蓬江区', '广东,江门,蓬江', '113.078521', '22.595149', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2366, 491070, 2, 490919, '440704000000', '江海区', '广东,江门,江海', '113.111612', '22.560474', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2367, 491136, 2, 490919, '440705000000', '新会区', '广东,江门,新会', '113.034187', '22.458300', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2368, 491380, 2, 490919, '440781000000', '台山市', '广东,江门,台山', '112.794065', '22.251924', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2369, 491711, 2, 490919, '440783000000', '开平市', '广东,江门,开平', '112.698545', '22.376395', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2370, 492000, 2, 490919, '440784000000', '鹤山市', '广东,江门,鹤山', '112.964446', '22.765392', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2371, 492153, 2, 490919, '440785000000', '恩平市', '广东,江门,恩平', '112.305145', '22.183206', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2372, 492342, 2, 492341, '440801000000', '市辖区', '广东,湛江', '110.359377', '21.270707', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2373, 492343, 2, 492341, '440802000000', '赤坎区', '广东,湛江,赤坎', '110.365900', '21.266119', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2374, 492393, 2, 492341, '440803000000', '霞山区', '广东,湛江,霞山', '110.398070', '21.191720', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2375, 492484, 2, 492341, '440804000000', '坡头区', '广东,湛江,坡头', '110.455332', '21.244721', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2376, 492563, 2, 492341, '440811000000', '麻章区', '广东,湛江,麻章', '110.334387', '21.263443', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2377, 492716, 2, 492341, '440823000000', '遂溪县', '广东,湛江,遂溪', '110.250124', '21.377246', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2378, 493015, 2, 492341, '440825000000', '徐闻县', '广东,湛江,徐闻', '110.176750', '20.325489', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2379, 493241, 2, 492341, '440881000000', '廉江市', '广东,湛江,廉江', '110.286209', '21.609700', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2380, 493663, 2, 492341, '440882000000', '雷州市', '广东,湛江,雷州', '110.096749', '20.914278', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2381, 494182, 2, 492341, '440883000000', '吴川市', '广东,湛江,吴川', '110.778411', '21.441808', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2382, 494395, 2, 494394, '440901000000', '市辖区', '广东,茂名', '110.925456', '21.662999', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2383, 494396, 2, 494394, '440902000000', '茂南区', '广东,茂名,茂南', '110.918026', '21.641337', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2384, 494629, 2, 494394, '440904000000', '电白区', '广东,茂名,电白', '111.013556', '21.514164', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2385, 495088, 2, 494394, '440981000000', '高州市', '广东,茂名,高州', '110.853302', '21.917982', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2386, 495611, 2, 494394, '440982000000', '化州市', '广东,茂名,化州', '110.639569', '21.664044', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2387, 496016, 2, 494394, '440983000000', '信宜市', '广东,茂名,信宜', '110.947044', '22.354385', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2388, 496439, 2, 496438, '441201000000', '市辖区', '广东,肇庆', '112.465091', '23.047191', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2389, 496440, 2, 496438, '441202000000', '端州区', '广东,肇庆,端州', '112.484848', '23.052101', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2390, 496505, 2, 496438, '441203000000', '鼎湖区', '广东,肇庆,鼎湖', '112.567588', '23.158447', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2391, 496594, 2, 496438, '441204000000', '高要区', '广东,肇庆,高要', '112.457771', '23.025668', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2392, 496964, 2, 496438, '441223000000', '广宁县', '广东,肇庆,广宁', '112.440690', '23.634676', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2393, 497158, 2, 496438, '441224000000', '怀集县', '广东,肇庆,怀集', '112.184652', '23.911899', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2394, 497503, 2, 496438, '441225000000', '封开县', '广东,肇庆,封开', '111.512343', '23.424033', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2395, 497719, 2, 496438, '441226000000', '德庆县', '广东,肇庆,德庆', '111.785937', '23.143722', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2396, 497926, 2, 496438, '441284000000', '四会市', '广东,肇庆,四会', '112.733773', '23.326504', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2397, 498105, 2, 498104, '441301000000', '市辖区', '广东,惠州', '114.416196', '23.111847', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2398, 498106, 2, 498104, '441302000000', '惠城区', '广东,惠州,惠城', '114.382541', '23.084122', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2399, 498397, 2, 498104, '441303000000', '惠阳区', '广东,惠州,惠阳', '114.456696', '22.788734', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2400, 498578, 2, 498104, '441322000000', '博罗县', '广东,惠州,博罗', '114.289496', '23.172899', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2401, 498978, 2, 498104, '441323000000', '惠东县', '广东,惠州,惠东', '114.720079', '22.984975', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2402, 499292, 2, 498104, '441324000000', '龙门县', '广东,惠州,龙门', '114.254863', '23.727737', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2403, 499490, 2, 499489, '441401000000', '市辖区', '广东,梅州', '116.122238', '24.288615', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2404, 499491, 2, 499489, '441402000000', '梅江区', '广东,梅州,梅江', '116.116616', '24.310384', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2405, 499625, 2, 499489, '441403000000', '梅县区', '广东,梅州,梅县', '116.082183', '24.265312', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2406, 500036, 2, 499489, '441422000000', '大埔县', '广东,梅州,大埔', '116.695195', '24.347783', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2407, 500312, 2, 499489, '441423000000', '丰顺县', '广东,梅州,丰顺', '116.182299', '23.739526', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2408, 500611, 2, 499489, '441424000000', '五华县', '广东,梅州,五华', '115.775788', '23.932409', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2409, 501074, 2, 499489, '441426000000', '平远县', '广东,梅州,平远', '115.891638', '24.567262', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2410, 501230, 2, 499489, '441427000000', '蕉岭县', '广东,梅州,蕉岭', '116.171356', '24.658700', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2411, 501351, 2, 499489, '441481000000', '兴宁市', '广东,梅州,兴宁', '115.731110', '24.136630', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2412, 501868, 2, 501867, '441501000000', '市辖区', '广东,汕尾', '115.375278', '22.786211', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2413, 501869, 2, 501867, '441502000000', '城区', '广东,汕尾,城区', '115.365029', '22.778699', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2414, 502002, 2, 501867, '441521000000', '海丰县', '广东,汕尾,海丰', '115.323436', '22.966586', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2415, 502303, 2, 501867, '441523000000', '陆河县', '广东,汕尾,陆河', '115.660143', '23.301617', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2416, 502439, 2, 501867, '441581000000', '陆丰市', '广东,汕尾,陆丰', '115.652260', '22.917576', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2417, 502829, 2, 502828, '441601000000', '市辖区', '广东,河源', '114.700447', '23.743538', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2418, 502830, 2, 502828, '441602000000', '源城区', '广东,河源,源城', '114.702517', '23.733969', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2419, 502907, 2, 502828, '441621000000', '紫金县', '广东,河源,紫金', '115.184061', '23.635271', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2420, 503226, 2, 502828, '441622000000', '龙川县', '广东,河源,龙川', '115.259872', '24.100066', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2421, 503608, 2, 502828, '441623000000', '连平县', '广东,河源,连平', '114.488714', '24.369588', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2422, 503797, 2, 502828, '441624000000', '和平县', '广东,河源,和平', '114.938684', '24.442180', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2423, 504060, 2, 502828, '441625000000', '东源县', '广东,河源,东源', '114.746380', '23.788393', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2424, 504367, 2, 504366, '441701000000', '市辖区', '广东,阳江', '111.982232', '21.857958', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2425, 504368, 2, 504366, '441702000000', '江城区', '广东,阳江,江城', '111.955059', '21.861787', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2426, 504549, 2, 504366, '441704000000', '阳东区', '广东,阳江,阳东', '112.006338', '21.868358', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2427, 504749, 2, 504366, '441721000000', '阳西县', '广东,阳江,阳西', '111.617849', '21.752396', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2428, 504911, 2, 504366, '441781000000', '阳春市', '广东,阳江,阳春', '111.791539', '22.170438', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2429, 505299, 2, 505298, '441801000000', '市辖区', '广东,清远', '113.056031', '23.681763', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2430, 505300, 2, 505298, '441802000000', '清城区', '广东,清远,清城', '113.062692', '23.697899', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2431, 505466, 2, 505298, '441803000000', '清新区', '广东,清远,清新', '113.017749', '23.734673', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2432, 505685, 2, 505298, '441821000000', '佛冈县', '广东,清远,佛冈', '113.531607', '23.879192', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2433, 505782, 2, 505298, '441823000000', '阳山县', '广东,清远,阳山', '112.641363', '24.465359', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2434, 505963, 2, 505298, '441825000000', '连山壮族瑶族自治县', '广东,清远,连山', '112.093617', '24.570491', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2435, 506027, 2, 505298, '441826000000', '连南瑶族自治县', '广东,清远,连南', '112.287012', '24.726017', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2436, 506106, 2, 505298, '441881000000', '英德市', '广东,清远,英德', '113.402376', '24.205024', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2437, 506430, 2, 505298, '441882000000', '连州市', '广东,清远,连州', '112.377361', '24.780966', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2438, 506617, 2, 506616, '441900003000', '东城街道办事处', '广东,东莞,东城', '113.754635', '23.002896', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2439, 506643, 2, 506616, '441900004000', '南城街道办事处', '广东,东莞,南城', '113.753133', '22.987560', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2440, 506662, 2, 506616, '441900005000', '万江街道办事处', '广东,东莞,万江', '113.740409', '23.052146', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2441, 506691, 2, 506616, '441900006000', '莞城街道办事处', '广东,东莞,莞城', '113.751050', '23.053413', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2442, 506700, 2, 506616, '441900101000', '石碣镇', '广东,东莞,石碣', '113.802109', '23.094111', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2443, 506716, 2, 506616, '441900102000', '石龙镇', '广东,东莞,石龙', '113.751765', '23.020536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2444, 506727, 2, 506616, '441900103000', '茶山镇', '广东,东莞,茶山', '113.751765', '23.020536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2445, 506746, 2, 506616, '441900104000', '石排镇', '广东,东莞,石排', '113.751765', '23.020536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2446, 506766, 2, 506616, '441900105000', '企石镇', '广东,东莞,企石', '113.751765', '23.020536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2447, 506787, 2, 506616, '441900106000', '横沥镇', '广东,东莞,横沥', '113.751765', '23.020536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2448, 506805, 2, 506616, '441900107000', '桥头镇', '广东,东莞,桥头', '113.751765', '23.020536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2449, 506823, 2, 506616, '441900108000', '谢岗镇', '广东,东莞,谢岗', '114.141456', '22.972083', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2450, 506836, 2, 506616, '441900109000', '东坑镇', '广东,东莞,东坑', '113.948089', '22.989033', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2451, 506853, 2, 506616, '441900110000', '常平镇', '广东,东莞,常平', '113.992186', '22.975601', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2452, 506887, 2, 506616, '441900111000', '寮步镇', '广东,东莞,寮步', '113.818996', '23.025373', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2453, 506918, 2, 506616, '441900112000', '樟木头镇', '广东,东莞,樟木头镇', '114.083278', '22.914909', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2454, 506930, 2, 506616, '441900113000', '大朗镇', '广东,东莞,大朗', '113.915820', '22.915996', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2455, 506959, 2, 506616, '441900114000', '黄江镇', '广东,东莞,黄江', '113.996039', '22.877840', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2456, 506967, 2, 506616, '441900115000', '清溪镇', '广东,东莞,清溪', '114.164330', '22.844557', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2457, 506990, 2, 506616, '441900116000', '塘厦镇', '广东,东莞,塘厦', '113.774481', '22.791051', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2458, 507015, 2, 506616, '441900117000', '凤岗镇', '广东,东莞,凤岗', '113.751765', '23.020536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2459, 507028, 2, 506616, '441900118000', '大岭山镇', '广东,东莞,大岭山镇', '113.842223', '22.899965', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2460, 507052, 2, 506616, '441900119000', '长安镇', '广东,东莞,长安', '113.794060', '22.803590', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2461, 507066, 2, 506616, '441900121000', '虎门镇', '广东,东莞,虎门', '113.672560', '22.814835', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2462, 507099, 2, 506616, '441900122000', '厚街镇', '广东,东莞,厚街', '113.751765', '23.020536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2463, 507124, 2, 506616, '441900123000', '沙田镇', '广东,东莞,沙田', '113.751765', '23.020536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2464, 507143, 2, 506616, '441900124000', '道滘镇', '广东,东莞,道滘', '113.751765', '23.020536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2465, 507158, 2, 506616, '441900125000', '洪梅镇', '广东,东莞,洪梅', '113.608903', '22.994717', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2466, 507169, 2, 506616, '441900126000', '麻涌镇', '广东,东莞,麻涌', '113.751765', '23.020536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2467, 507185, 2, 506616, '441900127000', '望牛墩镇', '广东,东莞,望牛墩镇', '113.656243', '23.055331', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2468, 507208, 2, 506616, '441900128000', '中堂镇', '广东,东莞,中堂', '113.751765', '23.020536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2469, 507229, 2, 506616, '441900129000', '高埗镇', '广东,东莞,高埗', '113.722126', '23.078713', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2470, 507249, 2, 506616, '441900401000', '松山湖管委会', '广东,东莞,松山湖', '113.909208', '22.960541', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2471, 507251, 2, 506616, '441900402000', '虎门港管委会', '广东,东莞,虎门港', '113.583070', '22.864175', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2472, 507253, 2, 506616, '441900403000', '东莞生态园', '广东,东莞,东莞生态园', '113.927452', '23.063210', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2473, 507256, 2, 507255, '442000001000', '石岐区街道办事处', '广东,中山,石岐区', '113.384930', '22.532046', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2474, 507276, 2, 507255, '442000002000', '东区街道办事处', '广东,中山,东区', '113.392782', '22.517645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2475, 507287, 2, 507255, '442000003000', '火炬开发区街道办事处', '广东,中山,火炬开发区', '113.480528', '22.566086', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2476, 507295, 2, 507255, '442000004000', '西区街道办事处', '广东,中山,西区', '113.392782', '22.517645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2477, 507305, 2, 507255, '442000005000', '南区街道办事处', '广东,中山,南区', '113.358509', '22.472530', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2478, 507310, 2, 507255, '442000006000', '五桂山街道办事处', '广东,中山,五桂山', '113.463397', '22.421549', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2479, 507316, 2, 507255, '442000100000', '小榄镇', '广东,中山,小榄', '113.250897', '22.672099', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2480, 507332, 2, 507255, '442000101000', '黄圃镇', '广东,中山,黄圃', '113.335242', '22.709897', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2481, 507349, 2, 507255, '442000102000', '民众镇', '广东,中山,民众', '113.392782', '22.517645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2482, 507369, 2, 507255, '442000103000', '东凤镇', '广东,中山,东凤', '113.392782', '22.517645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2483, 507384, 2, 507255, '442000104000', '东升镇', '广东,中山,东升', '113.294393', '22.616908', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2484, 507399, 2, 507255, '442000105000', '古镇镇', '广东,中山,古镇', '113.190869', '22.613406', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2485, 507413, 2, 507255, '442000106000', '沙溪镇', '广东,中山,沙溪', '113.392782', '22.517645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2486, 507430, 2, 507255, '442000107000', '坦洲镇', '广东,中山,坦洲', '113.460373', '22.265182', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2487, 507445, 2, 507255, '442000108000', '港口镇', '广东,中山,港口', '113.247148', '22.683616', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2488, 507455, 2, 507255, '442000109000', '三角镇', '广东,中山,三角', '113.422371', '22.684688', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2489, 507464, 2, 507255, '442000110000', '横栏镇', '广东,中山,横栏', '113.265845', '22.523201', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2490, 507476, 2, 507255, '442000111000', '南头镇', '广东,中山,南头', '113.392782', '22.517645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2491, 507483, 2, 507255, '442000112000', '阜沙镇', '广东,中山,阜沙', '113.392782', '22.517645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2492, 507493, 2, 507255, '442000113000', '南朗镇', '广东,中山,南朗', '113.392782', '22.517645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2493, 507509, 2, 507255, '442000114000', '三乡镇', '广东,中山,三乡', '113.441614', '22.357754', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2494, 507526, 2, 507255, '442000115000', '板芙镇', '广东,中山,板芙', '113.392782', '22.517645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2495, 507538, 2, 507255, '442000116000', '大涌镇', '广东,中山,大涌', '113.392782', '22.517645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2496, 507550, 2, 507255, '442000117000', '神湾镇', '广东,中山,神湾', '113.392782', '22.517645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2497, 507558, 2, 507557, '445101000000', '市辖区', '广东,潮州', '116.622603', '23.656950', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2498, 507559, 2, 507557, '445102000000', '湘桥区', '广东,潮州,湘桥', '116.628632', '23.674536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2499, 507748, 2, 507557, '445103000000', '潮安区', '广东,潮州,潮安', '116.678204', '23.462613', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2500, 508223, 2, 507557, '445122000000', '饶平县', '广东,潮州,饶平', '117.003900', '23.663824', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2501, 508649, 2, 508648, '445201000000', '市辖区', '广东,揭阳', '116.372831', '23.549993', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2502, 508650, 2, 508648, '445202000000', '榕城区', '广东,揭阳,榕城', '116.367026', '23.525153', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2503, 508863, 2, 508648, '445203000000', '揭东区', '广东,揭阳,揭东', '116.412015', '23.566127', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2504, 509101, 2, 508648, '445222000000', '揭西县', '广东,揭阳,揭西', '115.841838', '23.431294', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2505, 509449, 2, 508648, '445224000000', '惠来县', '广东,揭阳,惠来', '116.295150', '23.033267', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2506, 509796, 2, 508648, '445281000000', '普宁市', '广东,揭阳,普宁', '116.166004', '23.297642', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2507, 510409, 2, 510408, '445301000000', '市辖区', '广东,云浮', '112.044491', '22.915094', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2508, 510410, 2, 510408, '445302000000', '云城区', '广东,云浮,云城', '112.043857', '22.928115', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2509, 510536, 2, 510408, '445303000000', '云安区', '广东,云浮,云安', '112.003209', '23.071020', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2510, 510660, 2, 510408, '445321000000', '新兴县', '广东,云浮,新兴', '112.225335', '22.695690', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2511, 510878, 2, 510408, '445322000000', '郁南县', '广东,云浮,郁南', '111.535249', '23.234627', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2512, 511102, 2, 510408, '445381000000', '罗定市', '广东,云浮,罗定', '111.570010', '22.768595', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2513, 511464, 2, 511463, '450101000000', '市辖区', '广西,南宁', '108.366543', '22.817002', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2514, 511465, 2, 511463, '450102000000', '兴宁区', '广西,南宁,兴宁', '108.368871', '22.854021', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2515, 511545, 2, 511463, '450103000000', '青秀区', '广西,南宁,青秀', '108.494024', '22.785879', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2516, 511662, 2, 511463, '450105000000', '江南区', '广西,南宁,江南', '108.273158', '22.781632', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2517, 511790, 2, 511463, '450107000000', '西乡塘区', '广西,南宁,西乡塘', '108.306886', '22.832770', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2518, 511960, 2, 511463, '450108000000', '良庆区', '广西,南宁,良庆', '108.322102', '22.759090', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2519, 512044, 2, 511463, '450109000000', '邕宁区', '广西,南宁,邕宁', '108.487369', '22.758390', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2520, 512124, 2, 511463, '450110000000', '武鸣区', '广西,南宁,武鸣', '108.274712', '23.158693', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2521, 512381, 2, 511463, '450123000000', '隆安县', '广西,南宁,隆安', '107.696153', '23.166028', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2522, 512530, 2, 511463, '450124000000', '马山县', '广西,南宁,马山', '108.176979', '23.708192', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2523, 512695, 2, 511463, '450125000000', '上林县', '广西,南宁,上林', '108.604921', '23.431936', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2524, 512838, 2, 511463, '450126000000', '宾阳县', '广西,南宁,宾阳', '108.810326', '23.217787', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2525, 513091, 2, 511463, '450127000000', '横县', '广西,南宁,横县', '109.261384', '22.679932', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2526, 513435, 2, 513434, '450201000000', '市辖区', '广西,柳州', '109.415953', '24.325502', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2527, 513436, 2, 513434, '450202000000', '城中区', '广西,柳州,城中', '109.410736', '24.315602', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2528, 513477, 2, 513434, '450203000000', '鱼峰区', '广西,柳州,鱼峰', '109.452442', '24.318517', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2529, 513569, 2, 513434, '450204000000', '柳南区', '广西,柳州,柳南', '109.385519', '24.336229', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2530, 513661, 2, 513434, '450205000000', '柳北区', '广西,柳州,柳北', '109.402050', '24.362691', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2531, 513772, 2, 513434, '450206000000', '柳江区', '广西,柳州,柳江', '109.326380', '24.254892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2532, 513938, 2, 513434, '450222000000', '柳城县', '广西,柳州,柳城', '109.244730', '24.651518', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2533, 514091, 2, 513434, '450223000000', '鹿寨县', '广西,柳州,鹿寨', '109.750638', '24.472897', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2534, 514219, 2, 513434, '450224000000', '融安县', '广西,柳州,融安', '109.397538', '25.224550', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2535, 514380, 2, 513434, '450225000000', '融水苗族自治县', '广西,柳州,融水', '109.256334', '25.065934', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2536, 514607, 2, 513434, '450226000000', '三江侗族自治县', '广西,柳州,三江', '109.607675', '25.783198', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2537, 514791, 2, 514790, '450301000000', '市辖区', '广西,桂林', '110.290194', '25.273566', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2538, 514792, 2, 514790, '450302000000', '秀峰区', '广西,桂林,秀峰', '110.264183', '25.273625', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2539, 514824, 2, 514790, '450303000000', '叠彩区', '广西,桂林,叠彩', '110.301723', '25.314001', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2540, 514864, 2, 514790, '450304000000', '象山区', '广西,桂林,象山', '110.281082', '25.261687', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2541, 514911, 2, 514790, '450305000000', '七星区', '广西,桂林,七星', '110.317826', '25.252701', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2542, 514964, 2, 514790, '450311000000', '雁山区', '广西,桂林,雁山', '110.286690', '25.101935', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2543, 515012, 2, 514790, '450312000000', '临桂区', '广西,桂林,临桂', '110.212463', '25.238628', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2544, 515195, 2, 514790, '450321000000', '阳朔县', '广西,桂林,阳朔', '110.496593', '24.778481', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2545, 515319, 2, 514790, '450323000000', '灵川县', '广西,桂林,灵川', '110.325636', '25.409747', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2546, 515481, 2, 514790, '450324000000', '全州县', '广西,桂林,全州', '111.072926', '25.928617', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2547, 515784, 2, 514790, '450325000000', '兴安县', '广西,桂林,兴安', '110.671670', '25.611705', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2548, 515920, 2, 514790, '450326000000', '永福县', '广西,桂林,永福', '109.983076', '24.979856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2549, 516029, 2, 514790, '450327000000', '灌阳县', '广西,桂林,灌阳', '111.160851', '25.489383', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2550, 516180, 2, 514790, '450328000000', '龙胜各族自治县', '广西,桂林,龙胜各族', '110.011238', '25.797931', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2551, 516317, 2, 514790, '450329000000', '资源县', '广西,桂林,资源', '110.652700', '26.042443', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2552, 516399, 2, 514790, '450330000000', '平乐县', '广西,桂林,平乐', '110.643305', '24.633362', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2553, 516563, 2, 514790, '450331000000', '荔浦县', '广西,桂林,荔浦', '110.395287', '24.487824', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2554, 516721, 2, 514790, '450332000000', '恭城瑶族自治县', '广西,桂林,恭城', '110.830193', '24.822522', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2555, 516859, 2, 516858, '450401000000', '市辖区', '广西,梧州', '111.279115', '23.476962', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2556, 516860, 2, 516858, '450403000000', '万秀区', '广西,梧州,万秀', '111.320542', '23.472962', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2557, 516945, 2, 516858, '450405000000', '长洲区', '广西,梧州,长洲', '111.274777', '23.485695', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2558, 516991, 2, 516858, '450406000000', '龙圩区', '广西,梧州,龙圩', '111.246035', '23.409960', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2559, 517075, 2, 516858, '450421000000', '苍梧县', '广西,梧州,苍梧', '111.544008', '23.845097', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2560, 517230, 2, 516858, '450422000000', '藤县', '广西,梧州,藤县', '110.914849', '23.374984', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2561, 517542, 2, 516858, '450423000000', '蒙山县', '广西,梧州,蒙山', '110.525003', '24.193570', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2562, 517636, 2, 516858, '450481000000', '岑溪市', '广西,梧州,岑溪', '110.994913', '22.918350', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2563, 517934, 2, 517933, '450501000000', '市辖区', '广西,北海', '109.119927', '21.481254', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2564, 517935, 2, 517933, '450502000000', '海城区', '广西,北海,海城', '109.117210', '21.475005', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2565, 518010, 2, 517933, '450503000000', '银海区', '广西,北海,银海', '109.139990', '21.449219', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2566, 518067, 2, 517933, '450512000000', '铁山港区', '广西,北海,铁山港', '109.421581', '21.529128', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2567, 518115, 2, 517933, '450521000000', '合浦县', '广西,北海,合浦', '109.207336', '21.660936', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2568, 518408, 2, 518407, '450601000000', '市辖区', '广西,防城港', '108.353846', '21.686860', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2569, 518409, 2, 518407, '450602000000', '港口区', '广西,防城港,港口', '108.380144', '21.643384', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2570, 518455, 2, 518407, '450603000000', '防城区', '广西,防城港,防城', '108.353499', '21.769212', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2571, 518641, 2, 518407, '450621000000', '上思县', '广西,防城港,上思', '107.983626', '22.153672', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2572, 518762, 2, 518407, '450681000000', '东兴市', '广西,防城港,东兴', '107.971826', '21.547822', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2573, 518809, 2, 518808, '450701000000', '市辖区', '广西,钦州', '108.654146', '21.979933', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2574, 518810, 2, 518808, '450702000000', '钦南区', '广西,钦州,钦南', '108.657210', '21.938860', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2575, 519003, 2, 518808, '450703000000', '钦北区', '广西,钦州,钦北', '108.449110', '22.132761', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2576, 519201, 2, 518808, '450721000000', '灵山县', '广西,钦州,灵山', '109.291007', '22.416537', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2577, 519637, 2, 518808, '450722000000', '浦北县', '广西,钦州,浦北', '109.556953', '22.271651', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2578, 519930, 2, 519929, '450801000000', '市辖区', '广西,贵港', '109.598926', '23.111530', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2579, 519931, 2, 519929, '450802000000', '港北区', '广西,贵港,港北', '109.572240', '23.111531', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2580, 520063, 2, 519929, '450803000000', '港南区', '广西,贵港,港南', '109.599557', '23.075573', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2581, 520240, 2, 519929, '450804000000', '覃塘区', '广西,贵港,覃塘', '109.452662', '23.127149', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2582, 520397, 2, 519929, '450821000000', '平南县', '广西,贵港,平南', '110.392168', '23.539127', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2583, 520707, 2, 519929, '450881000000', '桂平市', '广西,贵港,桂平', '110.079379', '23.394326', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2584, 521167, 2, 521166, '450901000000', '市辖区', '广西,玉林', '110.164756', '22.636379', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2585, 521168, 2, 521166, '450902000000', '玉州区', '广西,玉林,玉州', '110.151147', '22.628102', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2586, 521286, 2, 521166, '450903000000', '福绵区', '广西,玉林,福绵', '110.059439', '22.585557', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2587, 521409, 2, 521166, '450921000000', '容县', '广西,玉林,容县', '110.557874', '22.857823', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2588, 521652, 2, 521166, '450922000000', '陆川县', '广西,玉林,陆川', '110.264052', '22.321048', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2589, 521832, 2, 521166, '450923000000', '博白县', '广西,玉林,博白', '109.975985', '22.273048', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2590, 522220, 2, 521166, '450924000000', '兴业县', '广西,玉林,兴业', '109.875304', '22.736421', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2591, 522448, 2, 521166, '450981000000', '北流市', '广西,玉林,北流', '110.354215', '22.708311', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2592, 522787, 2, 522786, '451001000000', '市辖区', '广西,百色', '106.618201', '23.902333', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2593, 522788, 2, 522786, '451002000000', '右江区', '广西,百色,右江', '106.618645', '23.901383', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2594, 522918, 2, 522786, '451021000000', '田阳县', '广西,百色,田阳', '106.915418', '23.735682', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2595, 523086, 2, 522786, '451022000000', '田东县', '广西,百色,田东', '107.126081', '23.597194', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2596, 523265, 2, 522786, '451023000000', '平果县', '广西,百色,平果', '107.589810', '23.329376', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2597, 523461, 2, 522786, '451024000000', '德保县', '广西,百色,德保', '106.615374', '23.323450', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2598, 523661, 2, 522786, '451026000000', '那坡县', '广西,百色,那坡', '105.832530', '23.387441', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2599, 523801, 2, 522786, '451027000000', '凌云县', '广西,百色,凌云', '106.561310', '24.347557', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2600, 523920, 2, 522786, '451028000000', '乐业县', '广西,百色,乐业', '106.556519', '24.776827', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2601, 524017, 2, 522786, '451029000000', '田林县', '广西,百色,田林', '106.228538', '24.294488', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2602, 524200, 2, 522786, '451030000000', '西林县', '广西,百色,西林', '105.093837', '24.489810', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2603, 524306, 2, 522786, '451031000000', '隆林各族自治县', '广西,百色,隆林各族', '105.344040', '24.770896', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2604, 524502, 2, 522786, '451081000000', '靖西市', '广西,百色,靖西', '106.417549', '23.134766', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2605, 524815, 2, 524814, '451101000000', '市辖区', '广西,贺州', '111.566694', '24.403582', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2606, 524816, 2, 524814, '451102000000', '八步区', '广西,贺州,八步', '111.552096', '24.411805', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2607, 525035, 2, 524814, '451103000000', '平桂区', '广西,贺州,平桂', '111.566694', '24.403582', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2608, 525169, 2, 524814, '451121000000', '昭平县', '广西,贺州,昭平', '110.811287', '24.169480', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2609, 525341, 2, 524814, '451122000000', '钟山县', '广西,贺州,钟山', '111.303111', '24.526022', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2610, 525470, 2, 524814, '451123000000', '富川瑶族自治县', '广西,贺州,富川', '111.277389', '24.814444', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2611, 525639, 2, 525638, '451201000000', '市辖区', '广西,河池', '108.085261', '24.692931', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2612, 525640, 2, 525638, '451202000000', '金城江区', '广西,河池,金城江', '108.037277', '24.689703', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2613, 525798, 2, 525638, '451221000000', '南丹县', '广西,河池,南丹', '107.540722', '24.974486', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2614, 525961, 2, 525638, '451222000000', '天峨县', '广西,河池,天峨', '107.173802', '24.999108', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2615, 526066, 2, 525638, '451223000000', '凤山县', '广西,河池,凤山', '107.042191', '24.546876', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2616, 526174, 2, 525638, '451224000000', '东兰县', '广西,河池,东兰', '107.374294', '24.510842', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2617, 526338, 2, 525638, '451225000000', '罗城仫佬族自治县', '广西,河池,罗城', '108.904707', '24.777413', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2618, 526493, 2, 525638, '451226000000', '环江毛南族自治县', '广西,河池,环江', '108.258028', '24.825664', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2619, 526654, 2, 525638, '451227000000', '巴马瑶族自治县', '广西,河池,巴马', '107.258588', '24.142299', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2620, 526772, 2, 525638, '451228000000', '都安瑶族自治县', '广西,河池,都安', '108.128403', '23.919338', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2621, 527041, 2, 525638, '451229000000', '大化瑶族自治县', '广西,河池,大化', '108.085261', '24.692931', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2622, 527216, 2, 525638, '451281000000', '宜州市', '广西,河池,宜州', '108.636415', '24.485214', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2623, 527444, 2, 527443, '451301000000', '市辖区', '广西,来宾', '109.221465', '23.750306', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2624, 527445, 2, 527443, '451302000000', '兴宾区', '广西,来宾,兴宾', '109.230541', '23.732926', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2625, 527762, 2, 527443, '451321000000', '忻城县', '广西,来宾,忻城', '108.665666', '24.066235', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2626, 527905, 2, 527443, '451322000000', '象州县', '广西,来宾,象州', '109.683985', '23.958528', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2627, 528042, 2, 527443, '451323000000', '武宣县', '广西,来宾,武宣', '109.663207', '23.594110', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2628, 528205, 2, 527443, '451324000000', '金秀瑶族自治县', '广西,来宾,金秀', '110.189462', '24.130374', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2629, 528299, 2, 527443, '451381000000', '合山市', '广西,来宾,合山', '108.886082', '23.806536', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2630, 528340, 2, 528339, '451401000000', '市辖区', '广西,崇左', '107.364711', '22.376532', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2631, 528341, 2, 528339, '451402000000', '江州区', '广西,崇左,江州', '107.353437', '22.405325', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2632, 528494, 2, 528339, '451421000000', '扶绥县', '广西,崇左,扶绥', '107.904187', '22.635013', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2633, 528647, 2, 528339, '451422000000', '宁明县', '广西,崇左,宁明', '107.076457', '22.140192', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2634, 528845, 2, 528339, '451423000000', '龙州县', '广西,崇左,龙州', '106.854451', '22.342797', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2635, 528986, 2, 528339, '451424000000', '大新县', '广西,崇左,大新', '107.200654', '22.829288', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2636, 529159, 2, 528339, '451425000000', '天等县', '广西,崇左,天等', '107.143433', '23.081394', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2637, 529297, 2, 528339, '451481000000', '凭祥市', '广西,崇左,凭祥', '106.766293', '22.094485', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2638, 529346, 2, 529345, '460101000000', '市辖区', '海南,海口', '110.198293', '20.044001', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2639, 529347, 2, 529345, '460105000000', '秀英区', '海南,海口,秀英', '110.293561', '20.007969', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2640, 529451, 2, 529345, '460106000000', '龙华区', '海南,海口,龙华', '110.328492', '20.031007', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2641, 529589, 2, 529345, '460107000000', '琼山区', '海南,海口,琼山', '110.353972', '20.003170', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2642, 529720, 2, 529345, '460108000000', '美兰区', '海南,海口,美兰', '110.366357', '20.029083', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2643, 529879, 2, 529878, '460201000000', '市辖区', '海南,三亚', '109.511909', '18.252847', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2644, 529910, 2, 529878, '460202000000', '海棠区', '海南,三亚,海棠', '109.760778', '18.407516', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2645, 529934, 2, 529878, '460203000000', '吉阳区', '海南,三亚,吉阳', '109.578330', '18.281397', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2646, 529973, 2, 529878, '460204000000', '天涯区', '海南,三亚,天涯', '109.506357', '18.247340', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2647, 530027, 2, 529878, '460205000000', '崖州区', '海南,三亚,崖州', '109.174313', '18.352212', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2648, 530061, 2, 530060, '460321000000', '西沙群岛', '海南,三沙,西沙群岛', '112.338695', '16.831839', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2649, 530064, 2, 530060, '460322000000', '南沙群岛', '海南,三沙,南沙群岛', '112.338695', '16.831839', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2650, 530067, 2, 530060, '460323000000', '中沙群岛的岛礁及其海域', '海南,三沙,中沙群岛的岛礁及其海域', '112.338695', '16.831839', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2651, 530071, 2, 530070, '460400100000', '那大镇', '海南,儋州,那大', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2652, 530112, 2, 530070, '460400101000', '和庆镇', '海南,儋州,和庆', '109.640856', '19.525399', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2653, 530126, 2, 530070, '460400102000', '南丰镇', '海南,儋州,南丰', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2654, 530139, 2, 530070, '460400103000', '大成镇', '海南,儋州,大成', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2655, 530162, 2, 530070, '460400104000', '雅星镇', '海南,儋州,雅星', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2656, 530188, 2, 530070, '460400105000', '兰洋镇', '海南,儋州,兰洋', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2657, 530207, 2, 530070, '460400106000', '光村镇', '海南,儋州,光村', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2658, 530220, 2, 530070, '460400107000', '木棠镇', '海南,儋州,木棠', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2659, 530246, 2, 530070, '460400108000', '海头镇', '海南,儋州,海头', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2660, 530261, 2, 530070, '460400109000', '峨蔓镇', '海南,儋州,峨蔓', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2661, 530275, 2, 530070, '460400110000', '三都镇', '海南,儋州,三都', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2662, 530285, 2, 530070, '460400111000', '王五镇', '海南,儋州,王五', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2663, 530295, 2, 530070, '460400112000', '白马井镇', '海南,儋州,白马井镇', '109.218734', '19.696407', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2664, 530318, 2, 530070, '460400113000', '中和镇', '海南,儋州,中和', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2665, 530331, 2, 530070, '460400114000', '排浦镇', '海南,儋州,排浦', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2666, 530340, 2, 530070, '460400115000', '东成镇', '海南,儋州,东成', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2667, 530361, 2, 530070, '460400116000', '新州镇', '海南,儋州,新州', '110.349228', '20.017377', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2668, 530394, 2, 530070, '460400400000', '国营西培农场', '海南,儋州,国营西培农场', '109.455554', '19.476422', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2669, 530410, 2, 530070, '460400404000', '国营西联农场', '海南,儋州,国营西联农场', '109.539074', '19.673015', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2670, 530431, 2, 530070, '460400405000', '国营蓝洋农场', '海南,儋州,国营蓝洋农场', '109.670723', '19.458984', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2671, 530437, 2, 530070, '460400407000', '国营八一农场', '海南,儋州,国营八一农场', '109.364519', '19.413460', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2672, 530447, 2, 530070, '460400499000', '洋浦经济开发区', '海南,儋州,洋浦经济开发', '109.202064', '19.736941', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2673, 530466, 2, 530070, '460400500000', '华南热作学院', '海南,儋州,华南热作学院', '109.494073', '19.505382', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2674, 530469, 2, 530468, '469001000000', '五指山市', '海南,五指山', '109.516922', '18.775146', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2675, 530552, 2, 530468, '469002000000', '琼海市', '海南,琼海', '110.474579', '19.259140', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2676, 530809, 2, 530468, '469005000000', '文昌市', '海南,文昌', '110.797714', '19.543423', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2677, 531148, 2, 530468, '469006000000', '万宁市', '海南,万宁', '110.391075', '18.795143', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2678, 531426, 2, 530468, '469007000000', '东方市', '海南,东方', '108.651817', '19.095350', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2679, 531647, 2, 530468, '469021000000', '定安县', '海南,定安', '110.358891', '19.681434', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2680, 531811, 2, 530468, '469022000000', '屯昌县', '海南,屯昌', '110.103415', '19.351766', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2681, 531971, 2, 530468, '469023000000', '澄迈县', '海南,澄迈', '110.006755', '19.738521', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2682, 532200, 2, 530468, '469024000000', '临高县', '海南,临高', '109.690508', '19.912026', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2683, 532409, 2, 530468, '469025000000', '白沙黎族自治县', '海南,白沙', '109.451484', '19.224823', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2684, 532558, 2, 530468, '469026000000', '昌江黎族自治县', '海南,昌江', '109.055724', '19.298062', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2685, 532672, 2, 530468, '469027000000', '乐东黎族自治县', '海南,乐东', '109.173055', '18.750260', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2686, 532906, 2, 530468, '469028000000', '陵水黎族自治县', '海南,陵水', '110.037504', '18.506048', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2687, 533053, 2, 530468, '469029000000', '保亭黎族苗族自治县', '海南,保亭', '109.702590', '18.639130', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2688, 533161, 2, 530468, '469030000000', '琼中黎族苗族自治县', '海南,琼中', '109.838389', '19.033369', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2689, 533330, 2, 533329, '500101000000', '万州区', '重庆,万州', '108.408661', '30.807667', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2690, 534019, 2, 533329, '500102000000', '涪陵区', '重庆,涪陵', '107.389298', '29.703113', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2691, 534468, 2, 533329, '500103000000', '渝中区', '重庆,渝中', '106.568892', '29.552750', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2692, 534558, 2, 533329, '500104000000', '大渡口区', '重庆,大渡口', '106.482347', '29.484527', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2693, 534656, 2, 533329, '500105000000', '江北区', '重庆,江北', '106.574271', '29.606703', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2694, 534799, 2, 533329, '500106000000', '沙坪坝区', '重庆,沙坪坝', '106.456878', '29.541145', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2695, 535021, 2, 533329, '500107000000', '九龙坡区', '重庆,九龙坡', '106.510676', '29.502272', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2696, 535262, 2, 533329, '500108000000', '南岸区', '重庆,南岸', '106.644428', '29.500297', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2697, 535428, 2, 533329, '500109000000', '北碚区', '重庆,北碚', '106.395612', '29.805108', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2698, 535629, 2, 533329, '500110000000', '綦江区', '重庆,綦江', '106.651362', '29.028067', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2699, 536131, 2, 533329, '500111000000', '大足区', '重庆,大足', '105.721733', '29.707032', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2700, 536468, 2, 533329, '500112000000', '渝北区', '重庆,渝北', '106.631187', '29.718143', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2701, 536890, 2, 533329, '500113000000', '巴南区', '重庆,巴南', '106.540257', '29.402408', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2702, 537212, 2, 533329, '500114000000', '黔江区', '重庆,黔江', '108.770678', '29.533610', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2703, 537461, 2, 533329, '500115000000', '长寿区', '重庆,长寿', '107.081283', '29.857996', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2704, 537745, 2, 533329, '500116000000', '江津区', '重庆,江津', '106.259281', '29.290069', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2705, 538050, 2, 533329, '500117000000', '合川区', '重庆,合川', '106.276130', '29.972084', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2706, 538493, 2, 533329, '500118000000', '永川区', '重庆,永川', '105.927376', '29.356117', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2707, 538778, 2, 533329, '500119000000', '南川区', '重庆,南川', '107.099266', '29.157891', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2708, 539057, 2, 533329, '500120000000', '璧山区', '重庆,璧山', '106.227305', '29.592024', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2709, 539260, 2, 533329, '500151000000', '铜梁区', '重庆,铜梁', '106.056404', '29.844811', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2710, 539615, 2, 533329, '500152000000', '潼南区', '重庆,潼南', '105.840556', '30.191013', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2711, 539942, 2, 533329, '500153000000', '荣昌区', '重庆,荣昌', '105.594623', '29.405002', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2712, 540131, 2, 533329, '500154000000', '开州区', '重庆,开州', '106.551556', '29.563009', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2713, 540701, 2, 540700, '500228000000', '梁平县', '重庆,梁平', '107.769312', '30.654203', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2714, 541080, 2, 540700, '500229000000', '城口县', '重庆,城口', '108.664214', '31.947633', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2715, 541310, 2, 540700, '500230000000', '丰都县', '重庆,丰都', '107.730895', '29.863500', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2716, 541671, 2, 540700, '500231000000', '垫江县', '重庆,垫江', '107.333390', '30.327717', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2717, 541999, 2, 540700, '500232000000', '武隆县', '重庆,武隆', '107.760025', '29.325601', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2718, 542236, 2, 540700, '500233000000', '忠县', '重庆,忠县', '108.039002', '30.299560', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2719, 542631, 2, 540700, '500235000000', '云阳县', '重庆,云阳', '108.697324', '30.930613', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2720, 543152, 2, 540700, '500236000000', '奉节县', '重庆,奉节', '109.463987', '31.018498', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2721, 543575, 2, 540700, '500237000000', '巫山县', '重庆,巫山', '109.879153', '31.074834', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2722, 543943, 2, 540700, '500238000000', '巫溪县', '重庆,巫溪', '109.570062', '31.398604', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2723, 544307, 2, 540700, '500240000000', '石柱土家族自治县', '重庆,石柱', '108.114069', '29.999285', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2724, 544583, 2, 540700, '500241000000', '秀山土家族苗族自治县', '重庆,秀山', '109.007094', '28.447997', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2725, 544878, 2, 540700, '500242000000', '酉阳土家族苗族自治县', '重庆,酉阳', '108.767747', '28.841244', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2726, 545196, 2, 540700, '500243000000', '彭水苗族土家族自治县', '重庆,彭水', '108.165538', '29.293902', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2727, 545534, 2, 545533, '510101000000', '市辖区', '四川,成都', '104.066541', '30.572269', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2728, 545535, 2, 545533, '510104000000', '锦江区', '四川,成都,锦江', '104.080989', '30.657689', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2729, 545669, 2, 545533, '510105000000', '青羊区', '四川,成都,青羊', '104.062499', '30.674406', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2730, 545763, 2, 545533, '510106000000', '金牛区', '四川,成都,金牛', '104.052236', '30.691359', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2731, 545889, 2, 545533, '510107000000', '武侯区', '四川,成都,武侯', '104.043390', '30.641982', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2732, 546035, 2, 545533, '510108000000', '成华区', '四川,成都,成华', '104.101255', '30.660122', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2733, 546151, 2, 545533, '510112000000', '龙泉驿区', '四川,成都,龙泉驿', '104.274632', '30.556507', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2734, 546306, 2, 545533, '510113000000', '青白江区', '四川,成都,青白江', '104.250877', '30.878681', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2735, 546441, 2, 545533, '510114000000', '新都区', '四川,成都,新都', '104.158705', '30.823499', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2736, 546710, 2, 545533, '510115000000', '温江区', '四川,成都,温江', '103.856646', '30.682203', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2737, 546835, 2, 545533, '510116000000', '双流区', '四川,成都,双流', '103.923588', '30.574488', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2738, 547144, 2, 545533, '510121000000', '金堂县', '四川,成都,金堂', '104.412005', '30.862017', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2739, 547398, 2, 545533, '510124000000', '郫县', '四川,成都,郫县', '103.901092', '30.795854', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2740, 547634, 2, 545533, '510129000000', '大邑县', '四川,成都,大邑', '103.511875', '30.572269', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2741, 547873, 2, 545533, '510131000000', '蒲江县', '四川,成都,蒲江', '103.506498', '30.196789', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2742, 548018, 2, 545533, '510132000000', '新津县', '四川,成都,新津', '103.811345', '30.410222', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2743, 548137, 2, 545533, '510181000000', '都江堰市', '四川,成都,都江堰', '103.646912', '30.988435', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2744, 548412, 2, 545533, '510182000000', '彭州市', '四川,成都,彭州', '103.958013', '30.990165', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2745, 548788, 2, 545533, '510183000000', '邛崃市', '四川,成都,邛崃', '103.464156', '30.410275', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2746, 549084, 2, 545533, '510184000000', '崇州市', '四川,成都,崇州', '103.673001', '30.630122', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2747, 549363, 2, 545533, '510185000000', '简阳市', '四川,成都,简阳', '104.546774', '30.410755', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2748, 550276, 2, 550275, '510301000000', '市辖区', '四川,自贡', '104.778442', '29.339030', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2749, 550277, 2, 550275, '510302000000', '自流井区', '四川,自贡,自流井', '104.777191', '29.337430', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2750, 550413, 2, 550275, '510303000000', '贡井区', '四川,自贡,贡井', '104.715117', '29.345546', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2751, 550609, 2, 550275, '510304000000', '大安区', '四川,自贡,大安', '104.773968', '29.363634', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2752, 550816, 2, 550275, '510311000000', '沿滩区', '四川,自贡,沿滩', '104.874073', '29.272581', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2753, 551023, 2, 550275, '510321000000', '荣县', '四川,自贡,荣县', '104.417388', '29.445410', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2754, 551398, 2, 550275, '510322000000', '富顺县', '四川,自贡,富顺', '104.975048', '29.181430', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2755, 551810, 2, 551809, '510401000000', '市辖区', '四川,攀枝花', '101.718637', '26.582347', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2756, 551811, 2, 551809, '510402000000', '东区', '四川,攀枝花,东区', '101.718637', '26.582347', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2757, 551891, 2, 551809, '510403000000', '西区', '四川,攀枝花,西区', '101.718637', '26.582347', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2758, 551941, 2, 551809, '510411000000', '仁和区', '四川,攀枝花,仁和', '101.738528', '26.497765', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2759, 552057, 2, 551809, '510421000000', '米易县', '四川,攀枝花,米易', '102.110339', '26.890689', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2760, 552169, 2, 551809, '510422000000', '盐边县', '四川,攀枝花,盐边', '101.855071', '26.683213', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2761, 552359, 2, 552358, '510501000000', '市辖区', '四川,泸州', '105.442258', '28.871810', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2762, 552360, 2, 552358, '510502000000', '江阳区', '四川,泸州,江阳', '105.435009', '28.878818', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2763, 552536, 2, 552358, '510503000000', '纳溪区', '四川,泸州,纳溪', '105.371151', '28.773428', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2764, 552755, 2, 552358, '510504000000', '龙马潭区', '四川,泸州,龙马潭', '105.437765', '28.913221', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2765, 552858, 2, 552358, '510521000000', '泸县', '四川,泸州,泸县', '105.381893', '29.151534', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2766, 553181, 2, 552358, '510522000000', '合江县', '四川,泸州,合江', '105.831067', '28.811203', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2767, 553536, 2, 552358, '510524000000', '叙永县', '四川,泸州,叙永', '105.444765', '28.155801', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2768, 553823, 2, 552358, '510525000000', '古蔺县', '四川,泸州,古蔺', '105.812602', '28.038802', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2769, 554143, 2, 554142, '510601000000', '市辖区', '四川,德阳', '104.397894', '31.126855', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2770, 554144, 2, 554142, '510603000000', '旌阳区', '四川,德阳,旌阳', '104.416943', '31.142498', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2771, 554397, 2, 554142, '510623000000', '中江县', '四川,德阳,中江', '104.678749', '31.033051', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2772, 555280, 2, 554142, '510626000000', '罗江县', '四川,德阳,罗江', '104.510249', '31.317045', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2773, 555418, 2, 554142, '510681000000', '广汉市', '四川,德阳,广汉', '104.282331', '30.976165', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2774, 555660, 2, 554142, '510682000000', '什邡市', '四川,德阳,什邡', '104.167501', '31.126780', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2775, 555848, 2, 554142, '510683000000', '绵竹市', '四川,德阳,绵竹', '104.220750', '31.338077', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2776, 556078, 2, 556077, '510701000000', '市辖区', '四川,绵阳', '104.679114', '31.467450', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2777, 556079, 2, 556077, '510703000000', '涪城区', '四川,绵阳,涪城', '104.756944', '31.455101', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2778, 556357, 2, 556077, '510704000000', '游仙区', '四川,绵阳,游仙', '104.766393', '31.473779', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2779, 556705, 2, 556077, '510705000000', '安州区', '四川,绵阳,安州', '104.679114', '31.467450', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2780, 556985, 2, 556077, '510722000000', '三台县', '四川,绵阳,三台', '105.094586', '31.095979', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2781, 558091, 2, 556077, '510723000000', '盐亭县', '四川,绵阳,盐亭', '105.389453', '31.208363', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2782, 558648, 2, 556077, '510725000000', '梓潼县', '四川,绵阳,梓潼', '105.170845', '31.642718', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2783, 559030, 2, 556077, '510726000000', '北川羌族自治县', '四川,绵阳,北川', '104.467970', '31.617203', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2784, 559397, 2, 556077, '510727000000', '平武县', '四川,绵阳,平武', '104.555583', '32.409675', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2785, 559687, 2, 556077, '510781000000', '江油市', '四川,绵阳,江油', '104.745877', '31.778025', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2786, 560192, 2, 560191, '510801000000', '市辖区', '四川,广元', '105.843357', '32.435435', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2787, 560193, 2, 560191, '510802000000', '利州区', '四川,广元,利州', '105.845218', '32.433898', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2788, 560469, 2, 560191, '510811000000', '昭化区', '四川,广元,昭化', '105.964121', '32.322788', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2789, 560735, 2, 560191, '510812000000', '朝天区', '四川,广元,朝天', '105.890445', '32.643982', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2790, 560982, 2, 560191, '510821000000', '旺苍县', '四川,广元,旺苍', '106.289905', '32.228917', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2791, 561413, 2, 560191, '510822000000', '青川县', '四川,广元,青川', '105.238842', '32.575485', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2792, 561756, 2, 560191, '510823000000', '剑阁县', '四川,广元,剑阁', '105.524766', '32.287723', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2793, 562393, 2, 560191, '510824000000', '苍溪县', '四川,广元,苍溪', '105.934801', '31.732432', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2794, 563243, 2, 563242, '510901000000', '市辖区', '四川,遂宁', '105.592898', '30.532847', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2795, 563244, 2, 563242, '510903000000', '船山区', '四川,遂宁,船山', '105.568297', '30.525475', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2796, 563569, 2, 563242, '510904000000', '安居区', '四川,遂宁,安居', '105.456342', '30.355379', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2797, 564115, 2, 563242, '510921000000', '蓬溪县', '四川,遂宁,蓬溪', '105.707570', '30.757575', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2798, 564699, 2, 563242, '510922000000', '射洪县', '四川,遂宁,射洪', '105.388405', '30.870986', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2799, 565387, 2, 563242, '510923000000', '大英县', '四川,遂宁,大英', '105.236904', '30.594337', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2800, 565736, 2, 565735, '511001000000', '市辖区', '四川,内江', '105.058433', '29.580228', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2801, 565737, 2, 565735, '511002000000', '市中区', '四川,内江,市中', '105.067597', '29.587053', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2802, 565956, 2, 565735, '511011000000', '东兴区', '四川,内江,东兴', '105.075490', '29.592756', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2803, 566504, 2, 565735, '511024000000', '威远县', '四川,内江,威远', '104.668879', '29.527440', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2804, 566895, 2, 565735, '511025000000', '资中县', '四川,内江,资中', '104.851944', '29.764059', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2805, 567769, 2, 565735, '511028000000', '隆昌县', '四川,内江,隆昌', '105.287612', '29.339476', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2806, 568203, 2, 568202, '511101000000', '市辖区', '四川,乐山', '103.765568', '29.552106', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2807, 568204, 2, 568202, '511102000000', '市中区', '四川,乐山,市中', '103.761330', '29.555375', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2808, 568549, 2, 568202, '511111000000', '沙湾区', '四川,乐山,沙湾', '103.549991', '29.413091', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2809, 568712, 2, 568202, '511112000000', '五通桥区', '四川,乐山,五通桥', '103.818009', '29.406932', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2810, 568897, 2, 568202, '511113000000', '金口河区', '四川,乐山,金口河', '103.078621', '29.244345', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2811, 568949, 2, 568202, '511123000000', '犍为县', '四川,乐山,犍为', '103.949326', '29.208171', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2812, 569368, 2, 568202, '511124000000', '井研县', '四川,乐山,井研', '104.069726', '29.651287', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2813, 569627, 2, 568202, '511126000000', '夹江县', '四川,乐山,夹江', '103.571657', '29.737630', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2814, 569905, 2, 568202, '511129000000', '沐川县', '四川,乐山,沐川', '103.902335', '28.956647', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2815, 570138, 2, 568202, '511132000000', '峨边彝族自治县', '四川,乐山,峨边', '103.765568', '29.552106', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2816, 570296, 2, 568202, '511133000000', '马边彝族自治县', '四川,乐山,马边', '103.546348', '28.835521', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2817, 570440, 2, 568202, '511181000000', '峨眉山市', '四川,乐山,峨眉山', '103.484504', '29.601199', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2818, 570734, 2, 570733, '511301000000', '市辖区', '四川,南充', '106.110698', '30.837793', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2819, 570735, 2, 570733, '511302000000', '顺庆区', '四川,南充,顺庆', '106.092399', '30.796486', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2820, 571078, 2, 570733, '511303000000', '高坪区', '四川,南充,高坪', '106.118808', '30.781623', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2821, 571510, 2, 570733, '511304000000', '嘉陵区', '四川,南充,嘉陵', '106.071793', '30.758748', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2822, 572146, 2, 570733, '511321000000', '南部县', '四川,南充,南部', '106.036584', '31.347467', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2823, 573339, 2, 570733, '511322000000', '营山县', '四川,南充,营山', '106.565473', '31.076458', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2824, 574080, 2, 570733, '511323000000', '蓬安县', '四川,南充,蓬安', '106.412151', '31.029097', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2825, 574767, 2, 570733, '511324000000', '仪陇县', '四川,南充,仪陇', '106.303042', '31.271562', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2826, 575761, 2, 570733, '511325000000', '西充县', '四川,南充,西充', '105.900878', '30.995669', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2827, 576427, 2, 570733, '511381000000', '阆中市', '四川,南充,阆中', '106.005047', '31.558357', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2828, 576993, 2, 576992, '511401000000', '市辖区', '四川,眉山', '103.848538', '30.075439', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2829, 576994, 2, 576992, '511402000000', '东坡区', '四川,眉山,东坡', '103.831752', '30.042345', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2830, 577323, 2, 576992, '511403000000', '彭山区', '四川,眉山,彭山', '103.872950', '30.193056', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2831, 577445, 2, 576992, '511421000000', '仁寿县', '四川,眉山,仁寿', '104.134082', '29.995630', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2832, 578124, 2, 576992, '511423000000', '洪雅县', '四川,眉山,洪雅', '103.372863', '29.904890', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2833, 578299, 2, 576992, '511424000000', '丹棱县', '四川,眉山,丹棱', '103.512733', '30.014448', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2834, 578385, 2, 576992, '511425000000', '青神县', '四川,眉山,青神', '103.846688', '29.831358', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2835, 578486, 2, 578485, '511501000000', '市辖区', '四川,宜宾', '104.643215', '28.751768', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2836, 578487, 2, 578485, '511502000000', '翠屏区', '四川,宜宾,翠屏', '104.620009', '28.765690', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2837, 578857, 2, 578485, '511503000000', '南溪区', '四川,宜宾,南溪', '104.969882', '28.845626', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2838, 579114, 2, 578485, '511521000000', '宜宾县', '四川,宜宾,宜宾', '104.533213', '28.690045', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2839, 579727, 2, 578485, '511523000000', '江安县', '四川,宜宾,江安', '105.066943', '28.723999', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2840, 580070, 2, 578485, '511524000000', '长宁县', '四川,宜宾,长宁', '104.921174', '28.582169', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2841, 580388, 2, 578485, '511525000000', '高县', '四川,宜宾,高县', '104.517739', '28.436226', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2842, 580725, 2, 578485, '511526000000', '珙县', '四川,宜宾,珙县', '104.709202', '28.438630', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2843, 581025, 2, 578485, '511527000000', '筠连县', '四川,宜宾,筠连', '104.510988', '28.163860', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2844, 581304, 2, 578485, '511528000000', '兴文县', '四川,宜宾,兴文', '105.236325', '28.303614', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2845, 581579, 2, 578485, '511529000000', '屏山县', '四川,宜宾,屏山', '104.345974', '28.828482', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2846, 581871, 2, 581870, '511601000000', '市辖区', '四川,广安', '106.633212', '30.455961', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2847, 581872, 2, 581870, '511602000000', '广安区', '四川,广安,广安', '106.641608', '30.474003', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2848, 582526, 2, 581870, '511603000000', '前锋区', '四川,广安,前锋', '106.893277', '30.496300', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2849, 582827, 2, 581870, '511621000000', '岳池县', '四川,广安,岳池', '106.440114', '30.537863', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2850, 583751, 2, 581870, '511622000000', '武胜县', '四川,广安,武胜', '106.295764', '30.348772', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2851, 584332, 2, 581870, '511623000000', '邻水县', '四川,广安,邻水', '106.930380', '30.334769', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2852, 584900, 2, 581870, '511681000000', '华蓥市', '四川,广安,华蓥', '106.783088', '30.390435', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2853, 585050, 2, 585049, '511701000000', '市辖区', '四川,达州', '107.468023', '31.209571', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2854, 585051, 2, 585049, '511702000000', '通川区', '四川,达州,通川', '107.504517', '31.214724', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2855, 585347, 2, 585049, '511703000000', '达川区', '四川,达州,达川', '107.511845', '31.196118', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2856, 586085, 2, 585049, '511722000000', '宣汉县', '四川,达州,宣汉', '107.727191', '31.353835', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2857, 586709, 2, 585049, '511723000000', '开江县', '四川,达州,开江', '107.868736', '31.082987', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2858, 586957, 2, 585049, '511724000000', '大竹县', '四川,达州,大竹', '107.204744', '30.736266', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2859, 587452, 2, 585049, '511725000000', '渠县', '四川,达州,渠县', '106.972996', '30.836659', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2860, 588071, 2, 585049, '511781000000', '万源市', '四川,达州,万源', '108.034657', '32.081631', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2861, 588539, 2, 588538, '511801000000', '市辖区', '四川,雅安', '103.013261', '29.980537', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2862, 588540, 2, 588538, '511802000000', '雨城区', '四川,雅安,雨城', '103.033083', '30.005447', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2863, 588771, 2, 588538, '511803000000', '名山区', '四川,雅安,名山', '103.109185', '30.069954', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2864, 589001, 2, 588538, '511822000000', '荥经县', '四川,雅安,荥经', '102.846738', '29.792931', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2865, 589135, 2, 588538, '511823000000', '汉源县', '四川,雅安,汉源', '102.645453', '29.347187', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2866, 589376, 2, 588538, '511824000000', '石棉县', '四川,雅安,石棉', '102.359462', '29.227874', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2867, 589494, 2, 588538, '511825000000', '天全县', '四川,雅安,天全', '102.758317', '30.066713', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2868, 589654, 2, 588538, '511826000000', '芦山县', '四川,雅安,芦山', '102.928260', '30.144084', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2869, 589711, 2, 588538, '511827000000', '宝兴县', '四川,雅安,宝兴', '102.814531', '30.368126', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2870, 589780, 2, 589779, '511901000000', '市辖区', '四川,巴中', '106.747477', '31.867903', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2871, 589781, 2, 589779, '511902000000', '巴州区', '四川,巴中,巴州', '106.768878', '31.851478', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2872, 590246, 2, 589779, '511903000000', '恩阳区', '四川,巴中,恩阳', '106.655347', '31.786691', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2873, 590712, 2, 589779, '511921000000', '通江县', '四川,巴中,通江', '107.245033', '31.911705', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2874, 591330, 2, 589779, '511922000000', '南江县', '四川,巴中,南江', '106.828697', '32.346589', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2875, 592003, 2, 589779, '511923000000', '平昌县', '四川,巴中,平昌', '107.104008', '31.560874', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2876, 592599, 2, 592598, '512001000000', '市辖区', '四川,资阳', '104.627636', '30.128901', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2877, 592600, 2, 592598, '512002000000', '雁江区', '四川,资阳,雁江', '104.677096', '30.108210', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2878, 593157, 2, 592598, '512021000000', '安岳县', '四川,资阳,安岳', '105.335613', '30.097246', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2879, 594205, 2, 592598, '512022000000', '乐至县', '四川,资阳,乐至', '105.020204', '30.276120', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2880, 594865, 2, 594864, '513201000000', '马尔康市', '四川,阿坝,马尔康', '102.206504', '31.905813', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2881, 594988, 2, 594864, '513221000000', '汶川县', '四川,阿坝,汶川', '103.590387', '31.476822', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2882, 595128, 2, 594864, '513222000000', '理县', '四川,阿坝,理县', '103.166853', '31.436473', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2883, 595230, 2, 594864, '513223000000', '茂县', '四川,阿坝,茂县', '103.853522', '31.681154', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2884, 595404, 2, 594864, '513224000000', '松潘县', '四川,阿坝,松潘', '103.604698', '32.655325', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2885, 595579, 2, 594864, '513225000000', '九寨沟县', '四川,阿坝,九寨沟', '104.243841', '33.252056', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2886, 595731, 2, 594864, '513226000000', '金川县', '四川,阿坝,金川', '102.063829', '31.476277', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2887, 595864, 2, 594864, '513227000000', '小金县', '四川,阿坝,小金', '102.364373', '30.999031', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2888, 596022, 2, 594864, '513228000000', '黑水县', '四川,阿坝,黑水', '102.990108', '32.061895', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2889, 596167, 2, 594864, '513230000000', '壤塘县', '四川,阿坝,壤塘', '100.978526', '32.265796', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2890, 596243, 2, 594864, '513231000000', '阿坝县', '四川,阿坝,阿坝', '101.706655', '32.902459', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2891, 596354, 2, 594864, '513232000000', '若尔盖县', '四川,阿坝,若尔盖', '102.961798', '33.575892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2892, 596475, 2, 594864, '513233000000', '红原县', '四川,阿坝,红原', '102.544405', '32.790891', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2893, 596526, 2, 596525, '513301000000', '康定市', '四川,甘孜,康定', '101.957146', '29.998436', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2894, 596792, 2, 596525, '513322000000', '泸定县', '四川,甘孜,泸定', '102.234618', '29.914160', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2895, 596957, 2, 596525, '513323000000', '丹巴县', '四川,甘孜,丹巴', '101.890358', '30.878577', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2896, 597158, 2, 596525, '513324000000', '九龙县', '四川,甘孜,九龙', '101.507294', '29.000348', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2897, 597242, 2, 596525, '513325000000', '雅江县', '四川,甘孜,雅江', '101.014425', '30.031533', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2898, 597374, 2, 596525, '513326000000', '道孚县', '四川,甘孜,道孚', '101.125237', '30.979545', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2899, 597557, 2, 596525, '513327000000', '炉霍县', '四川,甘孜,炉霍', '100.676372', '31.391790', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2900, 597749, 2, 596525, '513328000000', '甘孜县', '四川,甘孜,甘孜', '99.992671', '31.622934', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2901, 597992, 2, 596525, '513329000000', '新龙县', '四川,甘孜,新龙', '100.311369', '30.939169', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2902, 598162, 2, 596525, '513330000000', '德格县', '四川,甘孜,德格', '98.580915', '31.806118', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2903, 598363, 2, 596525, '513331000000', '白玉县', '四川,甘孜,白玉', '98.824182', '31.209913', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2904, 598540, 2, 596525, '513332000000', '石渠县', '四川,甘孜,石渠', '98.102900', '32.978960', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2905, 598733, 2, 596525, '513333000000', '色达县', '四川,甘孜,色达', '100.332743', '32.268129', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2906, 598889, 2, 596525, '513334000000', '理塘县', '四川,甘孜,理塘', '100.269818', '29.996049', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2907, 599129, 2, 596525, '513335000000', '巴塘县', '四川,甘孜,巴塘', '99.110712', '30.004677', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2908, 599272, 2, 596525, '513336000000', '乡城县', '四川,甘孜,乡城', '99.798435', '28.931172', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2909, 599377, 2, 596525, '513337000000', '稻城县', '四川,甘孜,稻城', '100.298403', '29.037007', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2910, 599516, 2, 596525, '513338000000', '得荣县', '四川,甘孜,得荣', '99.286335', '28.713037', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2911, 599660, 2, 599659, '513401000000', '西昌市', '四川,凉山,西昌', '102.264449', '27.894504', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2912, 599974, 2, 599659, '513422000000', '木里藏族自治县', '四川,凉山,木里', '101.280206', '27.928835', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2913, 600127, 2, 599659, '513423000000', '盐源县', '四川,凉山,盐源', '101.509188', '27.422645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2914, 600415, 2, 599659, '513424000000', '德昌县', '四川,凉山,德昌', '102.175670', '27.402839', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2915, 600579, 2, 599659, '513425000000', '会理县', '四川,凉山,会理', '102.244683', '26.655026', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2916, 600938, 2, 599659, '513426000000', '会东县', '四川,凉山,会东', '102.577961', '26.634669', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2917, 601284, 2, 599659, '513427000000', '宁南县', '四川,凉山,宁南', '102.759634', '27.066384', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2918, 601444, 2, 599659, '513428000000', '普格县', '四川,凉山,普格', '102.540901', '27.376413', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2919, 601640, 2, 599659, '513429000000', '布拖县', '四川,凉山,布拖', '102.811631', '27.706192', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2920, 601863, 2, 599659, '513430000000', '金阳县', '四川,凉山,金阳', '103.248772', '27.696861', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2921, 602076, 2, 599659, '513431000000', '昭觉县', '四川,凉山,昭觉', '102.842611', '28.014088', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2922, 602396, 2, 599659, '513432000000', '喜德县', '四川,凉山,喜德', '102.412518', '28.306726', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2923, 602594, 2, 599659, '513433000000', '冕宁县', '四川,凉山,冕宁', '102.177010', '28.549657', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2924, 602865, 2, 599659, '513434000000', '越西县', '四川,凉山,越西', '102.507680', '28.639801', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2925, 603201, 2, 599659, '513435000000', '甘洛县', '四川,凉山,甘洛', '102.771749', '28.966069', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2926, 603460, 2, 599659, '513436000000', '美姑县', '四川,凉山,美姑', '103.132180', '28.328640', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2927, 603792, 2, 599659, '513437000000', '雷波县', '四川,凉山,雷波', '103.571696', '28.262683', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2928, 604133, 2, 604132, '520101000000', '市辖区', '贵州,贵阳', '106.630153', '26.647661', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2929, 604134, 2, 604132, '520102000000', '南明区', '贵州,贵阳,南明', '106.714371', '26.567944', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2930, 604342, 2, 604132, '520103000000', '云岩区', '贵州,贵阳,云岩', '106.630153', '26.647661', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2931, 604530, 2, 604132, '520111000000', '花溪区', '贵州,贵阳,花溪', '106.670258', '26.409817', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2932, 604769, 2, 604132, '520112000000', '乌当区', '贵州,贵阳,乌当', '106.630153', '26.647661', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2933, 604883, 2, 604132, '520113000000', '白云区', '贵州,贵阳,白云', '106.630153', '26.647661', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2934, 604989, 2, 604132, '520115000000', '观山湖区', '贵州,贵阳,观山湖', '106.622452', '26.601450', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2935, 605114, 2, 604132, '520121000000', '开阳县', '贵州,贵阳,开阳', '106.965088', '27.057764', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2936, 605264, 2, 604132, '520122000000', '息烽县', '贵州,贵阳,息烽', '106.740410', '27.090479', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2937, 605453, 2, 604132, '520123000000', '修文县', '贵州,贵阳,修文', '106.592110', '26.838926', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2938, 605593, 2, 604132, '520181000000', '清镇市', '贵州,贵阳,清镇', '106.470711', '26.556080', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2939, 605835, 2, 605834, '520201000000', '钟山区', '贵州,六盘水,钟山', '104.843555', '26.574979', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2940, 605994, 2, 605834, '520203000000', '六枝特区', '贵州,六盘水,六枝特', '105.480029', '26.201228', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2941, 606258, 2, 605834, '520221000000', '水城县', '贵州,六盘水,水城', '104.957831', '26.547904', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2942, 606493, 2, 605834, '520222000000', '盘县', '贵州,六盘水,盘县', '104.471535', '25.710002', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2943, 607030, 2, 607029, '520301000000', '市辖区', '贵州,遵义', '106.927389', '27.725654', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2944, 607031, 2, 607029, '520302000000', '红花岗区', '贵州,遵义,红花岗', '106.893709', '27.644755', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2945, 607235, 2, 607029, '520303000000', '汇川区', '贵州,遵义,汇川', '106.934270', '27.750125', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2946, 607385, 2, 607029, '520304000000', '播州区', '贵州,遵义,播州', '106.927389', '27.725654', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2947, 607584, 2, 607029, '520322000000', '桐梓县', '贵州,遵义,桐梓', '106.825644', '28.133583', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2948, 607833, 2, 607029, '520323000000', '绥阳县', '贵州,遵义,绥阳', '107.191222', '27.946222', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2949, 607966, 2, 607029, '520324000000', '正安县', '贵州,遵义,正安', '107.453945', '28.553285', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2950, 608138, 2, 607029, '520325000000', '道真仡佬族苗族自治县', '贵州,遵义,道真', '106.927389', '27.725654', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2951, 608236, 2, 607029, '520326000000', '务川仡佬族苗族自治县', '贵州,遵义,务川', '107.898957', '28.563086', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2952, 608370, 2, 607029, '520327000000', '凤冈县', '贵州,遵义,凤冈', '107.716356', '27.954695', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2953, 608471, 2, 607029, '520328000000', '湄潭县', '贵州,遵义,湄潭', '107.465407', '27.749055', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2954, 608620, 2, 607029, '520329000000', '余庆县', '贵州,遵义,余庆', '107.905278', '27.215420', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2955, 608701, 2, 607029, '520330000000', '习水县', '贵州,遵义,习水', '106.197138', '28.331270', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2956, 608974, 2, 607029, '520381000000', '赤水市', '贵州,遵义,赤水', '105.697472', '28.590337', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2957, 609114, 2, 607029, '520382000000', '仁怀市', '贵州,遵义,仁怀', '106.400342', '27.791650', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2958, 609310, 2, 609309, '520401000000', '市辖区', '贵州,安顺', '105.947593', '26.253072', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2959, 609311, 2, 609309, '520402000000', '西秀区', '贵州,安顺,西秀', '105.965535', '26.245433', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2960, 609686, 2, 609309, '520403000000', '平坝区', '贵州,安顺,平坝', '106.255557', '26.405502', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2961, 609845, 2, 609309, '520422000000', '普定县', '贵州,安顺,普定', '105.743196', '26.301446', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2962, 610030, 2, 609309, '520423000000', '镇宁布依族苗族自治县', '贵州,安顺,镇宁', '105.770402', '26.057362', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2963, 610256, 2, 609309, '520424000000', '关岭布依族苗族自治县', '贵州,安顺,关岭', '105.622053', '25.940378', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2964, 610426, 2, 609309, '520425000000', '紫云苗族布依族自治县', '贵州,安顺,紫云', '106.087216', '25.755886', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2965, 610608, 2, 610607, '520501000000', '市辖区', '贵州,毕节', '105.283992', '27.302589', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2966, 610609, 2, 610607, '520502000000', '七星关区', '贵州,毕节,七星关', '105.305138', '27.298494', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2967, 611207, 2, 610607, '520521000000', '大方县', '贵州,毕节,大方', '105.613174', '27.141682', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2968, 611627, 2, 610607, '520522000000', '黔西县', '贵州,毕节,黔西', '106.033544', '27.007713', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2969, 612043, 2, 610607, '520523000000', '金沙县', '贵州,毕节,金沙', '106.220228', '27.459214', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2970, 612308, 2, 610607, '520524000000', '织金县', '贵州,毕节,织金', '105.770542', '26.663450', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2971, 612915, 2, 610607, '520525000000', '纳雍县', '贵州,毕节,纳雍', '105.382715', '26.777645', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2972, 613369, 2, 610607, '520526000000', '威宁彝族回族苗族自治县', '贵州,毕节,威宁', '104.278740', '26.856210', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2973, 614035, 2, 610607, '520527000000', '赫章县', '贵州,毕节,赫章', '104.727418', '27.123079', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2974, 614531, 2, 614530, '520601000000', '市辖区', '贵州,铜仁', '109.189598', '27.731514', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2975, 614532, 2, 614530, '520602000000', '碧江区', '贵州,铜仁,碧江', '109.181122', '27.690653', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2976, 614636, 2, 614530, '520603000000', '万山区', '贵州,铜仁,万山', '109.213644', '27.517896', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2977, 614733, 2, 614530, '520621000000', '江口县', '贵州,铜仁,江口', '108.839557', '27.699650', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2978, 614900, 2, 614530, '520622000000', '玉屏侗族自治县', '贵州,铜仁,玉屏', '108.914680', '27.243012', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2979, 615001, 2, 614530, '520623000000', '石阡县', '贵州,铜仁,石阡', '108.223612', '27.513829', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2980, 615331, 2, 614530, '520624000000', '思南县', '贵州,铜仁,思南', '108.253873', '27.937560', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2981, 615886, 2, 614530, '520625000000', '印江土家族苗族自治县', '贵州,铜仁,印江', '108.409752', '27.994247', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2982, 616278, 2, 614530, '520626000000', '德江县', '贵州,铜仁,德江', '108.119807', '28.263964', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2983, 616644, 2, 614530, '520627000000', '沿河土家族自治县', '贵州,铜仁,沿河', '108.503870', '28.563928', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2984, 617116, 2, 614530, '520628000000', '松桃苗族自治县', '贵州,铜仁,松桃', '109.202886', '28.154071', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2985, 617671, 2, 617670, '522301000000', '兴义市', '贵州,黔西南,兴义', '104.895467', '25.092040', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2986, 617923, 2, 617670, '522322000000', '兴仁县', '贵州,黔西南,兴仁', '105.186238', '25.435183', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2987, 618102, 2, 617670, '522323000000', '普安县', '贵州,黔西南,普安', '104.953063', '25.784135', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2988, 618205, 2, 617670, '522324000000', '晴隆县', '贵州,黔西南,晴隆', '105.218991', '25.834784', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2989, 618316, 2, 617670, '522325000000', '贞丰县', '贵州,黔西南,贞丰', '105.649864', '25.385760', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2990, 618489, 2, 617670, '522326000000', '望谟县', '贵州,黔西南,望谟', '106.099617', '25.178422', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2991, 618671, 2, 617670, '522327000000', '册亨县', '贵州,黔西南,册亨', '105.811593', '24.983663', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2992, 618816, 2, 617670, '522328000000', '安龙县', '贵州,黔西南,安龙', '105.442701', '25.099014', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2993, 619018, 2, 619017, '522601000000', '凯里市', '贵州,黔东南,凯里', '107.981212', '26.566867', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2994, 619308, 2, 619017, '522622000000', '黄平县', '贵州,黔东南,黄平', '107.916412', '26.905396', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2995, 619574, 2, 619017, '522623000000', '施秉县', '贵州,黔东南,施秉', '108.124380', '27.032920', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2996, 619657, 2, 619017, '522624000000', '三穗县', '贵州,黔东南,三穗', '108.675267', '26.952968', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2997, 619831, 2, 619017, '522625000000', '镇远县', '贵州,黔东南,镇远', '108.429691', '27.049110', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2998, 619970, 2, 619017, '522626000000', '岑巩县', '贵州,黔东南,岑巩', '108.816060', '27.173887', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (2999, 620122, 2, 619017, '522627000000', '天柱县', '贵州,黔东南,天柱', '109.207757', '26.909678', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3000, 620465, 2, 619017, '522628000000', '锦屏县', '贵州,黔东南,锦屏', '109.200534', '26.676233', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3001, 620673, 2, 619017, '522629000000', '剑河县', '贵州,黔东南,剑河', '108.441501', '26.728274', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3002, 620996, 2, 619017, '522630000000', '台江县', '贵州,黔东南,台江', '108.321245', '26.667525', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3003, 621166, 2, 619017, '522631000000', '黎平县', '贵州,黔东南,黎平', '109.136658', '26.230424', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3004, 621616, 2, 619017, '522632000000', '榕江县', '贵州,黔东南,榕江', '108.521881', '25.931893', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3005, 621906, 2, 619017, '522633000000', '从江县', '贵州,黔东南,从江', '108.905329', '25.753009', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3006, 622312, 2, 619017, '522634000000', '雷山县', '贵州,黔东南,雷山', '108.077540', '26.378443', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3007, 622484, 2, 619017, '522635000000', '麻江县', '贵州,黔东南,麻江', '107.589359', '26.491105', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3008, 622561, 2, 619017, '522636000000', '丹寨县', '贵州,黔东南,丹寨', '107.788728', '26.198320', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3009, 622735, 2, 622734, '522701000000', '都匀市', '贵州,黔南,都匀', '107.518847', '26.259427', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3010, 622888, 2, 622734, '522702000000', '福泉市', '贵州,黔南,福泉', '107.520386', '26.686335', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3011, 622973, 2, 622734, '522722000000', '荔波县', '贵州,黔南,荔波', '107.886450', '25.410654', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3012, 623082, 2, 622734, '522723000000', '贵定县', '贵州,黔南,贵定', '107.232889', '26.557071', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3013, 623205, 2, 622734, '522725000000', '瓮安县', '贵州,黔南,瓮安', '107.471555', '27.078472', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3014, 623318, 2, 622734, '522726000000', '独山县', '贵州,黔南,独山', '107.545048', '25.822132', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3015, 623391, 2, 622734, '522727000000', '平塘县', '贵州,黔南,平塘', '107.323077', '25.831955', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3016, 623530, 2, 622734, '522728000000', '罗甸县', '贵州,黔南,罗甸', '106.751418', '25.424845', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3017, 623723, 2, 622734, '522729000000', '长顺县', '贵州,黔南,长顺', '106.447376', '26.022116', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3018, 623813, 2, 622734, '522730000000', '龙里县', '贵州,黔南,龙里', '106.979524', '26.453154', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3019, 623901, 2, 622734, '522731000000', '惠水县', '贵州,黔南,惠水', '106.657089', '26.132061', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3020, 624122, 2, 622734, '522732000000', '三都水族自治县', '贵州,黔南,三都', '107.869749', '25.983202', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3021, 624374, 2, 624373, '530101000000', '市辖区', '云南,昆明', '102.832891', '24.880095', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3022, 624375, 2, 624373, '530102000000', '五华区', '云南,昆明,五华', '102.832891', '24.880095', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3023, 624486, 2, 624373, '530103000000', '盘龙区', '云南,昆明,盘龙', '102.832891', '24.880095', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3024, 624599, 2, 624373, '530111000000', '官渡区', '云南,昆明,官渡', '102.832891', '24.880095', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3025, 624730, 2, 624373, '530112000000', '西山区', '云南,昆明,西山', '102.832891', '24.880095', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3026, 624860, 2, 624373, '530113000000', '东川区', '云南,昆明,东川', '103.187820', '26.082872', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3027, 625034, 2, 624373, '530114000000', '呈贡区', '云南,昆明,呈贡', '102.832891', '24.880095', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3028, 625111, 2, 624373, '530122000000', '晋宁县', '云南,昆明,晋宁', '102.832891', '24.880095', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3029, 625255, 2, 624373, '530124000000', '富民县', '云南,昆明,富民', '102.497681', '25.222046', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3030, 625337, 2, 624373, '530125000000', '宜良县', '云南,昆明,宜良', '103.141304', '24.919704', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3031, 625486, 2, 624373, '530126000000', '石林彝族自治县', '云南,昆明,石林', '102.832891', '24.880095', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3032, 625585, 2, 624373, '530127000000', '嵩明县', '云南,昆明,嵩明', '103.036911', '25.338642', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3033, 625669, 2, 624373, '530128000000', '禄劝彝族苗族自治县', '云南,昆明,禄劝', '102.832891', '24.880095', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3034, 625883, 2, 624373, '530129000000', '寻甸回族彝族自治县', '云南,昆明,寻甸', '102.832891', '24.880095', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3035, 626074, 2, 624373, '530181000000', '安宁市', '云南,昆明,安宁', '102.832891', '24.880095', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3036, 626182, 2, 626181, '530301000000', '市辖区', '云南,曲靖', '103.796167', '25.489999', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3037, 626183, 2, 626181, '530302000000', '麒麟区', '云南,曲靖,麒麟', '103.805012', '25.495241', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3038, 626343, 2, 626181, '530303000000', '沾益区', '云南,曲靖,沾益', '103.822324', '25.600507', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3039, 626485, 2, 626181, '530321000000', '马龙县', '云南,曲靖,马龙', '103.578454', '25.428130', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3040, 626569, 2, 626181, '530322000000', '陆良县', '云南,曲靖,陆良', '103.666663', '25.030051', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3041, 626731, 2, 626181, '530323000000', '师宗县', '云南,曲靖,师宗', '103.985478', '24.822403', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3042, 626852, 2, 626181, '530324000000', '罗平县', '云南,曲靖,罗平', '104.308675', '24.884626', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3043, 627020, 2, 626181, '530325000000', '富源县', '云南,曲靖,富源', '104.255015', '25.674238', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3044, 627194, 2, 626181, '530326000000', '会泽县', '云南,曲靖,会泽', '103.297361', '26.417947', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3045, 627596, 2, 626181, '530381000000', '宣威市', '云南,曲靖,宣威', '104.104475', '26.219767', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3046, 627982, 2, 627981, '530401000000', '市辖区', '云南,玉溪', '102.546543', '24.352036', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3047, 627983, 2, 627981, '530402000000', '红塔区', '云南,玉溪,红塔', '102.540179', '24.341098', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3048, 628099, 2, 627981, '530403000000', '江川区', '云南,玉溪,江川', '102.753734', '24.287534', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3049, 628181, 2, 627981, '530422000000', '澄江县', '云南,玉溪,澄江', '102.908248', '24.673734', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3050, 628228, 2, 627981, '530423000000', '通海县', '云南,玉溪,通海', '102.760039', '24.112205', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3051, 628314, 2, 627981, '530424000000', '华宁县', '云南,玉溪,华宁', '102.928835', '24.192761', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3052, 628397, 2, 627981, '530425000000', '易门县', '云南,玉溪,易门', '102.162531', '24.671651', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3053, 628463, 2, 627981, '530426000000', '峨山彝族自治县', '云南,玉溪,峨山', '102.397333', '24.169401', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3054, 628548, 2, 627981, '530427000000', '新平彝族傣族自治县', '云南,玉溪,新平', '101.990157', '24.070051', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3055, 628684, 2, 627981, '530428000000', '元江哈尼族彝族傣族自治县', '云南,玉溪,元江', '101.998103', '23.596503', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3056, 628777, 2, 628776, '530501000000', '市辖区', '云南,保山', '99.161761', '25.112046', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3057, 628778, 2, 628776, '530502000000', '隆阳区', '云南,保山,隆阳', '99.165607', '25.121154', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3058, 629117, 2, 628776, '530521000000', '施甸县', '云南,保山,施甸', '99.189221', '24.723064', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3059, 629271, 2, 628776, '530523000000', '龙陵县', '云南,保山,龙陵', '98.689230', '24.586766', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3060, 629403, 2, 628776, '530524000000', '昌宁县', '云南,保山,昌宁', '99.605142', '24.827839', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3061, 629541, 2, 628776, '530581000000', '腾冲市', '云南,保山,腾冲', '98.497291', '25.017570', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3062, 629782, 2, 629781, '530601000000', '市辖区', '云南,昭通', '103.717465', '27.338257', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3063, 629783, 2, 629781, '530602000000', '昭阳区', '云南,昭通,昭阳', '103.706539', '27.320075', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3064, 629988, 2, 629781, '530621000000', '鲁甸县', '云南,昭通,鲁甸', '103.558042', '27.186659', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3065, 630098, 2, 629781, '530622000000', '巧家县', '云南,昭通,巧家', '102.930164', '26.908461', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3066, 630299, 2, 629781, '530623000000', '盐津县', '云南,昭通,盐津', '104.234442', '28.108710', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3067, 630404, 2, 629781, '530624000000', '大关县', '云南,昭通,大关', '103.891146', '27.747978', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3068, 630498, 2, 629781, '530625000000', '永善县', '云南,昭通,永善', '103.638067', '28.229113', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3069, 630656, 2, 629781, '530626000000', '绥江县', '云南,昭通,绥江', '103.968978', '28.592100', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3070, 630704, 2, 629781, '530627000000', '镇雄县', '云南,昭通,镇雄', '104.873579', '27.441668', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3071, 630989, 2, 629781, '530628000000', '彝良县', '云南,昭通,彝良', '104.048289', '27.625419', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3072, 631144, 2, 629781, '530629000000', '威信县', '云南,昭通,威信', '105.049027', '27.846901', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3073, 631242, 2, 629781, '530630000000', '水富县', '云南,昭通,水富', '104.416031', '28.629880', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3074, 631277, 2, 631276, '530701000000', '市辖区', '云南,丽江', '100.227750', '26.855047', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3075, 631278, 2, 631276, '530702000000', '古城区', '云南,丽江,古城', '100.225766', '26.877190', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3076, 631349, 2, 631276, '530721000000', '玉龙纳西族自治县', '云南,丽江,玉龙', '100.236955', '26.821460', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3077, 631469, 2, 631276, '530722000000', '永胜县', '云南,丽江,永胜', '100.750795', '26.684225', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3078, 631634, 2, 631276, '530723000000', '华坪县', '云南,丽江,华坪', '101.266195', '26.629211', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3079, 631704, 2, 631276, '530724000000', '宁蒗彝族自治县', '云南,丽江,宁蒗', '100.852001', '27.282071', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3080, 631812, 2, 631811, '530801000000', '市辖区', '云南,普洱', '100.966512', '22.825065', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3081, 631813, 2, 631811, '530802000000', '思茅区', '云南,普洱,思茅', '100.977165', '22.786910', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3082, 631894, 2, 631811, '530821000000', '宁洱哈尼族彝族自治县', '云南,普洱,宁洱', '100.980485', '22.781242', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3083, 631993, 2, 631811, '530822000000', '墨江哈尼族自治县', '云南,普洱,墨江', '101.692461', '23.431894', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3084, 632177, 2, 631811, '530823000000', '景东彝族自治县', '云南,普洱,景东', '100.833877', '24.446731', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3085, 632361, 2, 631811, '530824000000', '景谷傣族彝族自治县', '云南,普洱,景谷', '100.702871', '23.497028', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3086, 632513, 2, 631811, '530825000000', '镇沅彝族哈尼族拉祜族自治县', '云南,普洱,镇沅', '101.108595', '24.004442', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3087, 632634, 2, 631811, '530826000000', '江城哈尼族彝族自治县', '云南,普洱,江城', '101.862120', '22.585868', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3088, 632693, 2, 631811, '530827000000', '孟连傣族拉祜族佤族自治县', '云南,普洱,孟连', '99.584157', '22.329100', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3089, 632742, 2, 631811, '530828000000', '澜沧拉祜族自治县', '云南,普洱,澜沧', '99.931975', '22.555905', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3090, 632924, 2, 631811, '530829000000', '西盟佤族自治县', '云南,普洱,西', '100.966512', '22.825065', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3091, 632972, 2, 632971, '530901000000', '市辖区', '云南,临沧', '100.079583', '23.877573', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3092, 632973, 2, 632971, '530902000000', '临翔区', '云南,临沧,临翔', '100.082523', '23.895137', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3093, 633086, 2, 632971, '530921000000', '凤庆县', '云南,临沧,凤庆', '99.928460', '24.580424', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3094, 633287, 2, 632971, '530922000000', '云县', '云南,临沧,云县', '100.123248', '24.437061', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3095, 633498, 2, 632971, '530923000000', '永德县', '云南,临沧,永德', '99.259340', '24.018357', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3096, 633629, 2, 632971, '530924000000', '镇康县', '云南,临沧,镇康', '98.825285', '23.762584', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3097, 633711, 2, 632971, '530925000000', '双江拉祜族佤族布朗族傣族自治县', '云南,临沧,双江', '99.827698', '23.473499', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3098, 633793, 2, 632971, '530926000000', '耿马傣族佤族自治县', '云南,临沧,耿马', '99.395366', '23.529249', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3099, 633898, 2, 632971, '530927000000', '沧源佤族自治县', '云南,临沧,沧源', '99.246197', '23.146712', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3100, 634007, 2, 634006, '532301000000', '楚雄市', '云南,楚雄,楚雄', '101.545906', '25.032889', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3101, 634176, 2, 634006, '532322000000', '双柏县', '云南,楚雄,双柏', '101.641937', '24.688875', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3102, 634269, 2, 634006, '532323000000', '牟定县', '云南,楚雄,牟定', '101.546566', '25.313122', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3103, 634366, 2, 634006, '532324000000', '南华县', '云南,楚雄,南华', '101.273577', '25.192293', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3104, 634505, 2, 634006, '532325000000', '姚安县', '云南,楚雄,姚安', '101.241728', '25.504173', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3105, 634592, 2, 634006, '532326000000', '大姚县', '云南,楚雄,大姚', '101.336617', '25.729513', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3106, 634734, 2, 634006, '532327000000', '永仁县', '云南,楚雄,永仁', '101.666133', '26.049464', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3107, 634805, 2, 634006, '532328000000', '元谋县', '云南,楚雄,元谋', '101.874520', '25.704338', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3108, 634894, 2, 634006, '532329000000', '武定县', '云南,楚雄,武定', '102.404338', '25.530389', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3109, 635039, 2, 634006, '532331000000', '禄丰县', '云南,楚雄,禄丰', '102.079027', '25.150111', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3110, 635220, 2, 635219, '532501000000', '个旧市', '云南,红河,个旧', '103.160034', '23.359121', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3111, 635347, 2, 635219, '532502000000', '开远市', '云南,红河,开远', '103.267143', '23.714316', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3112, 635435, 2, 635219, '532503000000', '蒙自市', '云南,红河,蒙自', '103.364905', '23.396201', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3113, 635548, 2, 635219, '532504000000', '弥勒市', '云南,红河,弥勒', '103.414874', '24.411912', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3114, 635698, 2, 635219, '532523000000', '屏边苗族自治县', '云南,红河,屏边', '103.687612', '22.983560', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3115, 635786, 2, 635219, '532524000000', '建水县', '云南,红河,建水', '102.826557', '23.634700', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3116, 635955, 2, 635219, '532525000000', '石屏县', '云南,红河,石屏', '102.494984', '23.705936', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3117, 636080, 2, 635219, '532527000000', '泸西县', '云南,红河,泸西', '103.766196', '24.532025', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3118, 636176, 2, 635219, '532528000000', '元阳县', '云南,红河,元阳', '102.835223', '23.219932', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3119, 636329, 2, 635219, '532529000000', '红河县', '云南,红河,红河', '102.420600', '23.369161', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3120, 636434, 2, 635219, '532530000000', '金平苗族瑶族傣族自治县', '云南,红河,金平', '103.226448', '22.779543', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3121, 636546, 2, 635219, '532531000000', '绿春县', '云南,红河,绿春', '102.392463', '22.993718', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3122, 636647, 2, 635219, '532532000000', '河口瑶族自治县', '云南,红河,河口', '103.960560', '22.509593', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3123, 636689, 2, 636688, '532601000000', '文山市', '云南,文山,文山', '104.232510', '23.386306', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3124, 636850, 2, 636688, '532622000000', '砚山县', '云南,文山,砚山', '104.337244', '23.605740', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3125, 636970, 2, 636688, '532623000000', '西畴县', '云南,文山,西畴', '104.672597', '23.437782', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3126, 637052, 2, 636688, '532624000000', '麻栗坡县', '云南,文山,麻栗坡', '104.702799', '23.125714', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3127, 637166, 2, 636688, '532625000000', '马关县', '云南,文山,马关', '104.394158', '23.012915', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3128, 637312, 2, 636688, '532626000000', '丘北县', '云南,文山,丘北', '104.195820', '24.041919', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3129, 637426, 2, 636688, '532627000000', '广南县', '云南,文山,广南', '105.054981', '24.045941', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3130, 637619, 2, 636688, '532628000000', '富宁县', '云南,文山,富宁', '105.630999', '23.625283', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3131, 637779, 2, 637778, '532801000000', '景洪市', '云南,西双版纳,景洪', '100.771679', '22.000143', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3132, 637910, 2, 637778, '532822000000', '勐海县', '云南,西双版纳,勐海', '100.452548', '21.957354', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3133, 638015, 2, 637778, '532823000000', '勐腊县', '云南,西双版纳,勐腊', '101.564636', '21.459233', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3134, 638093, 2, 638092, '532901000000', '大理市', '云南,大理,大理', '100.241369', '25.593067', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3135, 638249, 2, 638092, '532922000000', '漾濞彝族自治县', '云南,大理,漾濞', '99.958015', '25.670148', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3136, 638325, 2, 638092, '532923000000', '祥云县', '云南,大理,祥云', '100.550946', '25.483850', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3137, 638475, 2, 638092, '532924000000', '宾川县', '云南,大理,宾川', '100.575412', '25.827182', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3138, 638576, 2, 638092, '532925000000', '弥渡县', '云南,大理,弥渡', '100.490991', '25.343804', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3139, 638674, 2, 638092, '532926000000', '南涧彝族自治县', '云南,大理,南涧', '100.509036', '25.043510', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3140, 638764, 2, 638092, '532927000000', '巍山彝族回族自治县', '云南,大理,巍山', '100.307175', '25.227212', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3141, 638858, 2, 638092, '532928000000', '永平县', '云南,大理,永平', '99.541236', '25.464681', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3142, 638941, 2, 638092, '532929000000', '云龙县', '云南,大理,云龙', '99.371121', '25.885596', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3143, 639039, 2, 638092, '532930000000', '洱源县', '云南,大理,洱源', '99.951054', '26.111160', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3144, 639139, 2, 638092, '532931000000', '剑川县', '云南,大理,剑川', '99.905559', '26.537033', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3145, 639241, 2, 638092, '532932000000', '鹤庆县', '云南,大理,鹤庆', '100.176498', '26.560231', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3146, 639369, 2, 639368, '533102000000', '瑞丽市', '云南,德宏,瑞丽', '97.855477', '24.017836', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3147, 639416, 2, 639368, '533103000000', '芒市', '云南,德宏,芒市', '98.588086', '24.433690', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3148, 639524, 2, 639368, '533122000000', '梁河县', '云南,德宏,梁河', '98.296657', '24.804232', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3149, 639600, 2, 639368, '533123000000', '盈江县', '云南,德宏,盈江', '97.931955', '24.705211', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3150, 639719, 2, 639368, '533124000000', '陇川县', '云南,德宏,陇川', '97.792105', '24.182965', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3151, 639803, 2, 639802, '533301000000', '泸水市', '云南,怒江,泸水', '98.853097', '25.852547', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3152, 639889, 2, 639802, '533323000000', '福贡县', '云南,怒江,福贡', '98.869132', '26.901832', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3153, 639956, 2, 639802, '533324000000', '贡山独龙族怒族自治县', '云南,怒江,贡山', '98.853097', '25.852547', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3154, 639990, 2, 639802, '533325000000', '兰坪白族普米族自治县', '云南,怒江,兰坪', '99.416677', '26.453571', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3155, 640108, 2, 640107, '533401000000', '香格里拉市', '云南,迪庆,香格里拉', '99.700836', '27.829743', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3156, 640184, 2, 640107, '533422000000', '德钦县', '云南,迪庆,德钦', '98.911561', '28.486162', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3157, 640239, 2, 640107, '533423000000', '维西傈僳族自治县', '云南,迪庆,维西', '99.287173', '27.177162', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3158, 640334, 2, 640333, '540101000000', '市辖区', '西藏,拉萨', '91.140856', '29.645554', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3159, 640335, 2, 640333, '540102000000', '城关区', '西藏,拉萨,城关', '91.140856', '29.645554', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3160, 640399, 2, 640333, '540103000000', '堆龙德庆区', '西藏,拉萨,堆龙德庆', '91.140856', '29.645554', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3161, 640441, 2, 640333, '540121000000', '林周县', '西藏,拉萨,林周', '91.140856', '29.645554', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3162, 640497, 2, 640333, '540122000000', '当雄县', '西藏,拉萨,当雄', '91.140856', '29.645554', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3163, 640534, 2, 640333, '540123000000', '尼木县', '西藏,拉萨,尼木', '91.140856', '29.645554', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3164, 640575, 2, 640333, '540124000000', '曲水县', '西藏,拉萨,曲水', '91.140856', '29.645554', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3165, 640599, 2, 640333, '540126000000', '达孜县', '西藏,拉萨,达孜', '91.140856', '29.645554', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3166, 640626, 2, 640333, '540127000000', '墨竹工卡县', '西藏,拉萨,墨竹工卡', '91.140856', '29.645554', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3167, 640676, 2, 640675, '540202000000', '桑珠孜区', '西藏,日喀则,桑珠孜', '88.887270', '29.270389', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3168, 640865, 2, 640675, '540221000000', '南木林县', '西藏,日喀则,南木林', '89.099243', '29.682331', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3169, 641029, 2, 640675, '540222000000', '江孜县', '西藏,日喀则,江孜', '89.605574', '28.911659', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3170, 641204, 2, 640675, '540223000000', '定日县', '西藏,日喀则,定日', '87.126120', '28.658743', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3171, 641393, 2, 640675, '540224000000', '萨迦县', '西藏,日喀则,萨迦', '88.021674', '28.899664', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3172, 641512, 2, 640675, '540225000000', '拉孜县', '西藏,日喀则,拉孜', '87.637041', '29.081660', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3173, 641622, 2, 640675, '540226000000', '昂仁县', '西藏,日喀则,昂仁', '87.236051', '29.294802', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3174, 641825, 2, 640675, '540227000000', '谢通门县', '西藏,日喀则,谢通门', '88.261620', '29.432641', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3175, 641940, 2, 640675, '540228000000', '白朗县', '西藏,日喀则,白朗', '89.261977', '29.107688', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3176, 642063, 2, 640675, '540229000000', '仁布县', '西藏,日喀则,仁布', '89.841984', '29.230933', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3177, 642146, 2, 640675, '540230000000', '康马县', '西藏,日喀则,康马', '89.681663', '28.555627', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3178, 642203, 2, 640675, '540231000000', '定结县', '西藏,日喀则,定结', '87.765872', '28.364159', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3179, 642284, 2, 640675, '540232000000', '仲巴县', '西藏,日喀则,仲巴', '84.031530', '29.770279', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3180, 642356, 2, 640675, '540233000000', '亚东县', '西藏,日喀则,亚东', '88.907094', '27.484806', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3181, 642389, 2, 640675, '540234000000', '吉隆县', '西藏,日喀则,吉隆', '85.297535', '28.852394', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3182, 642437, 2, 640675, '540235000000', '聂拉木县', '西藏,日喀则,聂拉木', '85.982237', '28.155186', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3183, 642489, 2, 640675, '540236000000', '萨嘎县', '西藏,日喀则,萨嘎', '85.232941', '29.328818', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3184, 642536, 2, 640675, '540237000000', '岗巴县', '西藏,日喀则,岗巴', '88.520031', '28.274601', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3185, 642572, 2, 642571, '540302000000', '卡若区', '西藏,昌都,卡若', '97.180437', '31.138507', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3186, 642755, 2, 642571, '540321000000', '江达县', '西藏,昌都,江达', '98.218430', '31.499202', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3187, 642864, 2, 642571, '540322000000', '贡觉县', '西藏,昌都,贡觉', '98.270970', '30.860099', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3188, 643026, 2, 642571, '540323000000', '类乌齐县', '西藏,昌都,类乌齐', '96.600246', '31.211601', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3189, 643119, 2, 642571, '540324000000', '丁青县', '西藏,昌都,丁青', '95.595761', '31.412405', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3190, 643197, 2, 642571, '540325000000', '察雅县', '西藏,昌都,察雅', '97.568752', '30.653943', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3191, 643349, 2, 642571, '540326000000', '八宿县', '西藏,昌都,八宿', '96.917836', '30.053209', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3192, 643474, 2, 642571, '540327000000', '左贡县', '西藏,昌都,左贡', '97.841022', '29.671069', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3193, 643613, 2, 642571, '540328000000', '芒康县', '西藏,昌都,芒康', '98.593113', '29.679908', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3194, 643691, 2, 642571, '540329000000', '洛隆县', '西藏,昌都,洛隆', '95.824567', '30.741571', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3195, 643769, 2, 642571, '540330000000', '边坝县', '西藏,昌都,边坝', '94.707800', '30.933652', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3196, 643864, 2, 643863, '540402000000', '巴宜区', '西藏,林芝,巴宜', '94.360994', '29.653727', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3197, 643943, 2, 643863, '540421000000', '工布江达县', '西藏,林芝,工布江达', '93.246077', '29.885280', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3198, 644033, 2, 643863, '540422000000', '米林县', '西藏,林芝,米林', '94.213486', '29.215833', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3199, 644109, 2, 643863, '540423000000', '墨脱县', '西藏,林芝,墨脱', '95.332241', '29.325734', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3200, 644164, 2, 643863, '540424000000', '波密县', '西藏,林芝,波密', '95.768158', '29.858766', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3201, 644260, 2, 643863, '540425000000', '察隅县', '西藏,林芝,察隅', '94.361490', '29.649128', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3202, 644364, 2, 643863, '540426000000', '朗县', '西藏,林芝,朗县', '93.074702', '29.046337', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3203, 644424, 2, 644423, '540501000000', '市辖区', '西藏,山南', '91.117212', '29.646922', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3204, 644425, 2, 644423, '540502000000', '乃东区', '西藏,山南,乃东', '91.761539', '29.224904', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3205, 644480, 2, 644423, '540521000000', '扎囊县', '西藏,山南,扎囊', '91.337250', '29.245114', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3206, 644548, 2, 644423, '540522000000', '贡嘎县', '西藏,山南,贡嘎', '90.984140', '29.289455', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3207, 644600, 2, 644423, '540523000000', '桑日县', '西藏,山南,桑日', '92.015818', '29.259189', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3208, 644647, 2, 644423, '540524000000', '琼结县', '西藏,山南,琼结', '91.683881', '29.024625', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3209, 644672, 2, 644423, '540525000000', '曲松县', '西藏,山南,曲松', '92.203739', '29.062826', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3210, 644699, 2, 644423, '540526000000', '措美县', '西藏,山南,措美', '91.433509', '28.438202', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3211, 644720, 2, 644423, '540527000000', '洛扎县', '西藏,山南,洛扎', '90.859992', '28.385713', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3212, 644755, 2, 644423, '540528000000', '加查县', '西藏,山南,加查', '92.593993', '29.140290', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3213, 644840, 2, 644423, '540529000000', '隆子县', '西藏,山南,隆子', '92.463305', '28.408552', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3214, 644932, 2, 644423, '540530000000', '错那县', '西藏,山南,错那', '91.960139', '27.991716', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3215, 644967, 2, 644423, '540531000000', '浪卡子县', '西藏,山南,浪卡子', '90.397977', '28.968031', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3216, 645077, 2, 645076, '542421000000', '那曲县', '西藏,那曲,那曲', '92.053500', '31.469643', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3217, 645231, 2, 645076, '542422000000', '嘉黎县', '西藏,那曲,嘉黎', '93.232528', '30.640815', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3218, 645364, 2, 645076, '542423000000', '比如县', '西藏,那曲,比如', '93.679639', '31.480250', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3219, 645550, 2, 645076, '542424000000', '聂荣县', '西藏,那曲,聂荣', '92.303346', '32.107772', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3220, 645703, 2, 645076, '542425000000', '安多县', '西藏,那曲,安多', '91.682330', '32.265176', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3221, 645791, 2, 645076, '542426000000', '申扎县', '西藏,那曲,申扎', '88.709853', '30.930505', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3222, 645862, 2, 645076, '542427000000', '索县', '西藏,那曲,索县', '93.785631', '31.886918', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3223, 645997, 2, 645076, '542428000000', '班戈县', '西藏,那曲,班戈', '90.009957', '31.392411', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3224, 646094, 2, 645076, '542429000000', '巴青县', '西藏,那曲,巴青', '94.053463', '31.918563', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3225, 646261, 2, 645076, '542430000000', '尼玛县', '西藏,那曲,尼玛', '87.236772', '31.784701', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3226, 646353, 2, 645076, '542431000000', '双湖县', '西藏,那曲,双湖', '88.837642', '33.188515', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3227, 646393, 2, 646392, '542521000000', '普兰县', '西藏,阿里,普兰', '81.176237', '30.294402', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3228, 646407, 2, 646392, '542522000000', '札达县', '西藏,阿里,札达', '79.802706', '31.479217', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3229, 646431, 2, 646392, '542523000000', '噶尔县', '西藏,阿里,噶尔', '80.096419', '32.491488', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3230, 646451, 2, 646392, '542524000000', '日土县', '西藏,阿里,日土', '79.732427', '33.381359', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3231, 646470, 2, 646392, '542525000000', '革吉县', '西藏,阿里,革吉', '81.145433', '32.387233', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3232, 646495, 2, 646392, '542526000000', '改则县', '西藏,阿里,改则', '84.062590', '32.302713', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3233, 646551, 2, 646392, '542527000000', '措勤县', '西藏,阿里,措勤', '85.159494', '31.016769', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3234, 646580, 2, 646579, '610101000000', '市辖区', '陕西,西安', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3235, 646581, 2, 646579, '610102000000', '新城区', '陕西,西安,新城', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3236, 646694, 2, 646579, '610103000000', '碑林区', '陕西,西安,碑林', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3237, 646800, 2, 646579, '610104000000', '莲湖区', '陕西,西安,莲湖', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3238, 646944, 2, 646579, '610111000000', '灞桥区', '陕西,西安,灞桥', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3239, 647214, 2, 646579, '610112000000', '未央区', '陕西,西安,未央', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3240, 647486, 2, 646579, '610113000000', '雁塔区', '陕西,西安,雁塔', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3241, 647710, 2, 646579, '610114000000', '阎良区', '陕西,西安,阎良', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3242, 647821, 2, 646579, '610115000000', '临潼区', '陕西,西安,临潼', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3243, 648113, 2, 646579, '610116000000', '长安区', '陕西,西安,长安', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3244, 648645, 2, 646579, '610117000000', '高陵区', '陕西,西安,高陵', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3245, 648756, 2, 646579, '610122000000', '蓝田县', '陕西,西安,蓝田', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3246, 649123, 2, 646579, '610124000000', '周至县', '陕西,西安,周至', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3247, 649424, 2, 646579, '610125000000', '户县', '陕西,西安,户县', '108.940174', '34.341568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3248, 649980, 2, 649979, '610201000000', '市辖区', '陕西,铜川', '108.945233', '34.896756', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3249, 649981, 2, 649979, '610202000000', '王益区', '陕西,铜川,王益', '109.075578', '35.068964', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3250, 650048, 2, 649979, '610203000000', '印台区', '陕西,铜川,印台', '109.099975', '35.114492', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3251, 650189, 2, 649979, '610204000000', '耀州区', '陕西,铜川,耀州', '108.980514', '34.908916', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3252, 650386, 2, 649979, '610222000000', '宜君县', '陕西,铜川,宜君', '109.116932', '35.398577', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3253, 650576, 2, 650575, '610301000000', '市辖区', '陕西,宝鸡', '107.237974', '34.361979', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3254, 650577, 2, 650575, '610302000000', '渭滨区', '陕西,宝鸡,渭滨', '107.149968', '34.371184', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3255, 650747, 2, 650575, '610303000000', '金台区', '陕西,宝鸡,金台', '107.146806', '34.376069', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3256, 650913, 2, 650575, '610304000000', '陈仓区', '陕西,宝鸡,陈仓', '107.387436', '34.354456', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3257, 651278, 2, 650575, '610322000000', '凤翔县', '陕西,宝鸡,凤翔', '107.400737', '34.521218', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3258, 651528, 2, 650575, '610323000000', '岐山县', '陕西,宝鸡,岐山', '107.621054', '34.443459', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3259, 651697, 2, 650575, '610324000000', '扶风县', '陕西,宝鸡,扶风', '107.900219', '34.375411', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3260, 651872, 2, 650575, '610326000000', '眉县', '陕西,宝鸡,眉县', '107.749767', '34.274247', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3261, 652014, 2, 650575, '610327000000', '陇县', '陕西,宝鸡,陇县', '106.864397', '34.893050', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3262, 652186, 2, 650575, '610328000000', '千阳县', '陕西,宝鸡,千阳', '107.132442', '34.642381', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3263, 652294, 2, 650575, '610329000000', '麟游县', '陕西,宝鸡,麟游', '107.793525', '34.677902', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3264, 652387, 2, 650575, '610330000000', '凤县', '陕西,宝鸡,凤县', '106.515756', '33.908469', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3265, 652505, 2, 650575, '610331000000', '太白县', '陕西,宝鸡,太白', '107.319116', '34.058401', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3266, 652582, 2, 652581, '610401000000', '市辖区', '陕西,咸阳', '108.708991', '34.329605', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3267, 652583, 2, 652581, '610402000000', '秦都区', '陕西,咸阳,秦都', '108.706272', '34.329567', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3268, 652779, 2, 652581, '610403000000', '杨陵区', '陕西,咸阳,杨陵', '108.084732', '34.272117', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3269, 652863, 2, 652581, '610404000000', '渭城区', '陕西,咸阳,渭城', '108.737213', '34.361988', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3270, 653042, 2, 652581, '610422000000', '三原县', '陕西,咸阳,三原', '108.940509', '34.617382', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3271, 653234, 2, 652581, '610423000000', '泾阳县', '陕西,咸阳,泾阳', '108.842623', '34.527114', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3272, 653470, 2, 652581, '610424000000', '乾县', '陕西,咸阳,乾县', '108.239473', '34.527551', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3273, 653679, 2, 652581, '610425000000', '礼泉县', '陕西,咸阳,礼泉', '108.425018', '34.481764', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3274, 653918, 2, 652581, '610426000000', '永寿县', '陕西,咸阳,永寿', '108.142311', '34.691979', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3275, 654101, 2, 652581, '610427000000', '彬县', '陕西,咸阳,彬县', '108.077658', '35.043911', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3276, 654369, 2, 652581, '610428000000', '长武县', '陕西,咸阳,长武', '107.798757', '35.205886', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3277, 654525, 2, 652581, '610429000000', '旬邑县', '陕西,咸阳,旬邑', '108.333986', '35.111978', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3278, 654661, 2, 652581, '610430000000', '淳化县', '陕西,咸阳,淳化', '108.580681', '34.799250', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3279, 654876, 2, 652581, '610431000000', '武功县', '陕西,咸阳,武功', '108.200398', '34.260204', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3280, 655081, 2, 652581, '610481000000', '兴平市', '陕西,咸阳,兴平', '108.490475', '34.299221', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3281, 655296, 2, 655295, '610501000000', '市辖区', '陕西,渭南', '109.509786', '34.499995', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3282, 655297, 2, 655295, '610502000000', '临渭区', '陕西,渭南,临渭', '109.492726', '34.498192', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3283, 655724, 2, 655295, '610503000000', '华州区', '陕西,渭南,华州', '109.761417', '34.511949', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3284, 655885, 2, 655295, '610522000000', '潼关县', '陕西,渭南,潼关', '110.246350', '34.544296', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3285, 655919, 2, 655295, '610523000000', '大荔县', '陕西,渭南,大荔', '109.941658', '34.797184', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3286, 656260, 2, 655295, '610524000000', '合阳县', '陕西,渭南,合阳', '110.149466', '35.237986', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3287, 656494, 2, 655295, '610525000000', '澄城县', '陕西,渭南,澄城', '109.932350', '35.190245', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3288, 656682, 2, 655295, '610526000000', '蒲城县', '陕西,渭南,蒲城', '109.586506', '34.955855', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3289, 656988, 2, 655295, '610527000000', '白水县', '陕西,渭南,白水', '109.590671', '35.177452', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3290, 657132, 2, 655295, '610528000000', '富平县', '陕西,渭南,富平', '109.180331', '34.751086', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3291, 657425, 2, 655295, '610581000000', '韩城市', '陕西,渭南,韩城', '110.442847', '35.476788', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3292, 657706, 2, 655295, '610582000000', '华阴市', '陕西,渭南,华阴', '110.092301', '34.566096', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3293, 657849, 2, 657848, '610601000000', '市辖区', '陕西,延安', '109.489727', '36.585455', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3294, 657850, 2, 657848, '610602000000', '宝塔区', '陕西,延安,宝塔', '109.493106', '36.591266', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3295, 658235, 2, 657848, '610603000000', '安塞区', '陕西,延安,安塞', '109.489727', '36.585455', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3296, 658462, 2, 657848, '610621000000', '延长县', '陕西,延安,延长', '110.012334', '36.579313', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3297, 658765, 2, 657848, '610622000000', '延川县', '陕西,延安,延川', '110.193514', '36.878117', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3298, 658951, 2, 657848, '610623000000', '子长县', '陕西,延安,子长', '109.675234', '37.142668', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3299, 659327, 2, 657848, '610625000000', '志丹县', '陕西,延安,志丹', '108.768432', '36.822194', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3300, 659450, 2, 657848, '610626000000', '吴起县', '陕西,延安,吴起', '108.175933', '36.927216', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3301, 659554, 2, 657848, '610627000000', '甘泉县', '陕西,延安,甘泉', '109.351020', '36.276526', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3302, 659632, 2, 657848, '610628000000', '富县', '陕西,延安,富县', '109.379711', '35.988010', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3303, 659777, 2, 657848, '610629000000', '洛川县', '陕西,延安,洛川', '109.432369', '35.761975', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3304, 660160, 2, 657848, '610630000000', '宜川县', '陕西,延安,宜川', '110.168963', '36.050178', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3305, 660375, 2, 657848, '610631000000', '黄龙县', '陕西,延安,黄龙', '109.840373', '35.584467', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3306, 660433, 2, 657848, '610632000000', '黄陵县', '陕西,延安,黄陵', '109.262961', '35.579428', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3307, 660644, 2, 660643, '610701000000', '市辖区', '陕西,汉中', '107.023323', '33.067480', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3308, 660645, 2, 660643, '610702000000', '汉台区', '陕西,汉中,汉台', '107.031856', '33.067771', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3309, 660909, 2, 660643, '610721000000', '南郑县', '陕西,汉中,南郑', '106.936230', '32.999334', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3310, 661244, 2, 660643, '610722000000', '城固县', '陕西,汉中,城固', '107.333930', '33.157131', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3311, 661535, 2, 660643, '610723000000', '洋县', '陕西,汉中,洋县', '107.545837', '33.222739', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3312, 661839, 2, 660643, '610724000000', '西乡县', '陕西,汉中,西乡', '107.766614', '32.983101', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3313, 662072, 2, 660643, '610725000000', '勉县', '陕西,汉中,勉县', '106.673221', '33.153553', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3314, 662289, 2, 660643, '610726000000', '宁强县', '陕西,汉中,宁强', '106.257171', '32.829694', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3315, 662521, 2, 660643, '610727000000', '略阳县', '陕西,汉中,略阳', '106.156718', '33.327281', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3316, 662704, 2, 660643, '610728000000', '镇巴县', '陕西,汉中,镇巴', '107.895035', '32.536704', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3317, 662908, 2, 660643, '610729000000', '留坝县', '陕西,汉中,留坝', '106.920808', '33.617571', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3318, 662993, 2, 660643, '610730000000', '佛坪县', '陕西,汉中,佛坪', '107.990539', '33.524359', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3319, 663047, 2, 663046, '610801000000', '市辖区', '陕西,榆林', '109.734589', '38.285390', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3320, 663048, 2, 663046, '610802000000', '榆阳区', '陕西,榆林,榆阳', '109.720309', '38.277029', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3321, 663445, 2, 663046, '610803000000', '横山区', '陕西,榆林,横山', '109.294346', '37.962209', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3322, 663827, 2, 663046, '610821000000', '神木县', '陕西,榆林,神木', '110.498868', '38.842498', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3323, 664184, 2, 663046, '610822000000', '府谷县', '陕西,榆林,府谷', '111.067366', '39.028116', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3324, 664441, 2, 663046, '610824000000', '靖边县', '陕西,榆林,靖边', '108.793988', '37.599438', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3325, 664686, 2, 663046, '610825000000', '定边县', '陕西,榆林,定边', '107.601267', '37.594612', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3326, 665047, 2, 663046, '610826000000', '绥德县', '陕西,榆林,绥德', '110.263362', '37.502940', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3327, 665732, 2, 663046, '610827000000', '米脂县', '陕西,榆林,米脂', '110.183754', '37.755417', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3328, 665953, 2, 663046, '610828000000', '佳县', '陕西,榆林,佳县', '110.491345', '38.019511', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3329, 666627, 2, 663046, '610829000000', '吴堡县', '陕西,榆林,吴堡', '110.739673', '37.452068', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3330, 666741, 2, 663046, '610830000000', '清涧县', '陕西,榆林,清涧', '110.121209', '37.088878', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3331, 667106, 2, 663046, '610831000000', '子洲县', '陕西,榆林,子洲', '110.035250', '37.610683', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3332, 667682, 2, 667681, '610901000000', '市辖区', '陕西,安康', '109.029022', '32.684714', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3333, 667683, 2, 667681, '610902000000', '汉滨区', '陕西,安康,汉滨', '109.026836', '32.695173', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3334, 668237, 2, 667681, '610921000000', '汉阴县', '陕西,安康,汉阴', '108.508745', '32.893026', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3335, 668397, 2, 667681, '610922000000', '石泉县', '陕西,安康,石泉', '108.247887', '33.038408', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3336, 668570, 2, 667681, '610923000000', '宁陕县', '陕西,安康,宁陕', '108.314283', '33.310527', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3337, 668662, 2, 667681, '610924000000', '紫阳县', '陕西,安康,紫阳', '108.534229', '32.520246', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3338, 668877, 2, 667681, '610925000000', '岚皋县', '陕西,安康,岚皋', '108.902049', '32.307001', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3339, 669026, 2, 667681, '610926000000', '平利县', '陕西,安康,平利', '109.361864', '32.388854', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3340, 669181, 2, 667681, '610927000000', '镇坪县', '陕西,安康,镇坪', '109.526873', '31.883672', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3341, 669251, 2, 667681, '610928000000', '旬阳县', '陕西,安康,旬阳', '109.365265', '32.834086', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3342, 669578, 2, 667681, '610929000000', '白河县', '陕西,安康,白河', '110.112629', '32.809026', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3343, 669708, 2, 669707, '611001000000', '市辖区', '陕西,商洛', '109.940477', '33.870422', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3344, 669709, 2, 669707, '611002000000', '商州区', '陕西,商洛,商州', '109.941241', '33.862703', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3345, 670030, 2, 669707, '611021000000', '洛南县', '陕西,商洛,洛南', '110.148509', '34.090838', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3346, 670291, 2, 669707, '611022000000', '丹凤县', '陕西,商洛,丹凤', '110.327331', '33.695783', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3347, 670459, 2, 669707, '611023000000', '商南县', '陕西,商洛,商南', '110.881807', '33.530995', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3348, 670594, 2, 669707, '611024000000', '山阳县', '陕西,商洛,山阳', '109.882290', '33.532172', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3349, 670852, 2, 669707, '611025000000', '镇安县', '陕西,商洛,镇安', '109.152893', '33.423357', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3350, 671028, 2, 669707, '611026000000', '柞水县', '陕西,商洛,柞水', '109.114207', '33.686110', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3351, 671121, 2, 671120, '620101000000', '市辖区', '甘肃,兰州', '103.834303', '36.061089', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3352, 671122, 2, 671120, '620102000000', '城关区', '甘肃,兰州,城关', '103.834303', '36.061089', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3353, 671324, 2, 671120, '620103000000', '七里河区', '甘肃,兰州,七里河', '103.834303', '36.061089', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3354, 671477, 2, 671120, '620104000000', '西固区', '甘肃,兰州,西固', '103.834303', '36.061089', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3355, 671606, 2, 671120, '620105000000', '安宁区', '甘肃,兰州,安宁', '103.834303', '36.061089', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3356, 671675, 2, 671120, '620111000000', '红古区', '甘肃,兰州,红古', '103.834303', '36.061089', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3357, 671740, 2, 671120, '620121000000', '永登县', '甘肃,兰州,永登', '103.834303', '36.061089', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3358, 671967, 2, 671120, '620122000000', '皋兰县', '甘肃,兰州,皋兰', '103.834303', '36.061089', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3359, 672034, 2, 671120, '620123000000', '榆中县', '甘肃,兰州,榆中', '103.834303', '36.061089', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3360, 672331, 2, 672330, '620201000000', '市辖区', '甘肃,嘉峪关', '98.289152', '39.773130', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3361, 672386, 2, 672385, '620301000000', '市辖区', '甘肃,金昌', '102.188043', '38.520089', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3362, 672387, 2, 672385, '620302000000', '金川区', '甘肃,金昌,金川', '102.194089', '38.521085', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3363, 672439, 2, 672385, '620321000000', '永昌县', '甘肃,金昌,永昌', '101.984649', '38.243170', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3364, 672578, 2, 672577, '620401000000', '市辖区', '甘肃,白银', '104.138559', '36.544756', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3365, 672579, 2, 672577, '620402000000', '白银区', '甘肃,白银,白银', '104.148556', '36.535398', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3366, 672670, 2, 672577, '620403000000', '平川区', '甘肃,白银,平川', '104.825208', '36.728304', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3367, 672773, 2, 672577, '620421000000', '靖远县', '甘肃,白银,靖远', '104.676774', '36.571366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3368, 672978, 2, 672577, '620422000000', '会宁县', '甘肃,白银,会宁', '105.053358', '35.692823', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3369, 673307, 2, 672577, '620423000000', '景泰县', '甘肃,白银,景泰', '104.063091', '37.183804', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3370, 673464, 2, 673463, '620501000000', '市辖区', '甘肃,天水', '105.724947', '34.580863', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3371, 673465, 2, 673463, '620502000000', '秦州区', '甘肃,天水,秦州', '105.724199', '34.580892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3372, 673952, 2, 673463, '620503000000', '麦积区', '甘肃,天水,麦积', '105.889557', '34.570384', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3373, 674399, 2, 673463, '620521000000', '清水县', '甘肃,天水,清水', '106.137293', '34.749865', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3374, 674684, 2, 673463, '620522000000', '秦安县', '甘肃,天水,秦安', '105.674983', '34.858916', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3375, 675138, 2, 673463, '620523000000', '甘谷县', '甘肃,天水,甘谷', '105.340864', '34.745465', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3376, 675568, 2, 673463, '620524000000', '武山县', '甘肃,天水,武山', '104.890782', '34.721380', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3377, 675938, 2, 673463, '620525000000', '张家川回族自治县', '甘肃,天水,张家川', '106.204518', '34.988037', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3378, 676216, 2, 676215, '620601000000', '市辖区', '甘肃,武威', '102.638011', '37.928264', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3379, 676217, 2, 676215, '620602000000', '凉州区', '甘肃,武威,凉州', '102.642184', '37.928225', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3380, 676751, 2, 676215, '620621000000', '民勤县', '甘肃,武威,民勤', '103.093792', '38.624350', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3381, 677055, 2, 676215, '620622000000', '古浪县', '甘肃,武威,古浪', '102.897533', '37.470120', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3382, 677344, 2, 676215, '620623000000', '天祝藏族自治县', '甘肃,武威,天祝', '103.141757', '36.971740', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3383, 677569, 2, 677568, '620701000000', '市辖区', '甘肃,张掖', '100.449818', '38.925875', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3384, 677570, 2, 677568, '620702000000', '甘州区', '甘肃,张掖,甘州', '100.478058', '38.929763', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3385, 677865, 2, 677568, '620721000000', '肃南裕固族自治县', '甘肃,张掖,肃南', '99.615601', '38.836932', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3386, 677983, 2, 677568, '620722000000', '民乐县', '甘肃,张掖,民乐', '100.812860', '38.430794', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3387, 678174, 2, 677568, '620723000000', '临泽县', '甘肃,张掖,临泽', '100.164445', '39.152642', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3388, 678270, 2, 677568, '620724000000', '高台县', '甘肃,张掖,高台', '99.819317', '39.377733', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3389, 678427, 2, 677568, '620725000000', '山丹县', '甘肃,张掖,山丹', '101.088575', '38.784758', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3390, 678561, 2, 678560, '620801000000', '市辖区', '甘肃,平凉', '106.665240', '35.543051', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3391, 678562, 2, 678560, '620802000000', '崆峒区', '甘肃,平凉,崆峒', '106.674767', '35.542491', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3392, 678825, 2, 678560, '620821000000', '泾川县', '甘肃,平凉,泾川', '107.367850', '35.332666', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3393, 679066, 2, 678560, '620822000000', '灵台县', '甘肃,平凉,灵台', '107.621124', '35.065399', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3394, 679271, 2, 678560, '620823000000', '崇信县', '甘肃,平凉,崇信', '107.035409', '35.302123', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3395, 679368, 2, 678560, '620824000000', '华亭县', '甘肃,平凉,华亭', '106.653158', '35.218292', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3396, 679507, 2, 678560, '620825000000', '庄浪县', '甘肃,平凉,庄浪', '106.036687', '35.202385', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3397, 679825, 2, 678560, '620826000000', '静宁县', '甘肃,平凉,静宁', '105.732556', '35.521977', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3398, 680192, 2, 680191, '620901000000', '市辖区', '甘肃,酒泉', '98.494483', '39.732410', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3399, 680193, 2, 680191, '620902000000', '肃州区', '甘肃,酒泉,肃州', '98.507850', '39.745071', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3400, 680365, 2, 680191, '620921000000', '金塔县', '甘肃,酒泉,金塔', '98.903270', '39.983599', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3401, 680478, 2, 680191, '620922000000', '瓜州县', '甘肃,酒泉,瓜州', '95.782306', '40.520545', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3402, 680582, 2, 680191, '620923000000', '肃北蒙古族自治县', '甘肃,酒泉,肃北', '94.876579', '39.512450', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3403, 680615, 2, 680191, '620924000000', '阿克塞哈萨克族自治县', '甘肃,酒泉,阿克塞', '94.340204', '39.633943', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3404, 680634, 2, 680191, '620981000000', '玉门市', '甘肃,酒泉,玉门', '97.045679', '40.291843', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3405, 680736, 2, 680191, '620982000000', '敦煌市', '甘肃,酒泉,敦煌', '94.661967', '40.142128', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3406, 680816, 2, 680815, '621001000000', '市辖区', '甘肃,庆阳', '107.643631', '35.709077', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3407, 680817, 2, 680815, '621002000000', '西峰区', '甘肃,庆阳,西峰', '107.651077', '35.730652', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3408, 680943, 2, 680815, '621021000000', '庆城县', '甘肃,庆阳,庆城', '107.881802', '36.016299', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3409, 681132, 2, 680815, '621022000000', '环县', '甘肃,庆阳,环县', '107.308501', '36.568435', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3410, 681414, 2, 680815, '621023000000', '华池县', '甘肃,庆阳,华池', '107.990035', '36.461355', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3411, 681559, 2, 680815, '621024000000', '合水县', '甘肃,庆阳,合水', '108.019530', '35.819243', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3412, 681665, 2, 680815, '621025000000', '正宁县', '甘肃,庆阳,正宁', '108.359976', '35.491890', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3413, 681784, 2, 680815, '621026000000', '宁县', '甘肃,庆阳,宁县', '107.928369', '35.502177', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3414, 682081, 2, 680815, '621027000000', '镇原县', '甘肃,庆阳,镇原', '107.200832', '35.677462', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3415, 682323, 2, 682322, '621101000000', '市辖区', '甘肃,定西', '104.626282', '35.580662', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3416, 682324, 2, 682322, '621102000000', '安定区', '甘肃,定西,安定', '104.610668', '35.580629', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3417, 682673, 2, 682322, '621121000000', '通渭县', '甘肃,定西,通渭', '105.242061', '35.210831', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3418, 683034, 2, 682322, '621122000000', '陇西县', '甘肃,定西,陇西', '104.634984', '35.003940', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3419, 683278, 2, 682322, '621123000000', '渭源县', '甘肃,定西,渭源', '104.215467', '35.136755', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3420, 683515, 2, 682322, '621124000000', '临洮县', '甘肃,定西,临洮', '103.859565', '35.394989', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3421, 683869, 2, 682322, '621125000000', '漳县', '甘肃,定西,漳县', '104.471572', '34.848444', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3422, 684024, 2, 682322, '621126000000', '岷县', '甘肃,定西,岷县', '104.036880', '34.438076', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3423, 684416, 2, 684415, '621201000000', '市辖区', '甘肃,陇南', '104.921841', '33.400684', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3424, 684417, 2, 684415, '621202000000', '武都区', '甘肃,陇南,武都', '104.926337', '33.392211', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3425, 685162, 2, 684415, '621221000000', '成县', '甘肃,陇南,成县', '105.742203', '33.750477', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3426, 685439, 2, 684415, '621222000000', '文县', '甘肃,陇南,文县', '104.683434', '32.943815', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3427, 685772, 2, 684415, '621223000000', '宕昌县', '甘肃,陇南,宕昌', '104.393385', '34.047261', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3428, 686138, 2, 684415, '621224000000', '康县', '甘肃,陇南,康县', '105.609169', '33.329136', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3429, 686518, 2, 684415, '621225000000', '西和县', '甘肃,陇南,西和', '105.298756', '34.014215', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3430, 686933, 2, 684415, '621226000000', '礼县', '甘肃,陇南,礼县', '105.178640', '34.189345', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3431, 687542, 2, 684415, '621227000000', '徽县', '甘肃,陇南,徽县', '106.087780', '33.768826', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3432, 687781, 2, 684415, '621228000000', '两当县', '甘肃,陇南,两当', '106.304967', '33.908917', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3433, 687917, 2, 687916, '622901000000', '临夏市', '甘肃,临夏,临夏', '103.243021', '35.604376', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3434, 687999, 2, 687916, '622921000000', '临夏县', '甘肃,临夏,临夏', '103.243021', '35.604376', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3435, 688248, 2, 687916, '622922000000', '康乐县', '甘肃,临夏,康乐', '103.708354', '35.370505', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3436, 688417, 2, 687916, '622923000000', '永靖县', '甘肃,临夏,永靖', '103.285854', '35.958306', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3437, 688588, 2, 687916, '622924000000', '广河县', '甘肃,临夏,广河', '103.575834', '35.488052', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3438, 688701, 2, 687916, '622925000000', '和政县', '甘肃,临夏,和政', '103.350997', '35.424603', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3439, 688841, 2, 687916, '622926000000', '东乡族自治县', '甘肃,临夏,东乡族自治县', '103.389346', '35.663752', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3440, 689096, 2, 687916, '622927000000', '积石山保安族东乡族撒拉族自治县', '甘肃,临夏,积石山', '102.875843', '35.717661', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3441, 689266, 2, 689265, '623001000000', '合作市', '甘肃,甘南,合作', '102.910882', '35.000399', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3442, 689327, 2, 689265, '623021000000', '临潭县', '甘肃,甘南,临潭', '103.353919', '34.692747', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3443, 689488, 2, 689265, '623022000000', '卓尼县', '甘肃,甘南,卓尼', '103.507109', '34.589588', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3444, 689610, 2, 689265, '623023000000', '舟曲县', '甘肃,甘南,舟曲', '104.371586', '33.785259', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3445, 689845, 2, 689265, '623024000000', '迭部县', '甘肃,甘南,迭部', '103.221870', '34.055939', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3446, 689913, 2, 689265, '623025000000', '玛曲县', '甘肃,甘南,玛曲', '102.072698', '33.997712', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3447, 689966, 2, 689265, '623026000000', '碌曲县', '甘肃,甘南,碌曲', '102.487327', '34.590944', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3448, 690005, 2, 689265, '623027000000', '夏河县', '甘肃,甘南,夏河', '102.521807', '35.202503', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3449, 690096, 2, 690095, '630101000000', '市辖区', '青海,西宁', '101.778228', '36.617144', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3450, 690097, 2, 690095, '630102000000', '城东区', '青海,西宁,城东', '101.778228', '36.617144', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3451, 690164, 2, 690095, '630103000000', '城中区', '青海,西宁,城中', '101.778228', '36.617144', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3452, 690235, 2, 690095, '630104000000', '城西区', '青海,西宁,城西', '101.778228', '36.617144', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3453, 690283, 2, 690095, '630105000000', '城北区', '青海,西宁,城北', '101.778228', '36.617144', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3454, 690357, 2, 690095, '630121000000', '大通回族土族自治县', '青海,西宁,大通', '101.679987', '36.930717', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3455, 690689, 2, 690095, '630122000000', '湟中县', '青海,西宁,湟中', '101.778228', '36.617144', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3456, 691114, 2, 690095, '630123000000', '湟源县', '青海,西宁,湟源', '101.778228', '36.617144', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3457, 691279, 2, 691278, '630202000000', '乐都区', '青海,海东,乐都', '102.401725', '36.482058', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3458, 691667, 2, 691278, '630203000000', '平安区', '青海,海东,平安', '102.108835', '36.500563', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3459, 691796, 2, 691278, '630222000000', '民和回族土族自治县', '青海,海东,民和', '102.830892', '36.320321', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3460, 692148, 2, 691278, '630223000000', '互助土族自治县', '青海,海东,互助', '101.959271', '36.844249', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3461, 692479, 2, 691278, '630224000000', '化隆回族自治县', '青海,海东,化隆', '102.264143', '36.094908', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3462, 692870, 2, 691278, '630225000000', '循化撒拉族自治县', '青海,海东,循化', '102.485646', '35.848586', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3463, 693041, 2, 693040, '632221000000', '门源回族自治县', '青海,海北,门源', '101.622364', '37.376449', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3464, 693186, 2, 693040, '632222000000', '祁连县', '青海,海北,祁连', '100.253211', '38.177112', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3465, 693243, 2, 693040, '632223000000', '海晏县', '青海,海北,海晏', '100.994430', '36.896467', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3466, 693286, 2, 693040, '632224000000', '刚察县', '青海,海北,刚察', '100.145833', '37.325470', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3467, 693343, 2, 693342, '632321000000', '同仁县', '青海,黄南,同仁', '102.018323', '35.516063', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3468, 693437, 2, 693342, '632322000000', '尖扎县', '青海,黄南,尖扎', '102.031183', '35.938299', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3469, 693541, 2, 693342, '632323000000', '泽库县', '青海,黄南,泽库', '101.466689', '35.035313', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3470, 693623, 2, 693342, '632324000000', '河南蒙古族自治县', '青海,黄南,河南', '102.015248', '35.519548', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3471, 693673, 2, 693672, '632521000000', '共和县', '青海,海南,共和', '100.620031', '36.284107', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3472, 693808, 2, 693672, '632522000000', '同德县', '青海,海南,同德', '100.578052', '35.254791', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3473, 693906, 2, 693672, '632523000000', '贵德县', '青海,海南,贵德', '101.433298', '36.040150', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3474, 694046, 2, 693672, '632524000000', '兴海县', '青海,海南,兴海', '99.987966', '35.588613', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3475, 694121, 2, 693672, '632525000000', '贵南县', '青海,海南,贵南', '100.747503', '35.586715', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3476, 694221, 2, 694220, '632621000000', '玛沁县', '青海,果洛,玛沁', '100.238888', '34.477433', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3477, 694272, 2, 694220, '632622000000', '班玛县', '青海,果洛,班玛', '100.737138', '32.932723', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3478, 694315, 2, 694220, '632623000000', '甘德县', '青海,果洛,甘德', '99.900905', '33.969219', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3479, 694361, 2, 694220, '632624000000', '达日县', '青海,果洛,达日', '99.651392', '33.748921', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3480, 694407, 2, 694220, '632625000000', '久治县', '青海,果洛,久治', '101.482831', '33.429471', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3481, 694440, 2, 694220, '632626000000', '玛多县', '青海,果洛,玛多', '98.209206', '34.915946', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3482, 694479, 2, 694478, '632701000000', '玉树市', '青海,玉树,玉树', '97.008785', '32.993107', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3483, 694572, 2, 694478, '632722000000', '杂多县', '青海,玉树,杂多', '95.300723', '32.893185', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3484, 694622, 2, 694478, '632723000000', '称多县', '青海,玉树,称多', '97.110832', '33.369218', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3485, 694695, 2, 694478, '632724000000', '治多县', '青海,玉树,治多', '95.613080', '33.852751', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3486, 694728, 2, 694478, '632725000000', '囊谦县', '青海,玉树,囊谦', '96.480650', '32.203246', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3487, 694816, 2, 694478, '632726000000', '曲麻莱县', '青海,玉树,曲麻莱', '95.797367', '34.126429', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3488, 694847, 2, 694846, '632801000000', '格尔木市', '青海,海西,格尔木', '94.928484', '36.406404', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3489, 694932, 2, 694846, '632802000000', '德令哈市', '青海,海西,德令哈', '97.360985', '37.369436', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3490, 695009, 2, 694846, '632821000000', '乌兰县', '青海,海西,乌兰', '98.480195', '36.929749', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3491, 695060, 2, 694846, '632822000000', '都兰县', '青海,海西,都兰', '98.095844', '36.302496', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3492, 695184, 2, 694846, '632823000000', '天峻县', '青海,海西,天峻', '99.022984', '37.300851', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3493, 695261, 2, 695260, '640101000000', '市辖区', '宁夏,银川', '106.230909', '38.487193', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3494, 695262, 2, 695260, '640104000000', '兴庆区', '宁夏,银川,兴庆', '106.230909', '38.487193', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3495, 695412, 2, 695260, '640105000000', '西夏区', '宁夏,银川,西夏', '106.230909', '38.487193', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3496, 695500, 2, 695260, '640106000000', '金凤区', '宁夏,银川,金凤', '106.230909', '38.487193', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3497, 695575, 2, 695260, '640121000000', '永宁县', '宁夏,银川,永宁', '106.230909', '38.487193', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3498, 695675, 2, 695260, '640122000000', '贺兰县', '宁夏,银川,贺兰', '106.230909', '38.487193', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3499, 695767, 2, 695260, '640181000000', '灵武市', '宁夏,银川,灵武', '106.230909', '38.487193', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3500, 695884, 2, 695883, '640201000000', '市辖区', '宁夏,石嘴山', '106.383303', '38.983236', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3501, 695885, 2, 695883, '640202000000', '大武口区', '宁夏,石嘴山,大武口', '106.367861', '39.019060', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3502, 695959, 2, 695883, '640205000000', '惠农区', '宁夏,石嘴山,惠农', '106.781176', '39.239302', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3503, 696058, 2, 695883, '640221000000', '平罗县', '宁夏,石嘴山,平罗', '106.523474', '38.913544', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3504, 696253, 2, 696252, '640301000000', '市辖区', '宁夏,吴忠', '106.198393', '37.997460', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3505, 696254, 2, 696252, '640302000000', '利通区', '宁夏,吴忠,利通', '106.212566', '37.983458', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3506, 696427, 2, 696252, '640303000000', '红寺堡区', '宁夏,吴忠,红寺堡', '106.062114', '37.425702', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3507, 696505, 2, 696252, '640323000000', '盐池县', '宁夏,吴忠,盐池', '107.407359', '37.783205', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3508, 696633, 2, 696252, '640324000000', '同心县', '宁夏,吴忠,同心', '105.914458', '36.980575', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3509, 696803, 2, 696252, '640381000000', '青铜峡市', '宁夏,吴忠,青铜峡', '106.078818', '38.021302', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3510, 696929, 2, 696928, '640401000000', '市辖区', '宁夏,固原', '106.242610', '36.015855', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3511, 696930, 2, 696928, '640402000000', '原州区', '宁夏,固原,原州', '106.287782', '36.003740', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3512, 697133, 2, 696928, '640422000000', '西吉县', '宁夏,固原,西吉', '105.729085', '35.963913', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3513, 697457, 2, 696928, '640423000000', '隆德县', '宁夏,固原,隆德', '106.111595', '35.625915', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3514, 697594, 2, 696928, '640424000000', '泾源县', '宁夏,固原,泾源', '106.330646', '35.498160', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3515, 697714, 2, 696928, '640425000000', '彭阳县', '宁夏,固原,彭阳', '106.638340', '35.849565', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3516, 697888, 2, 697887, '640501000000', '市辖区', '宁夏,中卫', '105.196902', '37.499972', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3517, 697889, 2, 697887, '640502000000', '沙坡头区', '宁夏,中卫,沙坡头', '105.190536', '37.514564', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3518, 698087, 2, 697887, '640521000000', '中宁县', '宁夏,中卫,中宁', '105.685285', '37.491505', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3519, 698240, 2, 697887, '640522000000', '海原县', '宁夏,中卫,海原', '105.643487', '36.565033', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3520, 698442, 2, 698441, '650101000000', '市辖区', '新疆,乌鲁木齐', '87.616848', '43.825592', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3521, 698443, 2, 698441, '650102000000', '天山区', '新疆,乌鲁木齐,天山', '87.616848', '43.825592', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3522, 698654, 2, 698441, '650103000000', '沙依巴克区', '新疆,乌鲁木齐,沙依巴克', '87.616848', '43.825592', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3523, 698884, 2, 698441, '650104000000', '新市区', '新疆,乌鲁木齐,新市区', '87.616848', '43.825592', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3524, 699054, 2, 698441, '650105000000', '水磨沟区', '新疆,乌鲁木齐,水磨沟', '87.616848', '43.825592', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3525, 699229, 2, 698441, '650106000000', '头屯河区', '新疆,乌鲁木齐,头屯河', '87.616848', '43.825592', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3526, 699313, 2, 698441, '650107000000', '达坂城区', '新疆,乌鲁木齐,达坂城', '87.616848', '43.825592', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3527, 699363, 2, 698441, '650109000000', '米东区', '新疆,乌鲁木齐,米东', '87.616848', '43.825592', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3528, 699535, 2, 698441, '650121000000', '乌鲁木齐县', '新疆,乌鲁木齐,乌鲁木齐', '87.616848', '43.825592', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3529, 699584, 2, 699583, '650201000000', '市辖区', '新疆,克拉玛依', '84.889207', '45.579888', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3530, 699585, 2, 699583, '650202000000', '独山子区', '新疆,克拉玛依,独山子', '84.886974', '44.328096', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3531, 699606, 2, 699583, '650203000000', '克拉玛依区', '新疆,克拉玛依,克拉玛依', '84.867844', '45.602526', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3532, 699730, 2, 699583, '650204000000', '白碱滩区', '新疆,克拉玛依,白碱滩', '85.131696', '45.687855', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3533, 699752, 2, 699583, '650205000000', '乌尔禾区', '新疆,克拉玛依,乌尔禾', '85.693742', '46.089148', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3534, 699774, 2, 699773, '650402000000', '高昌区', '新疆,吐鲁番,高昌', '89.182342', '42.947635', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3535, 699884, 2, 699773, '650421000000', '鄯善县', '新疆,吐鲁番,鄯善', '90.213330', '42.868744', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3536, 700000, 2, 699773, '650422000000', '托克逊县', '新疆,吐鲁番,托克逊', '88.653814', '42.792521', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3537, 700071, 2, 700070, '650502000000', '伊州区', '新疆,哈密,伊州', '93.514916', '42.818501', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3538, 700350, 2, 700070, '650521000000', '巴里坤哈萨克自治县', '新疆,哈密,巴里坤', '93.016625', '43.598763', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3539, 700438, 2, 700070, '650522000000', '伊吾县', '新疆,哈密,伊吾', '94.697074', '43.254978', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3540, 700490, 2, 700489, '652301000000', '昌吉市', '新疆,昌吉,昌吉', '87.304112', '44.013183', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3541, 700685, 2, 700489, '652302000000', '阜康市', '新疆,昌吉,阜康', '87.946894', '44.168576', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3542, 700805, 2, 700489, '652323000000', '呼图壁县', '新疆,昌吉,呼图壁', '86.898902', '44.191428', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3543, 700956, 2, 700489, '652324000000', '玛纳斯县', '新疆,昌吉,玛纳斯', '86.213997', '44.303893', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3544, 701230, 2, 700489, '652325000000', '奇台县', '新疆,昌吉,奇台', '89.593967', '44.022066', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3545, 701375, 2, 700489, '652327000000', '吉木萨尔县', '新疆,昌吉,吉木萨尔', '89.180437', '44.000497', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3546, 701474, 2, 700489, '652328000000', '木垒哈萨克自治县', '新疆,昌吉,木垒', '90.286028', '43.834689', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3547, 701560, 2, 701559, '652701000000', '博乐市', '新疆,博尔塔拉,博乐', '82.051005', '44.853870', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3548, 701834, 2, 701559, '652702000000', '阿拉山口市', '新疆,博尔塔拉,阿拉山口', '82.559396', '45.172228', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3549, 701839, 2, 701559, '652722000000', '精河县', '新疆,博尔塔拉,精河', '82.894195', '44.600408', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3550, 701978, 2, 701559, '652723000000', '温泉县', '新疆,博尔塔拉,温泉', '81.024816', '44.968857', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3551, 702105, 2, 702104, '652801000000', '库尔勒市', '新疆,巴音郭楞,库尔勒', '86.174633', '41.725892', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3552, 702357, 2, 702104, '652822000000', '轮台县', '新疆,巴音郭楞,轮台', '84.252156', '41.777702', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3553, 702447, 2, 702104, '652823000000', '尉犁县', '新疆,巴音郭楞,尉犁', '86.261321', '41.343933', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3554, 702573, 2, 702104, '652824000000', '若羌县', '新疆,巴音郭楞,若羌', '88.167152', '39.023242', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3555, 702634, 2, 702104, '652825000000', '且末县', '新疆,巴音郭楞,且末', '85.528865', '38.147895', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3556, 702727, 2, 702104, '652826000000', '焉耆回族自治县', '新疆,巴音郭楞,焉耆', '86.574067', '42.059759', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3557, 702821, 2, 702104, '652827000000', '和静县', '新疆,巴音郭楞,和静', '86.384065', '42.323625', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3558, 702995, 2, 702104, '652828000000', '和硕县', '新疆,巴音郭楞,和硕', '86.863963', '42.268371', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3559, 703063, 2, 702104, '652829000000', '博湖县', '新疆,巴音郭楞,博湖', '86.631998', '41.980152', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3560, 703120, 2, 703119, '652901000000', '阿克苏市', '新疆,阿克苏,阿克苏', '80.260605', '41.168779', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3561, 703353, 2, 703119, '652922000000', '温宿县', '新疆,阿克苏,温宿', '80.238959', '41.276688', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3562, 703576, 2, 703119, '652923000000', '库车县', '新疆,阿克苏,库车', '82.962016', '41.717906', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3563, 703858, 2, 703119, '652924000000', '沙雅县', '新疆,阿克苏,沙雅', '82.781819', '41.221667', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3564, 704059, 2, 703119, '652925000000', '新和县', '新疆,阿克苏,新和', '82.609220', '41.548118', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3565, 704209, 2, 703119, '652926000000', '拜城县', '新疆,阿克苏,拜城', '81.874156', '41.796910', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3566, 704413, 2, 703119, '652927000000', '乌什县', '新疆,阿克苏,乌什', '79.224445', '41.214652', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3567, 704556, 2, 703119, '652928000000', '阿瓦提县', '新疆,阿克苏,阿瓦提', '80.373137', '40.644529', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3568, 704733, 2, 703119, '652929000000', '柯坪县', '新疆,阿克苏,柯坪', '79.047291', '40.508340', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3569, 704780, 2, 704779, '653001000000', '阿图什市', '新疆,克孜勒苏,阿图什', '76.168400', '39.716160', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3570, 704893, 2, 704779, '653022000000', '阿克陶县', '新疆,克孜勒苏,阿克陶', '75.962509', '37.993697', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3571, 705047, 2, 704779, '653023000000', '阿合奇县', '新疆,克孜勒苏,阿合奇', '78.446253', '40.936936', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3572, 705084, 2, 704779, '653024000000', '乌恰县', '新疆,克孜勒苏,乌恰', '76.167819', '39.714526', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3573, 705146, 2, 705145, '653101000000', '喀什市', '新疆,喀什,喀什', '75.989755', '39.470400', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3574, 705344, 2, 705145, '653121000000', '疏附县', '新疆,喀什,疏附', '75.862814', '39.375044', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3575, 705496, 2, 705145, '653122000000', '疏勒县', '新疆,喀什,疏勒', '76.048139', '39.401385', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3576, 705764, 2, 705145, '653123000000', '英吉沙县', '新疆,喀什,英吉沙', '76.175729', '38.930382', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3577, 705961, 2, 705145, '653124000000', '泽普县', '新疆,喀什,泽普', '77.260103', '38.184955', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3578, 706133, 2, 705145, '653125000000', '莎车县', '新疆,喀什,莎车', '77.245761', '38.414217', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3579, 706753, 2, 705145, '653126000000', '叶城县', '新疆,喀什,叶城', '77.413836', '37.882989', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3580, 707143, 2, 705145, '653127000000', '麦盖提县', '新疆,喀什,麦盖提', '77.610105', '38.898666', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3581, 707342, 2, 705145, '653128000000', '岳普湖县', '新疆,喀什,岳普湖', '76.773163', '39.224200', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3582, 707464, 2, 705145, '653129000000', '伽师县', '新疆,喀什,伽师', '76.723720', '39.488182', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3583, 707806, 2, 705145, '653130000000', '巴楚县', '新疆,喀什,巴楚', '78.549297', '39.785155', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3584, 708055, 2, 705145, '653131000000', '塔什库尔干塔吉克自治县', '新疆,喀什,塔什库尔干', '75.989755', '39.470400', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3585, 708118, 2, 708117, '653201000000', '和田市', '新疆,和田,和田', '79.913534', '37.112149', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3586, 708305, 2, 708117, '653221000000', '和田县', '新疆,和田,和田', '79.913534', '37.112149', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3587, 708528, 2, 708117, '653222000000', '墨玉县', '新疆,和田,墨玉', '79.728841', '37.277340', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3588, 708940, 2, 708117, '653223000000', '皮山县', '新疆,和田,皮山', '78.283669', '37.621450', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3589, 709155, 2, 708117, '653224000000', '洛浦县', '新疆,和田,洛浦', '80.188986', '37.073667', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3590, 709393, 2, 708117, '653225000000', '策勒县', '新疆,和田,策勒', '80.806159', '36.998335', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3591, 709538, 2, 708117, '653226000000', '于田县', '新疆,和田,于田', '81.677418', '36.857081', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3592, 709746, 2, 708117, '653227000000', '民丰县', '新疆,和田,民丰', '82.695862', '37.064080', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3593, 709793, 2, 709792, '654002000000', '伊宁市', '新疆,伊犁,伊宁', '81.277950', '43.908558', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3594, 709978, 2, 709792, '654003000000', '奎屯市', '新疆,伊犁,奎屯', '84.903267', '44.426529', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3595, 710057, 2, 709792, '654004000000', '霍尔果斯市', '新疆,伊犁,霍尔果斯', '80.420759', '44.201669', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3596, 710090, 2, 709792, '654021000000', '伊宁县', '新疆,伊犁,伊宁', '81.277950', '43.908558', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3597, 710275, 2, 709792, '654022000000', '察布查尔锡伯自治县', '新疆,伊犁,察布查尔', '81.151337', '43.840726', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3598, 710410, 2, 709792, '654023000000', '霍城县', '新疆,伊犁,霍城', '80.874181', '44.053592', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3599, 710612, 2, 709792, '654024000000', '巩留县', '新疆,伊犁,巩留', '82.231718', '43.482628', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3600, 710730, 2, 709792, '654025000000', '新源县', '新疆,伊犁,新源', '83.260770', '43.429930', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3601, 710868, 2, 709792, '654026000000', '昭苏县', '新疆,伊犁,昭苏', '81.130975', '43.157293', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3602, 711013, 2, 709792, '654027000000', '特克斯县', '新疆,伊犁,特克斯', '81.836206', '43.217184', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3603, 711105, 2, 709792, '654028000000', '尼勒克县', '新疆,伊犁,尼勒克', '82.511810', '43.800247', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3604, 711219, 2, 711218, '654201000000', '塔城市', '新疆,塔城,塔城', '82.978928', '46.748523', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3605, 711436, 2, 711218, '654202000000', '乌苏市', '新疆,塔城,乌苏', '84.713736', '44.418887', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3606, 711820, 2, 711218, '654221000000', '额敏县', '新疆,塔城,额敏', '83.628303', '46.524673', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3607, 712103, 2, 711218, '654223000000', '沙湾县', '新疆,塔城,沙湾', '85.619416', '44.326388', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3608, 712601, 2, 711218, '654224000000', '托里县', '新疆,塔城,托里', '83.606951', '45.947638', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3609, 712700, 2, 711218, '654225000000', '裕民县', '新疆,塔城,裕民', '82.982668', '46.201104', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3610, 712777, 2, 711218, '654226000000', '和布克赛尔蒙古自治县', '新疆,塔城,和布克赛尔', '85.738335', '46.798895', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3611, 712894, 2, 712893, '654301000000', '阿勒泰市', '新疆,阿勒泰,阿勒泰', '88.131842', '47.827309', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3612, 713072, 2, 712893, '654321000000', '布尔津县', '新疆,阿勒泰,布尔津', '86.874897', '47.701850', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3613, 713161, 2, 712893, '654322000000', '富蕴县', '新疆,阿勒泰,富蕴', '89.525504', '46.994115', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3614, 713261, 2, 712893, '654323000000', '福海县', '新疆,阿勒泰,福海', '87.486703', '47.111919', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3615, 713426, 2, 712893, '654324000000', '哈巴河县', '新疆,阿勒泰,哈巴河', '86.418621', '48.060846', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3616, 713568, 2, 712893, '654325000000', '青河县', '新疆,阿勒泰,青河', '90.382961', '46.674205', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3617, 713635, 2, 712893, '654326000000', '吉木乃县', '新疆,阿勒泰,吉木乃', '85.874096', '47.443101', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3618, 713698, 2, 713697, '659001000000', '石河子市', '新疆,石河子', '86.080460', '44.305428', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3619, 713842, 2, 713697, '659002000000', '阿拉尔市', '新疆,阿拉尔', '81.280525', '40.547653', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3620, 714172, 2, 713697, '659003000000', '图木舒克市', '新疆,图木舒克', '79.074089', '39.868969', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3621, 714310, 2, 713697, '659004000000', '五家渠市', '新疆,五家渠', '87.543243', '44.166756', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3622, 714363, 2, 713697, '659006000000', '铁门关市', '新疆,铁门关', '85.669533', '41.863300', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3648, 714403, 2, 714402, '0', '芳苑乡', '台湾,彰化,芳苑', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3649, 714632, 2, 714402, '0', '芬园乡', '台湾,彰化,芬园', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3650, 714701, 2, 714402, '0', '福兴乡', '台湾,彰化,福兴', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3651, 714777, 2, 714402, '0', '和美镇', '台湾,彰化,和美', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3652, 715055, 2, 714402, '0', '花坛乡', '台湾,彰化,花坛', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3653, 715172, 2, 714402, '0', '鹿港镇', '台湾,彰化,鹿港', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3654, 715490, 2, 714402, '0', '埤头乡', '台湾,彰化,埤头', '120.464542', '23.890392', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3655, 715602, 2, 714402, '0', '埔心乡', '台湾,彰化,埔心', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3656, 715745, 2, 714402, '0', '埔盐乡', '台湾,彰化,埔盐', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3657, 715795, 2, 714402, '0', '伸港乡', '台湾,彰化,伸港', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3658, 715960, 2, 714402, '0', '社头乡', '台湾,彰化,社头', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3659, 716105, 2, 714402, '0', '田尾乡', '台湾,彰化,田尾', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3660, 716202, 2, 714402, '0', '田中镇', '台湾,彰化,田中', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3661, 716341, 2, 714402, '0', '线西乡', '台湾,彰化,线西', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3662, 716421, 2, 714402, '0', '溪湖镇', '台湾,彰化,溪湖', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3663, 716750, 2, 714402, '0', '秀水乡', '台湾,彰化,秀水', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3664, 716874, 2, 714402, '0', '溪州乡', '台湾,彰化,溪州', '120.492906', '23.853578', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3665, 717107, 2, 714402, '0', '永靖乡', '台湾,彰化,永靖', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3666, 717238, 2, 714402, '0', '员林市', '台湾,彰化,员林市', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3667, 717447, 2, 714402, '0', '竹塘乡', '台湾,彰化,竹塘', '120.416000', '24.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3668, 717532, 2, 717531, '0', '八里区', '台湾,新北,八里区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3669, 717645, 2, 717531, '0', '板桥区', '台湾,新北,板桥区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3670, 717902, 2, 717531, '0', '贡寮区', '台湾,新北,贡寮区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3671, 717955, 2, 717531, '0', '金山区', '台湾,新北,金山区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3672, 718036, 2, 717531, '0', '林口区', '台湾,新北,林口区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3673, 718195, 2, 717531, '0', '芦洲区', '台湾,新北,芦洲区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3674, 718266, 2, 717531, '0', '坪林区', '台湾,新北,坪林区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3675, 718327, 2, 717531, '0', '平溪区', '台湾,新北,平溪区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3676, 718375, 2, 717531, '0', '瑞芳区', '台湾,新北,瑞芳区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3677, 718490, 2, 717531, '0', '三重区', '台湾,新北,三重区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3678, 718786, 2, 717531, '0', '三峡区', '台湾,新北,三峡区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3679, 718879, 2, 717531, '0', '三芝区', '台湾,新北,三芝区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3680, 718980, 2, 717531, '0', '深坑区', '台湾,新北,深坑区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3681, 719023, 2, 717531, '0', '石碇区', '台湾,新北,石碇区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3682, 719115, 2, 717531, '0', '石门区', '台湾,新北,石门区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3683, 719155, 2, 717531, '0', '双溪区', '台湾,新北,双溪区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3684, 719243, 2, 717531, '0', '树林区', '台湾,新北,树林区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3685, 719382, 2, 717531, '0', '泰山区', '台湾,新北,泰山区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3686, 719498, 2, 717531, '0', '淡水区', '台湾,新北,淡水区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3687, 719731, 2, 717531, '0', '土城区', '台湾,新北,土城区', '121.465746', '25.012366', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3688, 719869, 2, 719868, '0', '白沙乡', '台湾,澎湖,白沙', '119.566417', '23.569733', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3689, 719890, 2, 719868, '0', '湖西乡', '台湾,澎湖,湖西', '119.566417', '23.569733', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3690, 719916, 2, 719868, '0', '马公市', '台湾,澎湖,马公市', '119.566417', '23.569733', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3691, 720065, 2, 719868, '0', '七美乡', '台湾,澎湖,七美', '119.566417', '23.569733', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3692, 720090, 2, 719868, '0', '望安乡', '台湾,澎湖,望安', '119.566417', '23.569733', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3693, 720102, 2, 719868, '0', '西屿乡', '台湾,澎湖,西屿', '119.566417', '23.569733', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3694, 720119, 2, 720118, '0', '三地门乡', '台湾,屏东,三地门', '120.487928', '22.682802', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3695, 720142, 2, 720118, '0', '狮子乡', '台湾,屏东,狮子', '120.487928', '22.682802', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3696, 720163, 2, 720118, '0', '泰武乡', '台湾,屏东,泰武', '120.626012', '22.591307', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3697, 720186, 2, 720118, '0', '万丹乡', '台湾,屏东,万丹', '120.486423', '22.588123', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3698, 720415, 2, 720118, '0', '万峦乡', '台湾,屏东,万峦', '120.566478', '22.571966', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3699, 720480, 2, 720118, '0', '雾臺乡', '台湾,屏东,雾臺', '120.727653', '22.743675', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3700, 720502, 2, 720118, '0', '新埤乡', '台湾,屏东,新埤', '120.545190', '22.465998', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3701, 720553, 2, 720118, '0', '新园乡', '台湾,屏东,新园', '120.459758', '22.544147', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3702, 720649, 2, 720118, '0', '盐埔乡', '台湾,屏东,盐埔', '120.487928', '22.682802', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3703, 720748, 2, 720118, '0', '竹田乡', '台湾,屏东,竹田', '120.487928', '22.682802', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3704, 720835, 2, 720118, '0', '长治乡', '台湾,屏东,长治', '120.487928', '22.682802', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3705, 720975, 2, 720118, '0', '潮州镇', '台湾,屏东,潮州', '120.487928', '22.682802', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3706, 721293, 2, 720118, '0', '车城乡', '台湾,屏东,车城', '120.707694', '22.072115', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3707, 721335, 2, 720118, '0', '春日乡', '台湾,屏东,春日', '120.622000', '22.368284', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3708, 721344, 2, 720118, '0', '东港镇', '台湾,屏东,东港', '120.487928', '22.682802', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3709, 721490, 2, 720118, '0', '枋寮乡', '台湾,屏东,枋寮', '120.487928', '22.682802', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3710, 721617, 2, 720118, '0', '枋山乡', '台湾,屏东,枋山', '120.647762', '22.262550', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3711, 721638, 2, 720118, '0', '高树乡', '台湾,屏东,高树', '120.595945', '22.825131', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3712, 721805, 2, 720118, '0', '恆春镇', '台湾,屏东,恆春', '120.487928', '22.682802', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3713, 721930, 2, 720118, '0', '佳冬乡', '台湾,屏东,佳冬', '120.545370', '22.417786', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3714, 722025, 2, 722024, '0', '梧栖区', '台湾,臺中,梧栖区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3715, 722212, 2, 722024, '0', '乌日区', '台湾,臺中,乌日区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3716, 722402, 2, 722024, '0', '新社区', '台湾,臺中,新社区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3717, 722474, 2, 722024, '0', '西屯区', '台湾,臺中,西屯区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3718, 722699, 2, 722024, '0', '北屯区', '台湾,臺中,北屯区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3719, 722879, 2, 722024, '0', '中区', '台湾,臺中,中区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3720, 722923, 2, 722024, '0', '大肚区', '台湾,臺中,大肚区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3721, 723021, 2, 722024, '0', '大甲区', '台湾,臺中,大甲区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3722, 723211, 2, 722024, '0', '大里区', '台湾,臺中,大里区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3723, 723592, 2, 722024, '0', '大雅区', '台湾,臺中,大雅区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3724, 723756, 2, 722024, '0', '大安区', '台湾,臺中,大安区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3725, 723802, 2, 722024, '0', '东势区', '台湾,臺中,东势区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3726, 723966, 2, 722024, '0', '东区', '台湾,臺中,东区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3727, 724148, 2, 722024, '0', '丰原区', '台湾,臺中,丰原区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3728, 724424, 2, 722024, '0', '和平区', '台湾,臺中,和平区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3729, 724504, 2, 722024, '0', '后里区', '台湾,臺中,后里区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3730, 724656, 2, 722024, '0', '龙井区', '台湾,臺中,龙井区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3731, 724797, 2, 722024, '0', '南屯区', '台湾,臺中,南屯区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3732, 724872, 2, 722024, '0', '北区', '台湾,臺中,北区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3733, 725199, 2, 722024, '0', '清水区', '台湾,臺中,清水区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3734, 725489, 2, 725488, '0', '佳里区', '台湾,臺南,佳里区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3735, 725588, 2, 725488, '0', '将军区', '台湾,臺南,将军区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3736, 725620, 2, 725488, '0', '六甲区', '台湾,臺南,六甲区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3737, 725679, 2, 725488, '0', '柳营区', '台湾,臺南,柳营区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3738, 725795, 2, 725488, '0', '龙崎区', '台湾,臺南,龙崎区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3739, 725841, 2, 725488, '0', '麻豆区', '台湾,臺南,麻豆区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3740, 725927, 2, 725488, '0', '南化区', '台湾,臺南,南化区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3741, 725938, 2, 725488, '0', '楠西区', '台湾,臺南,楠西区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3742, 725973, 2, 725488, '0', '北区', '台湾,臺南,北区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3743, 726300, 2, 725488, '0', '七股区', '台湾,臺南,七股区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3744, 726338, 2, 725488, '0', '仁德区', '台湾,臺南,仁德区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3745, 726539, 2, 725488, '0', '善化区', '台湾,臺南,善化区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3746, 726675, 2, 725488, '0', '山上区', '台湾,臺南,山上区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3747, 726691, 2, 725488, '0', '南区', '台湾,臺南,南区', '120.679305', '24.133453', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3748, 727041, 2, 725488, '0', '中西区', '台湾,臺南,中西区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3749, 727251, 2, 725488, '0', '下营区', '台湾,臺南,下营区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3750, 727339, 2, 725488, '0', '西港区', '台湾,臺南,西港区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3751, 727375, 2, 725488, '0', '新化区', '台湾,臺南,新化区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3752, 727425, 2, 725488, '0', '新市区', '台湾,臺南,新市区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3753, 727529, 2, 725488, '0', '新营区', '台湾,臺南,新营区', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3754, 727731, 2, 727730, '0', '北投区', '台湾,臺北,北投区', '121.517057', '25.048074', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3755, 727897, 2, 727730, '0', '大同区', '台湾,臺北,大同区', '121.517057', '25.048074', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3756, 728070, 2, 727730, '0', '大安区', '台湾,臺北,大安区', '121.517057', '25.048074', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3757, 728116, 2, 727730, '0', '南港区', '台湾,臺北,南港区', '121.517057', '25.048074', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3758, 728220, 2, 727730, '0', '内湖区', '台湾,臺北,内湖区', '121.517057', '25.048074', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3759, 728340, 2, 727730, '0', '士林区', '台湾,臺北,士林区', '121.517057', '25.048074', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3760, 728550, 2, 727730, '0', '松山区', '台湾,臺北,松山区', '121.517057', '25.048074', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3761, 728713, 2, 727730, '0', '万华区', '台湾,臺北,万华区', '121.517057', '25.048074', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3762, 728920, 2, 727730, '0', '文山区', '台湾,臺北,文山区', '121.517057', '25.048074', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3763, 729073, 2, 727730, '0', '信义区', '台湾,臺北,信义区', '121.517057', '25.048074', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3764, 729277, 2, 727730, '0', '中山区', '台湾,臺北,中山区', '121.517057', '25.048074', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3765, 729583, 2, 727730, '0', '中正区', '台湾,臺北,中正区', '121.517057', '25.048074', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3766, 729929, 2, 729928, '0', '卑南乡', '台湾,臺东,卑南', '121.117213', '22.781744', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3767, 729994, 2, 729928, '0', '长滨乡', '台湾,臺东,长滨', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3768, 730033, 2, 729928, '0', '成功镇', '台湾,臺东,成功', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3769, 730107, 2, 729928, '0', '池上乡', '台湾,臺东,池上', '121.212999', '23.123275', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3770, 730196, 2, 729928, '0', '达仁乡', '台湾,臺东,达仁', '120.878316', '22.296142', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3771, 730219, 2, 729928, '0', '大武乡', '台湾,臺东,大武', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3772, 730268, 2, 729928, '0', '东河乡', '台湾,臺东,东河', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3773, 730308, 2, 729928, '0', '关山镇', '台湾,臺东,关山', '121.158084', '23.047483', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3774, 730384, 2, 729928, '0', '海端乡', '台湾,臺东,海端', '121.172009', '23.101079', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3775, 730409, 2, 729928, '0', '金峰乡', '台湾,臺东,金峰', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3776, 730416, 2, 729928, '0', '兰屿乡', '台湾,臺东,兰屿', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3777, 730423, 2, 729928, '0', '绿岛乡', '台湾,臺东,绿岛', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3778, 730438, 2, 729928, '0', '鹿野乡', '台湾,臺东,鹿野', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3779, 730510, 2, 729928, '0', '太麻里乡', '台湾,臺东,太麻里', '120.999365', '22.610919', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3780, 730565, 2, 729928, '0', '臺东市', '台湾,臺东,臺东市', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3781, 730832, 2, 729928, '0', '延平乡', '台湾,臺东,延平', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3782, 730844, 2, 730843, '0', '八德区', '台湾,桃园,八德区', '121.083000', '25.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3783, 731212, 2, 730843, '0', '大溪区', '台湾,桃园,大溪区', '121.083000', '25.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3784, 731471, 2, 730843, '0', '大园区', '台湾,桃园,大园区', '121.083000', '25.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3785, 731767, 2, 730843, '0', '復兴区', '台湾,桃园,復兴区', '121.083000', '25.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3786, 731835, 2, 730843, '0', '观音区', '台湾,桃园,观音区', '121.083000', '25.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3787, 732079, 2, 730843, '0', '龟山区', '台湾,桃园,龟山区', '121.083000', '25.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3788, 732469, 2, 730843, '0', '龙潭区', '台湾,桃园,龙潭区', '121.083000', '25.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3789, 732800, 2, 730843, '0', '芦竹区', '台湾,桃园,芦竹区', '121.083000', '25.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3790, 733144, 2, 730843, '0', '平镇区', '台湾,桃园,平区', '121.083000', '25.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3791, 733179, 2, 730843, '0', '桃园区', '台湾,桃园,桃园区', '121.083000', '25.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3792, 733390, 2, 730843, '0', '新屋区', '台湾,桃园,新屋区', '121.083000', '25.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3793, 733537, 2, 730843, '0', '杨梅区', '台湾,桃园,杨梅区', '121.083000', '25.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3794, 733876, 2, 730843, '0', '中坜区', '台湾,桃园,中坜区', '121.083000', '25.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3795, 734180, 2, 734179, '0', '大同乡', '台湾,宜兰,大同', '121.500000', '24.600000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3796, 734246, 2, 734179, '0', '钓鱼臺', '台湾,宜兰,钓鱼臺', '121.500000', '24.600000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3797, 734248, 2, 734179, '0', '冬山乡', '台湾,宜兰,冬山', '121.500000', '24.600000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3798, 734579, 2, 734179, '0', '礁溪乡', '台湾,宜兰,礁溪', '121.500000', '24.600000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3799, 734681, 2, 734179, '0', '罗东镇', '台湾,宜兰,罗东', '121.500000', '24.600000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3800, 734842, 2, 734179, '0', '南澳乡', '台湾,宜兰,南澳', '121.500000', '24.600000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3801, 734865, 2, 734179, '0', '三星乡', '台湾,宜兰,三星', '121.500000', '24.600000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3802, 735104, 2, 734179, '0', '苏澳镇', '台湾,宜兰,苏澳', '121.500000', '24.600000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3803, 735319, 2, 734179, '0', '头城镇', '台湾,宜兰,头城', '121.500000', '24.600000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3804, 735419, 2, 734179, '0', '五结乡', '台湾,宜兰,五结', '121.796468', '24.685615', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3805, 735620, 2, 734179, '0', '宜兰市', '台湾,宜兰,宜兰市', '121.500000', '24.600000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3806, 735851, 2, 734179, '0', '员山乡', '台湾,宜兰,员山', '121.500000', '24.600000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3807, 735970, 2, 734179, '0', '壮围乡', '台湾,宜兰,壮围', '121.500000', '24.600000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3808, 736052, 2, 736051, '0', '草屯镇', '台湾,南投,草屯', '120.830000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3809, 736305, 2, 736051, '0', '国姓乡', '台湾,南投,国姓', '120.830000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3810, 736356, 2, 736051, '0', '集集镇', '台湾,南投,集集', '120.830000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3811, 736449, 2, 736051, '0', '鹿谷乡', '台湾,南投,鹿谷', '120.830000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3812, 736522, 2, 736051, '0', '名间乡', '台湾,南投,名间', '120.830000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3813, 736622, 2, 736051, '0', '南投市', '台湾,南投,南投市', '120.830000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3814, 736887, 2, 736051, '0', '埔里镇', '台湾,南投,埔里', '120.830000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3815, 737266, 2, 736051, '0', '仁爱乡', '台湾,南投,仁爱', '120.830000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3816, 737337, 2, 736051, '0', '水里乡', '台湾,南投,水里', '120.830000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3817, 737496, 2, 736051, '0', '信义乡', '台湾,南投,信义', '120.830000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3818, 737533, 2, 736051, '0', '鱼池乡', '台湾,南投,鱼池', '120.830000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3819, 737591, 2, 736051, '0', '中寮乡', '台湾,南投,中寮', '120.830000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3820, 737625, 2, 736051, '0', '竹山镇', '台湾,南投,竹山', '120.830000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3821, 737857, 2, 737856, '0', '东沙群岛', '台湾,南海岛,东沙群岛', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3822, 737859, 2, 737856, '0', '南沙群岛', '台湾,南海岛,南沙群岛', '0.000000', '0.000000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3823, 737862, 2, 737861, '0', '头屋乡', '台湾,苗栗,头屋', '120.818985', '24.561601', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3824, 737894, 2, 737861, '0', '西湖乡', '台湾,苗栗,西湖', '120.743700', '24.556610', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3825, 737948, 2, 737861, '0', '苑里镇', '台湾,苗栗,苑里', '120.818985', '24.561601', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3826, 738050, 2, 737861, '0', '造桥乡', '台湾,苗栗,造桥', '120.818985', '24.561601', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3827, 738158, 2, 737861, '0', '竹南镇', '台湾,苗栗,竹南', '120.872636', '24.685510', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3828, 738454, 2, 737861, '0', '卓兰镇', '台湾,苗栗,卓兰', '120.823440', '24.309510', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3829, 738528, 2, 737861, '0', '大湖乡', '台湾,苗栗,大湖', '120.863640', '24.422548', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3830, 738619, 2, 737861, '0', '公馆乡', '台湾,苗栗,公馆', '120.818985', '24.561601', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3831, 738695, 2, 737861, '0', '后龙镇', '台湾,苗栗,后龙', '120.786474', '24.612613', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3832, 738882, 2, 737861, '0', '苗栗市', '台湾,苗栗,苗栗市', '120.819288', '24.561582', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3833, 739250, 2, 737861, '0', '南庄乡', '台湾,苗栗,南庄', '120.818985', '24.561601', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3834, 739302, 2, 737861, '0', '三湾乡', '台湾,苗栗,三湾', '120.818985', '24.561601', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3835, 739369, 2, 737861, '0', '三义乡', '台湾,苗栗,三义', '120.765515', '24.413037', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3836, 739419, 2, 737861, '0', '狮潭乡', '台湾,苗栗,狮潭', '120.918024', '24.540004', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3837, 739465, 2, 737861, '0', '泰安乡', '台湾,苗栗,泰安', '120.818985', '24.561601', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3838, 739487, 2, 737861, '0', '铜锣乡', '台湾,苗栗,铜锣', '120.786475', '24.489502', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3839, 739564, 2, 737861, '0', '通霄镇', '台湾,苗栗,通霄', '120.676696', '24.489084', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3840, 739642, 2, 737861, '0', '头份市', '台湾,苗栗,头份市', '120.818985', '24.561601', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3841, 739958, 2, 739957, '0', '东区', '台湾,嘉义,东区', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3842, 740140, 2, 739957, '0', '西区', '台湾,嘉义,西区', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3843, 740511, 2, 740510, '0', '阿里山乡', '台湾,嘉义,阿里山', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3844, 740536, 2, 740510, '0', '布袋镇', '台湾,嘉义,布袋', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3845, 740625, 2, 740510, '0', '大林镇', '台湾,嘉义,大林', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3846, 740746, 2, 740510, '0', '大埔乡', '台湾,嘉义,大埔', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3847, 740792, 2, 740510, '0', '东石乡', '台湾,嘉义,东石', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3848, 740845, 2, 740510, '0', '番路乡', '台湾,嘉义,番路', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3849, 740943, 2, 740510, '0', '六脚乡', '台湾,嘉义,六脚', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3850, 740975, 2, 740510, '0', '鹿草乡', '台湾,嘉义,鹿草', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3851, 741010, 2, 740510, '0', '梅山乡', '台湾,嘉义,梅山', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3852, 741137, 2, 740510, '0', '民雄乡', '台湾,嘉义,民雄', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3853, 741312, 2, 740510, '0', '朴子市', '台湾,嘉义,朴子市', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3854, 741451, 2, 740510, '0', '水上乡', '台湾,嘉义,水上', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3855, 741550, 2, 740510, '0', '太保市', '台湾,嘉义,太保市', '120.332737', '23.459115', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3856, 741646, 2, 740510, '0', '溪口乡', '台湾,嘉义,溪口', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3857, 741688, 2, 740510, '0', '新港乡', '台湾,嘉义,新港', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3858, 741750, 2, 740510, '0', '义竹乡', '台湾,嘉义,义竹', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3859, 741785, 2, 740510, '0', '中埔乡', '台湾,嘉义,中埔', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3860, 741936, 2, 740510, '0', '竹崎乡', '台湾,嘉义,竹崎', '120.452538', '23.481568', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3861, 742127, 2, 742126, '0', '东区', '台湾,新竹,东区', '120.973544', '24.805226', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3862, 742309, 2, 742126, '0', '北区', '台湾,新竹,北区', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3863, 742637, 2, 742636, '0', '峨眉乡', '台湾,新竹,峨眉', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3864, 742674, 2, 742636, '0', '关西镇', '台湾,新竹,关西', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3865, 742797, 2, 742636, '0', '横山乡', '台湾,新竹,横山', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3866, 742852, 2, 742636, '0', '湖口乡', '台湾,新竹,湖口', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3867, 743201, 2, 742636, '0', '尖石乡', '台湾,新竹,尖石', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3868, 743246, 2, 742636, '0', '芎林乡', '台湾,新竹,芎林', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3869, 743298, 2, 742636, '0', '五峰乡', '台湾,新竹,五峰', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3870, 743319, 2, 742636, '0', '新丰乡', '台湾,新竹,新丰', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3871, 743414, 2, 742636, '0', '新埔镇', '台湾,新竹,新埔', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3872, 743527, 2, 742636, '0', '竹北市', '台湾,新竹,竹北市', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3873, 743565, 2, 742636, '0', '竹东镇', '台湾,新竹,竹东', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3874, 743725, 2, 742636, '0', '宝山乡', '台湾,新竹,宝山', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3875, 743888, 2, 742636, '0', '北埔乡', '台湾,新竹,北埔', '120.968798', '24.806738', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3876, 743939, 2, 743938, '0', '卓溪乡', '台湾,花莲,卓溪', '121.301890', '23.344908', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3877, 743956, 2, 743938, '0', '丰滨乡', '台湾,花莲,丰滨', '121.300000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3878, 743993, 2, 743938, '0', '凤林镇', '台湾,花莲,凤林', '121.300000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3879, 744128, 2, 743938, '0', '富里乡', '台湾,花莲,富里', '121.244694', '23.175468', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3880, 744185, 2, 743938, '0', '光復乡', '台湾,花莲,光復', '121.300000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3881, 744246, 2, 743938, '0', '花莲市', '台湾,花莲,花莲市', '121.606927', '23.981993', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3882, 744625, 2, 743938, '0', '吉安乡', '台湾,花莲,吉安', '121.300000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3883, 745050, 2, 743938, '0', '瑞穗乡', '台湾,花莲,瑞穗', '121.373373', '23.496080', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3884, 745196, 2, 743938, '0', '寿丰乡', '台湾,花莲,寿丰', '121.506030', '23.869774', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3885, 745354, 2, 743938, '0', '万荣乡', '台湾,花莲,万荣', '121.300000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3886, 745363, 2, 743938, '0', '新城乡', '台湾,花莲,新城', '121.604120', '24.039243', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3887, 745486, 2, 743938, '0', '秀林乡', '台湾,花莲,秀林', '121.300000', '23.830000', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3888, 745532, 2, 743938, '0', '玉里镇', '台湾,花莲,玉里', '121.312109', '23.334236', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3889, 745675, 2, 745674, '0', '阿莲区', '台湾,高雄,阿莲区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3890, 745715, 2, 745674, '0', '大寮区', '台湾,高雄,大寮区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3891, 746083, 2, 745674, '0', '大社区', '台湾,高雄,大社区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3892, 746199, 2, 745674, '0', '大树区', '台湾,高雄,大树区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3893, 746294, 2, 745674, '0', '凤山区', '台湾,高雄,凤山区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3894, 746624, 2, 745674, '0', '冈山区', '台湾,高雄,冈山区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3895, 746906, 2, 745674, '0', '鼓山区', '台湾,高雄,鼓山区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3896, 747053, 2, 745674, '0', '湖内区', '台湾,高雄,湖内区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3897, 747108, 2, 745674, '0', '甲仙区', '台湾,高雄,甲仙区', '120.587980', '23.083957', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3898, 747150, 2, 745674, '0', '苓雅区', '台湾,高雄,苓雅区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3899, 747342, 2, 745674, '0', '林园区', '台湾,高雄,林园区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3900, 747481, 2, 745674, '0', '六龟区', '台湾,高雄,六龟区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3901, 747536, 2, 745674, '0', '路竹区', '台湾,高雄,路竹区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3902, 747643, 2, 745674, '0', '茂林区', '台湾,高雄,茂林区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3903, 747647, 2, 745674, '0', '美浓区', '台湾,高雄,美浓区', '120.542419', '22.894882', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3904, 747764, 2, 745674, '0', '弥陀区', '台湾,高雄,弥陀区', '120.250672', '22.781561', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3905, 747894, 2, 745674, '0', '那玛夏区', '台湾,高雄,那玛夏区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3906, 747902, 2, 745674, '0', '楠梓区', '台湾,高雄,楠梓区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3907, 748258, 2, 745674, '0', '内门区', '台湾,高雄,内门区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3908, 748344, 2, 745674, '0', '鸟松区', '台湾,高雄,鸟松区', '120.311922', '22.620856', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3909, 748554, 2, 748553, '0', '安乐区', '台湾,基隆,安乐区', '121.746248', '25.130741', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3910, 748581, 2, 748553, '0', '暖暖区', '台湾,基隆,暖暖区', '121.746248', '25.130741', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3911, 748599, 2, 748553, '0', '七堵区', '台湾,基隆,七堵区', '121.746248', '25.130741', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3912, 748670, 2, 748553, '0', '仁爱区', '台湾,基隆,仁爱区', '121.746248', '25.130741', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3913, 748716, 2, 748553, '0', '信义区', '台湾,基隆,信义区', '121.746248', '25.130741', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3914, 748920, 2, 748553, '0', '中山区', '台湾,基隆,中山区', '121.746248', '25.130741', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3915, 749226, 2, 748553, '0', '中正区', '台湾,基隆,中正区', '121.768000', '25.151647', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3916, 749572, 2, 749571, '0', '金城镇', '台湾,金门,金城', '118.317089', '24.432706', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3917, 749647, 2, 749571, '0', '金湖镇', '台湾,金门,金湖', '118.317089', '24.432706', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3918, 749752, 2, 749571, '0', '金宁乡', '台湾,金门,金宁', '118.317089', '24.432706', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3919, 749810, 2, 749571, '0', '金沙镇', '台湾,金门,金沙', '118.317089', '24.432706', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3920, 749894, 2, 749571, '0', '烈屿乡', '台湾,金门,烈屿', '118.317089', '24.432706', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3921, 749928, 2, 749571, '0', '乌坵乡', '台湾,金门,乌坵', '118.317089', '24.432706', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3922, 749931, 2, 749930, '0', '北竿乡', '台湾,连江,北竿', '119.539704', '26.197364', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3923, 749938, 2, 749930, '0', '东引乡', '台湾,连江,东引', '119.539704', '26.197364', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3924, 749941, 2, 749930, '0', '莒光乡', '台湾,连江,莒光', '119.539704', '26.197364', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3925, 749947, 2, 749930, '0', '南竿乡', '台湾,连江,南竿', '119.539704', '26.197364', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3926, 749958, 2, 749957, '0', '褒忠乡', '台湾,云林,褒忠', '120.309069', '23.695652', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3927, 749991, 2, 749957, '0', '北港镇', '台湾,云林,北港', '120.296759', '23.572428', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3928, 750170, 2, 749957, '0', '莿桐乡', '台湾,云林,莿桐', '120.497033', '23.757251', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3929, 750218, 2, 749957, '0', '大埤乡', '台湾,云林,大埤', '120.527173', '23.696887', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3930, 750291, 2, 749957, '0', '东势乡', '台湾,云林,东势', '120.527173', '23.696887', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3931, 750363, 2, 749957, '0', '斗六市', '台湾,云林,斗六市', '120.527173', '23.696887', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3932, 750795, 2, 749957, '0', '斗南镇', '台湾,云林,斗南', '120.527173', '23.696887', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3933, 751009, 2, 749957, '0', '二崙乡', '台湾,云林,二崙', '120.527173', '23.696887', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3934, 751071, 2, 749957, '0', '古坑乡', '台湾,云林,古坑', '120.558553', '23.644734', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3935, 751147, 2, 749957, '0', '虎尾镇', '台湾,云林,虎尾', '120.429231', '23.707796', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3936, 751400, 2, 749957, '0', '口湖乡', '台湾,云林,口湖', '120.178640', '23.585506', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3937, 751493, 2, 749957, '0', '林内乡', '台湾,云林,林内', '120.527173', '23.696887', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3938, 751555, 2, 749957, '0', '崙背乡', '台湾,云林,崙背', '120.527173', '23.696887', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3939, 751674, 2, 749957, '0', '麦寮乡', '台湾,云林,麦寮', '120.527173', '23.696887', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3940, 751764, 2, 749957, '0', '水林乡', '台湾,云林,水林', '120.241228', '23.571067', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3941, 751832, 2, 749957, '0', '四湖乡', '台湾,云林,四湖', '120.220781', '23.635426', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3942, 751907, 2, 749957, '0', '臺西乡', '台湾,云林,臺西', '120.196139', '23.702821', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3943, 751956, 2, 749957, '0', '土库镇', '台湾,云林,土库', '120.527173', '23.696887', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3944, 752034, 2, 749957, '0', '西螺镇', '台湾,云林,西螺', '120.457123', '23.797412', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3945, 752149, 2, 749957, '0', '元长乡', '台湾,云林,元长', '120.311052', '23.649577', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3946, 752150, 1, 714368, '', '香港特别行政区', '香港特别行政区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3947, 752151, 2, 752150, '', '中西区', '中西区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3948, 752152, 2, 752150, '', '东区', '东区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3949, 752153, 2, 752150, '', '九龙城区', '九龙城区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3950, 752154, 2, 752150, '', '观塘区', '香港,九龙,观塘', '114.231268', '22.309430', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3951, 752155, 2, 752150, '', '南区', '香港,香港岛,南区', '114.174134', '22.246760', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3953, 752156, 2, 752150, '', '深水埗区', '香港特别行政区,香港特别行政区,深水埗区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3954, 752157, 2, 752150, '', '湾仔区', '湾仔区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3955, 752158, 2, 752150, '', '黄大仙区', '黄大仙区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3956, 752159, 2, 752150, '', '油尖旺区', '油尖旺区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3957, 752160, 2, 752150, '', '离岛区', '离岛区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3958, 752161, 2, 752150, '', '葵青区', '葵青区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3959, 752162, 2, 752150, '', '北区', '北区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3960, 752163, 2, 752150, '', '西贡区', '西贡区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3961, 752164, 2, 752150, '', '沙田区', '沙田区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3962, 752165, 2, 752150, '', '屯门区', '屯门区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3963, 752166, 2, 752150, '', '大埔区', '大埔区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3964, 752167, 2, 752150, '', '荃湾区', '荃湾区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3965, 752168, 2, 752150, '', '元朗区', '元朗区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3966, 752169, 1, 714390, '', '澳门特别行政区', '澳门特别行政区', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3967, 752170, 2, 752169, '', '澳门半岛', '澳门半岛', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3968, 752171, 2, 752169, '', '凼仔', '凼仔', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3969, 752172, 2, 752169, '', '路凼城', '路凼城', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3970, 752173, 2, 752169, '', '路环', '路环', '', '', 1, 0, 0, 0);
INSERT INTO `water_system_city` VALUES (3974, 752177, 2, 487721, '', '龙华区', ',龙华区', '', '', 1, 0, 0, 0);

-- ----------------------------
-- Table structure for water_system_config
-- ----------------------------
DROP TABLE IF EXISTS `water_system_config`;
CREATE TABLE `water_system_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置名称',
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段键',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'text' COMMENT '组件类型',
  `system_config_tab_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置分类id',
  `opts` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '单选框或多选框的选项',
  `validate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则',
  `value` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '默认值',
  `desc` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置简介',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否隐藏',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key`(`key`) USING BTREE,
  INDEX `system_config_tab_id`(`system_config_tab_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_system_config
-- ----------------------------
INSERT INTO `water_system_config` VALUES (1, '网站名称', 'site_name', 'text', 26, '', 'required:true', '\"CRMEB\"', '网站名称很多地方会显示的，建议认真填写', 10, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (2, '网站地址', 'site_url', 'text', 26, '', 'required:true,url:true', '', '安装自动配置，不要轻易修改，更换会影响网站访问、接口请求、本地文件储存、支付回调、微信授权、支付、小程序图片访问、部分二维码、官方授权等', 9, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (3, '后台大LOGO', 'site_logo', 'upload', 26, '', '', '\"https:\\/\\/data44.wuht.net\\/\\/uploads\\/attach\\/2022\\/01\\/20220115\\/1270c9ff5007ecc16245c9577370e031.png\"', '菜单展开左上角logo,建议尺寸[170*50]', 3, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (4, '联系电话', 'site_phone', 'text', 1, '', '', '', '联系电话', 0, 0, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (5, 'SEO标题', 'seo_title', 'text', 26, '', 'required:true', '\"CRMEB\"', 'SEO标题', 0, 0, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (6, '联系邮箱', 'site_email', 'text', 1, '', 'email:true', '', '联系邮箱', 0, 0, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (7, '联系QQ', 'site_qq', 'text', 1, '', 'qq:true', '', '联系QQ', 0, 0, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (8, '网站关闭', 'site_close', 'radio', 1, '0=>开启\n1=>PC端关闭\n2=>WAP端关闭(含微信)\n3=>全部关闭', '', '\"0\"', '网站后台、商家中心不受影响。关闭网站也可访问', 0, 2, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (9, '关闭后台', 'close_system', 'radio', 1, '0=>开启\n1=>关闭', '', '\"0\"', '关闭后台', 0, 2, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (13, 'AppID', 'wechat_appid', 'text', 5, '', '', '', 'AppID', 99, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (14, 'AppSecret', 'wechat_appsecret', 'text', 5, '', '', '', 'AppSecret', 95, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (15, '微信验证TOKEN', 'wechat_token', 'text', 5, '', '', '', '微信验证TOKEN', 88, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (16, '消息加解密方式', 'wechat_encode', 'radio', 5, '0=>明文模式\n1=>兼容模式\n2=>安全模式', '', '\"0\"', '如需使用安全模式请在管理中心修改，仅限服务号和认证订阅号', 84, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (17, 'EncodingAESKey', 'wechat_encodingaeskey', 'text', 5, '', '', '', '公众号消息加解密Key,在使用安全模式情况下要填写该值，请先在管理中心修改，然后填写该值，仅限服务号和认证订阅号', 80, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (18, '微信分享图片', 'wechat_share_img', 'upload', 11, '', '', '\"https:\\/\\/data44.wuht.net\\/\\/uploads\\/attach\\/2022\\/01\\/20220115\\/96e39565d72357df71860d326e9e6f02.jpeg\"', '若填写此图片地址，则分享网页出去时会分享此图片。可有效防止分享图片变形', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (19, '公众号关注二维码', 'wechat_qrcode', 'upload', 5, '', '', '', '公众号关注二维码', 76, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (21, '微信分享标题', 'wechat_share_title', 'text', 11, '', 'required:true', '\"CRMEB v4\\u6807\\u51c6\\u7248\"', '微信分享标题', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (22, '微信分享简介', 'wechat_share_synopsis', 'textarea', 11, '', '', '\"\\u5b8c\\u5584\\u7684\\u6587\\u6863 \\u5168\\u201c\\u5fc3\\u201d\\u800c\\u6765\\uff01\"', '微信分享简介', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (24, '商户ID', 'pay_mch_id', 'text', 12, '', '', '', '通联支付的商户ID', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (25, '应用ID', 'pay_app_id', 'text', 12, '', '', '', '通联支付的应用ID', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (26, '公钥', 'pay_public_key', 'text', 12, '', '', '', '通联支付的验证公钥', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (27, '私钥', 'pay_private_key', 'text', 12, '', '', '', '通联支付的验证私钥', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (28, '账号', 'email_username', 'text', 8, '', '', '', '邮箱的账号', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config` VALUES (29, '密码', 'email_password', 'text', 8, '', '', '', '邮箱的密码', 0, 1, 0, 0, 0);

-- ----------------------------
-- Table structure for water_system_config_tab
-- ----------------------------
DROP TABLE IF EXISTS `water_system_config_tab`;
CREATE TABLE `water_system_config_tab`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置分类id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置分类名称',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级分类id',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '配置分类状态 0不显示 1显示',
  `icon` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `sort` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `site_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_system_config_tab
-- ----------------------------
INSERT INTO `water_system_config_tab` VALUES (1, '基础配置', 0, 1, 'el-icon-s-tools', 0, 1, 0, 1657346949, 0);
INSERT INTO `water_system_config_tab` VALUES (2, '微信配置', 0, 1, '', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config_tab` VALUES (3, '站点配置', 1, 1, 'el-icon-setting', 0, 1, 0, 1657346967, 0);
INSERT INTO `water_system_config_tab` VALUES (4, '支付配置', 0, 1, '', 0, 1, 0, 1657330190, 0);
INSERT INTO `water_system_config_tab` VALUES (5, '公众号配置', 2, 1, '', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config_tab` VALUES (6, '小程序配置', 2, 1, '', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config_tab` VALUES (7, '短信配置', 1, 1, '', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config_tab` VALUES (8, '邮箱配置', 1, 1, '', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config_tab` VALUES (9, '用户配置', 1, 1, '', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config_tab` VALUES (12, '通联支付配置', 4, 1, '', 0, 1, 0, 0, 0);
INSERT INTO `water_system_config_tab` VALUES (13, 'test', 0, 1, 'el-icon-eleme', 0, 1, 1657265458, 1657270647, 0);

-- ----------------------------
-- Table structure for water_system_log
-- ----------------------------
DROP TABLE IF EXISTS `water_system_log`;
CREATE TABLE `water_system_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `route` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模块',
  `ip` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `query` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '查询字符串',
  `ua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 500 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_system_log
-- ----------------------------
INSERT INTO `water_system_log` VALUES (1, '管理员列表', 1, 'admin/v1.Admin/index', '/admin/v1/admin', 'admin', '2130706433', 'GET', 'lang=zh-cn&page=1', 'PostmanRuntime/7.29.0', 1657179866, 1657179866, 0);
INSERT INTO `water_system_log` VALUES (2, '获取管理员详情', 1, 'admin/v1.Admin/read', '/admin/v1/admin/12', 'admin', '2130706433', 'GET', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657179870, 1657179870, 0);
INSERT INTO `water_system_log` VALUES (3, '仪表盘', 1, 'admin/v1.Dashboard/index', '/admin/v1/dashboard', 'admin', '2130706433', 'GET', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657179876, 1657179876, 0);
INSERT INTO `water_system_log` VALUES (4, '后台登录', 0, 'admin/Login/login', '/admin/login', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657180010, 1657180010, 0);
INSERT INTO `water_system_log` VALUES (5, '后台登出', 1, 'admin/Login/logout', '/admin/logout', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657180014, 1657180014, 0);
INSERT INTO `water_system_log` VALUES (6, '后台登录', 0, 'admin/Login/login', '/admin/login', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657180018, 1657180018, 0);
INSERT INTO `water_system_log` VALUES (7, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657180104, 1657180104, 0);
INSERT INTO `water_system_log` VALUES (8, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657180105, 1657180105, 0);
INSERT INTO `water_system_log` VALUES (9, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657180142, 1657180142, 0);
INSERT INTO `water_system_log` VALUES (10, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657180143, 1657180143, 0);
INSERT INTO `water_system_log` VALUES (11, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657180158, 1657180158, 0);
INSERT INTO `water_system_log` VALUES (12, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657180407, 1657180407, 0);
INSERT INTO `water_system_log` VALUES (13, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657180469, 1657180469, 0);
INSERT INTO `water_system_log` VALUES (14, '仪表盘', 1, 'admin/v1.Dashboard/index', '/admin/v1/dashboard', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657180470, 1657180470, 0);
INSERT INTO `water_system_log` VALUES (15, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657180473, 1657180473, 0);
INSERT INTO `water_system_log` VALUES (16, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657180537, 1657180537, 0);
INSERT INTO `water_system_log` VALUES (17, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657181894, 1657181894, 0);
INSERT INTO `water_system_log` VALUES (18, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/2/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657181899, 1657181899, 0);
INSERT INTO `water_system_log` VALUES (19, '修改角色', 1, 'admin/v1.SystemRole/update', '/admin/v1/system_role/2', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657181907, 1657181907, 0);
INSERT INTO `water_system_log` VALUES (20, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657181908, 1657181908, 0);
INSERT INTO `water_system_log` VALUES (21, '后台登录', 0, 'admin/Login/login', '/admin/login', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657181915, 1657181915, 0);
INSERT INTO `water_system_log` VALUES (22, '添加管理员', 5, 'admin/v1.Admin/save', '/admin/v1/admin', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657181929, 1657181929, 0);
INSERT INTO `water_system_log` VALUES (23, '添加管理员', 5, 'admin/v1.Admin/save', '/admin/v1/admin', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657181944, 1657181944, 0);
INSERT INTO `water_system_log` VALUES (24, '添加管理员', 5, 'admin/v1.Admin/save', '/admin/v1/admin', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657181949, 1657181949, 0);
INSERT INTO `water_system_log` VALUES (25, '添加管理员', 5, 'admin/v1.Admin/save', '/admin/v1/admin', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657181954, 1657181954, 0);
INSERT INTO `water_system_log` VALUES (26, '添加管理员', 5, 'admin/v1.Admin/save', '/admin/v1/admin', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657181957, 1657181957, 0);
INSERT INTO `water_system_log` VALUES (27, '后台登录', 0, 'admin/Login/login', '/admin/login', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657181974, 1657181974, 0);
INSERT INTO `water_system_log` VALUES (28, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657182571, 1657182571, 0);
INSERT INTO `water_system_log` VALUES (29, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657182603, 1657182603, 0);
INSERT INTO `water_system_log` VALUES (30, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657182607, 1657182607, 0);
INSERT INTO `water_system_log` VALUES (31, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657182768, 1657182768, 0);
INSERT INTO `water_system_log` VALUES (32, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657182775, 1657182775, 0);
INSERT INTO `water_system_log` VALUES (33, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657182779, 1657182779, 0);
INSERT INTO `water_system_log` VALUES (34, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657182780, 1657182780, 0);
INSERT INTO `water_system_log` VALUES (35, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657182827, 1657182827, 0);
INSERT INTO `water_system_log` VALUES (36, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657182891, 1657182891, 0);
INSERT INTO `water_system_log` VALUES (37, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657182921, 1657182921, 0);
INSERT INTO `water_system_log` VALUES (38, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657182987, 1657182987, 0);
INSERT INTO `water_system_log` VALUES (39, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657182992, 1657182992, 0);
INSERT INTO `water_system_log` VALUES (40, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657182992, 1657182992, 0);
INSERT INTO `water_system_log` VALUES (41, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183012, 1657183012, 0);
INSERT INTO `water_system_log` VALUES (42, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183038, 1657183038, 0);
INSERT INTO `water_system_log` VALUES (43, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183040, 1657183040, 0);
INSERT INTO `water_system_log` VALUES (44, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183041, 1657183041, 0);
INSERT INTO `water_system_log` VALUES (45, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183436, 1657183436, 0);
INSERT INTO `water_system_log` VALUES (46, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183464, 1657183464, 0);
INSERT INTO `water_system_log` VALUES (47, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=3&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183529, 1657183529, 0);
INSERT INTO `water_system_log` VALUES (48, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183532, 1657183532, 0);
INSERT INTO `water_system_log` VALUES (49, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=2&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183541, 1657183541, 0);
INSERT INTO `water_system_log` VALUES (50, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183544, 1657183544, 0);
INSERT INTO `water_system_log` VALUES (51, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=2&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183559, 1657183559, 0);
INSERT INTO `water_system_log` VALUES (52, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183587, 1657183587, 0);
INSERT INTO `water_system_log` VALUES (53, '用户列表', 1, 'admin/v1.User/index', '/admin/v1/user', 'admin', '2130706433', 'GET', 'lang=zh-cn&_label=1', 'PostmanRuntime/7.29.0', 1657183747, 1657183747, 0);
INSERT INTO `water_system_log` VALUES (54, '删除用户', 1, 'admin/v1.User/delete', '/admin/v1/user/133', 'admin', '2130706433', 'DELETE', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657183762, 1657183762, 0);
INSERT INTO `water_system_log` VALUES (55, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183769, 1657183769, 0);
INSERT INTO `water_system_log` VALUES (56, '后台登录', 0, 'admin/Login/login', '/admin/login', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657183833, 1657183833, 0);
INSERT INTO `water_system_log` VALUES (57, '添加管理员', 5, 'admin/v1.Admin/save', '/admin/v1/admin', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657183849, 1657183849, 0);
INSERT INTO `water_system_log` VALUES (58, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183853, 1657183853, 0);
INSERT INTO `water_system_log` VALUES (59, '添加管理员', 5, 'admin/v1.Admin/save', '/admin/v1/admin', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657183866, 1657183866, 0);
INSERT INTO `water_system_log` VALUES (60, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183868, 1657183868, 0);
INSERT INTO `water_system_log` VALUES (61, '删除管理员', 5, 'admin/v1.Admin/delete', '/admin/v1/admin/1', 'admin', '2130706433', 'DELETE', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657183884, 1657183884, 0);
INSERT INTO `water_system_log` VALUES (62, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657183886, 1657183886, 0);
INSERT INTO `water_system_log` VALUES (63, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657184478, 1657184478, 0);
INSERT INTO `water_system_log` VALUES (64, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657184566, 1657184566, 0);
INSERT INTO `water_system_log` VALUES (65, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657184594, 1657184594, 0);
INSERT INTO `water_system_log` VALUES (66, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657184595, 1657184595, 0);
INSERT INTO `water_system_log` VALUES (67, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657184626, 1657184626, 0);
INSERT INTO `water_system_log` VALUES (68, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657184659, 1657184659, 0);
INSERT INTO `water_system_log` VALUES (69, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657184660, 1657184660, 0);
INSERT INTO `water_system_log` VALUES (70, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657184705, 1657184705, 0);
INSERT INTO `water_system_log` VALUES (71, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657184705, 1657184705, 0);
INSERT INTO `water_system_log` VALUES (72, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657184719, 1657184719, 0);
INSERT INTO `water_system_log` VALUES (73, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657184721, 1657184721, 0);
INSERT INTO `water_system_log` VALUES (74, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657184722, 1657184722, 0);
INSERT INTO `water_system_log` VALUES (75, '广告列表', 1, 'admin/v1.Adverts/index', '/admin/v1/adverts', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185025, 1657185025, 0);
INSERT INTO `water_system_log` VALUES (76, '添加或修改获取广告详情', 1, 'admin/v1.Adverts/edit', '/admin/v1/adverts/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185026, 1657185026, 0);
INSERT INTO `water_system_log` VALUES (77, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185036, 1657185036, 0);
INSERT INTO `water_system_log` VALUES (78, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185124, 1657185124, 0);
INSERT INTO `water_system_log` VALUES (79, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185125, 1657185125, 0);
INSERT INTO `water_system_log` VALUES (80, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&kw=1&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185127, 1657185127, 0);
INSERT INTO `water_system_log` VALUES (81, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185130, 1657185130, 0);
INSERT INTO `water_system_log` VALUES (82, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185159, 1657185159, 0);
INSERT INTO `water_system_log` VALUES (83, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185160, 1657185160, 0);
INSERT INTO `water_system_log` VALUES (84, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185171, 1657185171, 0);
INSERT INTO `water_system_log` VALUES (85, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185171, 1657185171, 0);
INSERT INTO `water_system_log` VALUES (86, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185267, 1657185267, 0);
INSERT INTO `water_system_log` VALUES (87, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185277, 1657185277, 0);
INSERT INTO `water_system_log` VALUES (88, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185283, 1657185283, 0);
INSERT INTO `water_system_log` VALUES (89, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185284, 1657185284, 0);
INSERT INTO `water_system_log` VALUES (90, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185317, 1657185317, 0);
INSERT INTO `water_system_log` VALUES (91, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185355, 1657185355, 0);
INSERT INTO `water_system_log` VALUES (92, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185471, 1657185471, 0);
INSERT INTO `water_system_log` VALUES (93, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185471, 1657185471, 0);
INSERT INTO `water_system_log` VALUES (94, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657185629, 1657185629, 0);
INSERT INTO `water_system_log` VALUES (95, '后台登录', 0, 'admin/Login/login', '/admin/login', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657243307, 1657243307, 0);
INSERT INTO `water_system_log` VALUES (96, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657243308, 1657243308, 0);
INSERT INTO `water_system_log` VALUES (97, '仪表盘', 1, 'admin/v1.Dashboard/index', '/admin/v1/dashboard', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657243309, 1657243309, 0);
INSERT INTO `water_system_log` VALUES (98, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657243325, 1657243325, 0);
INSERT INTO `water_system_log` VALUES (99, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657244243, 1657244243, 0);
INSERT INTO `water_system_log` VALUES (100, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657244345, 1657244345, 0);
INSERT INTO `water_system_log` VALUES (101, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657244345, 1657244345, 0);
INSERT INTO `water_system_log` VALUES (102, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657244392, 1657244392, 0);
INSERT INTO `water_system_log` VALUES (103, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657244393, 1657244393, 0);
INSERT INTO `water_system_log` VALUES (104, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657244979, 1657244979, 0);
INSERT INTO `water_system_log` VALUES (105, '刷新系统权限', 1, 'admin/v1.SystemAuth/flush', '/admin/v1/system_auth/flush', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657244981, 1657244981, 0);
INSERT INTO `water_system_log` VALUES (106, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657244982, 1657244982, 0);
INSERT INTO `water_system_log` VALUES (107, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245103, 1657245103, 0);
INSERT INTO `water_system_log` VALUES (108, '刷新系统权限', 1, 'admin/v1.SystemAuth/flush', '/admin/v1/system_auth/flush', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245105, 1657245105, 0);
INSERT INTO `water_system_log` VALUES (109, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245106, 1657245106, 0);
INSERT INTO `water_system_log` VALUES (110, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245277, 1657245277, 0);
INSERT INTO `water_system_log` VALUES (111, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245350, 1657245350, 0);
INSERT INTO `water_system_log` VALUES (112, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245522, 1657245522, 0);
INSERT INTO `water_system_log` VALUES (113, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/2/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245526, 1657245526, 0);
INSERT INTO `water_system_log` VALUES (114, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/1/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245530, 1657245530, 0);
INSERT INTO `water_system_log` VALUES (115, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/1/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245556, 1657245556, 0);
INSERT INTO `water_system_log` VALUES (116, '修改角色', 1, 'admin/v1.SystemRole/update', '/admin/v1/system_role/1', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245564, 1657245564, 0);
INSERT INTO `water_system_log` VALUES (117, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/2/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245575, 1657245575, 0);
INSERT INTO `water_system_log` VALUES (118, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245609, 1657245609, 0);
INSERT INTO `water_system_log` VALUES (119, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/2/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245614, 1657245614, 0);
INSERT INTO `water_system_log` VALUES (120, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245657, 1657245657, 0);
INSERT INTO `water_system_log` VALUES (121, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245740, 1657245740, 0);
INSERT INTO `water_system_log` VALUES (122, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657245741, 1657245741, 0);
INSERT INTO `water_system_log` VALUES (123, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657246244, 1657246244, 0);
INSERT INTO `water_system_log` VALUES (124, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657246617, 1657246617, 0);
INSERT INTO `water_system_log` VALUES (125, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/1/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657246879, 1657246879, 0);
INSERT INTO `water_system_log` VALUES (126, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/1/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657246895, 1657246895, 0);
INSERT INTO `water_system_log` VALUES (127, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657247004, 1657247004, 0);
INSERT INTO `water_system_log` VALUES (128, '系统日志列表', 1, 'admin/v1.SystemLog/index', '/admin/v1/system_log', 'admin', '2130706433', 'GET', 'module=admin&page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657247285, 1657247285, 0);
INSERT INTO `water_system_log` VALUES (129, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657247298, 1657247298, 0);
INSERT INTO `water_system_log` VALUES (130, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/2/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657247299, 1657247299, 0);
INSERT INTO `water_system_log` VALUES (131, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/1/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657247303, 1657247303, 0);
INSERT INTO `water_system_log` VALUES (132, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657247437, 1657247437, 0);
INSERT INTO `water_system_log` VALUES (133, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657247629, 1657247629, 0);
INSERT INTO `water_system_log` VALUES (134, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/2/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657247632, 1657247632, 0);
INSERT INTO `water_system_log` VALUES (135, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657247816, 1657247816, 0);
INSERT INTO `water_system_log` VALUES (136, '订单列表', 1, 'admin/v1.Order/index', '/admin/v1/order', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657247907, 1657247907, 0);
INSERT INTO `water_system_log` VALUES (137, '添加或修改获取订单详情', 1, 'admin/v1.Order/edit', '/admin/v1/order/42/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657247911, 1657247911, 0);
INSERT INTO `water_system_log` VALUES (138, '添加或修改获取订单详情', 1, 'admin/v1.Order/edit', '/admin/v1/order/39/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657247916, 1657247916, 0);
INSERT INTO `water_system_log` VALUES (139, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657247928, 1657247928, 0);
INSERT INTO `water_system_log` VALUES (140, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/2/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657247931, 1657247931, 0);
INSERT INTO `water_system_log` VALUES (141, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657248048, 1657248048, 0);
INSERT INTO `water_system_log` VALUES (142, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657248077, 1657248077, 0);
INSERT INTO `water_system_log` VALUES (143, '添加或修改获取系统权限详情', 1, 'admin/v1.SystemAuth/edit', '/admin/v1/system_auth/27/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657248166, 1657248166, 0);
INSERT INTO `water_system_log` VALUES (144, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657248308, 1657248308, 0);
INSERT INTO `water_system_log` VALUES (145, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657248406, 1657248406, 0);
INSERT INTO `water_system_log` VALUES (146, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249041, 1657249041, 0);
INSERT INTO `water_system_log` VALUES (147, '添加或修改获取系统权限详情', 1, 'admin/v1.SystemAuth/edit', '/admin/v1/system_auth/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249319, 1657249319, 0);
INSERT INTO `water_system_log` VALUES (148, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&pid=0&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249322, 1657249322, 0);
INSERT INTO `water_system_log` VALUES (149, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&pid=0&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249447, 1657249447, 0);
INSERT INTO `water_system_log` VALUES (150, '设备列表', 1, 'admin/v1.Device/index', '/admin/v1/device', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249472, 1657249472, 0);
INSERT INTO `water_system_log` VALUES (151, '获取设备使用状态', 1, 'admin/v1.Device/state', '/admin/v1/device/state', 'admin', '2130706433', 'GET', 'id=11%2C10%2C9%2C7%2C6%2C4%2C3%2C2%2C1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249473, 1657249473, 0);
INSERT INTO `water_system_log` VALUES (152, '获取设备使用状态', 1, 'admin/v1.Device/state', '/admin/v1/device/state', 'admin', '2130706433', 'GET', 'id=11%2C10%2C9%2C7%2C6%2C4%2C3%2C2%2C1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249474, 1657249474, 0);
INSERT INTO `water_system_log` VALUES (153, '添加或修改获取设备详情', 1, 'admin/v1.Device/edit', '/admin/v1/device/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249474, 1657249474, 0);
INSERT INTO `water_system_log` VALUES (154, '获取设备使用状态', 1, 'admin/v1.Device/state', '/admin/v1/device/state', 'admin', '2130706433', 'GET', 'id=11%2C10%2C9%2C7%2C6%2C4%2C3%2C2%2C1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249476, 1657249476, 0);
INSERT INTO `water_system_log` VALUES (155, '运营商列表', 1, 'admin/v1.Agent/index', '/admin/v1/agent', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249476, 1657249476, 0);
INSERT INTO `water_system_log` VALUES (156, '获取设备使用状态', 1, 'admin/v1.Device/state', '/admin/v1/device/state', 'admin', '2130706433', 'GET', 'id=11%2C10%2C9%2C7%2C6%2C4%2C3%2C2%2C1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249478, 1657249478, 0);
INSERT INTO `water_system_log` VALUES (157, '获取设备使用状态', 1, 'admin/v1.Device/state', '/admin/v1/device/state', 'admin', '2130706433', 'GET', 'id=11%2C10%2C9%2C7%2C6%2C4%2C3%2C2%2C1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249481, 1657249481, 0);
INSERT INTO `water_system_log` VALUES (158, '获取设备使用状态', 1, 'admin/v1.Device/state', '/admin/v1/device/state', 'admin', '2130706433', 'GET', 'id=11%2C10%2C9%2C7%2C6%2C4%2C3%2C2%2C1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249483, 1657249483, 0);
INSERT INTO `water_system_log` VALUES (159, '获取设备使用状态', 1, 'admin/v1.Device/state', '/admin/v1/device/state', 'admin', '2130706433', 'GET', 'id=11%2C10%2C9%2C7%2C6%2C4%2C3%2C2%2C1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249486, 1657249486, 0);
INSERT INTO `water_system_log` VALUES (160, '获取设备使用状态', 1, 'admin/v1.Device/state', '/admin/v1/device/state', 'admin', '2130706433', 'GET', 'id=11%2C10%2C9%2C7%2C6%2C4%2C3%2C2%2C1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249488, 1657249488, 0);
INSERT INTO `water_system_log` VALUES (161, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249490, 1657249490, 0);
INSERT INTO `water_system_log` VALUES (162, '添加或修改获取系统权限详情', 1, 'admin/v1.SystemAuth/edit', '/admin/v1/system_auth/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249494, 1657249494, 0);
INSERT INTO `water_system_log` VALUES (163, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&pid=0&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249497, 1657249497, 0);
INSERT INTO `water_system_log` VALUES (164, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249536, 1657249536, 0);
INSERT INTO `water_system_log` VALUES (165, '添加或修改获取系统权限详情', 1, 'admin/v1.SystemAuth/edit', '/admin/v1/system_auth/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249539, 1657249539, 0);
INSERT INTO `water_system_log` VALUES (166, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&pid=0&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249543, 1657249543, 0);
INSERT INTO `water_system_log` VALUES (167, '添加或修改获取系统权限详情', 1, 'admin/v1.SystemAuth/edit', '/admin/v1/system_auth/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249550, 1657249550, 0);
INSERT INTO `water_system_log` VALUES (168, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&pid=0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249728, 1657249728, 0);
INSERT INTO `water_system_log` VALUES (169, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249728, 1657249728, 0);
INSERT INTO `water_system_log` VALUES (170, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&pid=0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249743, 1657249743, 0);
INSERT INTO `water_system_log` VALUES (171, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249743, 1657249743, 0);
INSERT INTO `water_system_log` VALUES (172, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&pid=0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249790, 1657249790, 0);
INSERT INTO `water_system_log` VALUES (173, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249790, 1657249790, 0);
INSERT INTO `water_system_log` VALUES (174, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&pid=0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249843, 1657249843, 0);
INSERT INTO `water_system_log` VALUES (175, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249843, 1657249843, 0);
INSERT INTO `water_system_log` VALUES (176, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249982, 1657249982, 0);
INSERT INTO `water_system_log` VALUES (177, '添加或修改获取系统权限详情', 1, 'admin/v1.SystemAuth/edit', '/admin/v1/system_auth/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249986, 1657249986, 0);
INSERT INTO `water_system_log` VALUES (178, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&pid=0&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657249989, 1657249989, 0);
INSERT INTO `water_system_log` VALUES (179, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&pid=0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250047, 1657250047, 0);
INSERT INTO `water_system_log` VALUES (180, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&pid=0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250112, 1657250112, 0);
INSERT INTO `water_system_log` VALUES (181, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250118, 1657250118, 0);
INSERT INTO `water_system_log` VALUES (182, '后台登录', 0, 'admin/Login/login', '/admin/login', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250131, 1657250131, 0);
INSERT INTO `water_system_log` VALUES (183, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250131, 1657250131, 0);
INSERT INTO `water_system_log` VALUES (184, '后台登录', 0, 'admin/Login/login', '/admin/login', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657250166, 1657250166, 0);
INSERT INTO `water_system_log` VALUES (185, '个人信息', 5, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657250174, 1657250174, 0);
INSERT INTO `water_system_log` VALUES (186, '个人信息', 5, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657250288, 1657250288, 0);
INSERT INTO `water_system_log` VALUES (187, '后台登录', 0, 'admin/Login/login', '/admin/login', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250310, 1657250310, 0);
INSERT INTO `water_system_log` VALUES (188, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250311, 1657250311, 0);
INSERT INTO `water_system_log` VALUES (189, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250312, 1657250312, 0);
INSERT INTO `water_system_log` VALUES (190, '添加或修改获取系统权限详情', 1, 'admin/v1.SystemAuth/edit', '/admin/v1/system_auth/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250316, 1657250316, 0);
INSERT INTO `water_system_log` VALUES (191, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&pid=0&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250319, 1657250319, 0);
INSERT INTO `water_system_log` VALUES (192, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&pid=0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250334, 1657250334, 0);
INSERT INTO `water_system_log` VALUES (193, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250334, 1657250334, 0);
INSERT INTO `water_system_log` VALUES (194, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250401, 1657250401, 0);
INSERT INTO `water_system_log` VALUES (195, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250628, 1657250628, 0);
INSERT INTO `water_system_log` VALUES (196, '添加或修改获取系统权限详情', 1, 'admin/v1.SystemAuth/edit', '/admin/v1/system_auth/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250662, 1657250662, 0);
INSERT INTO `water_system_log` VALUES (197, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&pid=0&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250666, 1657250666, 0);
INSERT INTO `water_system_log` VALUES (198, '添加系统权限', 1, 'admin/v1.SystemAuth/save', '/admin/v1/system_auth', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250690, 1657250690, 0);
INSERT INTO `water_system_log` VALUES (199, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&page=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250690, 1657250690, 0);
INSERT INTO `water_system_log` VALUES (200, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&filter%5Bmodule%5D=api&op%5Bmodule%5D=%3D', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250867, 1657250867, 0);
INSERT INTO `water_system_log` VALUES (201, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&filter%5Bmodule%5D=admin&op%5Bmodule%5D=%3D', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250869, 1657250869, 0);
INSERT INTO `water_system_log` VALUES (202, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&filter%5Bmodule%5D=api&op%5Bmodule%5D=%3D', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250874, 1657250874, 0);
INSERT INTO `water_system_log` VALUES (203, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657250876, 1657250876, 0);
INSERT INTO `water_system_log` VALUES (204, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657251988, 1657251988, 0);
INSERT INTO `water_system_log` VALUES (205, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262055, 1657262055, 0);
INSERT INTO `water_system_log` VALUES (206, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262055, 1657262055, 0);
INSERT INTO `water_system_log` VALUES (207, '仪表盘', 1, 'admin/v1.Dashboard/index', '/admin/v1/dashboard', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262061, 1657262061, 0);
INSERT INTO `water_system_log` VALUES (208, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262077, 1657262077, 0);
INSERT INTO `water_system_log` VALUES (209, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262081, 1657262081, 0);
INSERT INTO `water_system_log` VALUES (210, '仪表盘', 1, 'admin/v1.Dashboard/index', '/admin/v1/dashboard', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262082, 1657262082, 0);
INSERT INTO `water_system_log` VALUES (211, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262170, 1657262170, 0);
INSERT INTO `water_system_log` VALUES (212, '仪表盘', 1, 'admin/v1.Dashboard/index', '/admin/v1/dashboard', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262170, 1657262170, 0);
INSERT INTO `water_system_log` VALUES (213, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262173, 1657262173, 0);
INSERT INTO `water_system_log` VALUES (214, '获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/read', '/admin/v1/system_config_tab/state', 'admin', '2130706433', 'GET', 'id=4%2C2%2C1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262174, 1657262174, 0);
INSERT INTO `water_system_log` VALUES (215, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262193, 1657262193, 0);
INSERT INTO `water_system_log` VALUES (216, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262193, 1657262193, 0);
INSERT INTO `water_system_log` VALUES (217, '获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/read', '/admin/v1/system_config_tab/state', 'admin', '2130706433', 'GET', 'id=4%2C2%2C1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262193, 1657262193, 0);
INSERT INTO `water_system_log` VALUES (218, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262203, 1657262203, 0);
INSERT INTO `water_system_log` VALUES (219, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262205, 1657262205, 0);
INSERT INTO `water_system_log` VALUES (220, '仪表盘', 1, 'admin/v1.Dashboard/index', '/admin/v1/dashboard', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262206, 1657262206, 0);
INSERT INTO `water_system_log` VALUES (221, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262209, 1657262209, 0);
INSERT INTO `water_system_log` VALUES (222, '获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/read', '/admin/v1/system_config_tab/state', 'admin', '2130706433', 'GET', 'id=4%2C2%2C1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262209, 1657262209, 0);
INSERT INTO `water_system_log` VALUES (223, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262219, 1657262219, 0);
INSERT INTO `water_system_log` VALUES (224, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262219, 1657262219, 0);
INSERT INTO `water_system_log` VALUES (225, '获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/read', '/admin/v1/system_config_tab/state', 'admin', '2130706433', 'GET', 'id=4%2C2%2C1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262220, 1657262220, 0);
INSERT INTO `water_system_log` VALUES (226, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262284, 1657262284, 0);
INSERT INTO `water_system_log` VALUES (227, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262353, 1657262353, 0);
INSERT INTO `water_system_log` VALUES (228, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262356, 1657262356, 0);
INSERT INTO `water_system_log` VALUES (229, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262357, 1657262357, 0);
INSERT INTO `water_system_log` VALUES (230, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262437, 1657262437, 0);
INSERT INTO `water_system_log` VALUES (231, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262448, 1657262448, 0);
INSERT INTO `water_system_log` VALUES (232, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262462, 1657262462, 0);
INSERT INTO `water_system_log` VALUES (233, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262463, 1657262463, 0);
INSERT INTO `water_system_log` VALUES (234, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262477, 1657262477, 0);
INSERT INTO `water_system_log` VALUES (235, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262551, 1657262551, 0);
INSERT INTO `water_system_log` VALUES (236, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657262564, 1657262564, 0);
INSERT INTO `water_system_log` VALUES (237, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263415, 1657263415, 0);
INSERT INTO `water_system_log` VALUES (238, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263462, 1657263462, 0);
INSERT INTO `water_system_log` VALUES (239, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263473, 1657263473, 0);
INSERT INTO `water_system_log` VALUES (240, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263561, 1657263561, 0);
INSERT INTO `water_system_log` VALUES (241, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/2/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263563, 1657263563, 0);
INSERT INTO `water_system_log` VALUES (242, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263649, 1657263649, 0);
INSERT INTO `water_system_log` VALUES (243, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263650, 1657263650, 0);
INSERT INTO `water_system_log` VALUES (244, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/2/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263652, 1657263652, 0);
INSERT INTO `water_system_log` VALUES (245, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/3/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263660, 1657263660, 0);
INSERT INTO `water_system_log` VALUES (246, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/2/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263664, 1657263664, 0);
INSERT INTO `water_system_log` VALUES (247, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/3/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263674, 1657263674, 0);
INSERT INTO `water_system_log` VALUES (248, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/3/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263698, 1657263698, 0);
INSERT INTO `water_system_log` VALUES (249, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263787, 1657263787, 0);
INSERT INTO `water_system_log` VALUES (250, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263787, 1657263787, 0);
INSERT INTO `water_system_log` VALUES (251, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/3/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263809, 1657263809, 0);
INSERT INTO `water_system_log` VALUES (252, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657263877, 1657263877, 0);
INSERT INTO `water_system_log` VALUES (253, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657264020, 1657264020, 0);
INSERT INTO `water_system_log` VALUES (254, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657264021, 1657264021, 0);
INSERT INTO `water_system_log` VALUES (255, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657264103, 1657264103, 0);
INSERT INTO `water_system_log` VALUES (256, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657264104, 1657264104, 0);
INSERT INTO `water_system_log` VALUES (257, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657264221, 1657264221, 0);
INSERT INTO `water_system_log` VALUES (258, '添加或修改获取系统配置分类详情', 5, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/1/edit', 'admin', '2130706433', 'GET', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657264237, 1657264237, 0);
INSERT INTO `water_system_log` VALUES (259, '添加或修改获取系统配置分类详情', 5, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/1/edit', 'admin', '2130706433', 'GET', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657264525, 1657264525, 0);
INSERT INTO `water_system_log` VALUES (260, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657264536, 1657264536, 0);
INSERT INTO `water_system_log` VALUES (261, '后台登录', 0, 'admin/Login/login', '/admin/login', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657264545, 1657264545, 0);
INSERT INTO `water_system_log` VALUES (262, '添加或修改获取系统配置详情', 1, 'admin/v1.SystemConfig/edit', '/admin/v1/system_config/1/edit', 'admin', '2130706433', 'GET', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657264549, 1657264549, 0);
INSERT INTO `water_system_log` VALUES (263, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/1/edit', 'admin', '2130706433', 'GET', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657264554, 1657264554, 0);
INSERT INTO `water_system_log` VALUES (264, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/4/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657264591, 1657264591, 0);
INSERT INTO `water_system_log` VALUES (265, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657264632, 1657264632, 0);
INSERT INTO `water_system_log` VALUES (266, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/1/edit', 'admin', '2130706433', 'GET', 'lang=zh-cn&_label=1', 'PostmanRuntime/7.29.0', 1657264652, 1657264652, 0);
INSERT INTO `water_system_log` VALUES (267, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657264729, 1657264729, 0);
INSERT INTO `water_system_log` VALUES (268, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657264751, 1657264751, 0);
INSERT INTO `water_system_log` VALUES (269, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/1/edit', 'admin', '2130706433', 'GET', 'lang=zh-cn&_label=1', 'PostmanRuntime/7.29.0', 1657264778, 1657264778, 0);
INSERT INTO `water_system_log` VALUES (270, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/1/edit', 'admin', '2130706433', 'GET', 'lang=zh-cn&_label=1', 'PostmanRuntime/7.29.0', 1657264811, 1657264811, 0);
INSERT INTO `water_system_log` VALUES (271, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/1/edit', 'admin', '2130706433', 'GET', 'lang=zh-cn&_label=1', 'PostmanRuntime/7.29.0', 1657264925, 1657264925, 0);
INSERT INTO `water_system_log` VALUES (272, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657264930, 1657264930, 0);
INSERT INTO `water_system_log` VALUES (273, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/1/edit', 'admin', '2130706433', 'GET', 'lang=zh-cn&_label=1', 'PostmanRuntime/7.29.0', 1657264953, 1657264953, 0);
INSERT INTO `water_system_log` VALUES (274, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265007, 1657265007, 0);
INSERT INTO `water_system_log` VALUES (275, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/1/edit', 'admin', '2130706433', 'GET', 'lang=zh-cn&_label=1', 'PostmanRuntime/7.29.0', 1657265014, 1657265014, 0);
INSERT INTO `water_system_log` VALUES (276, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265109, 1657265109, 0);
INSERT INTO `water_system_log` VALUES (277, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265335, 1657265335, 0);
INSERT INTO `water_system_log` VALUES (278, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'pid=0&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265341, 1657265341, 0);
INSERT INTO `water_system_log` VALUES (279, '添加系统配置分类', 1, 'admin/v1.SystemConfigTab/save', '/admin/v1/system_config_tab', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265361, 1657265361, 0);
INSERT INTO `water_system_log` VALUES (280, '添加系统配置分类', 1, 'admin/v1.SystemConfigTab/save', '/admin/v1/system_config_tab', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265409, 1657265409, 0);
INSERT INTO `water_system_log` VALUES (281, '添加系统配置分类', 1, 'admin/v1.SystemConfigTab/save', '/admin/v1/system_config_tab', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265445, 1657265445, 0);
INSERT INTO `water_system_log` VALUES (282, '添加系统配置分类', 1, 'admin/v1.SystemConfigTab/save', '/admin/v1/system_config_tab', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265458, 1657265458, 0);
INSERT INTO `water_system_log` VALUES (283, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'page=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265458, 1657265458, 0);
INSERT INTO `water_system_log` VALUES (284, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/13/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265478, 1657265478, 0);
INSERT INTO `water_system_log` VALUES (285, '修改系统配置分类', 1, 'admin/v1.SystemConfigTab/update', '/admin/v1/system_config_tab/13', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265483, 1657265483, 0);
INSERT INTO `water_system_log` VALUES (286, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'page=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265484, 1657265484, 0);
INSERT INTO `water_system_log` VALUES (287, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265595, 1657265595, 0);
INSERT INTO `water_system_log` VALUES (288, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/13/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265598, 1657265598, 0);
INSERT INTO `water_system_log` VALUES (289, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/13/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265626, 1657265626, 0);
INSERT INTO `water_system_log` VALUES (290, '修改系统配置分类', 1, 'admin/v1.SystemConfigTab/update', '/admin/v1/system_config_tab/13', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265630, 1657265630, 0);
INSERT INTO `water_system_log` VALUES (291, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265630, 1657265630, 0);
INSERT INTO `water_system_log` VALUES (292, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265648, 1657265648, 0);
INSERT INTO `water_system_log` VALUES (293, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265721, 1657265721, 0);
INSERT INTO `water_system_log` VALUES (294, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265783, 1657265783, 0);
INSERT INTO `water_system_log` VALUES (295, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265784, 1657265784, 0);
INSERT INTO `water_system_log` VALUES (296, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265829, 1657265829, 0);
INSERT INTO `water_system_log` VALUES (297, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657265830, 1657265830, 0);
INSERT INTO `water_system_log` VALUES (298, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657266701, 1657266701, 0);
INSERT INTO `water_system_log` VALUES (299, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657267230, 1657267230, 0);
INSERT INTO `water_system_log` VALUES (300, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657267231, 1657267231, 0);
INSERT INTO `water_system_log` VALUES (301, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657267232, 1657267232, 0);
INSERT INTO `water_system_log` VALUES (302, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657267393, 1657267393, 0);
INSERT INTO `water_system_log` VALUES (303, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657267394, 1657267394, 0);
INSERT INTO `water_system_log` VALUES (304, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657267395, 1657267395, 0);
INSERT INTO `water_system_log` VALUES (305, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657267426, 1657267426, 0);
INSERT INTO `water_system_log` VALUES (306, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657267426, 1657267426, 0);
INSERT INTO `water_system_log` VALUES (307, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657267452, 1657267452, 0);
INSERT INTO `water_system_log` VALUES (308, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657267895, 1657267895, 0);
INSERT INTO `water_system_log` VALUES (309, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/13/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657268104, 1657268104, 0);
INSERT INTO `water_system_log` VALUES (310, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'pid=0&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657268489, 1657268489, 0);
INSERT INTO `water_system_log` VALUES (311, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'pid=0&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657268521, 1657268521, 0);
INSERT INTO `water_system_log` VALUES (312, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270070, 1657270070, 0);
INSERT INTO `water_system_log` VALUES (313, '仪表盘', 1, 'admin/v1.Dashboard/index', '/admin/v1/dashboard', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270071, 1657270071, 0);
INSERT INTO `water_system_log` VALUES (314, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270075, 1657270075, 0);
INSERT INTO `water_system_log` VALUES (315, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270077, 1657270077, 0);
INSERT INTO `water_system_log` VALUES (316, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270527, 1657270527, 0);
INSERT INTO `water_system_log` VALUES (317, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270533, 1657270533, 0);
INSERT INTO `water_system_log` VALUES (318, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270537, 1657270537, 0);
INSERT INTO `water_system_log` VALUES (319, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270543, 1657270543, 0);
INSERT INTO `water_system_log` VALUES (320, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270548, 1657270548, 0);
INSERT INTO `water_system_log` VALUES (321, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270611, 1657270611, 0);
INSERT INTO `water_system_log` VALUES (322, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270611, 1657270611, 0);
INSERT INTO `water_system_log` VALUES (323, '修改系统配置分类字段值', 1, 'admin/v1.SystemConfigTab/change', '/admin/v1/system_config_tab/13/change', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270647, 1657270647, 0);
INSERT INTO `water_system_log` VALUES (324, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270649, 1657270649, 0);
INSERT INTO `water_system_log` VALUES (325, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270672, 1657270672, 0);
INSERT INTO `water_system_log` VALUES (326, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270673, 1657270673, 0);
INSERT INTO `water_system_log` VALUES (327, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270679, 1657270679, 0);
INSERT INTO `water_system_log` VALUES (328, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270693, 1657270693, 0);
INSERT INTO `water_system_log` VALUES (329, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657270706, 1657270706, 0);
INSERT INTO `water_system_log` VALUES (330, '删除角色', 1, 'admin/v1.SystemRole/delete', '/admin/v1/system_role/2', 'admin', '2130706433', 'DELETE', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657271814, 1657271814, 0);
INSERT INTO `water_system_log` VALUES (331, '管理员列表', 1, 'admin/v1.Admin/index', '/admin/v1/admin', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657271827, 1657271827, 0);
INSERT INTO `water_system_log` VALUES (332, '运营商列表', 1, 'admin/v1.Agent/index', '/admin/v1/agent', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657271834, 1657271834, 0);
INSERT INTO `water_system_log` VALUES (333, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657271838, 1657271838, 0);
INSERT INTO `water_system_log` VALUES (334, '删除角色', 1, 'admin/v1.SystemRole/delete', '/admin/v1/system_role/3', 'admin', '2130706433', 'DELETE', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657271842, 1657271842, 0);
INSERT INTO `water_system_log` VALUES (335, '添加或修改获取角色详情', 1, 'admin/v1.SystemRole/edit', '/admin/v1/system_role/3/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657271844, 1657271844, 0);
INSERT INTO `water_system_log` VALUES (336, '删除角色', 1, 'admin/v1.SystemRole/delete', '/admin/v1/system_role/2', 'admin', '2130706433', 'DELETE', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657273208, 1657273208, 0);
INSERT INTO `water_system_log` VALUES (337, '删除角色', 1, 'admin/v1.SystemRole/delete', '/admin/v1/system_role/2', 'admin', '2130706433', 'DELETE', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657273761, 1657273761, 0);
INSERT INTO `water_system_log` VALUES (338, '删除角色', 1, 'admin/v1.SystemRole/delete', '/admin/v1/system_role/2', 'admin', '2130706433', 'DELETE', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657273982, 1657273982, 0);
INSERT INTO `water_system_log` VALUES (339, '删除角色', 1, 'admin/v1.SystemRole/delete', '/admin/v1/system_role/2', 'admin', '2130706433', 'DELETE', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657274080, 1657274080, 0);
INSERT INTO `water_system_log` VALUES (340, '删除角色', 1, 'admin/v1.SystemRole/delete', '/admin/v1/system_role/2', 'admin', '2130706433', 'DELETE', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657274119, 1657274119, 0);
INSERT INTO `water_system_log` VALUES (341, '删除角色', 1, 'admin/v1.SystemRole/delete', '/admin/v1/system_role/2', 'admin', '2130706433', 'DELETE', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657274155, 1657274155, 0);
INSERT INTO `water_system_log` VALUES (342, '删除角色', 1, 'admin/v1.SystemRole/delete', '/admin/v1/system_role/2', 'admin', '2130706433', 'DELETE', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657274198, 1657274198, 0);
INSERT INTO `water_system_log` VALUES (343, '删除角色', 1, 'admin/v1.SystemRole/delete', '/admin/v1/system_role/2', 'admin', '2130706433', 'DELETE', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657274451, 1657274451, 0);
INSERT INTO `water_system_log` VALUES (344, '删除角色', 1, 'admin/v1.SystemRole/delete', '/admin/v1/system_role/2', 'admin', '2130706433', 'DELETE', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657274512, 1657274512, 0);
INSERT INTO `water_system_log` VALUES (345, '后台登录', 0, 'admin/Login/login', '/admin/login', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330098, 1657330098, 0);
INSERT INTO `water_system_log` VALUES (346, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330098, 1657330098, 0);
INSERT INTO `water_system_log` VALUES (347, '仪表盘', 1, 'admin/v1.Dashboard/index', '/admin/v1/dashboard', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330099, 1657330099, 0);
INSERT INTO `water_system_log` VALUES (348, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330153, 1657330153, 0);
INSERT INTO `water_system_log` VALUES (349, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/4/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330163, 1657330163, 0);
INSERT INTO `water_system_log` VALUES (350, '修改系统配置分类字段值', 1, 'admin/v1.SystemConfigTab/change', '/admin/v1/system_config_tab/4/change', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330185, 1657330185, 0);
INSERT INTO `water_system_log` VALUES (351, '修改系统配置分类字段值', 1, 'admin/v1.SystemConfigTab/change', '/admin/v1/system_config_tab/4/change', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330186, 1657330186, 0);
INSERT INTO `water_system_log` VALUES (352, '修改系统配置分类字段值', 1, 'admin/v1.SystemConfigTab/change', '/admin/v1/system_config_tab/4/change', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330186, 1657330186, 0);
INSERT INTO `water_system_log` VALUES (353, '修改系统配置分类字段值', 1, 'admin/v1.SystemConfigTab/change', '/admin/v1/system_config_tab/4/change', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330187, 1657330187, 0);
INSERT INTO `water_system_log` VALUES (354, '修改系统配置分类字段值', 1, 'admin/v1.SystemConfigTab/change', '/admin/v1/system_config_tab/4/change', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330188, 1657330188, 0);
INSERT INTO `water_system_log` VALUES (355, '修改系统配置分类字段值', 1, 'admin/v1.SystemConfigTab/change', '/admin/v1/system_config_tab/4/change', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330189, 1657330189, 0);
INSERT INTO `water_system_log` VALUES (356, '修改系统配置分类字段值', 1, 'admin/v1.SystemConfigTab/change', '/admin/v1/system_config_tab/4/change', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330190, 1657330190, 0);
INSERT INTO `water_system_log` VALUES (357, '修改系统配置分类字段值', 1, 'admin/v1.SystemConfigTab/change', '/admin/v1/system_config_tab/4/change', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330190, 1657330190, 0);
INSERT INTO `water_system_log` VALUES (358, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330197, 1657330197, 0);
INSERT INTO `water_system_log` VALUES (359, '刷新系统权限', 1, 'admin/v1.SystemAuth/flush', '/admin/v1/system_auth/flush', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330203, 1657330203, 0);
INSERT INTO `water_system_log` VALUES (360, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330204, 1657330204, 0);
INSERT INTO `water_system_log` VALUES (361, '刷新系统权限', 1, 'admin/v1.SystemAuth/flush', '/admin/v1/system_auth/flush', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330213, 1657330213, 0);
INSERT INTO `water_system_log` VALUES (362, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330214, 1657330214, 0);
INSERT INTO `water_system_log` VALUES (363, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330237, 1657330237, 0);
INSERT INTO `water_system_log` VALUES (364, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330779, 1657330779, 0);
INSERT INTO `water_system_log` VALUES (365, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657330818, 1657330818, 0);
INSERT INTO `water_system_log` VALUES (366, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331290, 1657331290, 0);
INSERT INTO `water_system_log` VALUES (367, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331290, 1657331290, 0);
INSERT INTO `water_system_log` VALUES (368, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331320, 1657331320, 0);
INSERT INTO `water_system_log` VALUES (369, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331321, 1657331321, 0);
INSERT INTO `water_system_log` VALUES (370, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331337, 1657331337, 0);
INSERT INTO `water_system_log` VALUES (371, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331337, 1657331337, 0);
INSERT INTO `water_system_log` VALUES (372, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331345, 1657331345, 0);
INSERT INTO `water_system_log` VALUES (373, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331345, 1657331345, 0);
INSERT INTO `water_system_log` VALUES (374, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331446, 1657331446, 0);
INSERT INTO `water_system_log` VALUES (375, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331446, 1657331446, 0);
INSERT INTO `water_system_log` VALUES (376, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331450, 1657331450, 0);
INSERT INTO `water_system_log` VALUES (377, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331497, 1657331497, 0);
INSERT INTO `water_system_log` VALUES (378, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331497, 1657331497, 0);
INSERT INTO `water_system_log` VALUES (379, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331606, 1657331606, 0);
INSERT INTO `water_system_log` VALUES (380, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331607, 1657331607, 0);
INSERT INTO `water_system_log` VALUES (381, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331619, 1657331619, 0);
INSERT INTO `water_system_log` VALUES (382, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331619, 1657331619, 0);
INSERT INTO `water_system_log` VALUES (383, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/13/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331657, 1657331657, 0);
INSERT INTO `water_system_log` VALUES (384, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'pid=0&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331802, 1657331802, 0);
INSERT INTO `water_system_log` VALUES (385, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'pid=0&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657331873, 1657331873, 0);
INSERT INTO `water_system_log` VALUES (386, '系统配置分类列表', 0, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'lang=zh-cn&pid=0', 'PostmanRuntime/7.29.0', 1657331895, 1657331895, 0);
INSERT INTO `water_system_log` VALUES (387, '后台登录', 0, 'admin/Login/login', '/admin/login', 'admin', '2130706433', 'POST', 'lang=zh-cn', 'PostmanRuntime/7.29.0', 1657331901, 1657331901, 0);
INSERT INTO `water_system_log` VALUES (388, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'lang=zh-cn&pid=0', 'PostmanRuntime/7.29.0', 1657331903, 1657331903, 0);
INSERT INTO `water_system_log` VALUES (389, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'lang=zh-cn&pid=0', 'PostmanRuntime/7.29.0', 1657331998, 1657331998, 0);
INSERT INTO `water_system_log` VALUES (390, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'pid=0&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657332014, 1657332014, 0);
INSERT INTO `water_system_log` VALUES (391, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'without=children&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657333025, 1657333025, 0);
INSERT INTO `water_system_log` VALUES (392, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'lang=zh-cn&pid=0&without=children', 'PostmanRuntime/7.29.0', 1657333058, 1657333058, 0);
INSERT INTO `water_system_log` VALUES (393, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'lang=zh-cn&pid=0&without=children', 'PostmanRuntime/7.29.0', 1657333090, 1657333090, 0);
INSERT INTO `water_system_log` VALUES (394, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'lang=zh-cn&pid=0&without=children', 'PostmanRuntime/7.29.0', 1657333106, 1657333106, 0);
INSERT INTO `water_system_log` VALUES (395, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'lang=zh-cn&pid=0&without=children%2Ca', 'PostmanRuntime/7.29.0', 1657333112, 1657333112, 0);
INSERT INTO `water_system_log` VALUES (396, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', 'lang=zh-cn&pid=0&without=children%2Ca', 'PostmanRuntime/7.29.0', 1657333125, 1657333125, 0);
INSERT INTO `water_system_log` VALUES (397, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657333559, 1657333559, 0);
INSERT INTO `water_system_log` VALUES (398, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657333633, 1657333633, 0);
INSERT INTO `water_system_log` VALUES (399, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657333651, 1657333651, 0);
INSERT INTO `water_system_log` VALUES (400, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657333652, 1657333652, 0);
INSERT INTO `water_system_log` VALUES (401, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657333676, 1657333676, 0);
INSERT INTO `water_system_log` VALUES (402, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657333705, 1657333705, 0);
INSERT INTO `water_system_log` VALUES (403, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657333730, 1657333730, 0);
INSERT INTO `water_system_log` VALUES (404, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657333733, 1657333733, 0);
INSERT INTO `water_system_log` VALUES (405, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657333734, 1657333734, 0);
INSERT INTO `water_system_log` VALUES (406, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657333823, 1657333823, 0);
INSERT INTO `water_system_log` VALUES (407, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657333933, 1657333933, 0);
INSERT INTO `water_system_log` VALUES (408, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657333938, 1657333938, 0);
INSERT INTO `water_system_log` VALUES (409, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657333939, 1657333939, 0);
INSERT INTO `water_system_log` VALUES (410, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334028, 1657334028, 0);
INSERT INTO `water_system_log` VALUES (411, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334029, 1657334029, 0);
INSERT INTO `water_system_log` VALUES (412, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334088, 1657334088, 0);
INSERT INTO `water_system_log` VALUES (413, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334090, 1657334090, 0);
INSERT INTO `water_system_log` VALUES (414, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334111, 1657334111, 0);
INSERT INTO `water_system_log` VALUES (415, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334111, 1657334111, 0);
INSERT INTO `water_system_log` VALUES (416, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334126, 1657334126, 0);
INSERT INTO `water_system_log` VALUES (417, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334127, 1657334127, 0);
INSERT INTO `water_system_log` VALUES (418, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334264, 1657334264, 0);
INSERT INTO `water_system_log` VALUES (419, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334264, 1657334264, 0);
INSERT INTO `water_system_log` VALUES (420, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334375, 1657334375, 0);
INSERT INTO `water_system_log` VALUES (421, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334378, 1657334378, 0);
INSERT INTO `water_system_log` VALUES (422, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334390, 1657334390, 0);
INSERT INTO `water_system_log` VALUES (423, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334398, 1657334398, 0);
INSERT INTO `water_system_log` VALUES (424, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334399, 1657334399, 0);
INSERT INTO `water_system_log` VALUES (425, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334429, 1657334429, 0);
INSERT INTO `water_system_log` VALUES (426, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334434, 1657334434, 0);
INSERT INTO `water_system_log` VALUES (427, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334434, 1657334434, 0);
INSERT INTO `water_system_log` VALUES (428, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334452, 1657334452, 0);
INSERT INTO `water_system_log` VALUES (429, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334485, 1657334485, 0);
INSERT INTO `water_system_log` VALUES (430, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334487, 1657334487, 0);
INSERT INTO `water_system_log` VALUES (431, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334514, 1657334514, 0);
INSERT INTO `water_system_log` VALUES (432, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334515, 1657334515, 0);
INSERT INTO `water_system_log` VALUES (433, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334518, 1657334518, 0);
INSERT INTO `water_system_log` VALUES (434, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334545, 1657334545, 0);
INSERT INTO `water_system_log` VALUES (435, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334608, 1657334608, 0);
INSERT INTO `water_system_log` VALUES (436, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334683, 1657334683, 0);
INSERT INTO `water_system_log` VALUES (437, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334695, 1657334695, 0);
INSERT INTO `water_system_log` VALUES (438, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334695, 1657334695, 0);
INSERT INTO `water_system_log` VALUES (439, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334830, 1657334830, 0);
INSERT INTO `water_system_log` VALUES (440, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334831, 1657334831, 0);
INSERT INTO `water_system_log` VALUES (441, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334838, 1657334838, 0);
INSERT INTO `water_system_log` VALUES (442, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334838, 1657334838, 0);
INSERT INTO `water_system_log` VALUES (443, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334856, 1657334856, 0);
INSERT INTO `water_system_log` VALUES (444, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657334856, 1657334856, 0);
INSERT INTO `water_system_log` VALUES (445, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657335379, 1657335379, 0);
INSERT INTO `water_system_log` VALUES (446, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657335380, 1657335380, 0);
INSERT INTO `water_system_log` VALUES (447, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657335426, 1657335426, 0);
INSERT INTO `water_system_log` VALUES (448, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657335493, 1657335493, 0);
INSERT INTO `water_system_log` VALUES (449, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657335494, 1657335494, 0);
INSERT INTO `water_system_log` VALUES (450, '修改系统配置分类字段值', 1, 'admin/v1.SystemConfigTab/change', '/admin/v1/system_config_tab/1/change', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657335495, 1657335495, 0);
INSERT INTO `water_system_log` VALUES (451, '修改系统配置分类字段值', 1, 'admin/v1.SystemConfigTab/change', '/admin/v1/system_config_tab/1/change', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657335496, 1657335496, 0);
INSERT INTO `water_system_log` VALUES (452, '修改系统配置分类字段值', 1, 'admin/v1.SystemConfigTab/change', '/admin/v1/system_config_tab/1/change', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657335498, 1657335498, 0);
INSERT INTO `water_system_log` VALUES (453, '修改系统配置分类字段值', 1, 'admin/v1.SystemConfigTab/change', '/admin/v1/system_config_tab/1/change', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657335499, 1657335499, 0);
INSERT INTO `water_system_log` VALUES (454, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657336189, 1657336189, 0);
INSERT INTO `water_system_log` VALUES (455, '广告列表', 1, 'admin/v1.Adverts/index', '/admin/v1/adverts', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657336364, 1657336364, 0);
INSERT INTO `water_system_log` VALUES (456, '添加或修改获取广告详情', 1, 'admin/v1.Adverts/edit', '/admin/v1/adverts/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657336365, 1657336365, 0);
INSERT INTO `water_system_log` VALUES (457, '附件列表', 1, 'admin/v1.Attachment/index', '/admin/v1/attachment', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657336451, 1657336451, 0);
INSERT INTO `water_system_log` VALUES (458, '附件列表', 1, 'admin/v1.Attachment/index', '/admin/v1/attachment', 'admin', '2130706433', 'GET', 'page=1&limit=20&category=image&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657336494, 1657336494, 0);
INSERT INTO `water_system_log` VALUES (459, '附件列表', 1, 'admin/v1.Attachment/index', '/admin/v1/attachment', 'admin', '2130706433', 'GET', 'page=1&limit=20&category=image&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657336594, 1657336594, 0);
INSERT INTO `water_system_log` VALUES (460, '运营商列表', 1, 'admin/v1.Agent/index', '/admin/v1/agent', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657336607, 1657336607, 0);
INSERT INTO `water_system_log` VALUES (461, '添加广告', 1, 'admin/v1.Adverts/save', '/admin/v1/adverts', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657336610, 1657336610, 0);
INSERT INTO `water_system_log` VALUES (462, '广告列表', 1, 'admin/v1.Adverts/index', '/admin/v1/adverts', 'admin', '2130706433', 'GET', 'page=1&limit=20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657336611, 1657336611, 0);
INSERT INTO `water_system_log` VALUES (463, '添加或修改获取广告详情', 1, 'admin/v1.Adverts/edit', '/admin/v1/adverts/5/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657336619, 1657336619, 0);
INSERT INTO `water_system_log` VALUES (464, '附件列表', 1, 'admin/v1.Attachment/index', '/admin/v1/attachment', 'admin', '2130706433', 'GET', 'page=1&limit=20&category=image&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657336621, 1657336621, 0);
INSERT INTO `water_system_log` VALUES (465, '附件列表', 1, 'admin/v1.Attachment/index', '/admin/v1/attachment', 'admin', '2130706433', 'GET', 'page=1&limit=20&category=image&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657336806, 1657336806, 0);
INSERT INTO `water_system_log` VALUES (466, '添加或修改获取广告详情', 1, 'admin/v1.Adverts/edit', '/admin/v1/adverts/3/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657337216, 1657337216, 0);
INSERT INTO `water_system_log` VALUES (467, '添加或修改获取广告详情', 1, 'admin/v1.Adverts/edit', '/admin/v1/adverts/1/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657337238, 1657337238, 0);
INSERT INTO `water_system_log` VALUES (468, '添加或修改获取广告详情', 1, 'admin/v1.Adverts/edit', '/admin/v1/adverts/2/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657337282, 1657337282, 0);
INSERT INTO `water_system_log` VALUES (469, '添加或修改获取广告详情', 1, 'admin/v1.Adverts/edit', '/admin/v1/adverts/1/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657337288, 1657337288, 0);
INSERT INTO `water_system_log` VALUES (470, '添加或修改获取广告详情', 1, 'admin/v1.Adverts/edit', '/admin/v1/adverts/3/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657337305, 1657337305, 0);
INSERT INTO `water_system_log` VALUES (471, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657337400, 1657337400, 0);
INSERT INTO `water_system_log` VALUES (472, '广告列表', 1, 'admin/v1.Adverts/index', '/admin/v1/adverts', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657337400, 1657337400, 0);
INSERT INTO `water_system_log` VALUES (473, '添加或修改获取广告详情', 1, 'admin/v1.Adverts/edit', '/admin/v1/adverts/5/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657337405, 1657337405, 0);
INSERT INTO `water_system_log` VALUES (474, '添加或修改获取广告详情', 1, 'admin/v1.Adverts/edit', '/admin/v1/adverts/3/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657337663, 1657337663, 0);
INSERT INTO `water_system_log` VALUES (475, '添加或修改获取广告详情', 1, 'admin/v1.Adverts/edit', '/admin/v1/adverts/3/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657338099, 1657338099, 0);
INSERT INTO `water_system_log` VALUES (476, '添加或修改获取广告详情', 1, 'admin/v1.Adverts/edit', '/admin/v1/adverts/3/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657338104, 1657338104, 0);
INSERT INTO `water_system_log` VALUES (477, '附件列表', 1, 'admin/v1.Attachment/index', '/admin/v1/attachment', 'admin', '2130706433', 'GET', 'page=1&limit=20&category=image&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657338391, 1657338391, 0);
INSERT INTO `water_system_log` VALUES (478, '添加或修改获取附件详情', 1, 'admin/v1.Attachment/edit', '/admin/v1/attachment/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657338392, 1657338392, 0);
INSERT INTO `water_system_log` VALUES (479, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657338961, 1657338961, 0);
INSERT INTO `water_system_log` VALUES (480, '广告列表', 1, 'admin/v1.Adverts/index', '/admin/v1/adverts', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657338962, 1657338962, 0);
INSERT INTO `water_system_log` VALUES (481, '添加或修改获取广告详情', 1, 'admin/v1.Adverts/edit', '/admin/v1/adverts/0/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657338963, 1657338963, 0);
INSERT INTO `water_system_log` VALUES (482, '添加附件', 1, 'admin/v1.Attachment/save', '/admin/v1/attachment', 'admin', '2130706433', 'POST', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657339063, 1657339063, 0);
INSERT INTO `water_system_log` VALUES (483, '个人信息', 1, 'admin/v1.Admin/info', '/admin/v1/admin/info', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346665, 1657346665, 0);
INSERT INTO `water_system_log` VALUES (484, '广告列表', 1, 'admin/v1.Adverts/index', '/admin/v1/adverts', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346666, 1657346666, 0);
INSERT INTO `water_system_log` VALUES (485, '修改广告字段值', 1, 'admin/v1.Adverts/change', '/admin/v1/adverts/5/change', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346669, 1657346669, 0);
INSERT INTO `water_system_log` VALUES (486, '角色列表', 1, 'admin/v1.SystemRole/index', '/admin/v1/system_role', 'admin', '2130706433', 'GET', 'page=1&limit=20&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346678, 1657346678, 0);
INSERT INTO `water_system_log` VALUES (487, '系统权限列表', 1, 'admin/v1.SystemAuth/index', '/admin/v1/system_auth', 'admin', '2130706433', 'GET', 'module=admin&_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346695, 1657346695, 0);
INSERT INTO `water_system_log` VALUES (488, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346726, 1657346726, 0);
INSERT INTO `water_system_log` VALUES (489, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346905, 1657346905, 0);
INSERT INTO `water_system_log` VALUES (490, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346923, 1657346923, 0);
INSERT INTO `water_system_log` VALUES (491, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/1/edit', 'admin', '2130706433', 'GET', '_label=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346942, 1657346942, 0);
INSERT INTO `water_system_log` VALUES (492, '修改系统配置分类', 1, 'admin/v1.SystemConfigTab/update', '/admin/v1/system_config_tab/1', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346949, 1657346949, 0);
INSERT INTO `water_system_log` VALUES (493, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346950, 1657346950, 0);
INSERT INTO `water_system_log` VALUES (494, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/3/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346954, 1657346954, 0);
INSERT INTO `water_system_log` VALUES (495, '修改系统配置分类', 1, 'admin/v1.SystemConfigTab/update', '/admin/v1/system_config_tab/3', 'admin', '2130706433', 'PUT', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346967, 1657346967, 0);
INSERT INTO `water_system_log` VALUES (496, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346967, 1657346967, 0);
INSERT INTO `water_system_log` VALUES (497, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/1/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657346990, 1657346990, 0);
INSERT INTO `water_system_log` VALUES (498, '添加或修改获取系统配置分类详情', 1, 'admin/v1.SystemConfigTab/edit', '/admin/v1/system_config_tab/1/edit', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657347152, 1657347152, 0);
INSERT INTO `water_system_log` VALUES (499, '系统配置分类列表', 1, 'admin/v1.SystemConfigTab/index', '/admin/v1/system_config_tab', 'admin', '2130706433', 'GET', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1657347225, 1657347225, 0);

-- ----------------------------
-- Table structure for water_system_role
-- ----------------------------
DROP TABLE IF EXISTS `water_system_role`;
CREATE TABLE `water_system_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `key` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '对应的 admin  editor 或者自行添加其他的',
  `auth_ids` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色权限ID',
  `site_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0全局 非0是非超管设置的',
  `mark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_system_role
-- ----------------------------
INSERT INTO `water_system_role` VALUES (1, '超级管理员', 'admin', '', 1, 0, 0, '', 1647827755, 1647827755, 0);
INSERT INTO `water_system_role` VALUES (2, '运营员', 'operate', '1,63,1,64,1,2,3,73,74,75,76,77,78,79,25,225,226,227,228,229,230,231,232,233,21,201,202,203,204,205,206,207,208,65,66,67,68,69,70,71,72', 1, 0, 0, '', 1647827755, 1657181907, 0);
INSERT INTO `water_system_role` VALUES (3, '测试下级', 'testchild', '1,64,1,63,1,2,65', 1, 2, 5, '', 1657174819, 1657174819, 0);
INSERT INTO `water_system_role` VALUES (4, '测试3级下级', 'testchild1', '1,64,1,63,1,2,65', 1, 3, 5, '', 1657174819, 1657174819, 0);

-- ----------------------------
-- Table structure for water_user
-- ----------------------------
DROP TABLE IF EXISTS `water_user`;
CREATE TABLE `water_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '账号',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `real_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别 0：未知 1：男 2：女',
  `birthday` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '生日',
  `id_card` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证',
  `tel` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电话',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 0：禁用 1：正常',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理',
  `role_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `last_login_ip` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pay_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买次数',
  `money` decimal(8, 2) UNSIGNED NOT NULL COMMENT '余额',
  `flow` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '流量',
  `add_ip` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '生成账号时的ip',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户类型',
  `used_flow` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用的流量',
  `platform` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'h5' COMMENT '用户注册类型 1:h5 2:微信 9:后台添加',
  `invitation_code` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理邀请码',
  `spread_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下级人数',
  `is_vip` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为会员',
  `mark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `extend` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '扩展字段',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `user`(`agent_id`) USING BTREE,
  INDEX `invitation_code`(`invitation_code`) USING BTREE,
  INDEX `tel`(`tel`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_user
-- ----------------------------
INSERT INTO `water_user` VALUES (1, 'agent', '1ad359f5abcb1ac4fd1d85c6a2f99816', '维多', '维多', 1, 0, '', '13750427123', '666666', '', 1, '123456@qq.com', 0, 0, '2130706433', 1656582334, 48, 5400.00, 9999, '', 9, 0, 'h5', 888888, 0, 0, '', '{\"repair_register_url\":\"http:\\/\\/weixin.qq.com\\/q\\/02X6D3ldPje7C10000M070\",\"repair_register_qrcode\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQFv8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWDZEM2xkUGplN0MxMDAwME0wNzAAAgREIbBiAwQAAAAA\"}', 0, 0, 1656582334, 0);
INSERT INTO `water_user` VALUES (2, '13712341234', '1ad359f5abcb1ac4fd1d85c6a2f99816', '维多1', '', 1, 0, '', '13712341234', '', '', 1, '', 0, 0, '', 0, 1, 100.00, 0, '2130706433', 1, 0, 'add', 0, 0, 0, '', '', 0, 1649837553, 1655448623, 0);
INSERT INTO `water_user` VALUES (5, '13712341235', '1ad359f5abcb1ac4fd1d85c6a2f99816', '维多2', '', 1, 0, '', '13712341235', '', '', 1, '', 0, 0, '', 0, 10, 1000.00, 1000, '2130706433', 1, 0, 'add', 0, 0, 0, '', '', 0, 1649900479, 1656472429, 0);
INSERT INTO `water_user` VALUES (7, 'tourist_ybEMxBWpCm', '6a72740cdbda817210df1adc762b9011', '游客ybEMxBWpCm', '', 0, 0, '', '', '', '', 1, '', 0, 0, '', 0, 0, 0.00, 0, '', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652684145, 1652684145, 0);
INSERT INTO `water_user` VALUES (8, 'tourist_KfPwhaLgkc', '1c907ee55fb4f24d31513bccb1369e29', '游客KfPwhaLgkc', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652684180, 0, 0.00, 0, '', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652684180, 1652684180, 0);
INSERT INTO `water_user` VALUES (9, 'tourist_hPgoBWFduZ', '2001b4a5b59a746bb580108fff2090cd', '游客hPgoBWFduZ', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652684249, 0, 0.00, 0, '', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652684249, 1652684249, 0);
INSERT INTO `water_user` VALUES (10, 'tourist_hTtMLwSiFN', '79b8d944033a33269ec2f7f309fe6db3', '游客hTtMLwSiFN', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652684288, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652684288, 1652684288, 0);
INSERT INTO `water_user` VALUES (11, 'tourist_emsgSyQraD', 'c38a03079b2263955ad51c011c994592', '游客emsgSyQraD', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685834, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685834, 1652685834, 0);
INSERT INTO `water_user` VALUES (12, 'tourist_CqkbKeUYun', '2292b558d476a472289520dc11122cc7', '游客CqkbKeUYun', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685835, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685835, 1652685835, 0);
INSERT INTO `water_user` VALUES (13, 'tourist_zRyBSPqOZk', '309e55b3e9ca5ccc8557274bd48fc90f', '游客zRyBSPqOZk', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685835, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685835, 1652685835, 0);
INSERT INTO `water_user` VALUES (14, 'tourist_zCvaFsnyiK', 'ed7eedd82aca0769f9c3406d289e88a5', '游客zCvaFsnyiK', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685836, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685836, 1652685836, 0);
INSERT INTO `water_user` VALUES (15, 'tourist_KWzhdqlTOj', '17f23d09e23714ed8510a58c09f5bb34', '游客KWzhdqlTOj', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685837, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685837, 1652685837, 0);
INSERT INTO `water_user` VALUES (16, 'tourist_gxDpAJahnr', 'c17e95517e92b54f4bcfb778d13bc903', '游客gxDpAJahnr', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685838, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685838, 1652685838, 0);
INSERT INTO `water_user` VALUES (17, 'tourist_iwxLdMbKeS', 'c1470aa04c9a6fec5a7f1cc1f5e20481', '游客iwxLdMbKeS', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685838, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685838, 1652685838, 0);
INSERT INTO `water_user` VALUES (18, 'tourist_PkuJqrohjy', '02c68fa535723d67c652868f7b2485ad', '游客PkuJqrohjy', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685839, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685839, 1652685839, 0);
INSERT INTO `water_user` VALUES (19, 'tourist_yXEJosQIfZ', '9c3a90dffd2ce98ae6de3f3826c69f41', '游客yXEJosQIfZ', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685840, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685840, 1652685840, 0);
INSERT INTO `water_user` VALUES (20, 'tourist_ZxdBmriOHM', '65a4e05d399b39c03ebdd45e244ac84b', '游客ZxdBmriOHM', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685840, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685840, 1652685840, 0);
INSERT INTO `water_user` VALUES (21, 'tourist_MTRlUhOcpx', 'ef4c81553cd663e46a6b9b0281bddf7d', '游客MTRlUhOcpx', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685841, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685841, 1652685841, 0);
INSERT INTO `water_user` VALUES (22, 'tourist_tqQOMAUpZy', '763ab06a82ad8e872ea029cb16becfca', '游客tqQOMAUpZy', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685842, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685842, 1652685842, 0);
INSERT INTO `water_user` VALUES (23, 'tourist_MjcwrCngVy', '2920d078fd83509e43887b65f3a0d5cc', '游客MjcwrCngVy', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685843, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685843, 1652685843, 0);
INSERT INTO `water_user` VALUES (24, 'tourist_RCrWkwMgAJ', 'cea0f15c905fc89429c733bda6c47a20', '游客RCrWkwMgAJ', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685843, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685843, 1652685843, 0);
INSERT INTO `water_user` VALUES (25, 'tourist_ypjkODauQZ', '50735dd6bd509aad455718310399ee87', '游客ypjkODauQZ', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685844, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685844, 1652685844, 0);
INSERT INTO `water_user` VALUES (26, 'tourist_GWctowkgML', '2ad2bb064d914202e68e84a2694808d0', '游客GWctowkgML', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685845, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685845, 1652685845, 0);
INSERT INTO `water_user` VALUES (27, 'tourist_INOwsgDbdR', 'd230ccf65f0efe5d1c4ca543658306ae', '游客INOwsgDbdR', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685845, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685845, 1652685845, 0);
INSERT INTO `water_user` VALUES (28, 'tourist_VAquQRmMlw', '01282165cbc7a20cb69666b3f31ddd54', '游客VAquQRmMlw', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685846, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685846, 1652685846, 0);
INSERT INTO `water_user` VALUES (29, 'tourist_bGAnjLPHRo', 'd80b25a26a2e0313815f8d1ea298b589', '游客bGAnjLPHRo', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685847, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685847, 1652685847, 0);
INSERT INTO `water_user` VALUES (30, 'tourist_kBPvUpZxIJ', '46ccc56a6d8ae55f245505d8540bfd29', '游客kBPvUpZxIJ', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685847, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685847, 1652685847, 0);
INSERT INTO `water_user` VALUES (31, 'tourist_gXWszITeMq', '36a47fe6856c3c821737599e4347dc56', '游客gXWszITeMq', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685848, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685848, 1652685848, 0);
INSERT INTO `water_user` VALUES (32, 'tourist_gKozjEdnmx', '60eeeb535ab013ddb9dc9869f6f5d527', '游客gKozjEdnmx', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685849, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685849, 1652685849, 0);
INSERT INTO `water_user` VALUES (33, 'tourist_kzvVUdEbtP', '0eb94af128a8ae098df4d6f05891228e', '游客kzvVUdEbtP', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685849, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685849, 1652685849, 0);
INSERT INTO `water_user` VALUES (34, 'tourist_EnMyTXtoFP', '34da514c47ea90bc517b6956f071a684', '游客EnMyTXtoFP', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685850, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685850, 1652685850, 0);
INSERT INTO `water_user` VALUES (35, 'tourist_IbQRUDvhnr', '510c7e7e6846977db1972d025a3a3b19', '游客IbQRUDvhnr', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685851, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685851, 1652685851, 0);
INSERT INTO `water_user` VALUES (36, 'tourist_OyoBxrdEmu', 'd247fe63bddd9842532075ff81e77218', '游客OyoBxrdEmu', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685852, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685852, 1652685852, 0);
INSERT INTO `water_user` VALUES (37, 'tourist_RDGeZKBJvM', '3cbde31c343d4cb09ba0e94577f1f4a1', '游客RDGeZKBJvM', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685853, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685853, 1652685853, 0);
INSERT INTO `water_user` VALUES (38, 'tourist_QzpndcYLTP', 'cb56a207f52a99793447d233f8f1dba0', '游客QzpndcYLTP', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685853, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685853, 1652685853, 0);
INSERT INTO `water_user` VALUES (39, 'tourist_uQozvUFtLd', '874e61040dd72c214975f78137c1b053', '游客uQozvUFtLd', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685854, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685854, 1652685854, 0);
INSERT INTO `water_user` VALUES (40, 'tourist_HMLJmuqNIf', '94cb8cee3b5f86e8521a5b662d8a3f56', '游客HMLJmuqNIf', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685855, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685855, 1652685855, 0);
INSERT INTO `water_user` VALUES (41, 'tourist_cePAaSjBDF', '04626ac6d173feb9a5a2b9fe802df1e6', '游客cePAaSjBDF', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685856, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685856, 1652685856, 0);
INSERT INTO `water_user` VALUES (42, 'tourist_ixSuLTbAjC', '9ee90c134c73eecfda5b919a6cff9792', '游客ixSuLTbAjC', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685857, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685857, 1652685857, 0);
INSERT INTO `water_user` VALUES (43, 'tourist_jJOeZScMLV', 'd7ac9b90eed792186192d1c66a47ac95', '游客jJOeZScMLV', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652685910, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652685910, 1652685910, 0);
INSERT INTO `water_user` VALUES (44, 'tourist_KWvaIpGfkt', '31524d651c2e990fbde492dc02857934', '游客KWvaIpGfkt', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652686716, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652686716, 1652686716, 0);
INSERT INTO `water_user` VALUES (45, 'tourist_JGAjMbzdEK', '29f824a39798dd7039167cd20725b877', '游客JGAjMbzdEK', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652686743, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652686743, 1652686743, 0);
INSERT INTO `water_user` VALUES (46, 'tourist_ztUbZHiDCT', 'c602bd5769dc3c042a5ee0c28ad6c4cf', '游客ztUbZHiDCT', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652686746, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652686746, 1652686746, 0);
INSERT INTO `water_user` VALUES (47, 'tourist_szlpNxuZyE', '26d2fb5f6d2c1c0290a2ac261db9ba75', '游客szlpNxuZyE', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652686764, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652686764, 1652686764, 0);
INSERT INTO `water_user` VALUES (48, 'tourist_BaShNcYtXz', '7581a9d99345fd88ce8e6ebfa0537e4e', '游客BaShNcYtXz', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652686785, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652686785, 1652686785, 0);
INSERT INTO `water_user` VALUES (49, 'tourist_XohmVKvakP', 'ad08b53d008262ebee9740e72a87cc89', '游客XohmVKvakP', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652686815, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652686815, 1652686815, 0);
INSERT INTO `water_user` VALUES (50, 'tourist_qIYeMkXRrs', '195d7ee3735cf4d5dd0d21203ff092a9', '游客qIYeMkXRrs', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652686826, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652686826, 1652686826, 0);
INSERT INTO `water_user` VALUES (51, 'tourist_JXYSnRIjOt', '186011902742441812426ef5cd043fa7', '游客JXYSnRIjOt', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652686885, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652686885, 1652686885, 0);
INSERT INTO `water_user` VALUES (52, 'tourist_wmTicCqNhA', '2b30228293256440d06b6b2c0b8eb2bd', '游客wmTicCqNhA', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652687039, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652687039, 1652687039, 0);
INSERT INTO `water_user` VALUES (53, 'tourist_ebfQtxmIgC', '6789dee6dcb57d7e1681b2226122ecb9', '游客ebfQtxmIgC', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652687082, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652687082, 1652687082, 0);
INSERT INTO `water_user` VALUES (54, 'tourist_RpCgZPkuVt', 'e6888a9c40f9d0b9beda412b6c0629ff', '游客RpCgZPkuVt', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652687163, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652687163, 1652687163, 0);
INSERT INTO `water_user` VALUES (55, 'tourist_xVTFHuPsjo', 'c4020954d1b16b8981e0b881b1d536f3', '游客xVTFHuPsjo', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652687427, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652687427, 1652687427, 0);
INSERT INTO `water_user` VALUES (56, 'tourist_MjuIZprzda', '4ddc281578fe1a06f3fd269708f1f97e', '游客MjuIZprzda', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652687492, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652687492, 1652687492, 0);
INSERT INTO `water_user` VALUES (57, 'tourist_OELdICAgYJ', '57e7ca9c337d18e139e1a69f6786ee2c', '游客OELdICAgYJ', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652689039, 0, 0.00, 180, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652689039, 1652695137, 0);
INSERT INTO `water_user` VALUES (58, 'tourist_MyZToRjrUV', 'd2b624e222dd3d546354f34a8d480c8f', '游客MyZToRjrUV', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652750962, 0, 0.00, 200, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652750962, 1652750962, 0);
INSERT INTO `water_user` VALUES (59, 'tourist_KjUkoNvcFG', 'd191107796d0120b98459e2f7c2f7f46', '游客KjUkoNvcFG', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652755697, 0, 0.00, 200, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652755697, 1652756155, 0);
INSERT INTO `water_user` VALUES (60, 'tourist_mFpfoURucd', 'df33fea884f82f9a57e44fec6619f520', '游客mFpfoURucd', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652767870, 0, 0.00, 200, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652767870, 1652767870, 0);
INSERT INTO `water_user` VALUES (61, 'tourist_nYtzagpZyl', '2365dd811dc39a61d26dd957419f0147', '游客nYtzagpZyl', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652767955, 0, 0.00, 200, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652767955, 1652767955, 0);
INSERT INTO `water_user` VALUES (62, 'tourist_LsGvepEkYX', 'e2d382c72509de0b0560de329e679b65', '游客LsGvepEkYX', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652767997, 0, 0.00, 200, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652767997, 1652767997, 0);
INSERT INTO `water_user` VALUES (63, 'tourist_XLRwrSQDyh', '5779b7a599ff8237444ace9a91aa32f0', '游客XLRwrSQDyh', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652768040, 0, 0.00, 200, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652768040, 1652768040, 0);
INSERT INTO `water_user` VALUES (64, 'tourist_uagPYArvpX', 'cb964a1ce409176b9c2aacf78efed712', '游客uagPYArvpX', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652768105, 0, 0.00, 200, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652768105, 1652768105, 0);
INSERT INTO `water_user` VALUES (65, 'tourist_bSaLIFTlPm', 'd6c421f36ee80a946870922c07a59131', '游客bSaLIFTlPm', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652768272, 0, 0.00, 200, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652768272, 1652768272, 0);
INSERT INTO `water_user` VALUES (66, 'tourist_xfPZdLlGOa', '4496129b072284b0f5abdfa6159f701c', '游客xfPZdLlGOa', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652768650, 0, 0.00, 199, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652768650, 1652768650, 0);
INSERT INTO `water_user` VALUES (67, 'tourist_jMZSuEkTdg', 'ff6794a8733ad0a1f0e40fe3c354a887', '游客jMZSuEkTdg', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652777907, 0, 0.00, 288, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652777907, 1652777907, 0);
INSERT INTO `water_user` VALUES (68, 'tourist_LqFGnHClXj', '5b36171aae026dd9d8d62100bd2c9af2', '游客LqFGnHClXj', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652779871, 0, 0.00, 100, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652779871, 1652779871, 0);
INSERT INTO `water_user` VALUES (69, 'tourist_vBUjPFnzSV', '18a6c253aaf52eed83c3deee9099cecf', '游客vBUjPFnzSV', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652836721, 0, 0.00, 100, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652836721, 1652836721, 0);
INSERT INTO `water_user` VALUES (70, 'tourist_ykSlMQIiAp', 'e9f52133cd73e7307af36a57eeacbdae', '游客ykSlMQIiAp', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652924130, 0, 0.00, 100, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652924130, 1654852454, 1654852454);
INSERT INTO `water_user` VALUES (71, 'tourist_JxvnMLadPQ', 'dcd3d110a3dcb97e135376466e462a60', '游客JxvnMLadPQ', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652924130, 0, 0.00, 100, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652924130, 1652924130, 0);
INSERT INTO `water_user` VALUES (72, 'tourist_SvurhdoPmf', '7475e7695f8386f568bacd661b08bc16', '游客SvurhdoPmf', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1652924309, 0, 0.00, 200, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1652924309, 1652924354, 0);
INSERT INTO `water_user` VALUES (73, 'tourist_pMWIBjsZou', '3963e26a69f74af0691c68385a6e3fb7', '游客pMWIBjsZou', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1653289780, 0, 0.00, 100, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1653289780, 1653289780, 0);
INSERT INTO `water_user` VALUES (74, 'tourist_jmSsDFATnr', '28f2d1d938d7c701f6e764cb35ddbd54', '游客jmSsDFATnr', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1653356511, 0, 0.00, 100, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1653356511, 1654852449, 1654852449);
INSERT INTO `water_user` VALUES (75, 'tourist_wbpAfIhqHG', 'a53eab6084ede14987d0db0f8c07cad2', '游客wbpAfIhqHG', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1653372677, 0, 0.00, 100, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1653372677, 1654852443, 1654852443);
INSERT INTO `water_user` VALUES (76, 'tourist_pzBbFCknlK', '8d8fd7564acd06bd22208d6a816d5507', '游客pzBbFCknlK', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1653373722, 0, 0.00, 1, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1653373722, 1654852443, 1654852443);
INSERT INTO `water_user` VALUES (77, 'tourist_XTZstKzNck', 'ed804bfbf3ebd410f2ef0553dca18220', '游客XTZstKzNck', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1653381762, 0, 0.00, 100, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1653381762, 1654852443, 1654852443);
INSERT INTO `water_user` VALUES (78, 'tourist_hinFeyAEYX', 'ccbf8756c29747d753d262d24ea5c54e', '游客hinFeyAEYX', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1653381762, 0, 0.00, 100, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1653381762, 1654852443, 1654852443);
INSERT INTO `water_user` VALUES (79, 'tourist_DfoaXwCYGT', 'e438a02026dfa7a984876af733ba6910', '游客DfoaXwCYGT', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1653442479, 0, 0.00, 100, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1653442479, 1653442479, 0);
INSERT INTO `water_user` VALUES (80, 'tourist_xcMRWqSeTv', '28a6de14e5768c4bf60daf63ba162a34', '游客xcMRWqSeTv', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1653444471, 0, 0.00, 100, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1653444471, 1653444471, 0);
INSERT INTO `water_user` VALUES (81, 'tourist_ybHzBdrxog', 'ff4fa1d1902ef7029c726368210d5865', '游客ybHzBdrxog', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1653444471, 0, 0.00, 93, '2130706433', 9, 0, 'h5', 0, 0, 0, '', '', 0, 1653444471, 1653445269, 0);
INSERT INTO `water_user` VALUES (82, '', '1ad359f5abcb1ac4fd1d85c6a2f99816', '测试代理', '测试', 1, 0, '', '', '', '', 0, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 1, 0, '9', 0, 0, 0, '', '', 0, 1654157053, 1654671394, 1654671394);
INSERT INTO `water_user` VALUES (83, '', '1ad359f5abcb1ac4fd1d85c6a2f99816', '测试代理1', '123123', 0, 0, '', '', '', '/upload/attachment/6d/d5ef6f17f3d39d4e2f7da2551f05d7.jpg', 1, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 1, 0, '9', 0, 0, 0, '', '', 0, 1654157815, 1654671394, 1654671394);
INSERT INTO `water_user` VALUES (84, '', '1ad359f5abcb1ac4fd1d85c6a2f99816', 'asdjaskl2', '111', 0, 0, '', '', '', '', 1, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 1, 0, '9', 0, 0, 0, '', '', 0, 1654157967, 1654671394, 1654671394);
INSERT INTO `water_user` VALUES (85, '', 'b46c3478f3cb604093e03b6a7bc2fea8', 'asd32e4', 'sdaswe', 1, 0, '', '', '', '', 0, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 1, 0, '9', 0, 0, 0, '', '', 0, 1654158092, 1654671394, 1654671394);
INSERT INTO `water_user` VALUES (86, '', 'b46c3478f3cb604093e03b6a7bc2fea8', 'asd32e41', 'sdaswe', 1, 0, '', '', '', '', 0, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 1, 0, '9', 0, 0, 0, '', '', 0, 1654158111, 1654671394, 1654671394);
INSERT INTO `water_user` VALUES (87, 'test', '553d2ff9940587a618716a03c91e9799', '123asd', 'asde23e', 1, 0, '', '', '', '', 1, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 9, 0, '9', 0, 0, 0, '', '', 0, 1654158230, 1655200211, 0);
INSERT INTO `water_user` VALUES (88, 'tourist_mclaNGEPXg', 'e5c39bf99b408edc08f9552eaa889555', '游客mclaNGEPXg', '', 0, 0, '', '', '', '', 1, '', 1, 0, '2130706433', 1654480924, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1654480924, 1654480924, 0);
INSERT INTO `water_user` VALUES (89, 'test123', '1ad359f5abcb1ac4fd1d85c6a2f99816', '测试', '', 1, 0, '', '13750421234', '', '', 1, '', 1, 0, '', 0, 0, 0.00, 0, '2130706433', 1, 0, '9', 0, 0, 0, '', '', 0, 1654584140, 1654584493, 0);
INSERT INTO `water_user` VALUES (93, 'testyunwei123', '1ad359f5abcb1ac4fd1d85c6a2f99816', '测试运维', '', 1, 0, '', '13750421235', '', '', 1, '', 1, 0, '', 0, 3, 0.00, 0, '2130706433', 6, 0, '9', 0, 0, 0, '', '', 0, 1654589251, 1654912160, 0);
INSERT INTO `water_user` VALUES (94, 'tourist_QSCyTKlWkP', '9085c926e6bfb59b8160027f5ef0a71e', '游客QSCyTKlWkP', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1654659709, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1654659709, 1654659709, 0);
INSERT INTO `water_user` VALUES (95, 'testcoupon1', '1ad359f5abcb1ac4fd1d85c6a2f99816', '测试优惠券管理员', '', 1, 0, '', '13750421236', '', '', 1, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 7, 0, '9', 0, 0, 0, '', '', 0, 1654739473, 1654739473, 0);
INSERT INTO `water_user` VALUES (96, 'testcoupon2', '1ad359f5abcb1ac4fd1d85c6a2f99816', '测试优惠券管理员2', '', 1, 0, '', '13750421237', '', '', 1, '', 1, 0, '', 0, 0, 0.00, 0, '2130706433', 7, 0, '9', 0, 0, 0, '', '', 0, 1654739757, 1655195650, 1655195650);
INSERT INTO `water_user` VALUES (97, 'tourist_pCSoYyRdDe', '7b3852208291a4223fa9e3b765f16816', '游客pCSoYyRdDe', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1654831269, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1654831269, 1654831269, 0);
INSERT INTO `water_user` VALUES (98, 'admin10', '1ad359f5abcb1ac4fd1d85c6a2f99816', '出厂设置员11', '', 0, 0, '', '', '', '', 1, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 1, 0, 'h5', 0, 0, 0, '', '', 0, 1655110570, 1655110570, 0);
INSERT INTO `water_user` VALUES (99, 'factory', '1ad359f5abcb1ac4fd1d85c6a2f99816', '出厂设置员', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1655430587, 0, 0.00, 0, '2130706433', 8, 0, 'h5', 0, 0, 0, '', '', 0, 1655110627, 1655430587, 0);
INSERT INTO `water_user` VALUES (100, 'testagent', '1ad359f5abcb1ac4fd1d85c6a2f99816', '666666', '', 0, 0, '', '', '', '', 1, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 9, 0, 'h5', 0, 0, 0, '', '', 0, 1655258305, 1655258305, 0);
INSERT INTO `water_user` VALUES (101, 'testagen123', '8cf42f256b719eac55e8f554b31a7aa2', 'asd123d', '', 0, 0, '', '', '', '', 1, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 9, 0, 'h5', 0, 0, 0, '', '', 0, 1655258451, 1655258451, 0);
INSERT INTO `water_user` VALUES (102, 'shop', '1ad359f5abcb1ac4fd1d85c6a2f99816', '商户', '', 1, 0, '', '13750421239', '', '', 1, '', 1, 0, '2130706433', 1655343953, 0, 0.00, 0, '2130706433', 7, 0, '9', 0, 0, 0, '', '', 0, 1655274291, 1655343953, 0);
INSERT INTO `water_user` VALUES (103, 'tourist_sFNxJjIEAG', 'b7bfb2a34150000706445a340b966bbb', '游客sFNxJjIEAG', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1655360928, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1655360927, 1655360928, 0);
INSERT INTO `water_user` VALUES (104, 'factory11', '1ad359f5abcb1ac4fd1d85c6a2f99816', 'testfactory3', '', 0, 0, '', '', '', '', 1, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 8, 0, 'h5', 0, 0, 0, '', '', 0, 1655366458, 1655366467, 0);
INSERT INTO `water_user` VALUES (105, 'repair_user', '1ad359f5abcb1ac4fd1d85c6a2f99816', '维护员', '', 0, 0, '', '', '', '', 1, '', 1, 0, '2130706433', 1655783777, 0, 0.00, 0, '2130706433', 6, 0, 'h5', 0, 0, 0, '', '', 0, 1655369747, 1655783777, 0);
INSERT INTO `water_user` VALUES (106, 'tourist_dpasRJVzDS', '0cc39f1a2d330cf70061e5a2e106a709', '游客dpasRJVzDS', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1655456919, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1655456919, 1655456919, 0);
INSERT INTO `water_user` VALUES (107, 'tourist_nVsGLbdpvm', 'e5677abb22dfce4529572893143d10ed', '游客nVsGLbdpvm', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1655456919, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1655456919, 1655456919, 0);
INSERT INTO `water_user` VALUES (108, 'tourist_ZPinwyofva', '81b305544d7da2dffb27c14d8016594f', '游客ZPinwyofva', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1655457466, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '{\"test\":\"1\"}', 0, 1655457466, 1655457466, 0);
INSERT INTO `water_user` VALUES (109, 'testrepair', '1ad359f5abcb1ac4fd1d85c6a2f99816', '测试维护员', '', 0, 0, '', '', '', '', 0, '', 1, 0, '', 0, 0, 0.00, 0, '', 6, 0, 'h5', 0, 0, 0, '申请注册', '', 0, 1655715887, 1655715887, 0);
INSERT INTO `water_user` VALUES (110, 'tourist_ChStZGQxMk', '32f8757a74226d0c285fc2a2ac3579d1', '游客ChStZGQxMk', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656061073, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1656061073, 1656061073, 0);
INSERT INTO `water_user` VALUES (111, 'tourist_pHRXTPZDqN', 'b24d7cfa6c2aff5292a4a68a605cb306', '游客pHRXTPZDqN', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656061405, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1656061405, 1656061405, 0);
INSERT INTO `water_user` VALUES (112, 'tourist_wsqVealcGz', '9b743be46f3b57e80e1b4f7abdf81b30', '游客wsqVealcGz', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656126715, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1656126715, 1656126715, 0);
INSERT INTO `water_user` VALUES (113, 'tourist_LMXZEopfiF', '074e95b104a43cf47918334823b3f8e5', '游客LMXZEopfiF', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656141824, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1656141824, 1656141824, 0);
INSERT INTO `water_user` VALUES (114, 'tourist_ORkFLUaSPr', '533032f6875ec35a52dcab862a8133ae', '游客ORkFLUaSPr', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656141824, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1656141824, 1656141824, 0);
INSERT INTO `water_user` VALUES (115, 'tourist_uljPgknras', 'b8ad2f6b13bdd8a047b850555da9d132', '游客uljPgknras', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656143118, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1656143118, 1656143118, 0);
INSERT INTO `water_user` VALUES (116, 'tourist_fXWJsEDZCF', '3b3124b466f0ed1696fee4bc81b49bea', '游客fXWJsEDZCF', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656143118, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1656143118, 1656143118, 0);
INSERT INTO `water_user` VALUES (117, 'tourist_PCaYILqfxi', 'a8ec6b4a3370b017eb217feaa9c29324', '游客PCaYILqfxi', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656147023, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1656147023, 1656147023, 0);
INSERT INTO `water_user` VALUES (118, 'water_company', '1ad359f5abcb1ac4fd1d85c6a2f99816', '水务公司', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656552528, 0, 0.00, 0, '2130706433', 2, 0, 'h5', 0, 0, 0, '', '', 0, 1656316579, 1656552528, 0);
INSERT INTO `water_user` VALUES (119, 'waterworks', '1ad359f5abcb1ac4fd1d85c6a2f99816', '水厂', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1657002133, 0, 0.00, 0, '2130706433', 3, 0, 'h5', 0, 0, 0, '', '{\"repair_register_url\":\"http:\\/\\/weixin.qq.com\\/q\\/02CIRNkZPje7C10000M07R\",\"repair_register_qrcode\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQFn8jwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ0lSTmtaUGplN0MxMDAwME0wN1IAAgSOk75iAwQAAAAA\"}', 118, 1656316601, 1657002133, 0);
INSERT INTO `water_user` VALUES (120, 'customer', '1ad359f5abcb1ac4fd1d85c6a2f99816', '取水客户', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1657078726, 0, 0.00, 199998, '2130706433', 4, 0, 'h5', 0, 0, 0, '', '', 118, 1656316635, 1657078726, 0);
INSERT INTO `water_user` VALUES (121, 'water_fetcher', '1ad359f5abcb1ac4fd1d85c6a2f99816', '取水员', '', 0, 0, '', '', '', '', 1, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 5, 0, 'h5', 0, 0, 0, '', '', 0, 1656316655, 1656316655, 0);
INSERT INTO `water_user` VALUES (122, 'testcustomer', '1ad359f5abcb1ac4fd1d85c6a2f99816', '测试取水客户', '', 1, 0, '', '13750421238', '', '', 1, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 4, 0, '9', 0, 0, 0, '', '', 118, 1656400797, 1656400797, 0);
INSERT INTO `water_user` VALUES (123, 'testcustomer2', '1ad359f5abcb1ac4fd1d85c6a2f99816', '测试取水客户2', '', 1, 0, '', '13750421240', '', '', 1, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 4, 0, '9', 0, 0, 0, '', '', 118, 1656400815, 1656400815, 0);
INSERT INTO `water_user` VALUES (124, 'testcustomer3', '1ad359f5abcb1ac4fd1d85c6a2f99816', '测试取水客户3', '', 1, 0, '', '13750421241', '', '', 1, '', 0, 0, '', 0, 0, 0.00, 0, '2130706433', 4, 0, '9', 0, 0, 0, '', '', 118, 1656400832, 1656400832, 0);
INSERT INTO `water_user` VALUES (125, 'tourist_aWgoYLURZt', 'f7c6902f8e7321ecbc191db3699529f0', '游客aWgoYLURZt', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656468959, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1656468959, 1656468959, 0);
INSERT INTO `water_user` VALUES (126, 'tourist_HpiaOzMldS', '7701036cdf09026e529da3855273de7e', '游客HpiaOzMldS', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656558816, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1656558816, 1656558816, 0);
INSERT INTO `water_user` VALUES (127, 'tourist_tGPdsXHyNp', 'ead718c80258a3f30955bdcd8b44f1ed', '游客tGPdsXHyNp', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656559858, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1656559858, 1656559858, 0);
INSERT INTO `water_user` VALUES (128, 'tourist_pVPAyFivek', '2dc6a47c101c63e4d1a7e72407705f3d', '游客pVPAyFivek', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656559858, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1656559858, 1656559858, 0);
INSERT INTO `water_user` VALUES (129, 'tourist_OVpUqKbJSB', '009d3047e987615880aa2c57d9654048', '游客OVpUqKbJSB', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656559889, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1656559889, 1656559889, 0);
INSERT INTO `water_user` VALUES (130, 'tourist_PiBxhXKOrW', '28b0c58d407e277a6d7bbc3a3e548735', '游客PiBxhXKOrW', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1656644154, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1656644154, 1656644154, 0);
INSERT INTO `water_user` VALUES (131, 'testyunwei1234', '1ad359f5abcb1ac4fd1d85c6a2f99816', '测试运维2', '', 1, 0, '', '13750421211', '', '', 1, '', 119, 0, '', 0, 0, 0.00, 0, '2130706433', 6, 0, '9', 0, 0, 0, '', '', 0, 1657002655, 1657002655, 0);
INSERT INTO `water_user` VALUES (132, 'tourist_osBQvAiewP', '3eb3fa40563241ccad5a2626e6a85d7e', '游客osBQvAiewP', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1657090791, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1657090790, 1657090791, 0);
INSERT INTO `water_user` VALUES (133, 'tourist_DYmwRzKbsr', '87f2704bbe324d4eefcfb59d4df7c577', '游客DYmwRzKbsr', '', 0, 0, '', '', '', '', 1, '', 0, 0, '2130706433', 1657090791, 0, 0.00, 100, '2130706433', 1, 0, '1', 0, 0, 0, '', '', 0, 1657090790, 1657183762, 1657183762);

-- ----------------------------
-- Table structure for water_user_oauth
-- ----------------------------
DROP TABLE IF EXISTS `water_user_oauth`;
CREATE TABLE `water_user_oauth`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开放ID',
  `unique_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '唯一ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联的用户ID',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `sex` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `platform` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1：微信 2:微信小程序',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '代理',
  `country` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `openid`(`openid`) USING BTREE,
  INDEX `uniqueid`(`unique_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_user_oauth
-- ----------------------------
INSERT INTO `water_user_oauth` VALUES (1, '1234567890', '1234567890', 0, '维多', '', 1, 1, 1, 1, '', '', '', 1, 0, 0, 0);

-- ----------------------------
-- Table structure for water_user_rebate
-- ----------------------------
DROP TABLE IF EXISTS `water_user_rebate`;
CREATE TABLE `water_user_rebate`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `money` decimal(8, 2) UNSIGNED NOT NULL COMMENT '金额',
  `balance` decimal(8, 2) UNSIGNED NOT NULL COMMENT '剩余金额',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '账单类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 0：待确认 1：有效 2：无效',
  `pm` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0：支出 1：收入',
  `freezing_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '冻结到期时间',
  `mark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `pm`(`pm`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户返利记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_user_rebate
-- ----------------------------
INSERT INTO `water_user_rebate` VALUES (1, '充值返利', 1, 1, 1.00, 1.00, '', 1, 1, 0, '', 0, 1649908794, 0);

-- ----------------------------
-- Table structure for water_user_wallet
-- ----------------------------
DROP TABLE IF EXISTS `water_user_wallet`;
CREATE TABLE `water_user_wallet`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户',
  `device_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '设备',
  `money` decimal(6, 2) UNSIGNED NOT NULL COMMENT '金额',
  `balance` decimal(8, 2) UNSIGNED NOT NULL COMMENT '余额',
  `pm` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0：支出 1：收入',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_user_wallet
-- ----------------------------

-- ----------------------------
-- Table structure for water_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `water_withdrawal`;
CREATE TABLE `water_withdrawal`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `money` decimal(10, 2) UNSIGNED NOT NULL COMMENT '提现金额',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0：待审核   1：提现中 2：已提现 3：已驳回 4：用户自行取消',
  `mark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `refuse_mark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '拒绝原因',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_withdrawal
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
