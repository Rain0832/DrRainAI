# ADR-0001: Independent Repository and Legacy Migration / 独立仓库与旧项目迁移

- Status / 状态: Proposed; owner approval required / 提案；需所有者批准

## Context / 背景

**中文：**DrRainAI 是新绿地仓库，不是 RainCppAI 的 Fork。旧仓库未经本轮审计。

**English:** DrRainAI is a new greenfield repository, not a fork of RainCppAI. The legacy repository was not audited in this run.

## Options Considered / 备选方案

- **中文：**整体复制旧代码；逐项审计后迁移；全新实现并选择性参考。
- **English:** Copy the legacy codebase; audit and migrate selectively; build anew with selective reference.

## Decision / 决定

- **中文：**提议保持仓库独立，只在具体工作流需要时只读检查旧项目；未验证代码不得复制。
- **English:** Keep the repository independent; inspect the legacy project read-only only for concrete workflow questions; do not copy unaudited code.

## Consequences / 影响

- **中文：**避免继承未经理解的设计；需另做功能盘点及兼容性回归设计。
- **English:** Avoid inheriting unexplored design; a feature inventory and compatibility regression plan are still needed.

## Risks / 风险

- **中文：**可能遗漏用户依赖的旧流程；当前没有源代码证据。
- **English:** Existing user workflows could be missed; no source-code evidence is currently available.

## Revisit Criteria / 复审条件

- **中文：**只读审计明确具体功能、证据、依赖、许可和迁移成本后复审。
- **English:** Revisit after a read-only audit documents concrete features, evidence, dependencies, licensing, and migration cost.
