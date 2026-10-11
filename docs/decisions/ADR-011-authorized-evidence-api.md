# ADR-011：Authorized Evidence API

- 状态：提案；需所有者批准

## 背景

Python Agent 需要业务事实进行推理，但模型运行时不应拥有业务数据库凭据或绕过 Core 的授权边界。

## 决定

Python Agent 只能通过 C++ Core 提供的授权接口获取 `Evidence` 对象。Core 在返回证据前执行租户隔离、资源级授权、记录状态和版本校验；只有 `Published` 数据可作为证据返回。Agent Runtime 禁止直连业务数据库，也不得把模型输出或工具请求当作授权依据。

接口模板见 [`contracts/openapi/evidence_api.yaml`](../../contracts/openapi/evidence_api.yaml)。

## 影响

授权和审计集中在 Core，便于统一控制数据边界；Core 与 Agent 之间增加一次接口调用和合同维护成本。

## 复审条件

当证据检索的延迟、流式需求或高性能 RPC 需求有可测量证据时，复审 HTTP/JSON 是否需要补充其他协议。
