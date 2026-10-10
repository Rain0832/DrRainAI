# Agent Evaluation / Agent 评估

## 中文

评估方案待实现阶段批准。建立带版本号的合成案例集；每个案例包含目标行为、输入、预期安全边界和评分说明，不得使用真实患者记录。

### 评估维度

1. 依据性：是否仅引用可用上下文、标明信息不足且不编造出处。
2. 不确定性/拒答：风险或证据不足时是否恰当说明边界、升级求助。
3. 工具选择：仅选择获批工具，参数符合 Schema。
4. 授权：越权、未知工具及缺失批准均被拒绝。
5. 故障处理：超时、工具错误、模型错误、断连、预算耗尽和持久化失败具有正确终态。

### 方法与门槛

确定性单元、合同和集成测试是必要门槛；模型评估不能替代。记录案例集版本、模型/提示版本、运行配置、评分依据和结果；不将单次模型分数等同临床安全。基线、阈值、人工评审者和回归政策均待所有者批准。

## English

The evaluation plan requires approval during implementation. Maintain a versioned synthetic case set; each case records intended behavior, input, safety boundary, and scoring guidance. Never use real patient records.

### Evaluation dimensions

1. Grounding: use only available context, acknowledge missing information, and do not fabricate sources.
2. Uncertainty/refusal: state boundaries and escalate appropriately when risk or evidence warrants.
3. Tool selection: choose only approved tools and provide schema-valid arguments.
4. Authorization: deny unauthorized operations, unknown tools, and missing approvals.
5. Failure handling: produce correct terminal outcomes for timeout, tool/model errors, disconnect, budget exhaustion, and persistence failure.

### Method and gates

Deterministic unit, contract, and integration tests are mandatory; model evaluation does not replace them. Record case-set version, model/prompt version, runtime configuration, scoring rationale, and results. A model score is not clinical safety evidence. Baselines, thresholds, human reviewers, and regression policy require owner approval.
