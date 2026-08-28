# SecureMail 企業安全郵件系統 (Enterprise Secure Mail)

本專案為針對企業安全防護、機密審核、合規歸檔與現代化辦公體驗的全面企業級安全郵件平台。底層深度整合 **Postfix (MTA)**、**Dovecot (IMAP/POP3)**、**MySQL 8.0** 與基於 **Node.js (TypeScript)** 的前後端架構，提供高安全性、易維運且具備現代化使用者體驗的私有化郵件伺服器解決方案。

---

## ✨ 核心特色功能

### 🛡️ 隱私安全防護
- **外部圖片防追蹤 (Anti-Tracking)**：預設阻擋 HTML 外部圖片並替換為安全佔位圖，徹底防範發件人透過 Web Beacon（透明像素圖）刺探您的 IP 位址、開信時間與所在位置；提供「單次顯示」與「永遠信任此寄件人」。
- **Anti-Spam & Anti-Virus 防護**：內建高危險副檔名攔截（`.exe`, `.vbs`, `.bat`, `.ps1` 等）與啟發式釣魚特徵評分，可疑郵件醒目警示並自動摺疊附件。
- **Web DLP 動態防洩密浮水印**：閱讀視圖與附件預覽區域動態疊加包含「使用者姓名 + 帳號 + 存取時間」的半透明浮水印，防止手機翻拍截圖洩密。
- **雙因子動態驗證 (TOTP 2FA)**：支援 Google Authenticator 與 Microsoft Authenticator 6 位數動態碼綁定。

### ✉️ 現代化辦公體驗
- **發信 5 秒緩衝撤回 (Undo Send)**：發信後提供 5 秒懸浮倒數條，點擊【撤回】立即還原原信至編輯器，防止手滑誤發。
- **預約定時發信 (Scheduled Send)**：支援指定未來特定時間排程發送，由背景服務精確派發。
- **多簽名檔管理與寫信即時切換**：個人可建立多組商務、英文或行動簽名檔（支援 WYSIWYG 富文本與圖片插入）；寫信時自動帶入預設簽名，工具列支援下拉即時切換。
- **全企業商務簽名檔公版**：管理員可於後台設定企業統一公版與變數（`{{name}}`、`{{email}}`、`{{department}}`、`{{job_title}}`、`{{phone}}` 等），使用者一鍵套用。
- **超大附件雲端下載卡片**：數百 MB 或數 GB 大檔案自動轉存獨立空間，信件自動生成附帶有效期限（7/14/30/90天）與提取密碼的精美雲端下載卡片。
- **休假自動回覆 (Out of Office)**：自訂請假/出差起訖時間與自動回覆範本。

### 📁 自訂資料夾管理與全域移動整合
- **自訂資料夾生命週期**：支援建立、更名與刪除自訂資料夾，核心預設資料夾受防護鎖定。
- **全域移動三合一整合**：
  - **信件右鍵快捷選單**：一體化呈現所有系統與自訂資料夾（自動排除當前所在資料夾），具備視窗邊界偵測向上翻轉展開（Upward Flip）防遮擋。
  - **多選批次移動**：勾選多封郵件後，頂部工具列下拉選單一鍵批次搬移。
  - **單信閱讀器移動**：閱讀面板頂部動作列支援直接下拉移動當前郵件。
- **自動分類規則 (Filter Rules)**：多條件過濾來信並即時自動分流至指定資料夾，完整保留未讀狀態與徽章計數。

### ⚖️ 企業多層安全審核機制
- **多維度審核條件**：支援外網郵件審核、敏感關鍵字審核、附件大小與類型審核。
- **審核發送與代理人**：送審信件暫扣於待審佇列；支援主管設定出差/休假代理人自動轉派審核。

### 📅 全功能行事曆與通訊錄
- **RFC 5545 iCalendar 會議中心**：支援發起團隊會議、自動發送標準 `.ics` 邀請信、受邀者一鍵回覆出席狀態（接受/暫定/婉拒）並自動同步個人行事曆。
- **企業組織通訊錄**：集中管理同仁與聯絡人，寫信時收件人即時自動補全。

### 👥 企業目錄同步與單一登入 (SSO)
- **LDAP / Active Directory 目錄同步**：支援定時排程或一鍵手動同步企業員工帳號樹。
- **企業 SSO (SAML 2.0 / OIDC)**：支援整合 Microsoft Azure AD (Entra ID)、Google Workspace、Okta 等企業 IdP。

---

## 💻 系統需求

- **Docker**：20.10+
- **Docker Compose**：2.0+
- **CPU**：2 核心以上（推薦 4 核心）
- **RAM**：4 GB 以上（推薦 8 GB）
- **作業系統**：Ubuntu 20.04/22.04 LTS、Debian 11/12、RHEL/AlmaLinux 8/9、macOS 或 Windows (WSL2)

---

## 🚀 快速開始 (Quick Start)

### 1. 下載專案
```bash
git clone https://github.com/mozhenbear/securemail.git
cd securemail
```

### 2. 啟動服務
```bash
docker compose up -d
```

### 3. 檢查運行狀態
```bash
docker compose ps
```
確認所有容器（`db`, `postfix`, `dovecot`, `web`）均處於正常運行狀態。

---

## 🌐 系統存取入口

| 介面 | 存取網址 | 預設帳號 / 密碼 |
| :--- | :--- | :--- |
| **Webmail 使用者介面** | `http://<您的伺服器IP>:33333/` | 於後台建立或使用測試帳號 |
| **系統管理後台 (Admin Portal)** | `http://<您的伺服器IP>:33333/admin` | 帳號：`admin` ｜ 密碼：`admin123` |

---

## ⚙️ 網域與 DNS 設定指引 (以 `yourcompany.com` 為例)

為確保企業郵件收發順暢且不被判定為垃圾郵件，請至您的網域名稱代管商（如 Cloudflare, GoDaddy, AWS Route 53 等）新增以下 DNS 記錄：

| 記錄類型 | 主機名稱 (Host / Name) | 記錄值 (Value / Content) | 優先級 (Priority) | 說明 |
| :--- | :--- | :--- | :--- | :--- |
| **A** | `mail.yourcompany.com` | `<伺服器公網 IP>` | - | 郵件主機 IP 指向 |
| **MX** | `@` (或 `yourcompany.com`) | `mail.yourcompany.com` | `10` | 郵件交換路由記錄 |
| **TXT (SPF)** | `@` | `v=spf1 mx a ip4:<伺服器公網 IP> ~all` | - | 發信伺服器授權驗證 |
| **TXT (DKIM)** | `default._domainkey` | `v=DKIM1; k=rsa; p=<管理後台一鍵生成之公鑰>` | - | 數位簽名防偽造記錄 |
| **TXT (DMARC)**| `_dmarc` | `v=DMARC1; p=quarantine; rua=mailto:dmarc-reports@yourcompany.com` | - | 郵件防護策略報告 |

> 💡 **提示**：登入管理後台 ➔ 【網域信譽與 DNS 檢測】，提供「一鍵生成 2048-bit DKIM 公私鑰」與「線上即時 DNS 診斷工具」。

---

## 📖 完整操作手冊

如需各模組之詳細操作指引、安全審核流程與維運管理說明，請參閱：
👉 **[完整使用者與系統部署維運手冊 (USER_GUIDE.md)](./USER_GUIDE.md)**

---

## 📄 授權條款

本專案採用 [MIT License](./LICENSE) 授權。
