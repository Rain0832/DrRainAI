# Privacy and Retention / 隐私与数据保留

## 中文

- 最小化收集：仅处理实现获批工作流必需的数据；数据类别和处理目的须公开说明。
- 目的限制：对话不得默认用于训练、分析或二次用途；任何此类用途需单独批准和适当告知/同意。
- 访问控制：服务端验证主体与会话所有权；管理访问须独立授权并留存必要审计。
- 传输与存储：生产设计应评估加密、密钥轮换、备份保护和访问审计；尚未实现或验证。
- 日志：默认不记录完整消息、提示、模型响应、凭据或健康信息；记录必要的运行标识、状态和脱敏错误。
- 保留与删除：会话保留时长、删除语义、备份清除、数据导出和法定保留要求均待评审；未定前不得宣称满足删除请求。
- 开发与评估只使用合成数据；不得复制真实患者数据。
- 适用法律与地区未确定，不作 GDPR、HIPAA 或其他合规声明。

## English

- Minimize collection: process only data required for approved workflows; disclose data categories and purposes.
- Purpose limitation: do not use conversations for training, analytics, or secondary purposes by default; such use requires separate approval and appropriate notice/consent.
- Access control: verify principal/session ownership server-side; separately authorize administrative access and retain necessary audit records.
- Transit and storage: production design must assess encryption, key rotation, backup protection, and access auditing; none is implemented or verified.
- Logging: do not log full messages, prompts, model responses, credentials, or health information by default; record only necessary run IDs, status, and redacted errors.
- Retention and deletion: session retention, deletion semantics, backup erasure, export, and legal retention remain for review; do not claim deletion compliance before they are defined.
- Use synthetic data only in development and evaluation; never copy real patient data.
- Applicable laws and jurisdictions are undecided; no GDPR, HIPAA, or other compliance claim is made.
