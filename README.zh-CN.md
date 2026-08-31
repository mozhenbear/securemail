<div align="center">

# 📬 SecureMail 企业级安全邮件系统
### 现代化、高安全、轻量极速的私有邮件服务器与 Webmail 平台

[![Docker Pulls](https://img.shields.io/docker/pulls/mozhenbear/securemail-web?style=for-the-badge&logo=docker&color=2496ED)](https://hub.docker.com/r/mozhenbear/securemail-web)
[![Docker Image Size](https://img.shields.io/docker/image-size/mozhenbear/securemail-web/latest?style=for-the-badge&logo=docker&color=4682B4)](https://hub.docker.com/r/mozhenbear/securemail-web)
[![Platform Multi-Arch](https://img.shields.io/badge/Platform-Linux%20(AMD64%20%2F%20ARM64)-blueviolet?style=for-the-badge&logo=linux)](https://hub.docker.com/r/mozhenbear/securemail-web)
[![License](https://img.shields.io/badge/License-AGPL--3.0-green.svg?style=for-the-badge&logo=opensourceinitiative)](LICENSE)
[![Release](https://img.shields.io/badge/Version-v2.0.0-indigo?style=for-the-badge&logo=semanticrelease)](https://github.com/mozhenbear/securemail/releases)

[![TypeScript](https://img.shields.io/badge/TypeScript-5.0-3178C6?style=for-the-badge&logo=typescript&logoColor=white)](https://www.typescriptlang.org/)
[![Node.js](https://img.shields.io/badge/Node.js-20_LTS-339933?style=for-the-badge&logo=node.js&logoColor=white)](https://nodejs.org/)
[![TailwindCSS](https://img.shields.io/badge/TailwindCSS-3.4-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)](https://tailwindcss.com/)
[![Postfix](https://img.shields.io/badge/Postfix-MTA-orange?style=for-the-badge&logo=serverfault)](http://www.postfix.org/)
[![Dovecot](https://img.shields.io/badge/Dovecot-IMAP%2FPOP3-blue?style=for-the-badge&logo=mail.ru)](https://www.dovecot.org/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)

<br>

**[English](README.md) | [繁體中文](README.zh-TW.md) | [简体中文](README.zh-CN.md)**

<p align="center">
  <b>SecureMail</b> 是一套针对现代企业安全防护、机密审核、合规归档与极致操作体验打造的企业级安全邮件平台。深度整合 <b>Postfix (MTA)</b>、<b>Dovecot (IMAP/POP3)</b>、<b>MySQL 8.0</b> 与现代化 <b>TypeScript Webmail</b>，开箱即用提供多层次邮件审核、Web Beacon 远程图片防追踪、RFC 5545 标准会议邀请、全量合规归档、手机自适应与多国语系支持。
</p>

</div>

---

## 📸 界面展示 (Screenshots)

<div align="center">

### 💻 现代化 Webmail 操作界面
*简洁流畅的电脑端三栏布局，原生支持手机端单栏下钻与滑动抽屉自适应*
<img src="docs/images/webmail-preview.png" alt="SecureMail Webmail Interface" width="95%" style="border-radius: 12px; box-shadow: 0 10px 30px rgba(0,0,0,0.15); margin-bottom: 24px;">

### 🛡️ 企业管理后台 (Admin Console)
*域名账号维护、多层审核规则、合规归档检索、LDAP 同步与自定义企业品牌*
<img src="docs/images/admin-preview.png" alt="SecureMail Admin Console" width="95%" style="border-radius: 12px; box-shadow: 0 10px 30px rgba(0,0,0,0.15);">

</div>

---

## 📊 主流邮件方案客观规格对比矩阵

> *最后核实与更新时间：2026 年 8 月。依据各项目官方最新文档、开源版本与公开发行规格进行客观对比。*

| 功能特性 / 评测维度 | **SecureMail Enterprise** | **Mailcow: dockerized** | **iRedMail** | **Roundcube Webmail** | **Zimbra Collaboration** |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **系统架构定位** | **完整服务器 + 现代化 Webmail** | 完整服务器 + SOGo 界面 | 完整服务器 + 开源 Webmail | 仅为 Webmail 客户端 (MUA) | 完整企业协作套件 |
| **企业外发邮件安全审核** | **✅ 内置 7 阶段审核流程** | ❌ 无原生审核签核队列 | 💰 需加购 iRedAdmin-Pro | ❌ 无 (仅前端客户端) | 💰 需加购 Network 商业版 |
| **远程图片隐私防追踪** | **✅ 矢量占位安全隔离** | ⚠️ 基础图片阻挡 (SOGo) | ⚠️ 基础图片阻挡 | ✅ 原生「显示图片」开关 | ⚠️ 基础图片阻挡 |
| **RFC 5545 会议日程与 RSVP** | **✅ 原生双向整合** | ✅ 原生支持 (SOGo CalDAV) | 💰 需 SOGo 组件支持 | ⚠️ 需安装第三方插件 | ✅ 原生内置支持 |
| **移动设备手机自适应 (RWD)** | **✅ 原生单栏下钻状态机** | ⚠️ 响应式 SOGo 主题 | ⚠️ 需 Elastic 皮肤 / SOGo | ✅ 官方 Elastic 响应式皮肤 | ⚠️ Zimbra Modern UI |
| **全量合规归档库 (WORM)** | **✅ 原生 SHA-256 / Legal Hold** | ⚠️ 建议外挂 Mailpiler | 💰 需加购 iRedAdmin-Pro | ❌ 无 (仅前端客户端) | 💰 需加购 Network 商业版 |
| **Web DLP 动态防泄密水印** | **✅ 原生动态渲染防截图** | ❌ 无 | ❌ 无 | ❌ 无 | ❌ 无 |
| **发信缓冲撤回与预约发信** | **✅ 内置 5s 撤回 / 背景定时** | ❌ 无 | ❌ 无 | ⚠️ 需安装第三方插件 | ❌ 无 |
| **系统建议内存占用** | **⚡ 极致轻量 (< 300MB RAM)** | 🐢 需 4GB+ RAM (ClamAV/Solr) | ⚠️ 需 2GB - 4GB RAM | ⚡ 轻量 (需额外 LAMP/IMAP) | 🐢 需 8GB+ RAM 最低配置 |
| **Docker Compose 一键启动** | **🚀 原生 `docker compose up -d`** | ✅ 原生 Docker 堆栈 | ❌ 脚本裸机安装 | ❌ 仅提供 Webmail 容器 | ❌ 庞大单体安装包 |
| **开源与授权模式** | **Open Core (免费社区 / 企业版)** | 开源 (GPL-3.0) | 开源基础版 / 商业 Pro 后台 | 开源 (GPL-3.0) | 开源版 / 商业 Network 版 |

<details>
<summary><b>🔍 详细规格说明与架构背景澄清</b></summary>

1. **Roundcube** 定位为纯邮件网页客户端（MUA），本身不包含 Postfix/Dovecot 邮件服务，具备优秀的 Elastic 响应式皮肤与图片阻挡，但外发审核、定时发信与归档需依赖额外后端与第三方插件。
2. **Mailcow: dockerized** 为成熟的 Docker 邮件服务器套件，群组功能依赖 SOGo 提供 CalDAV/CardDAV，但不具备开箱即用的外发签核审批流程与 WORM 合规存证（官方建议另行整合 Mailpiler）。
3. **iRedMail** 提供基础开源安装脚本，进阶 Web 管理后台、外发隔离节流与邮件归档主要集中于商业版 *iRedAdmin-Pro*。
4. **Zimbra Collaboration** 为全功能企业套件，其深度 DLP 政策、Legal Hold 法规留存与备份等进阶功能主要提供于商业 *Network Edition*。
5. **SecureMail** 将 MTA、IMAP 引擎、数据库与响应式 TypeScript Webmail 深度整合为极轻量容器堆栈，原生内置 7 阶段安全审核、Web Beacon 隐私隔离与动态防泄密水印。
</details>

---

## ✨ 核心特色与商业亮点

| 领域分类 | 功能重点 |
| :--- | :--- |
| **🛡️ 隐私安全防护** | Web Beacon 远程图片追踪阻挡、Anti-Spam/Virus 特征过滤、Web DLP 动态水印、TOTP 双因子验证、RFC 2387 内嵌图片引擎 |
| **✉️ 现代化办公效率** | 发信 5 秒倒数一键撤回 (Undo Send)、预约定时发信、多签名档管理与企业公版范本、超大附件云端下载卡片、休假自动回复 |
| **⚖️ 企业多层审核** | 7 阶段安全检核 (关键字、收件人上限、附件大小与类型、外网审核)、主管差旅时区感知代理人指派 |
| **📅 会议中心与整合** | RFC 5545 / RFC 6047 标准会议邀请，支持 1 键回复出席 (接受/暂定/婉拒)、企业 LDAP/AD 排程同步与 SSO 单一登入 |
| **📱 移动端手机自适应** | 智能手机与平板优化排版、滑出式文件夹抽屉、单栏下钻读信与全屏写信、常驻底部快捷导航栏 |
| **📁 自定义文件夹与规则** | IMAP 自定义文件夹管理、3 合 1 移动整合 (右键菜单、批量列、阅读窗格)、多规则自动分类过滤引擎 |
| **🌐 全球化与多时区** | 内置**英文**、**繁体中文**、**简体中文**，支持浏览器语言自动侦测与毫秒级时区双向转换 |

---

## 🚀 快速上手 (1 分钟启动)

### 1. 环境需求
- **Docker Engine**: 20.10+
- **Docker Compose**: v2.0+
- **本机端口**: `25` (SMTP), `80/443` (Web), `143/993` (IMAP), `587` (Submission)

### 2. 下载与启动
```bash
# Clone 存储库
git clone https://github.com/mozhenbear/securemail.git
cd securemail

# 通过 Docker Compose 一键启动所有服务
docker compose pull
docker compose up -d
```

### 3. 访问系统
- **用户 Webmail 界面**: `http://localhost:33333` (或您的域名)
- **系统管理员后台**: `http://localhost:33333/admin`
  - 默认管理员账号: `admin`
  - 默认管理员密码: `admin123`

---

## 📄 授权条款与商业模式
SecureMail 采用**双重授权模式 (Dual Licensing Model)**：
- **社区免费授权 (Community Free License)**：启用账号在 5 个以内（`<= 5 Users`）可永久免费使用全部核心安全与审核功能，可用于商业营运。
- **企业商业扩充授权 (Enterprise Commercial License)**：针对需要 5 个以上账号（`> 5 Users`）、原厂 SLA 技术支持、定制化开发或高可用架构之企业用户。
  - 洽询信箱：`mozhenbear@zodic.dev`
详细三语系（英文、繁体中文、简体中文）授权规范请参阅 [LICENSE](LICENSE) 文件。
