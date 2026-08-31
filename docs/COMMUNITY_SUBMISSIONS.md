# 📢 SecureMail Community Submissions & Directory Ingestion Pack

This document contains pre-formatted entries, PR descriptions, and launch posts for external directory submissions and community amplification.

---

## 1. 🌟 Awesome-Selfhosted Submission Entry

Submit a Pull Request to [awesome-selfhosted/awesome-selfhosted](https://github.com/awesome-selfhosted/awesome-selfhosted).

### Location in `README.md`:
Find the section: `Software` > `Communication systems` > `Mail Transfer Agents` or `Webmail`.

### Markdown Entry to insert (alphabetical order):
```markdown
- [SecureMail](https://github.com/mozhenbear/securemail) - Modern, ultra-lightweight (<300MB RAM) private mail server and responsive Webmail with 7-stage outbound audit, Web DLP dynamic watermarks, RFC 5545 calendar, and 1-line Docker Compose deployment. `AGPL-3.0` `Docker/Node.js`
```

### Pull Request Title & Description:
**PR Title:** `Add SecureMail to Communication systems / Webmail`

**PR Body:**
```markdown
### Name of Software
SecureMail

### License
AGPL-3.0 (Open Core)

### Description
SecureMail is an ultra-lightweight (<300MB RAM), enterprise-grade private email server platform integrating Postfix, Dovecot, MySQL 8.0, and a modern TypeScript Webmail. It provides 7-stage outbound email inspection, remote image tracking blocker (Web Beacon), RFC 5545 iCalendar invites with 1-click RSVP, Web DLP dynamic watermarking, WORM compliance archiving, and multi-language support (EN / zh-TW / zh-CN).

### Source Code
https://github.com/mozhenbear/securemail

### Docker Image
https://hub.docker.com/r/mozhenbear/securemail-web
```

---

## 2. 🔀 AlternativeTo Listing Details

Submit a new application on [AlternativeTo.net](https://alternativeto.net/software/new/):

- **Name**: SecureMail Enterprise
- **Tagline**: Modern, ultra-lightweight (<300MB RAM) private mail server & responsive Webmail.
- **Website**: `https://github.com/mozhenbear/securemail`
- **License**: Open Source (AGPL-3.0 / Commercial)
- **Platforms**: Self-Hosted, Linux, Docker, Web
- **Categories**: Email Servers, Webmail Clients, Privacy Tools
- **Alternatives to**: Mailcow, iRedMail, Roundcube, Zimbra, Proton Mail, Microsoft Exchange

---

## 3. 💬 Reddit Announcement Post (`r/selfhosted` & `r/sysadmin`)

**Title**: `[Release] SecureMail: An ultra-lightweight (<300MB RAM) Docker mail server & modern Webmail in TypeScript with 7-stage outbound audit & Web DLP`

**Body**:
```markdown
Hey r/selfhosted!

We built **SecureMail** because we wanted a modern, lightweight private mail server that doesn't consume 4GB-8GB of RAM just to idle, while providing the enterprise-grade privacy and moderation features typically locked behind expensive proprietary licenses.

### 🌟 Key Highlights:
- ⚡ **Ultra-Lightweight Footprint**: Consumes under **300MB of RAM** at idle (Postfix + Dovecot + MySQL 8 + Node.js backend).
- 🔒 **Privacy & DLP by Default**: Built-in Web Beacon / remote pixel isolation, plus dynamic anti-leak screen watermarks with employee credentials and live timestamps.
- ⚖️ **7-Stage Outbound Email Audit**: Automatic keyword, recipient limit, attachment size/type filtering, and external recipient supervisor sign-off queues.
- 📅 **RFC 5545 Meeting Center**: 1-click RSVP calendar invitations directly from email view.
- 📱 **Mobile-First Responsive Webmail**: Off-canvas folder drawers, single-column drilldown reader, and bottom navigation.
- 🚀 **1-Command Docker Compose**: Complete MTA + IMAP + Webmail stack up in under 60 seconds with multi-arch support (`linux/amd64` and `linux/arm64`).

### 🛠️ Quick Start:
```bash
git clone https://github.com/mozhenbear/securemail.git
cd securemail
docker compose pull && docker compose up -d
```
Access Webmail at `http://localhost:33333` and Admin Console at `http://localhost:33333/admin` (`admin` / `admin123`).

- 📂 GitHub: https://github.com/mozhenbear/securemail
- 🐳 Docker Hub: https://hub.docker.com/r/mozhenbear/securemail-web

Feedback, PRs, and feature requests are very welcome!
```

---

## 4. 🚀 Hacker News (Show HN)

**Title**: `Show HN: SecureMail – Ultra-lightweight (<300MB RAM) Docker mail server & Webmail`

**URL**: `https://github.com/mozhenbear/securemail`

**Commentary**:
```text
Hi HN,

Most self-hosted mail stacks (Mailcow, Zimbra) are powerful but require 4GB–8GB+ of memory and heavy Java/Solr/ClamAV dependencies. We built SecureMail to offer a unified, modern TypeScript Webmail + Postfix + Dovecot stack that runs in under 300MB RAM while natively providing enterprise security features like 7-stage outbound approval queues, tracking pixel blocking, and RFC 5545 meeting invitations out-of-the-box.

We would love your thoughts on the architecture, security isolation, and webmail UX!
```
