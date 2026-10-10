# Local Development / 本地开发

## 中文

当前阶段不含可运行服务或启动脚本。实现获批后，按组件分别以原生进程运行，并记录可复制的安装与启动命令；本仓库不要求 Docker/Compose。

建议组件顺序：PostgreSQL（若批准）→ Core → Agent Runtime → Gateway → Web。服务实际启动顺序和健康检查须以实现为准。无供应商凭据时使用模拟模型/工具进行测试。

不得将真实健康信息用于本地开发。环境变量示例只能包含占位值；真实密钥不得提交。

## English

There are no runnable services or launch scripts in this phase. Once implementation is approved, run each component as a native process and document reproducible setup/start commands; Docker/Compose is not required.

Suggested component order: PostgreSQL (if approved) → Core → Agent Runtime → Gateway → Web. Actual startup order and health checks depend on implementation. Use simulated models/tools when provider credentials are unavailable.

Never use real health information in local development. Environment examples may contain placeholders only; never commit real secrets.
