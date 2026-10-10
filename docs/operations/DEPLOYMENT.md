# Deployment / 部署

## 中文

本仓库未实现可部署服务，亦未选定生产环境。部署方式、地域、网络、可用性、备份/恢复、密钥管理和监控均须另行评审。

获批部署设计至少要定义：信任边界、服务身份、TLS、网络访问、密钥轮换、数据库迁移与回滚、备份恢复演练、健康探针、资源限制、超时/取消、日志与数据保留、漏洞修复及事故响应。

不要求 Kubernetes、Docker、服务网格或特定云服务。任何公开发布、生产部署或数据库迁移均须所有者批准；本文件不构成部署操作指令。

## English

No deployable service is implemented and no production environment has been selected. Deployment model, region, networking, availability, backup/recovery, secret management, and monitoring require separate review.

An approved deployment design must define trust boundaries, service identities, TLS, network access, key rotation, database migration/rollback, backup-restore exercises, health probes, resource limits, timeout/cancellation, logging and retention, vulnerability remediation, and incident response.

Kubernetes, Docker, a service mesh, and any specific cloud are not required. Public release, production deployment, and database migration require owner approval; this document is not an operational runbook.
