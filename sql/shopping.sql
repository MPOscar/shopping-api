/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : shopping

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 25/09/2020 12:07:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_images
-- ----------------------------
DROP TABLE IF EXISTS `blog_images`;
CREATE TABLE `blog_images`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `imgUrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `blogId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `position` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blogId`(`blogId`) USING BTREE,
  CONSTRAINT `blog_images_ibfk_1` FOREIGN KEY (`blogId`) REFERENCES `blogs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_images
-- ----------------------------
INSERT INTO `blog_images` VALUES ('4411056e-9c9e-4a9c-a42f-f27082558106', NULL, 'https://s3.us-east-2.amazonaws.com/shopping.uy/1601042347641.jpg', '7b9af458-d39d-4e6f-b939-13295359a057', '2020-09-25 13:59:08', '2020-09-25 13:59:08', 1);
INSERT INTO `blog_images` VALUES ('8422cd25-ff9c-4f6d-bc72-8d882cdac2f9', NULL, 'https://s3.us-east-2.amazonaws.com/shopping.uy/1601042390463.jpg', '7b9af458-d39d-4e6f-b939-13295359a057', '2020-09-25 13:59:51', '2020-09-25 13:59:51', 2);
INSERT INTO `blog_images` VALUES ('ab7343ae-8894-43bb-a5ff-2c626d65edfc', NULL, 'https://s3.us-east-2.amazonaws.com/shopping.uy/1601042331220.jpg', '7b9af458-d39d-4e6f-b939-13295359a057', '2020-09-25 13:58:52', '2020-09-25 13:58:52', 0);

-- ----------------------------
-- Table structure for blogs
-- ----------------------------
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `imgUrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `brandId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE,
  INDEX `brandId`(`brandId`) USING BTREE,
  CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogs
-- ----------------------------
INSERT INTO `blogs` VALUES ('7b9af458-d39d-4e6f-b939-13295359a057', 'dffged', 'https://s3.us-east-2.amazonaws.com/shopping.uy/1601042331220.jpg', 'regferere', 'Article', 'erg', 'b3489c24-1112-4445-9088-b1d7f5be8e74', '2020-09-25 13:58:10', '2020-09-25 13:59:51');

-- ----------------------------
-- Table structure for brand_shops
-- ----------------------------
DROP TABLE IF EXISTS `brand_shops`;
CREATE TABLE `brand_shops`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `shopId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `brandId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `displayOnBrands` tinyint(1) NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopId`(`shopId`) USING BTREE,
  INDEX `brandId`(`brandId`) USING BTREE,
  CONSTRAINT `brand_shops_ibfk_1` FOREIGN KEY (`shopId`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `brand_shops_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brand_shops
