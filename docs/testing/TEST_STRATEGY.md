# Test Strategy / 测试策略

## 中文

本仓库当前无业务实现，因此没有可运行的产品测试，也不声明测试通过。测试命令须随具体服务和工具链确定。

### 实现后的测试层次

- 单元：Core 领域规则、Gateway 路由/超时、Agent 状态机/预算、前端交互。
- 合同：OpenAPI、JSON Schema、错误格式、SSE 事件名/顺序/终态及跨语言兼容。
- 集成：授权、数据库持久化/重载、模型与工具适配器（使用可控替身）。
- E2E：批准身份模式下的创建会话→发送消息→流式完成→历史重载。
- 安全/隐私：越权拒绝、输入限制、秘密扫描、日志脱敏、恶意工具请求。
- Agent 评估：使用版本化合成案例；不得替代确定性测试。

每项测试仅使用合成数据。故障测试覆盖断连、取消、超时、重试冲突、模型/工具错误与持久化失败。性能目标待基线测量后批准。

## English

This repository currently has no business implementation, runnable product tests, or test-pass claim. Define commands when the service/toolchains exist.

### Test layers after implementation

- Unit: Core domain rules, Gateway routing/timeouts, Agent state machine/budgets, frontend interaction.
- Contract: OpenAPI, JSON Schema, error format, SSE names/order/terminal state, and cross-language compatibility.
- Integration: authorization, database persistence/reload, model and tool adapters using controlled substitutes.
- E2E: session creation → message submission → streamed completion → history reload under the approved identity mode.
- Security/privacy: access denial, input limits, secret scanning, log redaction, malicious tool requests.
- Agent evaluation: versioned synthetic cases; never a substitute for deterministic tests.

Use synthetic data only. Failure tests cover disconnect, cancellation, timeout, retry conflicts, model/tool errors, and persistence failure. Approve performance targets only after measuring a baseline.
