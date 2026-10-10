# 旧项目只读审计与迁移映射

## 审计范围

本次只读审计对象为 `Rain0832/RainCppAI` 的 `dev` 分支，审计提交：
`858657b299c18cd668aedda6028ae64ac7decac4`（2026-08-10）。
未修改、未回推旧仓库，也未复制其源代码。以下“已验证”仅表示在该提交中检查过实现或文档，不表示 DrRainAI 已实现。

## 用户流程与路由

| 旧路径/符号 | 观察到的职责 | 证据位置 | 验证 | 新归属 | 处置与回归要求 |
|---|---|---|---|---|---|
| `/`、`/entry`、`/register` | 登录、注册和入口页面 | `AIServerCore/src/server/ChatServer.cpp:392-394`、`web/entry.html`、`web/register.html` | 已验证 | Web + Gateway | 保留核心身份流程；用页面与合同测试回归 |
| `POST /login` | 用户登录并签发 JWT Cookie | `ChatServer.cpp:399`、`ChatLoginHandler.cpp`、`Common/Auth/JwtService.cpp` | 已验证 | Gateway + Core | 保留；测试成功、失败、锁定和 Cookie 安全属性 |
| `POST /register` | 邀请码、邮箱验证码和账户注册 | `ChatServer.cpp:400`、`ChatRegisterHandler.cpp`、`AuthService.cpp` | 已验证 | Gateway + Core | P1；先确定身份/邀请政策，再做注册合同测试 |
| `/api/invite/verify` | 校验邀请码 | `ChatServer.cpp:403`、`ChatInviteVerifyHandler.cpp` | 已验证 | Core | P1；测试过期、禁用、次数和越权 |
| `/api/verify/send`、`/api/verify/check` | 邮箱验证码发送与核验 | `ChatServer.cpp:406-407`、对应 Handler、`VerificationCodeRepository` | 已验证 | Core + 外部邮件适配器 | P1；测试频率限制、过期和重放 |
| `POST /chat/send-stream` | 唯一聊天入口，SSE 流式模型响应 | `ChatServer.cpp:415`、`ChatSseHandler.cpp`、`AIHelper.cpp` | 已验证 | Gateway + Agent Runtime + Core | P0；按 SSE 合同测试顺序、取消、超时和持久化 |
| `GET /chat/sessions` | 当前用户会话列表 | `ChatServer.cpp:416`、`ChatSessionsHandler.cpp`、`SessionRepository` | 已验证 | Core | P0；测试所有权、删除会话不可见和历史一致性 |
| `POST /chat/history` | 查询会话历史，含图片负载路径 | `ChatServer.cpp:417`、`ChatHistoryHandler.cpp` | 已验证 | Core + Web | P0；测试分页/顺序、所有权和敏感内容最小化 |
| `POST /chat/delete-session` | 会话软删除 | `ChatServer.cpp:420`、`ChatDeleteSessionHandler.cpp` | 已验证 | Core | P1；先批准删除与保留语义，再测试幂等性 |
| `POST /chat/update-title` | 更新会话标题 | `ChatServer.cpp:419`、`ChatUpdateTitleHandler.cpp` | 已验证 | Core | P1；测试所有权、长度和日志脱敏 |
| `POST /chat/tts` | 百度 TTS 代理 | `ChatServer.cpp:418`、`ChatSpeechHandler.cpp`、`AISpeechProcessor.cpp` | 已验证 | Agent Runtime 的可选适配器 | 后续；需供应商、隐私和成本评审 |
| `/upload`、`POST /upload/send` | 独立图像识别页面和上传 | `ChatServer.cpp:423-424`、`AIUploadSendHandler.cpp`、`ImageRecognizer.cpp` | 已验证 | Agent Runtime + Web | 后续；需图像数据保留和医疗安全评审 |
| `/api/chat/models` | 从 `models.json` 返回模型注册表 | `ChatServer.cpp:434`、`ModelListHandler.cpp`、`models.json` | 已验证 | Agent Runtime 配置接口 | P1；测试白名单和供应商故障 |
| `/api/user/apikey` | 用户 API Key 增删查 | `ChatServer.cpp:437-438`、`ApiKeyHandler.cpp`、`ApiKeyRepository.cpp` | 已验证 | Core + Agent 受控凭据引用 | 暂缓；先完成密钥模型与轮换设计 |
| `/api/user/password` | 修改密码 | `ChatServer.cpp:441`、`ChangePasswordHandler.cpp` | 已验证 | Core | P1；测试当前密码、哈希和会话失效 |
| `/user/logout` | 用户登出 | `ChatServer.cpp:410`、`ChatLogoutHandler.cpp` | 已验证 | Gateway + Core | P1；测试 Cookie 清理与令牌失效策略 |
| `/api/feedback` | 用户提交反馈 | `ChatServer.cpp:410`、`ChatFeedbackHandler.cpp` | 已验证 | Core | 后续；定义敏感内容和管理员访问范围 |
| `/mcp` | MCP JSON-RPC 入口 | `ChatServer.cpp:444`、`McpHandler.cpp`、`McpClientManager.cpp` | 已验证 | Agent Runtime | 后续；默认关闭，逐工具授权和审计 |
| `/task/:taskId/status` | 查询 RabbitMQ 异步视觉/TTS 任务状态 | `ChatServer.cpp`、`TaskStatusHandler.cpp`、`TaskProducer.cpp` | 已验证 | Agent Runtime + Core | 后续；只有确认异步需求后再引入队列 |
| `/health`、`/metrics` | 健康检查和 Prometheus 指标 | `ChatServer.cpp:395-396`、对应 Handler | 已验证 | Gateway/运营 | P1；定义不泄露内部信息的健康响应 |
| `/admin/dashboard`、`/admin/sse` | 管理面板和实时管理 SSE | `ChatServer.cpp:452` 起、Admin Handler、`web/admin/` | 已验证 | 后续管理应用 | 后续；先定义管理员角色、审计与最小权限 |
| `/admin/api/users`、`/toggle` | 用户列表及启停 | Admin Handler、`AdminRepository.cpp` | 已验证 | Core + 管理 Web | 后续；必须做强授权和审计 |
| `/admin/api/feedback` | 管理员查看反馈 | `AdminFeedbackHandler.cpp` | 已验证 | Core + 管理 Web | 后续；限制敏感内容暴露 |
| `/admin/api/invite-codes/*` | 邀请码列表、创建和启停 | `AdminInviteCodesHandler.cpp`、`AdminRepository.cpp` | 已验证 | Core + 管理 Web | 后续；需审批与审计 |
| `/admin/logs` | 管理员日志查看器 | `AdminLogsHandler.cpp`、`web/admin/logs.html` | 已验证 | 不迁移原样 | 暂缓；优先使用脱敏日志与集中观测 |

