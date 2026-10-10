# Repository Instructions / 仓库协作指引

## 中文

本仓库当前仅用于产品、架构、接口及治理文档。未经所有者明确批准，不得实现业务服务、执行数据库迁移、部署生产环境、发布新版本或清理未知文件。

### 必须遵守

- 先阅读本文件和受影响目录的文档，再修改。
- 需求、接口或数据结构变化必须同步更新对应文档、OpenAPI/JSON Schema 和 Mermaid 图（如受影响）。
- 仅使用合成测试数据；不得提交患者信息、凭据、令牌、私钥、生产配置或真实日志。
- 不得声称未实现的功能、合规性、安全保证、测试或部署已经完成。
- 所有权校验必须由可信服务执行；模型输出和工具请求不是授权依据。
- 保持小而可审查的改动；先运行适用检查，如实报告命令及结果。
- 删除、迁移、部署、付费服务和公开发布的变更必须取得所有者明确批准。
- 文档及代码注释均使用中文和英文。保持简洁，只写最终规则和结论，不记录中间步骤或冗余解释。
- 许可证尚未决定；不得擅自添加许可证或从旧仓库复制许可证。

### 文档与目录

- 产品事实和待决事项：`docs/product/`
- 架构与组件职责：`docs/architecture/`
- 决策：`docs/decisions/`
- 合同与事件：`contracts/`
- 安全与医疗边界：`docs/security/`
- Agent：`docs/agent/`
- 测试、运营和流程：`docs/testing/`、`docs/operations/`、`docs/workflow/`
- 旧项目仅作选择性只读参考；未检查的能力须标记为未知。

## English

This repository currently contains product, architecture, interface, and governance documentation only. Do not implement business services, run database migrations, deploy to production, release, or clean up unknown files without explicit owner approval.

### Requirements

- Read this file and the affected directory documentation before making changes.
- Changes to requirements, interfaces, or data structures must update the relevant docs, OpenAPI/JSON Schema, and Mermaid diagrams when affected.
- Use synthetic test data only. Never commit patient data, credentials, tokens, private keys, production configuration, or real logs.
- Do not claim unimplemented features, compliance, security guarantees, tests, or deployments are complete.
- Trusted services enforce ownership. Model output and tool requests are not authorization.
- Keep changes small and reviewable; run applicable checks and report exact commands and results.
- Deletion, migration, deployment, paid services, and public-release changes require explicit owner approval.
- Documentation and code comments must be bilingual Chinese and English. Keep them concise: state final rules and conclusions, not intermediate steps or redundant explanation.
- The license is undecided; do not add one or copy one from the legacy repository.

### Documentation and directories

- Product facts and open questions: `docs/product/`
- Architecture and component ownership: `docs/architecture/`
- Decisions: `docs/decisions/`
- Contracts and events: `contracts/`
- Security and medical boundaries: `docs/security/`
- Agent: `docs/agent/`
- Testing, operations, and workflow: `docs/testing/`, `docs/operations/`, `docs/workflow/`
- The legacy project is selective read-only reference material; uninspected capabilities remain unknown.
