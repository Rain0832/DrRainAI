# Threat Model / 威胁模型

## 中文

**状态：初始提案，需安全评审。**当前无可运行服务，以下是设计风险，不是已发现漏洞或安全保证。

### 资产与边界

- 资产：身份凭据、会话/消息、运行状态、模型凭据、工具凭据、审计记录。
- 边界：浏览器与 Gateway；Gateway 与 Core/Agent；Agent 与模型供应商/工具；Core 与数据库。
- 信任原则：Core 权威校验身份与资源所有权；Agent、模型输出和客户端输入均不可信。

### 主要威胁与控制提案

| 威胁 | 控制 |
|---|---|
| 越权读取/修改会话 | 服务端每次请求校验主体与资源所有权；拒绝响应避免存在性泄露 |
| 提示注入与恶意工具调用 | 默认无工具；工具逐项 allowlist、参数 schema 校验及每次权限判定 |
| 凭据泄露 | 使用受控密钥管理/注入；日志、错误、合同和仓库不得含秘密 |
| 流量滥用与成本耗尽 | Gateway 限流、请求大小限制、运行/模型/工具预算 |
| XSS/CSRF/会话劫持 | 前端输出编码；认证模式确定后评审 Cookie、CSRF、CSP 与安全头 |
| 供应链风险 | 固定并审查依赖；漏洞响应与更新流程待建立 |
| 敏感日志/备份暴露 | 默认不记录完整对话；访问控制、保留期限、删除和备份策略待定 |
| 断连/重试导致重复副作用 | 取消传播、幂等键；有副作用工具需人工审批或事务语义 |

具体认证方案、密钥管理器、限流阈值、审计保存期限、威胁分级和渗透测试要求尚未决定。上线前需做数据流与部署环境专项评审。

## English

**Status: initial proposal, requiring security review.** No runnable service exists; these are design risks, not confirmed vulnerabilities or guarantees.

### Assets and boundaries

- Assets: identity credentials, sessions/messages, run state, model credentials, tool credentials, audit records.
- Boundaries: browser/Gateway; Gateway/Core/Agent; Agent/provider/tools; Core/database.
- Trust: Core authoritatively checks identity and resource ownership; Agent, model output, and client input are untrusted.

### Threats and proposed controls

| Threat | Control |
|---|---|
| Unauthorized session read/write | Check principal/resource ownership server-side on every request; avoid existence disclosure on denial |
| Prompt injection and malicious tools | No tools by default; per-tool allowlist, schema validation, and authorization on every invocation |
| Credential exposure | Controlled secret management/injection; no secrets in logs, errors, contracts, or repository |
| Abuse and cost exhaustion | Gateway rate limits, request-size limits, run/model/tool budgets |
| XSS/CSRF/session theft | Encode rendered output; review cookies, CSRF, CSP, and security headers after auth is decided |
| Supply-chain risk | Pin and review dependencies; vulnerability response and update process remain to be established |
| Sensitive logs/backups | Do not log full conversations by default; access, retention, deletion, and backup policy remain open |
| Duplicate side effects after disconnect/retry | Propagate cancellation and use idempotency; consequential tools need approval or transaction semantics |

Authentication, secret manager, rate thresholds, audit retention, threat classification, and penetration-testing requirements are undecided. Review data flows and deployment environment before release.