## 模块、实体和外部依赖

| 旧模块/实体 | 观察到的内容 | 证据位置 | 处置 |
|---|---|---|---|
| `HttpServer/` | muduo HTTP、路由、中间件、静态资源、SSL | `HttpServer/TECHDOC.md`、`HttpServer/src/` | 替换为 Go Gateway；只迁移已批准合同 |
| `AIServerCore/` | 30 多个 Handler、Service、Repository、启动和路由编排 | `AIServerCore/TECHDOC.md`、`AIServerCore/src/` | 拆分为 Core、Gateway、Agent Runtime |
| `AIEngine/` | 多模型调用、Agent 工具循环、MCP、视觉、TTS | `AIEngine/TECHDOC.md`、`AIEngine/src/` | 选择性替换；不复制实现 |
| `Storage/` | MySQL 连接池和预处理语句 | `Storage/TECHDOC.md`、`Storage/src/` | 参考数据访问需求；DrRainAI PostgreSQL 仍待批准 |
| `accounts` | 用户名、密码哈希、邮箱、角色、禁用、失败次数、登录时间 | `ChatServer.cpp:100-116` | 映射为 `Principal`；必须重新设计密码、锁定和删除 |
| `sessions`、`messages` | 会话、标题、消息角色/内容、软删除、时间戳 | `ChatServer.cpp:118-151`、Repository | 映射为 `Session`、`Message`；重新定义保留和内容访问 |
| `api_keys`、`invite_codes`、`verification_codes` | 用户密钥、邀请码、邮箱验证码 | `ChatServer.cpp:153-185` | 暂缓迁移；先完成秘密生命周期和身份政策 |
| `feedback`、审计/日志 | 用户反馈和运营记录 | Admin Handler、日志模块 | 后续；禁止默认复制完整健康内容 |
| MySQL | 主数据库，8 张表及外键的文档声明 | `ChatServer.cpp`、`Storage/` | 只迁移经批准的实体；不直接迁移模式 |
| Redis | 内存→Redis→MySQL 会话缓存和上下文缓存 | `Infralib/Cache/SessionCache.*`、`TECHDOC.md` | 不纳入首期，除非有测量需求 |
| RabbitMQ | 视觉/TTS 异步队列 | `Infralib/Mq/*`、`TaskProducer.cpp` | 不纳入首期，除非确认异步任务需求 |
| 模型供应商 | 阿里云百炼、火山引擎、百度 TTS | `models.json`、`config.json.example`、`AIEngine/` | 作为受控适配器候选；凭据不迁移 |
| MCP | stdio/SSE MCP 客户端及天气示例 | `mcp_config.json`、`McpClientManager.cpp`、`mcp_servers/` | 后续；默认关闭、逐工具授权 |
| ONNX/OpenCV | 图像识别 | `ImageRecognizer.*`、CI | 后续；先做医疗安全和数据生命周期评审 |

## 安全审计结论

已确认的设计风险包括：

1. `config.json.example` 含 API Key、JWT 和邮件凭据的占位字段；DrRainAI 不得复制其结构中的真实值或默认秘密。
2. `Common/Auth/JwtService.cpp` 存在 `dev-secret-change-in-production` 默认回退；新系统必须在缺失密钥时显式启动失败。
3. `ChatServer.cpp` 的 root 播种流程会首次生成密码并以严重级别输出到控制台；新系统禁止输出初始密码，改用一次性安全引导流程。
4. 旧系统混用 Cookie JWT、localStorage 回退、配置文件凭据、Redis/RabbitMQ 和外部模型；迁移前需单独确定信任边界与秘密管理。

这些是旧实现的审计发现，不是 DrRainAI 已存在的漏洞。未发现需要复制到新仓库的患者数据；审计未执行完整秘密扫描工具。
