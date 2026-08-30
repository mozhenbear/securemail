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

## 📊 规格对比矩阵 (SecureMail 与主流竞品对比)

| 功能特性 (Features) | **SecureMail Enterprise** | **Mailcow: dockerized** | **iRedMail** | **Roundcube** | **Zimbra** |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **企业外发邮件安全审核** | **✅ 内置 7 阶段拦截** | ❌ 无 | 💰 需加购 Pro 版 | ❌ 无 | ❌ 无 |
| **远程图片隐私防追踪** | **✅ 矢量占位安全隔离** | ❌ 无 | ❌ 无 | ⚠️ 基础阻挡 | ❌ 无 |
| **RFC 5545 会议日程与 RSVP** | **✅ 原生双向整合** | ⚠️ 基础 SOGo | 💰 需外挂 SOGo | ⚠️ 需外挂插件 | ✅ 内置支持 |
| **移动设备手机自适应 (RWD)** | **✅ 原生单栏下钻** | ⚠️ 部分适配 | 💰 需付费皮肤 | ⚠️ 需自定义主题 | ⚠️ 界面厚重 |
| **全量合规归档库 (WORM)** | **✅ SHA-256 / Legal Hold** | ⚠️ 需整合 Mail Piler | 💰 需加购 Pro 版 | ❌ 无 | 💰 需付费网络版 |
| **Web DLP 动态防泄密水印** | **✅ 原生动态渲染** | ❌ 无 | ❌ 无 | ❌ 无 | ❌ 无 |
| **发信缓冲撤回与预约发信** | **✅ 内置 5s 撤回/定时** | ❌ 无 | ❌ 无 | ⚠️ 需外挂插件 | ❌ 无 |
| **硬件资源内存占用** | **⚡ 极致轻量 (< 300MB)** | 🐢 厚重 (需 4GB+ RAM) | ⚠️ 中等 (需 2GB+ RAM) | ⚠️ 需依赖 LAMP | 🐢 极厚重 (需 8GB+ RAM) |
| **Docker 一键部署** | **🚀 1 行指令 (`docker compose`)** | ⚠️ 配置脚本繁复 | ❌ 脚本裸机安装 | ❌ 仅为前端 Web | ❌ 单体庞大难容器化 |
| **国际化多语系 (i18n)** | **✅ 繁中 / 简中 / 英文** | ✅ 多语系 | ✅ 多语系 | ✅ 多语系 | ✅ 多语系 |

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

## 📄 开源授权
本项目基于 **AGPL-3.0 License** 开源发布，详见 [LICENSE](LICENSE) 文件。
