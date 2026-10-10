# 技术栈



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
