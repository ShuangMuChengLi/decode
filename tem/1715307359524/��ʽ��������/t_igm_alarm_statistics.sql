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

 Date: 30/04/2024 21:39:44
*/


-- ----------------------------
-- Table structure for t_igm_alarm_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_igm_alarm_statistics";
CREATE TABLE "public"."t_igm_alarm_statistics" (
  "igm_alarm_statistics_id" int8 NOT NULL,
  "dept_no" varchar(32) COLLATE "pg_catalog"."default",
  "dept_name" varchar(128) COLLATE "pg_catalog"."default",
  "alarm_count" int4 DEFAULT 0,
  "unprocessed_count" int4 DEFAULT 0,
  "mark_illegal_count" int4 DEFAULT 0,
  "mark_cancel_count" int4 DEFAULT 0,
  "cancel_today_repetition" int4 DEFAULT 0,
  "cancel_identified" int4 DEFAULT 0,
  "cancel_other" int4 DEFAULT 0,
  "cancel_pedestrian" int4 DEFAULT 0,
  "identified_count" int4 DEFAULT 0,
  "unidentified_count" int4 DEFAULT 0,
  "send_msg_count" int4 DEFAULT 0,
  "unpunish_count" int4 DEFAULT 0,
  "punish_count" int4 DEFAULT 0,
  "punish_warning" int4 DEFAULT 0,
  "punish_fine" int4 DEFAULT 0,
  "statistic_date" date,
  "device_town_code" varchar(32) COLLATE "pg_catalog"."default",
  "device_town_name" varchar(255) COLLATE "pg_catalog"."default",
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
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."dept_no" IS '部门编码';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."dept_name" IS '部门名称';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."alarm_count" IS '预警总数';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."unprocessed_count" IS '未处理总数';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."mark_illegal_count" IS '标记违法总数';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."mark_cancel_count" IS '标记作废总数';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."cancel_today_repetition" IS '作废-当天重复';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."cancel_identified" IS '作废-未识别';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."cancel_other" IS '作废-其他';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."cancel_pedestrian" IS '作废-行人';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."identified_count" IS '已识别总数';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."unidentified_count" IS '未识别总数';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."send_msg_count" IS '短信下发总数';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."unpunish_count" IS '未处罚总总数';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."punish_count" IS '处罚总数';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."punish_warning" IS '处罚-警告';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."punish_fine" IS '处罚-罚款';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."statistic_date" IS '结存日期';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."device_town_code" IS '设备归属街镇编码';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."device_town_name" IS '设备归属街镇';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."remark" IS '备注';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."is_delete" IS '是否删除';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."create_user" IS '创建用户';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."create_department" IS '创建部门';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."create_host" IS '创建IP';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."update_user" IS '更新用户';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."update_department" IS '更新部门';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."update_host" IS '更新IP';
COMMENT ON COLUMN "public"."t_igm_alarm_statistics"."update_time" IS '更新时间';

-- ----------------------------
-- Primary Key structure for table t_igm_alarm_statistics
-- ----------------------------
ALTER TABLE "public"."t_igm_alarm_statistics" ADD CONSTRAINT "t_igm_alarm_statistics_copy_pkey" PRIMARY KEY ("igm_alarm_statistics_id");
