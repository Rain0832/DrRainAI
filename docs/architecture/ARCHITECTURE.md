# 架构



### 状态与目标

以下为待所有者评审的逻辑架构，不代表组件已实现或服务已部署。采用少量进程和明确边界；本阶段不引入 Kubernetes、消息总线、服务网格、独立向量库或容器要求。

### 组件

| 组件 | 职责 | 不拥有 |
|---|---|---|
| Web（React/TypeScript/Vite） | 用户交互、会话视图、SSE 展示 | 授权决策、密钥、业务真相 |
| Gateway（Go） | 外部 HTTP 入口、请求 ID、限流/超时策略、认证入口、SSE 代理与取消传播 | 核心领域状态、模型策略 |
| Core（C++） | 领域规则、身份/会话/消息所有权校验、持久化边界 | 模型执行、公开网络入口 |
| Agent Runtime（Python） | 单 Agent 有界运行、模型适配、经批准的检索/工具编排 | Core 数据库直连、独立授权 |
| PostgreSQL（提案） | Core 管理的持久数据 | Agent 的直接写入 |

调用方向：Web → Gateway → Core；Gateway → Agent Runtime；Agent 通过受控 Core 接口请求允许的操作。所有服务接口暂为 HTTP/JSON 提案。

### 聊天事务与流

Core 校验会话所有权并创建运行及用户消息后，Gateway 调用 Agent Runtime 并转发规范化事件。成功结果须先由 Core 持久化，再由 Gateway 发出 `completed`。模型或工具不得绕过 Core 写数据库。超时、断连、取消、部分内容和持久化失败的外部语义见 [API 合同](../../contracts/events/sse-events.md)；重连/恢复仍未定。

### 图示

规范图源位于 `docs/diagrams/`：[系统上下文](../diagrams/system-context.mmd)、[容器](../diagrams/container-architecture.mmd)、[聊天时序](../diagrams/chat-sequence.mmd)、[Agent 状态机](../diagrams/agent-state-machine.mmd)、[本地部署](../diagrams/local-deployment.mmd)。
