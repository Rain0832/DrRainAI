# Legacy Reference Map / 旧项目参考映射

## 中文

来源候选：[RainCppAI](https://github.com/Rain0832/RainCppAI)。本轮未读取远程仓库内容、克隆代码或验证其默认分支，故没有可归属到源代码的观察事实。下表是待审计清单，不是旧项目功能声明。

| 候选领域 | 证据/位置 | 验证 | 暂定处置 | 新归属候选 |
|---|---|---|---|---|
| 登录与身份 | 未检查 | 未验证 | 未知 | Gateway + Core |
| 聊天与流式输出 | 未检查 | 未验证 | 未知 | Gateway + Agent Runtime |
| 会话与历史 | 未检查 | 未验证 | 未知 | Core |
| 模型供应商 | 未检查 | 未验证 | 未知 | Agent Runtime |
| MCP/工具、检索 | 未检查 | 未验证 | 未知 | Agent Runtime |
| 图像、语音 | 未检查 | 未验证 | 未知 | 待需求与证据确认 |
| 管理、反馈 | 未检查 | 未验证 | 未知 | 待范围确认 |
| 中间件、数据库、部署与测试 | 未检查 | 未验证 | 未知 | 不推定迁移 |

完成兼容性审计前，不应声称功能已保留，也不应复制旧代码。具体文件、符号、路由、数据实体及回归测试待后续只读检查后补充。

## English

Candidate source: [RainCppAI](https://github.com/Rain0832/RainCppAI). This run did not read the remote repository, clone code, or verify its default branch; therefore, there are no source-attributed observations. The table is an audit checklist, not a claim about legacy features.

| Candidate area | Evidence/location | Verified | Provisional disposition | Candidate owner |
|---|---|---|---|---|
| Login and identity | Not inspected | No | Unknown | Gateway + Core |
| Chat and streaming | Not inspected | No | Unknown | Gateway + Agent Runtime |
| Sessions and history | Not inspected | No | Unknown | Core |
| Model providers | Not inspected | No | Unknown | Agent Runtime |
| MCP/tools and retrieval | Not inspected | No | Unknown | Agent Runtime |
| Image and speech | Not inspected | No | Unknown | Confirm from requirements and evidence |
| Administration and feedback | Not inspected | No | Unknown | Confirm scope |
| Middleware, database, deployment, and tests | Not inspected | No | Unknown | No migration assumed |

Do not claim compatibility or copy legacy code before a compatibility audit. Exact files, symbols, routes, entities, and regression tests require a later read-only inspection.
