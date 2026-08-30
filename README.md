<div align="center">

# 📬 SecureMail Enterprise
### Modern, Secure, High-Performance Private Email Server & Webmail Platform

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
  <b>SecureMail</b> is an enterprise-grade, privacy-first private email server platform combining <b>Postfix (MTA)</b>, <b>Dovecot (IMAP/POP3)</b>, <b>MySQL 8.0</b>, and a modern <b>TypeScript Webmail</b> frontend. It delivers out-of-the-box multi-layer security audits, RFC 2387 inline CID rendering, Web DLP watermarking, RFC 5545 iCalendar meeting invitations, full compliance archiving, mobile responsive layout, and internationalization.
</p>

</div>

---

## 📸 Screenshots & Showcase

<div align="center">

### 💻 Modern Webmail Interface
*Clean, responsive 3-column desktop layout with instant mobile single-column drill-down*
<img src="docs/images/webmail-preview.png" alt="SecureMail Webmail Interface" width="95%" style="border-radius: 12px; box-shadow: 0 10px 30px rgba(0,0,0,0.15); margin-bottom: 24px;">

### 🛡️ Enterprise Admin Console
*Comprehensive domain management, audit policies, compliance logs, LDAP sync & branding*
<img src="docs/images/admin-preview.png" alt="SecureMail Admin Console" width="95%" style="border-radius: 12px; box-shadow: 0 10px 30px rgba(0,0,0,0.15);">

</div>

---

## 📊 Objective Feature Comparison Matrix

> *Last verified & updated: August 2026. Based on official documentation and publicly available releases of each respective project.*

| Capability / Dimension | **SecureMail Enterprise** | **Mailcow: dockerized** | **iRedMail** | **Roundcube Webmail** | **Zimbra Collaboration** |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **System Scope** | **Full Server + Modern Webmail** | Full Server + SOGo Webmail | Full Server + Webmail | Webmail Client Only (MUA) | Full Enterprise Suite |
| **Outbound Email Security Audit** | **✅ Built-in 7-Stage Workflow** | ❌ No native approval UI | 💰 Paid iRedAdmin-Pro only | ❌ None (MUA only) | 💰 Paid Network Edition only |
| **Remote Image Anti-Tracking** | **✅ Vector Isolation Placeholder** | ⚠️ Basic Blocker (SOGo) | ⚠️ Basic Blocker (MUA) | ✅ Native "Display Images" Toggle | ⚠️ Basic Blocker |
| **RFC 5545 iCalendar & Meeting RSVP** | **✅ Native 2-Way Integration** | ✅ Native via SOGo CalDAV | 💰 Via SOGo Component | ⚠️ Requires 3rd-party plugin | ✅ Native Built-in |
| **Mobile Responsive UI (RWD)** | **✅ Native Single-Column Drilldown** | ⚠️ Responsive SOGo theme | ⚠️ Via Elastic Skin / SOGo | ✅ Official Elastic Skin | ⚠️ Zimbra Modern UI |
| **Full Compliance WORM Archiving** | **✅ Native SHA-256 / Legal Hold** | ⚠️ Via Mailpiler integration | 💰 Paid iRedAdmin-Pro only | ❌ None (MUA only) | 💰 Paid Network Edition only |
| **Web DLP Dynamic Watermark** | **✅ Native Anti-Leak Overlay** | ❌ None | ❌ None | ❌ None | ❌ None |
| **5s Undo Send & Scheduled Send** | **✅ Built-in Native Service** | ❌ None | ❌ None | ⚠️ Requires 3rd-party plugin | ❌ None |
| **Recommended RAM Footprint** | **⚡ Ultra Light (< 300MB RAM)** | 🐢 4GB+ RAM (Rspamd/ClamAV/Solr) | ⚠️ 2GB - 4GB RAM (Amavisd/ClamAV) | ⚡ Light (Requires LAMP/IMAP) | 🐢 8GB+ RAM minimum |
| **Docker Compose 1-Line Deploy** | **🚀 Native `docker compose up -d`** | ✅ Native Docker stack | ❌ Bare-metal bash script | ❌ Webmail container only | ❌ Monolithic enterprise installer |
| **License Model** | **Open Core (Free Community / Enterprise)** | Open Source (GPL-3.0) | Open Source / Paid Pro UI | Open Source (GPL-3.0) | Open Source / Paid Network Ed. |

<details>
<summary><b>🔍 Detailed Comparison Notes & Architecture Clarifications</b></summary>

1. **Roundcube** is strictly a Webmail Client (MUA); it requires an existing Postfix + Dovecot infrastructure. It provides an excellent responsive skin (*Elastic*) and basic remote image blocking, but lacks server-side audit, legal hold, and outbox scheduling without third-party plugins.
2. **Mailcow: dockerized** is a complete mail server suite using SOGo as its primary groupware webmail. It supports native CalDAV/CardDAV and Docker deployment, but does not provide a native outbound email moderation queue or WORM legal hold out-of-the-box (recommends external Mailpiler pairing).
3. **iRedMail** offers a free core script with open-source components, while advanced web administration, outbound quarantine/throttling, and archiving UI are part of the commercial *iRedAdmin-Pro* license.
4. **Zimbra Collaboration** provides a comprehensive enterprise suite, with advanced DLP policies, legal hold, and mobile synchronization prioritized in its commercial *Network Edition*.
5. **SecureMail** integrates the MTA, IMAP engine, database, and a responsive TypeScript Webmail into a unified, lightweight Docker stack with native 7-stage security auditing, privacy tracking isolation, and DLP watermarking enabled out-of-the-box.
</details>