-- ----------------------------
INSERT INTO `brand_shops` VALUES ('0eb4c356-0aeb-435e-a148-3e0b0f5b26b7', '4a93d068-c90e-4bab-b9d2-b35da84dffd8', 'aabda173-7a97-4eba-8145-84a04d6b4e9e', 0, '2020-09-25 14:31:05', '2020-09-25 14:31:06');
INSERT INTO `brand_shops` VALUES ('24749596-48e5-4eac-b116-974d9b6acdab', 'b2675334-6298-4c96-a7ba-d57ecf417365', '6079e5b0-c8c5-47d1-9fc2-27109501f422', NULL, '2020-09-25 11:10:46', '2020-09-25 11:10:46');
INSERT INTO `brand_shops` VALUES ('39b03a73-17ff-48c8-827d-e077ecf40f77', '4a93d068-c90e-4bab-b9d2-b35da84dffd8', 'b3489c24-1112-4445-9088-b1d7f5be8e74', 0, '2020-09-25 11:07:11', '2020-09-25 14:29:58');
INSERT INTO `brand_shops` VALUES ('3c576ca1-1bf2-4eac-af7d-d8afef55171a', '4a93d068-c90e-4bab-b9d2-b35da84dffd8', '6079e5b0-c8c5-47d1-9fc2-27109501f422', NULL, '2020-09-25 11:07:11', '2020-09-25 11:07:11');
INSERT INTO `brand_shops` VALUES ('40c43d01-d5c8-4293-a53a-622f1dedc956', 'b2675334-6298-4c96-a7ba-d57ecf417365', 'b3489c24-1112-4445-9088-b1d7f5be8e74', 0, '2020-09-25 11:10:46', '2020-09-25 14:29:58');
INSERT INTO `brand_shops` VALUES ('c540bde8-7f95-41fa-87cf-c2e0ca617434', '63c2a677-efa0-4815-b954-4b8d7ecb2c8d', 'aabda173-7a97-4eba-8145-84a04d6b4e9e', 0, '2020-09-25 14:31:05', '2020-09-25 14:31:06');
INSERT INTO `brand_shops` VALUES ('e9c45840-1edc-45c4-a3fb-389f8c1ad0a0', '63c2a677-efa0-4815-b954-4b8d7ecb2c8d', 'b3489c24-1112-4445-9088-b1d7f5be8e74', 0, '2020-09-25 14:30:09', '2020-09-25 14:30:09');
INSERT INTO `brand_shops` VALUES ('eabbd6e1-19c3-4e4d-be14-1f02fbf68e75', 'b2675334-6298-4c96-a7ba-d57ecf417365', 'aabda173-7a97-4eba-8145-84a04d6b4e9e', 1, '2020-09-25 14:31:10', '2020-09-25 14:31:30');

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `imgUrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES ('6079e5b0-c8c5-47d1-9fc2-27109501f422', 'Fila', '', '', '2020-08-18 01:00:02', '2020-08-18 01:00:02');
INSERT INTO `brands` VALUES ('9adbd912-f1a7-437f-a2e5-52e98abc05ab', 'Puma', '', '', '2020-08-18 01:00:02', '2020-08-18 01:00:02');
INSERT INTO `brands` VALUES ('aabda173-7a97-4eba-8145-84a04d6b4e9e', 'New Brand', 'new brand', 'https://s3.us-east-2.amazonaws.com/shopping.uy/1601044259943.jpg', '2020-09-25 14:31:00', '2020-09-25 14:31:37');
INSERT INTO `brands` VALUES ('b3489c24-1112-4445-9088-b1d7f5be8e74', 'Adidas', 'Adidas known worldwide for their amazing sport models', '', '2020-08-18 01:00:02', '2020-08-18 01:00:02');
INSERT INTO `brands` VALUES ('f4aad326-103e-4641-9cd5-076a25b45321', 'Nike', '', '', '2020-08-18 01:00:02', '2020-08-18 01:00:02');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('44125d8e-111b-4d8d-b3c2-e74cc96b3221', 'Music', '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL, NULL);
INSERT INTO `categories` VALUES ('a47a9578-f90a-4f4b-8bd9-a505b690fcdd', 'Sport', '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL, NULL);

-- ----------------------------
-- Table structure for category_shops
-- ----------------------------
DROP TABLE IF EXISTS `category_shops`;
CREATE TABLE `category_shops`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `shopId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `categoryId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopId`(`shopId`) USING BTREE,
  INDEX `categoryId`(`categoryId`) USING BTREE,
  CONSTRAINT `category_shops_ibfk_1` FOREIGN KEY (`shopId`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `category_shops_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_shops
-- ----------------------------
INSERT INTO `category_shops` VALUES ('01c7f1d1-57a8-48c6-b85e-6d95ffab4b01', 'b2675334-6298-4c96-a7ba-d57ecf417365', 'a47a9578-f90a-4f4b-8bd9-a505b690fcdd', '2020-09-25 11:10:46', '2020-09-25 11:10:46');
INSERT INTO `category_shops` VALUES ('0e295d83-ad8c-4dce-a707-43f185514f50', '4a93d068-c90e-4bab-b9d2-b35da84dffd8', 'a47a9578-f90a-4f4b-8bd9-a505b690fcdd', '2020-09-25 11:07:11', '2020-09-25 11:07:11');
INSERT INTO `category_shops` VALUES ('594628f2-7b0d-49ee-b65b-e50d474c883a', 'b2675334-6298-4c96-a7ba-d57ecf417365', '44125d8e-111b-4d8d-b3c2-e74cc96b3221', '2020-09-25 11:10:46', '2020-09-25 11:10:46');
INSERT INTO `category_shops` VALUES ('9206ffde-052f-4770-8a3c-962273acf078', '4a93d068-c90e-4bab-b9d2-b35da84dffd8', '44125d8e-111b-4d8d-b3c2-e74cc96b3221', '2020-09-25 11:07:11', '2020-09-25 11:07:11');

-- ----------------------------
-- Table structure for collection_releases
-- ----------------------------
DROP TABLE IF EXISTS `collection_releases`;
CREATE TABLE `collection_releases`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `releaseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `collectionId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `releaseId`(`releaseId`) USING BTREE,
  INDEX `collectionId`(`collectionId`) USING BTREE,
  CONSTRAINT `collection_releases_ibfk_1` FOREIGN KEY (`releaseId`) REFERENCES `releases` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `collection_releases_ibfk_2` FOREIGN KEY (`collectionId`) REFERENCES `collections` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for collection_shops
-- ----------------------------
DROP TABLE IF EXISTS `collection_shops`;
CREATE TABLE `collection_shops`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `shopId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `collectionId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `linkText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `linkUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopId`(`shopId`) USING BTREE,
  INDEX `collectionId`(`collectionId`) USING BTREE,
  CONSTRAINT `collection_shops_ibfk_1` FOREIGN KEY (`shopId`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `collection_shops_ibfk_2` FOREIGN KEY (`collectionId`) REFERENCES `collections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for collections
-- ----------------------------
DROP TABLE IF EXISTS `collections`;
CREATE TABLE `collections`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `imgUrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `brand` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `brand`(`brand`) USING BTREE,
  CONSTRAINT `collections_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collections
-- ----------------------------
INSERT INTO `collections` VALUES ('2d226ba4-c451-418a-9fec-c17b35a94b5f', 'Adidas Consortium', NULL, 'b3489c24-1112-4445-9088-b1d7f5be8e74', '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL);
INSERT INTO `collections` VALUES ('58d5891f-3b58-4658-ae47-798e36e47090', 'Adidas Ultra Boost', NULL, 'b3489c24-1112-4445-9088-b1d7f5be8e74', '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL);
INSERT INTO `collections` VALUES ('5d378a8c-b764-483b-9e27-6113e9ae6288', 'Fila Light Strike', NULL, '6079e5b0-c8c5-47d1-9fc2-27109501f422', '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL);
INSERT INTO `collections` VALUES ('7f23e5b7-2cfa-44c6-abca-727e67162805', 'Adidas EQT', NULL, 'b3489c24-1112-4445-9088-b1d7f5be8e74', '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL);
INSERT INTO `collections` VALUES ('e7df5b5a-ace6-495c-9aac-3e86e9642048', 'Fila Blue Shelter', NULL, '6079e5b0-c8c5-47d1-9fc2-27109501f422', '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL);
INSERT INTO `collections` VALUES ('eccc4970-c772-4304-b5c5-8407cdeaaebe', 'Adidas Originals', NULL, 'b3489c24-1112-4445-9088-b1d7f5be8e74', '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL);

-- ----------------------------
-- Table structure for companies
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `philhealth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `isDeleted` int(0) NULL DEFAULT 0,
  `createdBy` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `updatedBy` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of companies
-- ----------------------------
INSERT INTO `companies` VALUES ('0f9e3fda-d950-4125-9213-4911031d94cf', 'Schaden - Sawayn', '5228 Cooper Squares', '724.786.7213 x692', 'CZ1700500650067198922557', 'EE894215658270011739', 'CH693566475P9Y5Z37976', 0, '48e40a9c-c5e9-4d63-9aba-b77cdf4ca67b', NULL, '2020-08-18 01:00:02', '2020-08-18 01:00:02');
INSERT INTO `companies` VALUES ('399aa7f3-2194-4812-b50c-a2a17aee91af', 'Pfeffer - Mayert', '222 Effertz Mountains', '(935) 111-3736 x5565', 'JO13DZQD0011068810229890007606', 'GR72025433395655M67B9C15965', 'MD754876BFQ93255U2359526', 0, '48e40a9c-c5e9-4d63-9aba-b77cdf4ca67b', NULL, '2020-08-18 01:00:02', '2020-08-18 01:00:02');
INSERT INTO `companies` VALUES ('50826f93-9a64-4d1f-b24e-635bc13c709b', 'Pfeffer, Maggio and Olson', '972 Leta Plains', '1-961-192-6435 x7927', 'AE035825043035011043875', 'SA9467TU0596015IP5718G5D', 'CR5600402300440909266', 0, '48e40a9c-c5e9-4d63-9aba-b77cdf4ca67b', NULL, '2020-08-18 01:00:02', '2020-08-18 01:00:02');
INSERT INTO `companies` VALUES ('67e601a0-e618-4798-beb3-47875ad58d44', 'Goyette, Okuneva and Waelchi', '3488 Carmel Walk', '1-039-837-3720 x0533', 'SA1474991922618311B4D409', 'GE91C30162900985307007', 'CZ5818006411470156210061', 0, '48e40a9c-c5e9-4d63-9aba-b77cdf4ca67b', NULL, '2020-08-18 01:00:02', '2020-08-18 01:00:02');
INSERT INTO `companies` VALUES ('7a777f8e-6785-4463-8f3b-93e4e5b23b9f', 'Lang LLC', '010 Hills Dam', '098-494-7844 x5124', 'SK5600600407240099908024', 'MU06IBRY4007002461870021528XRA', 'ES0944235303846031914012', 0, '48e40a9c-c5e9-4d63-9aba-b77cdf4ca67b', NULL, '2020-08-18 01:00:02', '2020-08-18 01:00:02');

-- ----------------------------
-- Table structure for deals
-- ----------------------------
DROP TABLE IF EXISTS `deals`;
CREATE TABLE `deals`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `startDate` datetime(0) NULL DEFAULT NULL,
  `endDate` datetime(0) NULL DEFAULT NULL,
  `salePercentage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `promoCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `displayOnSale` tinyint(1) NULL DEFAULT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shopId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `startTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `endTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `trackedUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bitlyUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopId`(`shopId`) USING BTREE,
  CONSTRAINT `deals_ibfk_1` FOREIGN KEY (`shopId`) REFERENCES `shops` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of deals
-- ----------------------------
INSERT INTO `deals` VALUES ('485bf6c0-95c5-4030-9b16-1d89271f30b6', 'www.shops.com', '2020-09-25 03:00:00', '2020-09-26 03:00:00', '23', 'Live', '23', NULL, 1, 'https://s3.us-east-2.amazonaws.com/shopping.uy/1601033250496.jpg', 'b2675334-6298-4c96-a7ba-d57ecf417365', '2020-09-25 11:27:43', '2020-09-25 11:27:43', '04:19', '05:24', 'http://www.google.comwww.shops.com', 'https://bit.ly/3j1xXgU');

-- ----------------------------
-- Table structure for layout_header_columns
-- ----------------------------
DROP TABLE IF EXISTS `layout_header_columns`;
CREATE TABLE `layout_header_columns`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `layoutId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `layoutId`(`layoutId`) USING BTREE,
  CONSTRAINT `layout_header_columns_ibfk_1` FOREIGN KEY (`layoutId`) REFERENCES `layouts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for layout_ourpartners_tab_slides
-- ----------------------------
DROP TABLE IF EXISTS `layout_ourpartners_tab_slides`;
CREATE TABLE `layout_ourpartners_tab_slides`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `entityId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `layoutOurpartnersTabId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `layoutOurpartnersTabId`(`layoutOurpartnersTabId`) USING BTREE,
  CONSTRAINT `layout_ourpartners_tab_slides_ibfk_1` FOREIGN KEY (`layoutOurpartnersTabId`) REFERENCES `layout_ourpartners_tabs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of layout_ourpartners_tab_slides
-- ----------------------------
INSERT INTO `layout_ourpartners_tab_slides` VALUES ('53dfddab-4511-4b63-a9cb-02e99c8064a6', '5c27ea77-4d72-4e4c-b10b-6a2fe83a8e99', 'offer', 'wer', NULL, '2020-09-25 15:02:32', '2020-09-25 15:02:32');
INSERT INTO `layout_ourpartners_tab_slides` VALUES ('f33330d7-8465-4d85-b59b-1b48a7a138d0', '5c27ea77-4d72-4e4c-b10b-6a2fe83a8e99', 'offer', 'dfere', NULL, '2020-09-25 15:02:51', '2020-09-25 15:02:51');

-- ----------------------------
-- Table structure for layout_ourpartners_tabs
-- ----------------------------
DROP TABLE IF EXISTS `layout_ourpartners_tabs`;
CREATE TABLE `layout_ourpartners_tabs`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `layoutId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `layoutId`(`layoutId`) USING BTREE,
  CONSTRAINT `layout_ourpartners_tabs_ibfk_1` FOREIGN KEY (`layoutId`) REFERENCES `layouts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for layout_slides
-- ----------------------------
DROP TABLE IF EXISTS `layout_slides`;
CREATE TABLE `layout_slides`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `entityType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `entityId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `layoutId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `layoutId`(`layoutId`) USING BTREE,
  CONSTRAINT `layout_slides_ibfk_1` FOREIGN KEY (`layoutId`) REFERENCES `layouts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of layout_slides
-- ----------------------------
INSERT INTO `layout_slides` VALUES ('89c86bf4-9d2a-43d9-bf00-486dc0d18a4a', 'offer', 'https://s3.us-east-2.amazonaws.com/shopping.uy/1601045521118.jpg', '77947967-2346-4d1d-8fe4-6ab914563c63', 'wewwe', '362d9198-15dd-11e9-bcb7-12866a7f41c6', '2020-09-25 14:52:17', '2020-09-25 14:52:17');
INSERT INTO `layout_slides` VALUES ('e00b23b4-8148-4a7c-89c7-a53d0d0ae39b', 'offer', 'https://s3.us-east-2.amazonaws.com/shopping.uy/1601045521118.jpg', '77947967-2346-4d1d-8fe4-6ab914563c63', 'wewwe', NULL, '2020-09-25 14:52:15', '2020-09-25 14:52:17');

-- ----------------------------
-- Table structure for layouts
-- ----------------------------
DROP TABLE IF EXISTS `layouts`;
CREATE TABLE `layouts`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `page` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `headerImgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `headerLink` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `headerDisplay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sliderDisplay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `hottestDisplay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `headerDisplayOnPage` tinyint(1) NULL DEFAULT NULL,
  `sliderDisplayOnPage` tinyint(1) NULL DEFAULT NULL,
  `hottestDisplayOnPage` tinyint(1) NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `headerLabel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `headingImgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `layoutMenuJSON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `headingDisplayOnPage` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`, `page`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of layouts
-- ----------------------------
INSERT INTO `layouts` VALUES ('362d9198-15dd-11e9-bcb7-12866a7f41c6', 'home', 'Home', NULL, NULL, 'https://s3.us-east-2.amazonaws.com/shopping.uy/1597922955706.jpg', 'http://a.com', 'top', 'top', NULL, 1, 0, NULL, '2020-08-18 01:00:02', '2020-09-25 14:52:15', NULL, NULL, NULL, 1);
INSERT INTO `layouts` VALUES ('4fc5aed4-15de-11e9-bcb7-12866a7f41c6', 'brands', 'Brands', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL, NULL, NULL, 1);
INSERT INTO `layouts` VALUES ('5a3d0d52-15de-11e9-bcb7-12866a7f41c6', 'styles', 'Styles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL, NULL, NULL, 1);
INSERT INTO `layouts` VALUES ('639ef3aa-15de-11e9-bcb7-12866a7f41c6', 'customized', 'Customized', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL, NULL, NULL, 1);
INSERT INTO `layouts` VALUES ('73808f2d-15de-11e9-bcb7-12866a7f41c6', 'blogs', 'Blogs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL, NULL, NULL, 1);
INSERT INTO `layouts` VALUES ('7fc6a5c5-15de-11e9-bcb7-12866a7f41c6', 'release_calendar', 'Release Calendar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL, NULL, NULL, 1);
INSERT INTO `layouts` VALUES ('7fc6a5c5-15de-11e9-bcb7-12866a7f41i6', 'sales', 'Sales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-25 11:59:29', '2020-09-25 11:59:29', NULL, NULL, NULL, 1);
INSERT INTO `layouts` VALUES ('7fc6a5c5-15de-11e9-bcb7-12866a7f41i8', 'shops', 'Shops', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-25 11:59:55', '2020-09-25 11:59:55', NULL, NULL, NULL, 1);
INSERT INTO `layouts` VALUES ('7fc6a5c5-15de-11e9-bcb7-12866a7f41i9', 'contact', 'Contact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-25 12:00:31', '2020-09-25 12:00:31', NULL, NULL, NULL, 1);
INSERT INTO `layouts` VALUES ('7fc6a5c5-15de-11e9-bcb7-12866a7f41r6', 'releases', 'Releases', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-25 11:57:49', '2020-09-25 11:57:49', NULL, NULL, NULL, 1);
INSERT INTO `layouts` VALUES ('7fc6a5c5-15de-11e9-bcb7-12866a7f41u6', 'categories', 'Categories', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-25 11:59:06', '2020-09-25 11:59:06', NULL, NULL, NULL, 1);
INSERT INTO `layouts` VALUES ('bcfbb157-15de-11e9-bcb7-12866a7f41c6', 'whats_new', 'What\'s New', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for offer_links
-- ----------------------------
DROP TABLE IF EXISTS `offer_links`;
CREATE TABLE `offer_links`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `offerId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trackedUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bitlyUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `offerId`(`offerId`) USING BTREE,
  CONSTRAINT `offer_links_ibfk_1` FOREIGN KEY (`offerId`) REFERENCES `offers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of offer_links
-- ----------------------------
INSERT INTO `offer_links` VALUES ('8b74ff76-f416-4dac-be49-b3da3e01fe34', 'werw', 'www.google.com', '77947967-2346-4d1d-8fe4-6ab914563c63', '2020-09-25 12:22:22', '2020-09-25 12:22:22', 'http://www.google.comwww.google.com', 'https://bit.ly/2EwhKRR');
INSERT INTO `offer_links` VALUES ('9150d556-26c1-4a33-8aef-a78f1a73db8f', 'werw', '34', 'd092ff55-d6be-49e9-8259-ad267972a74d', '2020-09-25 14:17:02', '2020-09-25 14:17:02', 'http://www.google.com34', 'https://bit.ly/3mQ8f1e');
INSERT INTO `offer_links` VALUES ('9d27d1c8-5826-4f39-b5e1-b83e01417618', 'Get it TEST', 'wewrerw', '5c27ea77-4d72-4e4c-b10b-6a2fe83a8e99', '2020-09-25 10:44:59', '2020-09-25 10:44:59', 'undefinedwewrerw', NULL);

-- ----------------------------
-- Table structure for offers
-- ----------------------------
DROP TABLE IF EXISTS `offers`;
CREATE TABLE `offers`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shipping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `offerDate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `priceUSD` double NULL DEFAULT NULL,
  `priceGBP` double NULL DEFAULT NULL,
  `priceEUR` double NULL DEFAULT NULL,
  `salePercentage` double NULL DEFAULT NULL,
  `raffle` tinyint(1) NULL DEFAULT NULL,
  `raffleStart` datetime(0) NULL DEFAULT NULL,
  `raffleEnd` datetime(0) NULL DEFAULT NULL,
  `displayWhatsNew` tinyint(1) NULL DEFAULT 0,
  `displayOnSale` tinyint(1) NULL DEFAULT 0,
  `shopId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `releaseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `releaseTime` datetime(0) NULL DEFAULT NULL,
  `countries` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopId`(`shopId`) USING BTREE,
  INDEX `releaseId`(`releaseId`) USING BTREE,
  CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`shopId`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `offers_ibfk_2` FOREIGN KEY (`releaseId`) REFERENCES `releases` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of offers
-- ----------------------------
INSERT INTO `offers` VALUES ('5c27ea77-4d72-4e4c-b10b-6a2fe83a8e99', 'available', 'worldwide', '2020-08-18 01:00:02', 90, 90, 90, 0, 0, NULL, NULL, 0, 0, '4a93d068-c90e-4bab-b9d2-b35da84dffd8', '2d226ba4-c451-418a-9fec-c17b35a94b5f', '2018-11-29 16:08:58', '2020-09-25 10:44:59', NULL, NULL, NULL);
INSERT INTO `offers` VALUES ('77947967-2346-4d1d-8fe4-6ab914563c63', 'live', 'Worldwide', '2020-09-25 12:22:22', 50, NULL, NULL, 0, 1, NULL, '2020-09-25 05:00:00', 0, 0, 'b2675334-6298-4c96-a7ba-d57ecf417365', '2d226ba4-c451-418a-9fec-c17b35a94b5f', '2020-09-25 12:22:22', '2020-09-25 12:22:22', NULL, '', 'BST');
INSERT INTO `offers` VALUES ('d092ff55-d6be-49e9-8259-ad267972a74d', 'available', 'Worldwide', '2020-09-25 14:17:02', 34, 34, 34, 0, 0, NULL, NULL, 1, 0, 'b2675334-6298-4c96-a7ba-d57ecf417365', 'b7db21c3-61e3-4078-8b42-a44e4cb5ed7e', '2020-09-25 14:17:02', '2020-09-25 14:17:02', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for release_images
-- ----------------------------
DROP TABLE IF EXISTS `release_images`;
CREATE TABLE `release_images`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `imgUrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `releaseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `releaseId`(`releaseId`) USING BTREE,
  CONSTRAINT `release_images_ibfk_1` FOREIGN KEY (`releaseId`) REFERENCES `releases` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of release_images
-- ----------------------------
INSERT INTO `release_images` VALUES ('3d226ba4-c451-418b-9fec-c17b35a94c5h', NULL, 'x', '2d226ba4-c451-418a-9fec-c17b35a94b5f', '2020-08-18 01:00:02', '2020-08-18 01:00:02');
INSERT INTO `release_images` VALUES ('feb1d2ba-cb13-4f4b-bb17-37ffd1e64006', NULL, 'https://s3.us-east-2.amazonaws.com/shopping.uy/1601043422127.jpg', 'b7db21c3-61e3-4078-8b42-a44e4cb5ed7e', '2020-09-25 14:17:03', '2020-09-25 14:17:03');

-- ----------------------------
-- Table structure for releases
-- ----------------------------
DROP TABLE IF EXISTS `releases`;
CREATE TABLE `releases`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `releaseDate` datetime(0) NULL DEFAULT NULL,
  `hot` tinyint(1) NULL DEFAULT NULL,
  `customized` tinyint(1) NULL DEFAULT NULL,
  `children` tinyint(1) NULL DEFAULT NULL,
  `hiddenDashboard` tinyint(1) NULL DEFAULT NULL,
  `priceUSD` double NULL DEFAULT NULL,
  `priceGBP` double NULL DEFAULT NULL,
  `priceEUR` double NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mainImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `styleId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `collectionId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `supplierColor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `styleId`(`styleId`) USING BTREE,
  INDEX `collectionId`(`collectionId`) USING BTREE,
  CONSTRAINT `releases_ibfk_1` FOREIGN KEY (`styleId`) REFERENCES `styles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `releases_ibfk_2` FOREIGN KEY (`collectionId`) REFERENCES `collections` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of releases
-- ----------------------------
INSERT INTO `releases` VALUES ('2d226ba4-c451-418a-9fec-c17b35a94b5f', 'abc-asd-123', 'Adidas Consortium', 'new release adidas', 'blue', '2020-08-24 16:08:58', 1, 0, NULL, NULL, 50, 50, 50, 'm', NULL, NULL, '94f6a741-205c-46d7-a3d9-29a6e51416e4', NULL, '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL, NULL);
INSERT INTO `releases` VALUES ('b7db21c3-61e3-4078-8b42-a44e4cb5ed7e', 'werw', 'werw', '', 'black,blue', '2020-09-26 03:00:00', 1, 1, NULL, 0, 23, 32, 23, 'c', 'https://s3.us-east-2.amazonaws.com/shopping.uy/1601043422127.jpg', NULL, '15808144-845c-4f00-84fc-8ab1ca5421e0', 'eccc4970-c772-4304-b5c5-8407cdeaaebe', '2020-09-26 03:00:00', '2020-09-25 05:17:01', 'werw-werw', 'wer');

-- ----------------------------
-- Table structure for sequelizemeta
-- ----------------------------
DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE `sequelizemeta`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequelizemeta
-- ----------------------------
INSERT INTO `sequelizemeta` VALUES ('001-users.js');
INSERT INTO `sequelizemeta` VALUES ('002-company.js');
INSERT INTO `sequelizemeta` VALUES ('003-create-shop.js');
INSERT INTO `sequelizemeta` VALUES ('004-create-category.js');
INSERT INTO `sequelizemeta` VALUES ('005-create-brands.js');
INSERT INTO `sequelizemeta` VALUES ('006-create-style.js');
INSERT INTO `sequelizemeta` VALUES ('007-create-collections.js');
INSERT INTO `sequelizemeta` VALUES ('008-create-releases.js');
INSERT INTO `sequelizemeta` VALUES ('009-create-release-images.js');
INSERT INTO `sequelizemeta` VALUES ('010-create-offer.js');
INSERT INTO `sequelizemeta` VALUES ('011-create-shop-images.js');
INSERT INTO `sequelizemeta` VALUES ('012-create-shop-working_hours.js');
INSERT INTO `sequelizemeta` VALUES ('013-create-blogs.js');
INSERT INTO `sequelizemeta` VALUES ('014-create-deals.js');
INSERT INTO `sequelizemeta` VALUES ('015-create-urls.js');
INSERT INTO `sequelizemeta` VALUES ('016-create-style_shops.js');
INSERT INTO `sequelizemeta` VALUES ('017-create-brand_shops.js');
INSERT INTO `sequelizemeta` VALUES ('018-create-tasks.js');
INSERT INTO `sequelizemeta` VALUES ('019-create-collection_shops.js');
INSERT INTO `sequelizemeta` VALUES ('020-create-collection_releases.js');
INSERT INTO `sequelizemeta` VALUES ('021-create-layout.js');
INSERT INTO `sequelizemeta` VALUES ('022-create-layout-slides.js');
INSERT INTO `sequelizemeta` VALUES ('024-create-layout-header_columns.js');
INSERT INTO `sequelizemeta` VALUES ('025-create-offer-links.js');
INSERT INTO `sequelizemeta` VALUES ('026-create-settings.js');
INSERT INTO `sequelizemeta` VALUES ('027-create-layout-ourpartners-tabs.js');
INSERT INTO `sequelizemeta` VALUES ('028-create-layout-ourpartners-tab-slides.js');
INSERT INTO `sequelizemeta` VALUES ('029-create-blog-images.js');
INSERT INTO `sequelizemeta` VALUES ('030-create-shop-categories.js');
INSERT INTO `sequelizemeta` VALUES ('031-add-category-fields.js');
INSERT INTO `sequelizemeta` VALUES ('032-create-style-categories.js');
INSERT INTO `sequelizemeta` VALUES ('033-shop-add-default-offer-label.js');
INSERT INTO `sequelizemeta` VALUES ('034-deals-add-fields-time.js');
INSERT INTO `sequelizemeta` VALUES ('035-modify-offer.js');
INSERT INTO `sequelizemeta` VALUES ('036-add-layout-header-label.js');
INSERT INTO `sequelizemeta` VALUES ('037-offer-drop-description.js');
INSERT INTO `sequelizemeta` VALUES ('038-blog-images-add-position.js');
INSERT INTO `sequelizemeta` VALUES ('039-drop-shop-images.js');
INSERT INTO `sequelizemeta` VALUES ('040-offer-add-release-time.js');
INSERT INTO `sequelizemeta` VALUES ('041-layout-add-heading-img-url.js');
INSERT INTO `sequelizemeta` VALUES ('042-shop-working-hours-add-off-work.js');
INSERT INTO `sequelizemeta` VALUES ('043-shop-add-type.js');
INSERT INTO `sequelizemeta` VALUES ('044-layout-add-menu-json.js');
INSERT INTO `sequelizemeta` VALUES ('044-offer-links-add-tracked-url.js');
INSERT INTO `sequelizemeta` VALUES ('046-offer-links-add-bitly-url.js');
INSERT INTO `sequelizemeta` VALUES ('047-release-add-slug.js');
INSERT INTO `sequelizemeta` VALUES ('048-release-clean-slug.js');
INSERT INTO `sequelizemeta` VALUES ('049-add-collection-description.js');
INSERT INTO `sequelizemeta` VALUES ('050-release-add-supplier_color.js');
INSERT INTO `sequelizemeta` VALUES ('051-shop-add-slug.js');
INSERT INTO `sequelizemeta` VALUES ('052-shop-clean-slug.js');
INSERT INTO `sequelizemeta` VALUES ('053-layout-add-heading-display-on-page.js');
INSERT INTO `sequelizemeta` VALUES ('054-deals-change-percentage.js');
INSERT INTO `sequelizemeta` VALUES ('055-deals-add-bitly-url.js');
INSERT INTO `sequelizemeta` VALUES ('056-shop-add-more-images.js');
INSERT INTO `sequelizemeta` VALUES ('057-release-change-description-size.js');
INSERT INTO `sequelizemeta` VALUES ('058-offer-add-shipping-countries.js');
INSERT INTO `sequelizemeta` VALUES ('059-offer-fix-shipping-countries.js');
INSERT INTO `sequelizemeta` VALUES ('060-offer-add-timezone.js');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shop_working_hours
-- ----------------------------
DROP TABLE IF EXISTS `shop_working_hours`;
CREATE TABLE `shop_working_hours`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `dayOfWeek` int(0) NULL DEFAULT NULL,
  `openHour` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `closeHour` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shopId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `offWork` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopId`(`shopId`) USING BTREE,
  CONSTRAINT `shop_working_hours_ibfk_1` FOREIGN KEY (`shopId`) REFERENCES `shops` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_working_hours
-- ----------------------------
INSERT INTO `shop_working_hours` VALUES ('6999be81-8f9e-4531-ab4f-b4883932903c', NULL, NULL, NULL, 'b2675334-6298-4c96-a7ba-d57ecf417365', '2020-09-25 11:10:46', '2020-09-25 11:10:46', 0);

-- ----------------------------
-- Table structure for shops
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `siteUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `zipCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shippingDetails` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `shippingCountries` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `countries` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `trackingListBaseUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `showOnRegion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mainImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  `rank` int(0) NULL DEFAULT NULL,
  `parent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isParent` tinyint(1) NULL DEFAULT 0,
  `lat` float NULL DEFAULT NULL,
  `lon` float NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `defaultOfferLabel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `smallImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `headerImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('4a93d068-c90e-4bab-b9d2-b35da84dffd8', 'Foot Locker', NULL, NULL, 'asd', 'France', 'Europe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, NULL, 0, 0, 0, '2020-08-18 01:00:02', '2020-09-25 11:07:16', NULL, 'physical', 'foot-locker', NULL, NULL);
INSERT INTO `shops` VALUES ('63c2a677-efa0-4815-b954-4b8d7ecb2c8d', 'Burn Rubber', NULL, NULL, 'asd', 'USA', 'America', 'USD', NULL, 'worldwide', NULL, NULL, NULL, NULL, NULL, 1, 5, NULL, 0, NULL, NULL, '2020-08-18 01:00:02', '2020-08-18 01:00:02', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `shops` VALUES ('b2675334-6298-4c96-a7ba-d57ecf417365', 'New Shop', NULL, NULL, NULL, NULL, NULL, 'USD', NULL, NULL, 'Worldwide', NULL, 'http://www.google.com', 'USA', 'https://s3.us-east-2.amazonaws.com/shopping.uy/1601032242785.jpg', 1, NULL, NULL, 0, 0, 0, '2020-09-25 11:10:46', '2020-09-25 11:27:58', 'werw', 'virtual', 'new-shop', 'https://s3.us-east-2.amazonaws.com/shopping.uy/1601032243089.jpg', 'https://s3.us-east-2.amazonaws.com/shopping.uy/1601032243028.jpg');

-- ----------------------------
-- Table structure for style_categories
-- ----------------------------
DROP TABLE IF EXISTS `style_categories`;
CREATE TABLE `style_categories`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `categoryId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `styleId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categoryId`(`categoryId`) USING BTREE,
  INDEX `styleId`(`styleId`) USING BTREE,
  CONSTRAINT `style_categories_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `style_categories_ibfk_2` FOREIGN KEY (`styleId`) REFERENCES `styles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of style_categories
-- ----------------------------
INSERT INTO `style_categories` VALUES ('6d9fa536-f90c-4e77-8615-1be939a1b56d', '44125d8e-111b-4d8d-b3c2-e74cc96b3221', 'd8b6286b-6b58-490b-9c17-a25e34eb9648', '2020-09-25 10:28:15', '2020-09-25 10:28:15');
INSERT INTO `style_categories` VALUES ('ebff1199-1b70-4e4d-b4e9-225fed933e0b', '44125d8e-111b-4d8d-b3c2-e74cc96b3221', '15808144-845c-4f00-84fc-8ab1ca5421e0', '2020-09-25 10:28:32', '2020-09-25 10:28:32');

-- ----------------------------
-- Table structure for style_shops
-- ----------------------------
DROP TABLE IF EXISTS `style_shops`;
CREATE TABLE `style_shops`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `shopId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `styleId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `linkText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `linkUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopId`(`shopId`) USING BTREE,
  INDEX `styleId`(`styleId`) USING BTREE,
  CONSTRAINT `style_shops_ibfk_1` FOREIGN KEY (`shopId`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `style_shops_ibfk_2` FOREIGN KEY (`styleId`) REFERENCES `styles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of style_shops
-- ----------------------------
INSERT INTO `style_shops` VALUES ('4920fc87-6c9d-4456-a02a-d6b7ab98eb39', '63c2a677-efa0-4815-b954-4b8d7ecb2c8d', '15808144-845c-4f00-84fc-8ab1ca5421e0', NULL, NULL, '2020-09-25 10:29:13', '2020-09-25 10:29:13');

-- ----------------------------
-- Table structure for styles
-- ----------------------------
DROP TABLE IF EXISTS `styles`;
CREATE TABLE `styles`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `parent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `category` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `brand` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `isDeleted` tinyint(1) NULL DEFAULT 0,
  `isParent` tinyint(1) NULL DEFAULT 0,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `category`(`category`) USING BTREE,
  INDEX `brand`(`brand`) USING BTREE,
  CONSTRAINT `styles_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `styles_ibfk_2` FOREIGN KEY (`brand`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of styles
-- ----------------------------
INSERT INTO `styles` VALUES ('15808144-845c-4f00-84fc-8ab1ca5421e0', 'NEW', '', '', NULL, 'b3489c24-1112-4445-9088-b1d7f5be8e74', 0, 0, '2020-09-25 10:28:31', '2020-09-25 10:28:54');
INSERT INTO `styles` VALUES ('94f6a741-205c-46d7-a3d9-29a6e51416e4', 'Adidas sport', 'Adidas sport version, a nice option', NULL, 'a47a9578-f90a-4f4b-8bd9-a505b690fcdd', 'f4aad326-103e-4641-9cd5-076a25b45321', 0, 0, '2020-08-18 01:00:02', '2020-08-18 01:00:02');
INSERT INTO `styles` VALUES ('96838987-658f-44f4-95fc-2edc837e98ff', 'Adidas retro', 'Adidas retro version, a really good option', NULL, 'a47a9578-f90a-4f4b-8bd9-a505b690fcdd', 'f4aad326-103e-4641-9cd5-076a25b45321', 0, 0, '2020-08-18 01:00:02', '2020-08-18 01:00:02');
INSERT INTO `styles` VALUES ('d8b6286b-6b58-490b-9c17-a25e34eb9648', 'Parent', 'New Parent', NULL, NULL, 'b3489c24-1112-4445-9088-b1d7f5be8e74', 0, 1, '2020-09-25 10:28:15', '2020-09-25 10:28:15');

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `priority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `responsable` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `responsable`(`responsable`) USING BTREE,
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`responsable`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for urls
-- ----------------------------
DROP TABLE IF EXISTS `urls`;
CREATE TABLE `urls`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `vanityUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of urls
-- ----------------------------
INSERT INTO `urls` VALUES ('81985c4a-5282-4d1c-8af4-f4b105b39914', 'wew', 'wew', '2020-09-25 12:52:13', '2020-09-25 12:52:13');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `middleName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `roleId` int(0) NOT NULL,
  `verificationCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `isVerified` int(0) NULL DEFAULT 0,
  `isDeleted` int(0) NULL DEFAULT 0,
  `createdBy` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `updatedBy` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('48e40a9c-c5e9-4d63-9aba-b77cdf4ca67b', 'Test', 'Developer', 'Super Dev', 'testdev@gmail.com', '$2a$10$YYfyRwDjnbWYLepnDHrf0.BYO0Y1tdSmJayjkJql6KsaFPeomGsMC', 1, 'ba1bfda5-1c27-4755-bd23-36c7a4dbfd2b', 1, 0, '48e40a9c-c5e9-4d63-9aba-b77cdf4ca67b', NULL, '2020-08-18 00:59:55', '2020-08-18 00:59:55');

SET FOREIGN_KEY_CHECKS = 1;
