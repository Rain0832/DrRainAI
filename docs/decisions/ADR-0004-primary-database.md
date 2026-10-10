# ADR-0004: Primary Database / 主数据库

- Status / 状态: Provisional recommendation; owner approval required / 暂定建议；需所有者批准

## Context / 背景

- **中文：**候选域数据包括用户/主体、会话、消息、运行及审计事件，要求一致性和所有权校验。旧项目数据模型与迁移成本尚未审计。
- **English:** Candidate domain data includes principals, sessions, messages, runs, and audit events requiring consistency and ownership checks. Legacy schema and migration cost have not been audited.

## Options Considered / 备选方案

- **中文：**PostgreSQL 与 MySQL。两者均具事务、成熟驱动和迁移工具；旧项目兼容性、团队熟悉度和现有托管条件未知。
- **English:** PostgreSQL and MySQL. Both offer transactions, mature drivers, and migration tooling; legacy compatibility, team familiarity, and hosting constraints are unknown.

## Decision / 决定

- **中文：**绿地候选优先 PostgreSQL，因其关系事务与扩展生态适合候选数据；并非已批准决定。首期使用普通关系/文本能力，不预设 pgvector。
- **English:** Prefer PostgreSQL as a greenfield candidate because relational transactions and its extension ecosystem fit candidate data. This is not an approved final decision. Start with relational/text capabilities; do not assume pgvector.

## Consequences / 影响

- **中文：**可用单一关系库实现初期持久化；需评估运维、备份、驱动和迁移策略。更换数据库会产生模式与数据迁移成本。
- **English:** A single relational database can support initial persistence; operations, backup, drivers, and migration strategy need assessment. A database change incurs schema and data migration costs.

## Risks / 风险

- **中文：**团队或旧数据更适合 MySQL；过早依赖 PostgreSQL 专有功能会增加锁定。
- **English:** The team or legacy data may favor MySQL; premature PostgreSQL-specific features increase lock-in.

## Revisit Criteria / 复审条件

- **中文：**旧系统审计、团队能力、托管要求、事务/查询基准及检索需求明确后，由所有者批准。仅在检索指标证明必要时评估 pgvector。
- **English:** Revisit after legacy audit, team capability, hosting constraints, transaction/query benchmarks, and retrieval needs are known. Evaluate pgvector only when retrieval evidence requires it.
