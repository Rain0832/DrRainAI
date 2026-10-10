# Tool Policy / 工具策略

## 中文

当前没有获批工具；Agent 默认不能调用工具。每项工具上线前须记录负责人、用途、数据流、威胁、权限、输入/输出 JSON Schema、超时、幂等性、审计字段和失败语义。

- 服务端按用户、会话、工具和操作进行授权；不能依赖模型决定权限。
- 使用最小权限和 allowlist；拒绝未知工具、额外字段、无效参数和越权请求。
- 任何写入、外部通信、账户操作或其他有后果动作须先由人工批准；审批内容应包含具体操作与目标。
- 工具输出视为不可信内容；对模型重新输入前限制长度并隔离指令内容。
- 凭据由工具服务端持有，不进入 Agent 提示、浏览器或日志。
- 可重试操作须幂等；失败时返回稳定、脱敏的错误，拒绝默认静默降级。

## English

No tools are approved; the Agent cannot call tools by default. Before enabling a tool, document its owner, purpose, data flow, threats, permissions, input/output JSON Schemas, timeout, idempotency, audit fields, and failure semantics.

- Authorize server-side by user, session, tool, and operation; never rely on the model to grant permission.
- Use least privilege and an allowlist; reject unknown tools, extra fields, invalid arguments, and unauthorized requests.
- Any write, external communication, account operation, or other consequential action requires prior human approval specifying the operation and target.
- Treat tool output as untrusted; bound its size and isolate embedded instructions before returning it to the model.
- Credentials remain server-side and out of Agent prompts, browser, and logs.
- Retryable operations must be idempotent; return stable, redacted errors on failure rather than silently degrading.
