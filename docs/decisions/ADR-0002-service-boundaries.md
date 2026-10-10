# ADR-0002: Service Boundaries / 服务边界

- Status / 状态: Proposed; owner approval required / 提案；需所有者批准

## Context / 背景

- **中文：**需要隔离公开入口、权威业务规则与模型/工具执行。
- **English:** Public ingress, authoritative business rules, and model/tool execution need separate trust boundaries.

## Options Considered / 备选方案

- **中文：**单体、分层模块化单体、独立 Web/Gateway/Core/Agent 进程。
- **English:** Monolith, modular monolith, or separate Web/Gateway/Core/Agent processes.

## Decision / 决定

- **中文：**逻辑上采用 Web、Go Gateway、C++ Core、Python Agent Runtime 四个边界；部署初期可按团队与运维能力合并进程，须经 ADR 评审。
- **English:** Propose four logical boundaries—Web, Go Gateway, C++ Core, Python Agent Runtime. Processes may be co-located initially based on team and operations capacity, subject to ADR review.

## Consequences / 影响

- **中文：**职责清晰但增加跨进程合同、构建和运维成本。
- **English:** Boundaries clarify ownership but add cross-process contract, build, and operational costs.

## Risks / 风险

- **中文：**为技术分层过度拆分；跨服务错误及取消传播处理不全。
- **English:** Over-splitting for technology boundaries; incomplete cross-service error and cancellation propagation.

## Revisit Criteria / 复审条件

- **中文：**团队规模、可靠性需求、部署成本或测量到的扩展瓶颈表明边界不合适时复审。
- **English:** Revisit if team size, reliability requirements, deployment cost, or measured scaling bottlenecks make the boundaries unsuitable.
