# SSE Event Contract (Draft) / SSE 事件合同（草案）

## 中文

**状态：DRAFT；未经批准且未实现。**事件均为 UTF-8 JSON 数据，SSE `event` 名与 JSON `type` 一致。`request_id`、`run_id` 用于关联；不得在事件中放入凭据或不必要的健康信息。字段结构见 [`run-event.schema.json`](../json-schema/run-event.schema.json)。

每帧提案格式为 `id: <event_id>`、`event: <type>`、`data: <JSON>`，并以空行结束。API 路径采用 `/v1`；不兼容字段、必填字段或事件语义变更需新主版本。向现有事件添加可选字段仅在消费者忽略未知可选字段并通过合同测试后视为兼容。未知事件不得解释为成功；客户端应将其作为协议错误处理，不得显示成功终态。

### 事件

| `event` / `type` | 负载 | 规则 |
|---|---|---|
| `run.started` | `status` | 每次运行至多一个，先于输出 |
| `message.delta` | `text` | 有序增量；部分文本不是完整结果 |
| `tool.started` | `tool_name` | 仅在工具获批、允许且授权后发出；不含秘密参数 |
| `tool.completed` | `tool_name`、安全摘要 | 成功工具结束 |
| `tool.failed` | `tool_name`、安全 `error` | 工具失败；不暴露内部敏感细节 |
| `run.completed` | 最终 `message_id` | 仅 Core 确认持久化后发出 |
| `run.failed` | `error` | 无法成功完成；`retryable` 由服务判定 |
| `run.cancelled` | `reason` | 取消已生效或运行已停止 |

`error` 使用稳定机器码、安全短消息和 `retryable`。REST 错误提案采用 `application/problem+json`，含 `type/title/status/request_id`；不返回堆栈或供应商原始错误。

### 可靠性语义

- Core 先校验身份/会话所有权并持久化用户消息与运行，再启动 Agent。
- 运行成功时先持久化 assistant 结果，再发送 `run.completed`。持久化失败发送 `run.failed`。
- 客户端断连触发尽力取消；服务端应设置总超时与模型/工具超时。实际取消延迟和部分输出保留策略待定。
- Agent/工具错误不得被伪装为成功；仅对幂等且可重试操作按预算重试。
- 请求重试使用 `Idempotency-Key` 提案；作用域、保存期限、冲突处理待定。
- 重放、`Last-Event-ID`、断点恢复及恰好一次语义未定义；不得依赖其存在。
- 每次运行只允许一个终态；建议输出顺序为 started → 增量/工具事件 → 单一终态。

## English

**Status: DRAFT; neither approved nor implemented.** Events carry UTF-8 JSON; the SSE `event` name matches JSON `type`. `request_id` and `run_id` provide correlation. Never include credentials or unnecessary health information. See [`run-event.schema.json`](../json-schema/run-event.schema.json) for the envelope.

The proposed frame is `id: <event_id>`, `event: <type>`, `data: <JSON>`, followed by a blank line. API paths use `/v1`; incompatible field, required-field, or event-semantic changes require a new major version. Adding optional fields is compatible only when consumers ignore unknown optional fields and contract tests pass. Unknown events must not be interpreted as success; clients should treat them as protocol errors and must not display a successful terminal state.

### Events

| `event` / `type` | Payload | Rule |
|---|---|---|
| `run.started` | `status` | At most once per run, before output |
| `message.delta` | `text` | Ordered delta; partial text is not a complete answer |
| `tool.started` | `tool_name` | Emit only after tool approval, allowlisting, and authorization; no secret arguments |
| `tool.completed` | `tool_name`, safe summary | Tool completed successfully |
| `tool.failed` | `tool_name`, safe `error` | Tool failed; do not expose sensitive internals |
| `run.completed` | Final `message_id` | Emit only after Core confirms persistence |
| `run.failed` | `error` | Cannot complete successfully; service determines `retryable` |
| `run.cancelled` | `reason` | Cancellation took effect or execution stopped |

`error` uses a stable machine code, safe short message, and `retryable`. REST errors propose `application/problem+json` with `type/title/status/request_id`; never return stack traces or raw provider errors.

### Reliability semantics

- Core authenticates/checks session ownership and persists the user message and run before starting the Agent.
- On success, persist the assistant result before `run.completed`. Persistence failure emits `run.failed`.
- A client disconnect triggers best-effort cancellation; the server must enforce total, model, and tool timeouts. Cancellation latency and partial-output retention require a decision.
- Agent/tool errors must not appear as success; retry only idempotent, retryable operations within a budget.
- Request retries propose `Idempotency-Key`; scope, retention, and conflict behavior remain unresolved.
- Replay, `Last-Event-ID`, resume, and exactly-once semantics are undefined; clients must not assume they exist.
- Each run has at most one terminal event; proposed order is started → deltas/tool events → one terminal event.
