# ADR-0006: Agent Runtime / Agent 运行时

- Status / 状态: Proposed; owner approval required / 提案；需所有者批准

## Context / 背景

- **中文：**需要模型适配和受限工具执行，同时让 Core 保持业务与持久化权威。
- **English:** Model adapters and bounded tool execution are needed while Core remains authoritative for business and persistence.

## Options Considered / 备选方案

- **中文：**Agent 直接置于 Core；独立 Python Runtime；多 Agent 编排平台。
- **English:** Embed the Agent in Core; use a separate Python runtime; adopt multi-Agent orchestration.

## Decision / 决定

- **中文：**提议 Python 单 Agent Runtime，默认无工具；工具须逐项批准、类型校验、授权、超时和审计。Agent 不直连数据库。
- **English:** Propose a Python single-Agent runtime with no tools enabled by default. Each tool requires approval, typed validation, authorization, timeout, and audit. The Agent has no direct database access.

## Consequences / 影响

- **中文：**运行时可独立限制和取消；跨语言与供应商 SDK 带来维护成本。
- **English:** Runtime can be bounded and cancelled separately; polyglot and provider SDK dependencies add maintenance cost.

## Risks / 风险

- **中文：**模型调用成本难精确衡量；工具提示注入或副作用造成风险。
- **English:** Model-call cost may not be precisely measurable; prompt injection or tool side effects create risk.

## Revisit Criteria / 复审条件

- **中文：**团队能力、模型供应商、工具需求和运行隔离要求明确后复审；未经证据不采用多 Agent。
- **English:** Revisit when team capability, provider, tool needs, and isolation requirements are known; do not adopt multi-Agent without evidence.
