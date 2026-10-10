# ADR-0007: API Contracts / API 合同

- Status / 状态: Proposed; owner approval required / 提案；需所有者批准

## Context / 背景

- **中文：**跨语言服务需要稳定、可验证的请求、错误和流事件格式。
- **English:** Cross-language services need stable, verifiable request, error, and stream-event formats.

## Options Considered / 备选方案

- **中文：**HTTP/JSON 与 OpenAPI/JSON Schema；gRPC/Protobuf；混合方案。
- **English:** HTTP/JSON with OpenAPI/JSON Schema; gRPC/Protobuf; hybrid contracts.

## Decision / 决定

- **中文：**提议 HTTP/JSON + OpenAPI + JSON Schema + SSE；接口当前为 DRAFT，不定义未确认的最终路径。
- **English:** Propose HTTP/JSON + OpenAPI + JSON Schema + SSE. Interfaces are DRAFT; do not assert unconfirmed final paths.

## Consequences / 影响

- **中文：**人类可读且语言无关；需制定兼容、版本、验证和生成流程。
- **English:** Human-readable and language-neutral; compatibility, versioning, validation, and generation rules are needed.

## Risks / 风险

- **中文：**规范与实现漂移；事件命名或终态语义不一致。
- **English:** Specification may drift from implementation; event names or terminal semantics may diverge.

## Revisit Criteria / 复审条件

- **中文：**在真实服务性能、代码生成或协议能力要求经测量不满足时复审。
- **English:** Revisit if measured service performance, code-generation, or protocol requirements are not met.
