/*
 Navicat Premium Data Transfer

 Source Server         : postgresql_172.19.2.42
 Source Server Type    : PostgreSQL
 Source Server Version : 150004
 Source Host           : 172.19.2.42:6232
 Source Catalog        : xs_igm_server
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 150004
 File Encoding         : 65001

 Date: 30/04/2024 22:17:07
*/


-- ----------------------------
-- Table structure for t_igm_dept_town_rel
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_igm_dept_town_rel";
CREATE TABLE "public"."t_igm_dept_town_rel" (
  "igm_dept_town_rel_id" int8 NOT NULL,
  "device_town_code" varchar(32) COLLATE "pg_catalog"."default",
  "device_town_name" varchar(64) COLLATE "pg_catalog"."default",
  "dept_no" varchar(32) COLLATE "pg_catalog"."default",
  "dept_name" varchar(64) COLLATE "pg_catalog"."default",
  "remark" varchar(512) COLLATE "pg_catalog"."default",
  "is_delete" bool DEFAULT false,
  "create_user" varchar(32) COLLATE "pg_catalog"."default",
  "create_department" varchar(32) COLLATE "pg_catalog"."default",
  "create_host" varchar(32) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "update_user" varchar(32) COLLATE "pg_catalog"."default",
  "update_department" varchar(32) COLLATE "pg_catalog"."default",
  "update_host" varchar(32) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "record_version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."igm_dept_town_rel_id" IS '关联ID';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."device_town_code" IS '街镇编码';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."device_town_name" IS '街镇名称';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."dept_no" IS '部门编码';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."dept_name" IS '部门名称';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."remark" IS '备注（说明）';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."is_delete" IS '是否删除（true-是、false-否）';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."create_user" IS '创建用户';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."create_department" IS '创建部门';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."create_host" IS '创建服务IP';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."update_user" IS '修改用户';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."update_department" IS '修改部门';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."update_host" IS '修改服务IP';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."t_igm_dept_town_rel"."record_version" IS '记录版本号';
COMMENT ON TABLE "public"."t_igm_dept_town_rel" IS '单位-街镇关联信息表';

-- ----------------------------
-- Records of t_igm_dept_town_rel
-- ----------------------------
INSERT INTO "public"."t_igm_dept_town_rel" VALUES (1, '320921101', '陈港镇', '320921170800', '陈港中队', NULL, 'f', NULL, NULL, NULL, '0001-01-01 10:57:13.10284', NULL, NULL, NULL, '0001-01-01 10:57:13.10284', 0);
INSERT INTO "public"."t_igm_dept_town_rel" VALUES (2, '320921402', '省属灌东盐场', '320921170800', '陈港中队', NULL, 'f', 'zhuyj', NULL, NULL, '2024-04-30 10:55:29', NULL, NULL, NULL, '0001-01-01 10:56:11.261848', 0);
INSERT INTO "public"."t_igm_dept_town_rel" VALUES (3, '320921106', '南河镇', '320921170800', '陈港中队', NULL, 'f', NULL, NULL, NULL, '0001-01-01 10:57:13.10284', NULL, NULL, NULL, '0001-01-01 10:57:13.10284', 0);
INSERT INTO "public"."t_igm_dept_town_rel" VALUES (4, '320921107', '运河镇', '320921170600', '运河中队', NULL, 'f', 'zhuyj', NULL, NULL, '2024-04-30 10:55:29', NULL, NULL, NULL, '0001-01-01 10:56:11.261848', 0);
INSERT INTO "public"."t_igm_dept_town_rel" VALUES (5, '320921103', '黄圩镇', '320921170600', '运河中队', NULL, 'f', NULL, NULL, NULL, '0001-01-01 10:57:13.10284', NULL, NULL, NULL, '0001-01-01 10:57:13.10284', 0);
INSERT INTO "public"."t_igm_dept_town_rel" VALUES (6, '320921102', '小尖镇', '320921170500', '小尖中队', NULL, 'f', 'zhuyj', NULL, NULL, '2024-04-30 10:55:29', NULL, NULL, NULL, '0001-01-01 10:56:11.261848', 0);
INSERT INTO "public"."t_igm_dept_town_rel" VALUES (7, '320921104', '大有镇', '320921170700', '大有中队', NULL, 'f', NULL, NULL, NULL, '0001-01-01 10:57:13.10284', NULL, NULL, NULL, '0001-01-01 10:57:13.10284', 0);
INSERT INTO "public"."t_igm_dept_town_rel" VALUES (8, '320921401', '省属黄海农场', '320921170700', '大有中队', NULL, 'f', 'zhuyj', NULL, NULL, '2024-04-30 10:55:29', NULL, NULL, NULL, '0001-01-01 10:56:11.261848', 0);
INSERT INTO "public"."t_igm_dept_town_rel" VALUES (9, '320921100', '响水镇', '320921170400', '县城中队', NULL, 'f', NULL, NULL, NULL, '0001-01-01 10:57:13.10284', NULL, NULL, NULL, '0001-01-01 10:57:13.10284', 0);
INSERT INTO "public"."t_igm_dept_town_rel" VALUES (10, '320921105', '双港镇', '320921170400', '县城中队', NULL, 'f', NULL, NULL, NULL, '0001-01-01 10:57:13.10284', NULL, NULL, NULL, '0001-01-01 10:57:13.10284', 0);
INSERT INTO "public"."t_igm_dept_town_rel" VALUES (11, '320921400', '经济开发区', '320921170400', '县城中队', NULL, 'f', 'zhuyj', NULL, NULL, '2024-04-30 10:55:29', NULL, NULL, NULL, '0001-01-01 10:56:11.261848', 0);

-- ----------------------------
-- Primary Key structure for table t_igm_dept_town_rel
-- ----------------------------
ALTER TABLE "public"."t_igm_dept_town_rel" ADD CONSTRAINT "t_igm_dept_town_rel_pk" PRIMARY KEY ("igm_dept_town_rel_id");
