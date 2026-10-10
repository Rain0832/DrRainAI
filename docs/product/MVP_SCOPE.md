# MVP Scope / MVP 范围

## 中文

所有范围均为提案，须经所有者批准。最小目标是单用户端到端聊天闭环，不把未审计的旧功能带入 MVP。

| 能力 | 暂定优先级 | 验收状态 |
|---|---|---|
| 身份或访客模式 | 未决 | 必须先决定身份模式 |
| 创建会话、提交消息 | P0 提案 | 见 [验收标准](MVP_SCOPE.md#验收标准) |
| Agent 流式答复及终止状态 | P0 提案 | 需定义并测试 SSE 合同 |
| 持久化并重新载入历史 | P0 提案 | 需授权与一致性测试 |
| 多模型供应商 | P1 提案 | 未验证需求 |
| MCP/工具 | 后续/未决 | 先建立授权与工具风险依据 |
| 检索、图像、语音 | 后续/未决 | 依据审计和需求再定 |
| 管理与反馈 | 后续/未决 | 角色和范围未定 |

### 验收标准（提案）

1. 在批准的身份模式下创建会话；未授权用户不能读取他人会话。
2. 合法消息触发一个关联 `run_id` 的流；开始、文本增量、完成/失败/取消事件遵循合同。
3. 成功完成前确认 assistant 回复已持久化；持久化失败不得发送成功终态。
4. 客户端断连、超时和取消均有确定终态；取消应尽力传播到 Agent 和上游调用。
5. 重新载入会话可得到持久化的用户消息和成功的 assistant 回复；失败回复按明确策略显示。
6. 合成测试覆盖授权拒绝、事件顺序、超时、断连及持久化故障。

身份模式、流重连策略和失败消息是否保留仍待所有者决定；接受标准不能据此宣称已实现。

## English

All scope is proposed and requires owner approval. The smallest target is a single-user end-to-end chat loop; unaudited legacy features are not automatically included.

| Capability | Provisional priority | Acceptance status |
|---|---|---|
| Identity or guest mode | Unresolved | Identity mode must be decided |
| Create session and submit message | P0 proposal | See [Acceptance Criteria](#acceptance-criteria) |
| Streamed Agent answer and terminal state | P0 proposal | SSE contract and tests required |
| Persist and reload history | P0 proposal | Authorization and consistency tests required |
| Multiple model providers | P1 proposal | Need not verified |
| MCP/tools | Later/unresolved | Establish authorization and tool-risk basis first |
| Retrieval, image, speech | Later/unresolved | Decide from audited evidence and requirements |
| Administration and feedback | Later/unresolved | Roles and scope undecided |

### Acceptance Criteria (proposed)

1. Create a session under the approved identity mode; unauthorized users cannot read another user's session.
2. A valid message starts a stream associated with a `run_id`; start, text-delta, and completed/failed/cancelled events follow the contract.
3. Confirm assistant-answer persistence before successful completion; persistence failure must not produce a success terminal event.
4. Client disconnect, timeout, and cancellation have defined terminal outcomes; cancellation is propagated best-effort to the Agent and upstream calls.
5. Reloading a session returns persisted user messages and successful assistant answers; failed answers follow an explicit policy.
6. Synthetic tests cover authorization denial, event order, timeout, disconnect, and persistence failure.

Identity mode, stream reconnection, and failed-message retention remain for owner decision; these criteria do not imply implementation.
