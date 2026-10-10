# Product Specification / 产品规格

## 中文

### 愿景与用户

为用户提供可理解、可追溯且注意安全边界的健康信息辅助。目标用户、使用地区、年龄范围和是否面向临床人员均待所有者确认。

### 目标体验

候选主流程为：用户建立身份或使用经批准的访客模式，创建会话，提交问题，接收流式回复，并查看历史记录。此流程尚未实现，身份模式待决。

### 能力范围

聊天、会话历史、模型供应商、MCP/工具、检索、图像、语音和管理能力均为候选项，优先级见 [MVP 范围](MVP_SCOPE.md)。旧项目尚未审计，不能将其描述为已验证能力。

### 安全与隐私

助手提供信息支持，不作确诊、不替代医护人员。表达不确定性，不虚构来源；高风险情况应建议联系当地急救或合格医疗人员。只收集完成服务所需数据，默认不记录完整对话，访问必须经过服务端授权。具体保留期限、同意流程、适用司法辖区和升级文案均待评审。

### 部署与成功度量

开发阶段采用本地进程运行。部署环境和可用性目标未确定。拟衡量端到端任务完成率、流式终止正确率、历史一致性、授权拒绝正确率及安全评估结果；阈值须由所有者设定，当前无基线或性能声明。

### 非目标

不提供自动确诊、处方、急救替代、未经人工批准的高影响操作或未经证据支持的临床有效性声明。

## English

### Vision and users

Provide understandable, traceable health-information assistance with explicit safety boundaries. Target users, jurisdictions, age range, and any clinician-facing use remain for owner confirmation.

### Intended experience

A candidate journey is: establish an identity or use an approved guest mode, create a session, submit a question, receive a streamed answer, and review history. This journey is not implemented; identity mode is unresolved.

### Capability scope

Chat, session history, model providers, MCP/tools, retrieval, image, speech, and administration are candidates; prioritization is in the [MVP Scope](MVP_SCOPE.md). The legacy project has not been audited, so none of these are verified legacy capabilities.

### Safety and privacy

The assistant provides information, not definitive diagnosis or replacement for clinicians. It must communicate uncertainty and not fabricate sources; high-risk situations should direct users to local emergency services or qualified medical professionals. Collect only data needed for the service, avoid full-conversation logging by default, and enforce access authorization server-side. Retention periods, consent, applicable jurisdictions, and escalation wording require review.

### Deployment and success measures

Development uses local processes. Deployment environment and availability targets are undecided. Candidate measures include end-to-end task completion, correct stream termination, history consistency, correct authorization denial, and safety-evaluation results. The owner must set thresholds; no baseline or performance claim exists.

### Non-goals

No automated diagnosis, prescribing, replacement for emergency care, unapproved consequential actions, or unsupported clinical-effectiveness claims.