--- | :---: | :---: | :---: | :---: | :---: |
| **Outbound Email Security Audit** | **✅ Built-in (7-Stage)** | ❌ None | 💰 Paid Pro only | ❌ None | ❌ None |
| **Web Beacon Anti-Tracking** | **✅ Vector Isolation** | ❌ None | ❌ None | ⚠️ Basic Blocker | ❌ None |
| **RFC 5545 Meeting Center & RSVP** | **✅ Native 2-Way Sync** | ⚠️ Basic SOGo | 💰 SOGo Plugin | ⚠️ Plugin required | ✅ Built-in |
| **Mobile Responsive (RWD)** | **✅ Native Drilldown** | ⚠️ Partial | 💰 Paid Skin | ⚠️ Theme required | ⚠️ Heavy |
| **Full Compliance WORM Archiving** | **✅ SHA-256 / Legal Hold** | ⚠️ Mail Piler Addon | 💰 Paid Pro only | ❌ None | 💰 Paid Network |
| **Web DLP Dynamic Watermark** | **✅ Native Anti-Leak** | ❌ None | ❌ None | ❌ None | ❌ None |
| **5s Undo Send & Scheduled Send** | **✅ Built-in** | ❌ None | ❌ None | ⚠️ Plugin required | ❌ None |
| **Memory Footprint** | **⚡ Ultra Light (< 300MB)** | 🐢 Heavy (4GB+ RAM) | ⚠️ Medium (2GB+ RAM) | ⚠️ Requires LAMP | 🐢 Very Heavy (8GB+ RAM) |
| **Docker Deployment** | **🚀 1 Command (`docker compose`)** | ⚠️ Complex scripts | ❌ Bare-metal script | ❌ Webmail only | ❌ Monolithic |
| **Multi-Language (i18n)** | **✅ EN / zh-TW / zh-CN** | ✅ Multi-lang | ✅ Multi-lang | ✅ Multi-lang | ✅ Multi-lang |

---

## ✨ Key Features

| Category | Highlights |
| :--- | :--- |
| **🛡️ Privacy & Security** | Web Beacon tracking blocker, Anti-Spam & Anti-Virus heuristics, Web DLP dynamic watermarking, TOTP 2FA, RFC 2387 MIME inline CID engine |
| **✉️ Modern Productivity** | 5s Undo Send countdown, Scheduled Send, Multi-signature manager & corporate templates, Cloud big-attachment transfer cards, Out-of-Office auto-responder |
| **⚖️ Enterprise Audit** | 7-stage outbound email inspection (keywords, recipients, attachment type/size, external recipient approval), manager leave delegation |
| **📅 Meetings & Directory** | RFC 5545 / RFC 6047 standard iCalendar meeting invitations with 1-click RSVP (Accept / Tentative / Decline), Corporate LDAP/AD sync & SSO (SAML 2.0 / OIDC) |
| **📱 Mobile Responsive** | Adaptive mobile layout, off-canvas folder drawer, single-column drilldown reader, bottom navigation bar |
| **📁 Folders & Workflow** | Custom folders lifecycle, 3-in-1 move integration (Context Menu, Batch Toolbar, Reader Actions), dynamic rules filtering |
| **🌐 Global Accessibility** | Built-in **English**, **Traditional Chinese (繁體中文)**, **Simplified Chinese (简体中文)** with automatic browser locale detection & global timezone conversion |

---

## 🚀 Quick Start (1-Minute Setup)

### 1. Prerequisites
- **Docker Engine**: 20.10+
- **Docker Compose**: v2.0+
- **Host Ports**: `25` (SMTP), `80/443` (Web), `143/993` (IMAP), `587` (Submission)

### 2. Download and Run
```bash
# Clone the repository
git clone https://github.com/mozhenbear/securemail.git
cd securemail

# Launch all services via Docker Compose
docker compose pull
docker compose up -d
```

### 3. Access Web Portals
- **Webmail Interface**: `http://localhost:33333` (or your configured domain)
- **Admin Console**: `http://localhost:33333/admin`
  - Default Admin Account: `admin`
  - Default Password: `admin123`

---

## 🏗 Architecture & Technology Stack

```mermaid
graph TB
    subgraph Clients["Clients & Outer World"]
        Browser["Modern Browser (Webmail / Admin)"]
        Mobile["Mobile Smartphone / Tablet"]
        ExternalMail["External Mail (Gmail / Outlook)"]
    end

    subgraph DockerPlatform["SecureMail Docker Stack"]
        WebNode["Web / API Service (Node.js 20 + TypeScript)<br>Express · MailComposer · MailParser · i18n"]
        Postfix["Postfix MTA<br>Port 25 / 587"]
        Dovecot["Dovecot IMAP / SASL<br>Port 143 / 993"]
        Database[("MySQL 8.0 Database<br>Accounts · Audits · Calendars · Archives")]
    end

    Browser -->|HTTP / REST API| WebNode
    Mobile -->|Mobile Responsive RWD| WebNode
    WebNode -->|SMTP Direct / Audit| Postfix
    WebNode -->|IMAP Mail Access| Dovecot
    Postfix -->|Virtual Maps Query| Database
    Dovecot -->|Auth & Passdb Query| Database
    WebNode -->|ORM & Data Queries| Database
    Postfix <-->|SMTP Transport| ExternalMail
```

---

## 📄 License & Commercial Terms
SecureMail is licensed under a **Dual Licensing Model**:
- **Community Free License**: Free and perpetual for up to 5 active mailboxes (`<= 5 Users`) with all core security and audit features included for personal or commercial use.
- **Enterprise Commercial License**: For deployments requiring `> 5 Users`, dedicated vendor SLA support, bespoke integration, and High Availability (HA) clustering.
  - Contact: `mozhenbear@zodic.dev`
See the [LICENSE](LICENSE) file for the complete multi-language license agreement (English, Traditional Chinese, Simplified Chinese).
