# Data Model / 数据模型

## 中文

**提案：**关系数据由 Core 拥有和访问，暂定 PostgreSQL。Agent Runtime 禁止直连数据库。

| 实体 | 关键字段（提案） | 关系/约束 |
|---|---|---|
| Principal | `principal_id`、身份提供方引用、状态 | 认证方式待定；不在此存储明文凭据 |
| Session | `session_id`、`owner_id`、创建/更新时间、状态 | 每次读写验证 owner |
| Message | `message_id`、`session_id`、角色、内容引用/内容、时间、状态 | 角色与状态受约束；内容访问受会话授权 |
| Run | `run_id`、`session_id`、`request_id`、状态、时间、终止错误码 | 一个用户消息对应运行关系待确定；至多一个终态 |
| AuditRecord | 事件 ID、主体、动作、对象类型/ID、结果、时间 | 仅保留必要元数据，不默认复制消息正文 |

唯一性、并发写、内容加密、删除级联、软删除、导出和保留期限均待决；模式不代表最终物理表。审计记录本身的访问与防篡改要求也待评审。

## English

**Proposal:** Core owns and accesses relational data, with PostgreSQL provisional. Agent Runtime must not connect directly to the database.

| Entity | Proposed key fields | Relations/constraints |
|---|---|---|
| Principal | `principal_id`, identity-provider reference, status | Auth method undecided; no plaintext credentials |
| Session | `session_id`, `owner_id`, created/updated times, status | Verify owner on every access |
| Message | `message_id`, `session_id`, role, content reference/content, time, status | Constrain role/status; protect content by session authorization |
| Run | `run_id`, `session_id`, `request_id`, status, time, terminal error code | User-message relation undecided; at most one terminal state |
| AuditRecord | Event ID, principal, action, object type/ID, result, time | Keep necessary metadata only; do not copy message body by default |

Uniqueness, concurrent writes, content encryption, deletion cascade, soft delete, export, and retention are unresolved; this proposal is not a final physical schema. Audit-record access and tamper-resistance requirements also need review.
