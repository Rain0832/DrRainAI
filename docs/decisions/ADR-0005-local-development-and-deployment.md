# ADR-0005: Local Development and Deployment / 本地开发与部署

- Status / 状态: Proposed; owner approval required / 提案；需所有者批准

## Context / 背景

- **中文：**仓库处于文档阶段，需要避免先引入未证实的运行平台。
- **English:** The repository is in documentation phase and should not adopt an unsubstantiated runtime platform.

## Options Considered / 备选方案

- **中文：**原生本地进程；Docker Compose；集群编排。
- **English:** Native local processes; Docker Compose; cluster orchestration.

## Decision / 决定

- **中文：**本阶段仅规范原生本地进程；不要求 Docker/Compose。未来部署形式待实施需求评审。
- **English:** Specify native local processes only in this phase; Docker/Compose is not required. Future deployment form awaits implementation needs.

## Consequences / 影响

- **中文：**减少基础设施门槛；开发者需自行安装语言工具链和数据库。
- **English:** Lowers infrastructure overhead; developers must install language toolchains and database locally.

## Risks / 风险

- **中文：**环境差异导致“在我机器可用”；未来缺少自动化部署基线。
- **English:** Environment drift may cause works-on-my-machine issues; no automated deployment baseline yet.

## Revisit Criteria / 复审条件

- **中文：**经验证的复现性或发布需求出现后再评估容器和编排，不预先加入。
- **English:** Evaluate containers/orchestration only when reproducibility or release requirements are demonstrated.
