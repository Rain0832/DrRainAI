# Technology Stack / 技术栈

## 中文

以下均为提案，具体决策见对应 ADR；当前未添加实现依赖。

| 层 | 提案 | 理由与代价 |
|---|---|---|
| 前端 | React + TypeScript + Vite | 适合交互式 Web；需维护 JS 工具链与类型边界 |
| Gateway | Go | 单一网络入口、并发流代理；团队需维护 Go 服务 |
| 业务 Core | C++ | 满足目标设计的领域核心约束；接口/构建复杂度较高，需验证维护能力 |
| Agent Runtime | Python，单 Agent | 模型 SDK 生态；运行时隔离、依赖和供应商变更须治理 |
| 主数据库 | PostgreSQL，暂定 | 事务与 JSON 能力契合候选数据；对旧项目迁移成本未知 |
| API/事件 | HTTP/JSON、OpenAPI、JSON Schema、SSE | 可读、工具广泛；需版本兼容规则 |
| 本地开发 | 原生进程 | 不要求容器；开发者需安装各语言工具链和 PostgreSQL |

初期不引入 Redis、RabbitMQ、独立向量库、Kafka、Kubernetes 或 gRPC。只有经验证需求和 ADR 才能加入。pgvector 需等检索需求、数据规模和质量评估明确后再决定。

## English

These are proposals; see the corresponding ADRs. No implementation dependencies have been added.

| Layer | Proposal | Rationale and cost |
|---|---|---|
| Frontend | React + TypeScript + Vite | Suits interactive web UX; requires maintaining a JS toolchain and type boundaries |
| Gateway | Go | Single network entry and concurrent stream relay; team must operate Go services |
| Business Core | C++ | Matches the target domain-core constraint; interface/build complexity and team capability need validation |
| Agent Runtime | Python, single Agent | Model SDK ecosystem; runtime isolation, dependencies, and provider changes need governance |
| Primary database | PostgreSQL, provisional | Transactions and JSON fit candidate data; legacy migration cost is unknown |
| API/events | HTTP/JSON, OpenAPI, JSON Schema, SSE | Readable and widely supported; compatibility rules are required |
| Local development | Native processes | No container requirement; developers need language toolchains and PostgreSQL |

Do not initially add Redis, RabbitMQ, a standalone vector database, Kafka, Kubernetes, or gRPC. Add only for a validated need and ADR. Decide on pgvector only after retrieval needs, data scale, and quality evaluation are understood.
