# Agent Runtime / Agent 运行时

## 中文

**提案：**Python 单 Agent 有界执行。Agent 不持有业务真相，不直接连接 Core 数据库，也不因模型请求自动获得权限。

### 状态与终止

状态：`accepted → validating → running → finalizing → completed | failed | cancelled`；工具调用是 `running` 的受控子状态。每次运行最多一个终态。Core 确认 assistant 消息持久化后才允许 `completed`。

### 资源与取消

- 必须设置最大迭代数、总运行超时、单模型调用超时、单工具超时及输出上限；数值作为部署配置由所有者评审，未定前不虚构默认值。
- 若供应商提供可测量用量，应记录模型调用次数/令牌或成本估计及预算终止原因；不得假称精确成本。
- 超预算、超时、客户端取消、工具拒绝/失败均进入明确终态；取消传播尽力而为。
- `run_id`、`request_id` 和 trace 标识贯穿 Gateway、Core、Agent；不得用患者文本充当标识。

### 工具、重试和错误

- 默认不启用工具。每个工具须有 allowlist、版本化输入/输出 schema、调用方权限检查、最小权限、超时和安全审计。
- 模型给出的工具参数是非可信输入；先验证 schema，再由可信服务判权。
- 仅对明确可重试且幂等的调用重试，并受次数/时间预算约束；有副作用调用须幂等键或人工确认。
- 对外使用稳定错误码及脱敏信息；内部堆栈和供应商原始错误不得透传。
- 模型/工具失败或持久化失败不得发成功事件。恢复与部分输出保留策略待定。

## English

**Proposal:** a single bounded Python Agent. It does not own business truth, connect directly to the Core database, or gain permissions from model requests.

### States and termination

States: `accepted → validating → running → finalizing → completed | failed | cancelled`; tool calls are controlled substates of `running`. A run has at most one terminal state. `completed` requires Core confirmation that the assistant message is durable.

### Resources and cancellation

- Configure maximum iterations, total run timeout, per-model-call timeout, per-tool timeout, and output limit. Owners must approve values; do not invent defaults while undecided.
- When provider usage is measurable, record call/token or cost estimates and budget termination reason; never claim exact cost without evidence.
- Budget exhaustion, timeout, client cancellation, tool denial/failure, and persistence failure lead to explicit terminal outcomes; cancellation propagation is best effort.
- Propagate `run_id`, `request_id`, and trace identifiers across Gateway/Core/Agent; never derive identifiers from patient text.

### Tools, retries, and errors

- Tools are disabled by default. Each tool requires an allowlist entry, versioned input/output schema, caller authorization, least privilege, timeout, and safe audit.
- Model-produced tool arguments are untrusted; validate schema, then authorize through a trusted service.
- Retry only explicitly retryable and idempotent operations within count/time budgets; side effects require idempotency or human approval.
- Return stable error codes and redacted messages; do not expose internal stacks or raw provider errors.
- Model/tool or persistence failure must not emit a success event. Recovery and partial-output retention remain unresolved.
