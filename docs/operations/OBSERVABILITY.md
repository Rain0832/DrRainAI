# Observability / 可观测性

## 中文

- 结构化日志记录时间、服务、环境、`request_id`、`run_id`、事件类型和结果；禁止默认记录消息正文、提示、模型响应、凭据或患者标识。
- 错误字段使用稳定代码与脱敏消息；避免把上游原始错误写入用户响应或日志。
- Trace 跨 Gateway、Core、Agent 传播关联标识；指标至少可区分请求数、延迟分布、错误/终止原因和取消情况。
- 为避免高基数及隐私泄露，指标标签不得包含用户、会话、消息或自由文本标识。
- 健康检查、告警阈值、采样、保留期、访问授权及监控供应商均待部署评审。
- 可观测数据同样可能包含敏感信息，须控制访问和保留。

## English

- Structured logs should include time, service, environment, `request_id`, `run_id`, event type, and outcome; do not log message bodies, prompts, model responses, credentials, or patient identifiers by default.
- Use stable error codes and redacted messages; do not place raw upstream errors in responses or logs.
- Propagate trace correlation across Gateway/Core/Agent. Metrics should distinguish request count, latency distribution, error/terminal reason, and cancellation.
- To avoid high cardinality and privacy leaks, metric labels must not contain user, session, message, or free-text identifiers.
- Health checks, alert thresholds, sampling, retention, access authorization, and monitoring vendor require deployment review.
- Observability data can itself be sensitive and needs access and retention controls.
