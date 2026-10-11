# 组件边界



| 组件 | 公共接口（提案） | 允许依赖 | 配置要求 | 测试要求 |
|---|---|---|---|---|
| Web | Gateway 的 HTTP/JSON、SSE | UI 库与共享合同 | Gateway 地址；不得包含服务端密钥 | 单元、交互、合同、浏览器 E2E |
| Gateway | 浏览器 HTTP/SSE；Core/Agent 内部 HTTP | Go 标准库优先、经批准客户端 | 监听地址、上游地址、限流/超时、密钥引用 | 单元、合同、集成、断连/超时 |
| Core | Gateway 内部 HTTP/JSON | C++ 标准库及经批准数据库驱动 | 数据库连接、服务监听、密钥引用 | 领域单元、数据库集成、授权 |
| Agent Runtime | Gateway 内部运行/流协议、Core 的 Authorized Evidence API | Python 标准库及评审通过的模型 SDK | 供应商凭据引用、超时/迭代/预算限制 | 状态机、工具合同、仿真模型 |

配置名和启动命令待实现阶段按实际工具确定，不在本规范中虚构。密钥通过受控运行环境注入，不写入版本库。

### 依赖方向

前端只依赖公开 Gateway 合同；Gateway 编排 Core 与 Agent Runtime；Core 是业务和持久化权威；Agent Runtime 不能直连 Core 数据库。共享合同只定义交换格式，不引入跨组件业务逻辑。医疗记录只有 `Published` 版本可被 Evidence API 返回；Agent Runtime 不得直连业务数据库。

每个实现组件的 `README.md` 和 `AGENTS.md` 应在其获批创建时明确职责、禁止拥有内容、接口、允许依赖、配置、测试命令和文档更新要求。
