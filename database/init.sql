-- ========================================================
-- 現代化企業安全郵件系統資料庫結構 (SecureMail Database Schema)
-- 包含完整的補全欄位與 Postfix/Dovecot 整合結構
-- ========================================================

CREATE DATABASE IF NOT EXISTS `securemail` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `securemail`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- --------------------------------------------------------
-- 1. 主網域表 (mail_domain)
-- --------------------------------------------------------
DROP TABLE IF EXISTS `mail_domain`;
CREATE TABLE `mail_domain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT '',
  `imap_server` varchar(255) DEFAULT 'dovecot',
  `app_server` varchar(255) DEFAULT 'web',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `dkim_selector` varchar(64) NOT NULL DEFAULT 'default',
  `dkim_private_key` text DEFAULT NULL,
  `dkim_public_key` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_domain_name` (`domain_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 2. 別名網域表 (alias_domain)
-- --------------------------------------------------------
DROP TABLE IF EXISTS `alias_domain`;
CREATE TABLE `alias_domain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_alias_domain_name` (`domain_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 3. 郵件用戶帳號與權限審核主表 (mail_account)
--    Postfix & Dovecot 與 Webmail / Admin 整合主表
-- --------------------------------------------------------
DROP TABLE IF EXISTS `mail_account`;
CREATE TABLE `mail_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mail_domain_id` bigint(20) NOT NULL,
  `mail_address` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `chinese_name` varchar(255) NOT NULL DEFAULT '',
  `init_password` varchar(255) DEFAULT NULL,
  `md5password` varchar(255) NOT NULL,
  `mail_dir` varchar(255) DEFAULT NULL,
  `quota` int(11) NOT NULL DEFAULT 100 COMMENT 'MB 配額',
  `mail_size` int(11) NOT NULL DEFAULT 20 COMMENT '單信上限 (MB)',
  `recipient_number` int(11) NOT NULL DEFAULT 30 COMMENT '單信收件人數上限',
  `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '帳號是否啟用',
  `reply` tinyint(1) NOT NULL DEFAULT 1 COMMENT '可否回覆',
  `reply_all` tinyint(1) NOT NULL DEFAULT 1 COMMENT '可否全部回覆',
  `forward` tinyint(1) NOT NULL DEFAULT 1 COMMENT '可否轉發',
  `attachment` tinyint(1) NOT NULL DEFAULT 1 COMMENT '可否夾帶附件',
  `attachment_type` varchar(255) NOT NULL DEFAULT '' COMMENT '允許或限制附件類型 (如 doc,pdf,zip)',
  `fixedip` varchar(255) NOT NULL DEFAULT '' COMMENT '綁定固定 IP',
  `fixed_computer_name` varchar(255) NOT NULL DEFAULT '' COMMENT '綁定電腦名稱',
  `whit_list` text COMMENT '白名單',
  `black_list` text COMMENT '黑名單',
  `bcclist` text COMMENT '密件副本強制抄送名單',
  `forbidden_keyword` text COMMENT '禁止發送關鍵字',
  `approval_keyword` text COMMENT '需主管審核關鍵字',
  
  -- 補全 Java 程式碼中使用但舊 SQL 缺失之欄位
  `login_error_count` int(11) NOT NULL DEFAULT 0 COMMENT '連續密碼錯誤次數',
  `has_internet_mail_approver` tinyint(1) NOT NULL DEFAULT 0 COMMENT '有無外網郵件審核人',
  `internet_mail_approver` varchar(255) DEFAULT NULL COMMENT '外網郵件審核人',
  `has_interouapprover` tinyint(1) NOT NULL DEFAULT 0 COMMENT '有無組織內部郵件審核人',
  `interouapprover` varchar(255) DEFAULT NULL COMMENT '組織內部郵件審核人',
  `has_intraouapprover` tinyint(1) NOT NULL DEFAULT 0 COMMENT '有無組織外部郵件審核人',
  `intraouapprover` varchar(255) DEFAULT NULL COMMENT '組織外部郵件審核人',
  `has_keyword_approver` tinyint(1) NOT NULL DEFAULT 0 COMMENT '有無關鍵字郵件審核人',
  `keyword_approver` varchar(255) DEFAULT NULL COMMENT '關鍵字郵件審核人',
  `has_attachment_approver` tinyint(1) NOT NULL DEFAULT 0 COMMENT '有無附件郵件審核人',
  `attachment_approver` varchar(255) DEFAULT NULL COMMENT '附件郵件審核人',
  `has_agent` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否啟用審核代理人',
  `attachment_agent` varchar(255) DEFAULT NULL COMMENT '附件審核代理人',
  `attachment_start_time` datetime DEFAULT NULL COMMENT '附件代理開始時間',
  `attachment_end_time` datetime DEFAULT NULL COMMENT '附件代理結束時間',
  `internet_agent` varchar(255) DEFAULT NULL COMMENT '外網郵件審核代理人',
  `internet_start_time` datetime DEFAULT NULL COMMENT '外網代理開始時間',
  `internet_end_time` datetime DEFAULT NULL COMMENT '外網代理結束時間',
  `keyword_agent` varchar(255) DEFAULT NULL COMMENT '關鍵字審核代理人',
  `keyword_start_time` datetime DEFAULT NULL COMMENT '關鍵字代理開始時間',
  `keyword_end_time` datetime DEFAULT NULL COMMENT '關鍵字代理結束時間',
  `timezone` varchar(64) NOT NULL DEFAULT 'Asia/Taipei' COMMENT '使用者偏好時區',
  `department` varchar(100) DEFAULT NULL COMMENT '組織部門名稱',
  `job_title` varchar(100) DEFAULT NULL COMMENT '職稱職位',
  `phone` varchar(64) DEFAULT NULL COMMENT '公務電話/手機/分機',
  
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_mail_address` (`mail_address`),
  UNIQUE KEY `uk_short_name` (`short_name`),
  KEY `fk_mail_account_domain` (`mail_domain_id`),
  CONSTRAINT `fk_mail_account_domain` FOREIGN KEY (`mail_domain_id`) REFERENCES `mail_domain` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 4. 帳號別名網域映射表 (mail_account_alias_domain)
-- --------------------------------------------------------
DROP TABLE IF EXISTS `mail_account_alias_domain`;
CREATE TABLE `mail_account_alias_domain` (
  `mail_account_id` bigint(20) NOT NULL,
  `alias_domain_id` bigint(20) NOT NULL,
  PRIMARY KEY (`mail_account_id`,`alias_domain_id`),
  KEY `fk_maad_alias_domain` (`alias_domain_id`),
  CONSTRAINT `fk_maad_mail_account` FOREIGN KEY (`mail_account_id`) REFERENCES `mail_account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_maad_alias_domain` FOREIGN KEY (`alias_domain_id`) REFERENCES `alias_domain` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 5. 別名帳號表 (alias_account)
-- --------------------------------------------------------
DROP TABLE IF EXISTS `alias_account`;
CREATE TABLE `alias_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alias_domain_id` bigint(20) NOT NULL,
  `alias_address` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_alias_address` (`alias_address`),
  KEY `fk_alias_account_domain` (`alias_domain_id`),
  CONSTRAINT `fk_alias_account_domain` FOREIGN KEY (`alias_domain_id`) REFERENCES `alias_domain` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 6. 別名帳號與郵件帳號映射表 (alias_account_mail_account)
-- --------------------------------------------------------
DROP TABLE IF EXISTS `alias_account_mail_account`;
CREATE TABLE `alias_account_mail_account` (
  `alias_account_id` bigint(20) NOT NULL,
  `mail_account_id` bigint(20) NOT NULL,
  PRIMARY KEY (`alias_account_id`,`mail_account_id`),
  KEY `fk_aama_mail_account` (`mail_account_id`),
  CONSTRAINT `fk_aama_alias_account` FOREIGN KEY (`alias_account_id`) REFERENCES `alias_account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_aama_mail_account` FOREIGN KEY (`mail_account_id`) REFERENCES `mail_account` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 7. 管理員帳號與角色表 (admin_user & admin_role)
-- --------------------------------------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'ROLE_ADMIN',
  `login_error_count` int(11) NOT NULL DEFAULT 0 COMMENT '連續密碼錯誤次數',
  `account_locked` tinyint(1) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_admin_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 8. 通訊錄聯絡人表 (contacts)
-- --------------------------------------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `middle_name` varchar(100) DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `nick_name` varchar(50) DEFAULT '',
  `title` varchar(50) DEFAULT '',
  `sex` varchar(10) DEFAULT '',
  `email_primary` varchar(255) DEFAULT '',
  `email_alternate` varchar(255) DEFAULT '',
  `gsm_no_primary` varchar(30) DEFAULT '',
  `gsm_no_alternate` varchar(30) DEFAULT '',
  `web_page` varchar(255) DEFAULT '',
  `personal_note` text,
  `work_company` varchar(100) DEFAULT '',
  `work_job_title` varchar(100) DEFAULT '',
  `work_department` varchar(100) DEFAULT '',
  `work_office` varchar(100) DEFAULT '',
  `work_phone` varchar(30) DEFAULT '',
  `work_faks` varchar(30) DEFAULT '',
  `work_address` text,
  `home_address` text,
  `home_phone` varchar(30) DEFAULT '',
  `birth_day` char(2) DEFAULT NULL,
  `birth_month` char(2) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_user` (`username`),
  KEY `idx_contacts_email` (`email_primary`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 9. 通訊錄群組表 (contact_groups & contact_group_objects)
-- --------------------------------------------------------
DROP TABLE IF EXISTS `contact_groups`;
CREATE TABLE `contact_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `short_name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_cg_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `contact_group_objects`;
CREATE TABLE `contact_group_objects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `group_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `contact_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_cgo_user_group` (`username`,`group_id`),
  KEY `idx_cgo_contact` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 10. 行事曆排程與會議管理表 (calendar_events & meeting_attendees)
-- --------------------------------------------------------
DROP TABLE IF EXISTS `calendar_events`;
CREATE TABLE `calendar_events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `location` varchar(255) DEFAULT '',
  `record_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `repeat_type` int(11) DEFAULT 0 COMMENT '0:一次, 1:每日, 2:每週, 3:每兩週, 4:每月, 5:每年',
  `reminder_minutes` int(11) DEFAULT 15,
  `reminder_method` int(11) DEFAULT 1 COMMENT '1:Web 彈窗, 2:郵件提醒',
  `color` varchar(20) DEFAULT '#3b82f6',
  `is_meeting` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否為多人會議',
  `organizer_email` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL COMMENT 'iCalendar UID',
  `status` varchar(20) NOT NULL DEFAULT 'CONFIRMED' COMMENT 'CONFIRMED, CANCELLED, TENTATIVE',
  `last_dismissed_at` datetime DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_ce_user_date` (`username`,`record_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `meeting_attendees`;
CREATE TABLE `meeting_attendees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) unsigned NOT NULL,
  `attendee_email` varchar(255) NOT NULL,
  `attendee_name` varchar(255) DEFAULT '',
  `status` varchar(20) NOT NULL DEFAULT 'PENDING' COMMENT 'PENDING, ACCEPTED, DECLINED, TENTATIVE',
  `reply_comment` varchar(255) DEFAULT '',
  `replied_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ma_event` (`event_id`),
  KEY `idx_ma_attendee` (`attendee_email`),
  CONSTRAINT `fk_ma_event` FOREIGN KEY (`event_id`) REFERENCES `calendar_events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 11. 郵件審核佇列與歷程表記錄 (approval_records)
-- --------------------------------------------------------
DROP TABLE IF EXISTS `approval_records`;
CREATE TABLE `approval_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sender_email` varchar(255) NOT NULL,
  `sender_short_name` varchar(255) NOT NULL,
  `original_to` text NOT NULL,
  `original_cc` text,
  `original_bcc` text,
  `subject` varchar(500) NOT NULL DEFAULT '',
  `body_html` longtext,
  `attachments_json` json DEFAULT NULL,
  `approver_email` varchar(255) NOT NULL,
  `actual_approver_email` varchar(255) NOT NULL,
  `audit_reason_type` varchar(50) NOT NULL COMMENT 'OUTSIDE, ATTACHMENT, KEYWORD, MULTI_LEVEL',
  `matched_keyword` varchar(255) DEFAULT '',
  `status` varchar(20) NOT NULL DEFAULT 'PENDING' COMMENT 'PENDING, APPROVED, REJECTED',
  `rejection_reason` text,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT 0,
  `request_receipt` tinyint(1) NOT NULL DEFAULT 0,
  `is_read_approver` tinyint(1) NOT NULL DEFAULT 0 COMMENT '審核人是否已讀',
  `is_read_sender` tinyint(1) NOT NULL DEFAULT 0 COMMENT '發件人是否已讀',
  `deleted_by_approver` tinyint(1) NOT NULL DEFAULT 0 COMMENT '審核人是否已刪除',
  `deleted_by_sender` tinyint(1) NOT NULL DEFAULT 0 COMMENT '發件人是否已刪除',
  `priority` varchar(10) DEFAULT '3',
  `sensitivity` varchar(10) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `processed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ar_sender` (`sender_email`),
  KEY `idx_ar_approver` (`actual_approver_email`),
  KEY `idx_ar_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 12. 用戶設定與簽名檔 (user_signatures & user_preferences)
-- --------------------------------------------------------
DROP TABLE IF EXISTS `user_signatures`;
CREATE TABLE `user_signatures` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `signature_name` varchar(100) NOT NULL,
  `signature_content` text NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_sig_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `user_preferences`;
CREATE TABLE `user_preferences` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `pref_value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_up_user_kw` (`username`,`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 13. 收信規則過濾表 (mail_sieve, mail_sieve_define, mail_sieve_exec)
-- --------------------------------------------------------
DROP TABLE IF EXISTS `mail_sieve`;
CREATE TABLE `mail_sieve` (
  `sie_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sie_name` varchar(100) NOT NULL DEFAULT '',
  `sie_user` varchar(255) NOT NULL DEFAULT '',
  `sie_type` varchar(20) DEFAULT '1',
  PRIMARY KEY (`sie_id`),
  KEY `idx_sieve_user` (`sie_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `mail_sieve_define`;
CREATE TABLE `mail_sieve_define` (
  `define_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sie_id` bigint(20) NOT NULL,
  `sie_key` varchar(50) DEFAULT '',
  `sie_symbol` varchar(20) DEFAULT '',
  `sie_value` varchar(255) DEFAULT '',
  `sie_sort` int(11) DEFAULT 0,
  PRIMARY KEY (`define_id`),
  KEY `idx_sd_sie_id` (`sie_id`),
  CONSTRAINT `fk_sd_sieve` FOREIGN KEY (`sie_id`) REFERENCES `mail_sieve` (`sie_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `mail_sieve_exec`;
CREATE TABLE `mail_sieve_exec` (
  `exec_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sie_id` bigint(20) NOT NULL,
  `ope_type` varchar(20) DEFAULT '',
  `ope_value` varchar(255) DEFAULT '',
  `sie_box_name` varchar(100) DEFAULT '',
  PRIMARY KEY (`exec_id`),
  KEY `idx_se_sie_id` (`sie_id`),
  CONSTRAINT `fk_se_sieve` FOREIGN KEY (`sie_id`) REFERENCES `mail_sieve` (`sie_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ========================================================
-- 初始測試資料 (Seed Data)
-- ========================================================

-- 1. 預設管理員 (密碼: admin123 -> MD5: 0192023a7bbd73250516f069df18b500)
INSERT INTO `admin_user` (`id`, `username`, `password_hash`, `role`, `enabled`, `account_locked`, `login_error_count`)
VALUES (1, 'admin', '0192023a7bbd73250516f069df18b500', 'ROLE_ADMIN', 1, 0, 0)
ON DUPLICATE KEY UPDATE `username`=`username`;

-- 2. 預設郵件網域
INSERT INTO `mail_domain` (`id`, `domain_name`, `description`, `imap_server`, `app_server`, `active`)
VALUES 
(1, 'sectest.com', '企業主郵件網域', 'dovecot', 'web', 1),
(2, 'mail1.sectest.com', '第一子郵件網域', 'dovecot', 'web', 1)
ON DUPLICATE KEY UPDATE `domain_name`=`domain_name`;

-- 3. 預設別名網域
INSERT INTO `alias_domain` (`id`, `domain_name`, `description`, `active`)
VALUES 
(1, 'sectest.com', '企業主別名網域', 1)
ON DUPLICATE KEY UPDATE `domain_name`=`domain_name`;

-- 4. 預設郵件使用者帳號
-- 密碼 hash 為相容 Dovecot MD5-CRYPT / SSHA / bcrypt，預設密碼均為: user123 (或 testuser123 / admin123)
-- $1$mailsys1$bQhZgN5V7v0Vz2gM3x8Lp1 -> MD5-CRYPT
INSERT INTO `mail_account` (
  `id`, `mail_domain_id`, `mail_address`, `short_name`, `first_name`, `last_name`, `chinese_name`, 
  `init_password`, `md5password`, `mail_dir`, `quota`, `mail_size`, `recipient_number`, `active`, 
  `reply`, `reply_all`, `forward`, `attachment`, `attachment_type`, `fixedip`, `fixed_computer_name`, 
  `whit_list`, `black_list`, `bcclist`, `forbidden_keyword`, `approval_keyword`, 
  `login_error_count`, `has_internet_mail_approver`, `internet_mail_approver`, 
  `has_interouapprover`, `interouapprover`, `has_intraouapprover`, `intraouapprover`, 
  `has_keyword_approver`, `keyword_approver`, `has_attachment_approver`, `attachment_approver`, 
  `has_agent`, `attachment_agent`, `internet_agent`, `keyword_agent`
) VALUES 
(
  1, 1, 'admin@sectest.com', 'admin', '管理員', '系統', '系統管理員',
  'admin123', '$1$mailsys1$bQhZgN5V7v0Vz2gM3x8Lp1', 'admin@sectest.com/', 1000, 50, 100, 1,
  1, 1, 1, 1, '', '', '',
  '', '', '', '機密,密級,極機密', '合同,報價,招標',
  0, 0, NULL,
  0, NULL, 0, NULL,
  0, NULL, 0, NULL,
  0, NULL, NULL, NULL
),
(
  2, 1, 'manager@sectest.com', 'manager', '主管', '部門', '審核主管',
  'manager123', '$1$mailsys1$bQhZgN5V7v0Vz2gM3x8Lp1', 'manager@sectest.com/', 500, 30, 50, 1,
  1, 1, 1, 1, '', '', '',
  '', '', '', '機密,極機密', '',
  0, 0, NULL,
  0, NULL, 0, NULL,
  0, NULL, 0, NULL,
  0, NULL, NULL, NULL
),
(
  3, 1, 'user1@sectest.com', 'user1', '員工1', '測試', '測試員工1',
  'user123', '$1$mailsys1$bQhZgN5V7v0Vz2gM3x8Lp1', 'user1@sectest.com/', 200, 20, 30, 1,
  1, 1, 1, 1, 'doc,docx,pdf,xls,xlsx,zip,rar,png,jpg', '', '',
  '', 'blocked@example.com', '', '禁止轉發,外洩', '合同,採購,報價,機密',
  0, 1, 'manager@sectest.com',
  0, NULL, 0, NULL,
  1, 'manager@sectest.com', 1, 'manager@sectest.com',
  0, NULL, NULL, NULL
),
(
  4, 1, 'user2@sectest.com', 'user2', '員工2', '測試', '測試員工2',
  'user123', '$1$mailsys1$bQhZgN5V7v0Vz2gM3x8Lp1', 'user2@sectest.com/', 200, 20, 30, 1,
  1, 1, 1, 1, '', '', '',
  '', '', '', '', '',
  0, 0, NULL,
  0, NULL, 0, NULL,
  0, NULL, 0, NULL,
  0, NULL, NULL, NULL
),
(
  5, 1, 'agent@sectest.com', 'agent', '代理人', '審核', '審核代理人',
  'agent123', '$1$mailsys1$bQhZgN5V7v0Vz2gM3x8Lp1', 'agent@sectest.com/', 200, 20, 30, 1,
  1, 1, 1, 1, '', '', '',
  '', '', '', '', '',
  0, 0, NULL,
  0, NULL, 0, NULL,
  0, NULL, 0, NULL,
  0, NULL, NULL, NULL
)
ON DUPLICATE KEY UPDATE `mail_address`=`mail_address`;

-- 5. 關聯別名網域
INSERT INTO `mail_account_alias_domain` (`mail_account_id`, `alias_domain_id`)
VALUES (1, 1), (2, 1), (3, 1), (4, 1), (5, 1)
ON DUPLICATE KEY UPDATE `mail_account_id`=`mail_account_id`;

-- 6. 預設通訊錄聯絡人
INSERT INTO `contacts` (`id`, `username`, `first_name`, `last_name`, `nick_name`, `email_primary`, `gsm_no_primary`, `work_company`, `work_job_title`, `work_department`)
VALUES 
(1, 'user1@sectest.com', '主管', '審核', '審核主管', 'manager@sectest.com', '0912345678', '企業組織', '部門主管', '技術管理部'),
(2, 'user1@sectest.com', '員工2', '測試', '測試員工2', 'user2@sectest.com', '0922333444', '企業組織', '專案成員', '技術研發部'),
(3, 'user1@sectest.com', '代理人', '審核', '審核代理人', 'agent@sectest.com', '0933444555', '企業組織', '代理主管', '技術管理部')
ON DUPLICATE KEY UPDATE `id`=`id`;

-- 7. 預設通訊錄群組
INSERT INTO `contact_groups` (`id`, `username`, `short_name`, `description`)
VALUES 
(1, 'user1@sectest.com', '技術研發組', '研發部全體成員')
ON DUPLICATE KEY UPDATE `id`=`id`;

INSERT INTO `contact_group_objects` (`id`, `username`, `group_id`, `contact_id`)
VALUES 
(1, 'user1@sectest.com', 1, 1),
(2, 'user1@sectest.com', 1, 2)
ON DUPLICATE KEY UPDATE `id`=`id`;

-- 8. 預設行事曆與會議排程
INSERT INTO `calendar_events` (`id`, `username`, `title`, `description`, `location`, `record_date`, `end_date`, `repeat_type`, `reminder_minutes`, `is_meeting`, `organizer_email`)
VALUES 
(1, 'user1@sectest.com', '每週研發進度會議', '檢視郵件重構進度與審核功能測試', '第 3 會議室 (或線上)', DATE_ADD(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 1 DAY) + INTERVAL 1 HOUR, 2, 15, 1, 'user1@sectest.com'),
(2, 'user1@sectest.com', '系統升級與部署驗證', '執行 Docker Compose 部署並驗證 Postfix/Dovecot 服務連線', '機房', DATE_ADD(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 2 DAY) + INTERVAL 2 HOUR, 0, 30, 0, 'user1@sectest.com')
ON DUPLICATE KEY UPDATE `id`=`id`;

INSERT INTO `meeting_attendees` (`id`, `event_id`, `attendee_email`, `attendee_name`, `status`)
VALUES 
(1, 1, 'manager@sectest.com', '審核主管', 'ACCEPTED'),
(2, 1, 'user2@sectest.com', '測試員工2', 'PENDING')
ON DUPLICATE KEY UPDATE `id`=`id`;

-- 9. 預設系統配置 (企業全域資訊與簽名檔公版)
INSERT INTO `system_configs` (`config_key`, `config_value`, `description`)
VALUES 
('company_profile', '{"company_name":"SecureMail 企業安全郵件","company_tel":"+886-2-2345-6789","company_address":"台北市信義區信義路五段7號","company_website":"https://sectest.com"}', '企業組織全域資訊設定'),
('corporate_signature_template', '<div style="font-family: Arial, \'Microsoft JhengHei\', sans-serif; font-size: 13px; color: #334155; line-height: 1.6; border-left: 3px solid #6366f1; padding-left: 12px; margin-top: 16px;">\n  <div style="font-weight: bold; font-size: 14px; color: #1e293b;">{{name}}</div>\n  <div style="color: #64748b; font-size: 12px;">{{department}} · {{job_title}}</div>\n  <div style="color: #6366f1; font-size: 12px; margin-top: 4px;">📧 {{email}} ｜ 📞 {{phone}}</div>\n  <div style="color: #94a3b8; font-size: 11px; margin-top: 6px;">{{company}} · {{domain}}</div>\n</div>', '全企業商務簽名檔公版範本')
ON DUPLICATE KEY UPDATE `config_key`=`config_key`;

SET FOREIGN_KEY_CHECKS = 1;
