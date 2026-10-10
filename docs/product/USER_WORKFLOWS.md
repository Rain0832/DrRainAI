# User Workflows / 用户流程

## 中文

### 主流程候选（待确认）

1. 用户进入产品并完成批准的身份验证，或使用明确批准的访客模式。
2. 用户创建新会话或选择其有权访问的历史会话。
3. 用户提交健康信息问题；界面说明信息支持边界。
4. 系统创建请求标识和运行标识，校验会话所有权后开始流式响应。
5. 用户看到增量文本及完成、失败或取消结果。
6. 成功答复持久化后，用户可重新打开会话。

### 异常流程

- 未授权：返回通用错误，不泄露资源是否存在。
- 上游超时或失败：发送失败终态，不将部分输出说成完整答复。
- 用户取消或断开：尽力取消运行；保留部分输出的规则待定。
- 持久化失败：不得报告成功完成。
- 高风险表述：根据医疗安全政策显示适当的升级提示；文案与检测标准待评审。

身份模式、历史删除、数据导出、断线续传及反馈路径均未决定。

## English

### Candidate primary flow (unconfirmed)

1. The user enters the product and authenticates under the approved model or uses an explicitly approved guest mode.
2. The user creates a session or selects history they are authorized to access.
3. The user submits a health question; the interface states the informational-support boundary.
4. The system creates request and run IDs, validates session ownership, and begins streaming.
5. The user receives incremental text and a completed, failed, or cancelled outcome.
6. After successful persistence, the user can reopen the conversation.

### Failure flows

- Unauthorized: return a generic error without disclosing whether the resource exists.
- Upstream timeout or failure: emit a failure terminal event; do not present partial output as a complete answer.
- User cancellation or disconnect: attempt to cancel the run; retention of partial output is undecided.
- Persistence failure: do not report successful completion.
- High-risk language: show an appropriate escalation message under the medical-safety policy; wording and detection criteria require review.

Identity mode, history deletion, data export, stream resume, and feedback paths are undecided.
