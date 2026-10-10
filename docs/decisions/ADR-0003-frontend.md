# ADR-0003: Frontend / 前端

- Status / 状态: Proposed; owner approval required / 提案；需所有者批准

## Context / 背景

- **中文：**产品需要会话交互、历史浏览和流式文本呈现。
- **English:** The product needs session interaction, history browsing, and streamed text presentation.

## Options Considered / 备选方案

- **中文：**React + TypeScript + Vite；其他主流 Web 框架；服务端渲染方案。
- **English:** React + TypeScript + Vite; other mainstream web frameworks; server-rendered options.

## Decision / 决定

- **中文：**提议 React + TypeScript + Vite；客户端仅调用 Gateway 合同，不保存服务端凭据。
- **English:** Propose React + TypeScript + Vite; the client uses only Gateway contracts and stores no server credentials.

## Consequences / 影响

- **中文：**成熟生态但需维护前端构建链、无障碍体验和浏览器兼容性。
- **English:** Mature ecosystem, with frontend build-chain, accessibility, and browser-compatibility maintenance.

## Risks / 风险

- **中文：**客户端验证被误当作授权；敏感数据暴露于浏览器。
- **English:** Client-side validation mistaken for authorization; sensitive data exposed in the browser.

## Revisit Criteria / 复审条件

- **中文：**目标用户设备、SEO、无障碍或团队技能要求不同方案时复审。
- **English:** Revisit if target devices, SEO, accessibility, or team skills favor another option.
