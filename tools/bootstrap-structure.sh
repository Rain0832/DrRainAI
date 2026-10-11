#!/usr/bin/env bash
set -euo pipefail

# 仅创建目录；README、合同和规范文档由版本控制中的文件维护。
mkdir -p \
  apps/web \
  apps/api-gateway \
  apps/core-service \
  apps/agent-runtime \
  modules/identity \
  modules/medical-record \
  modules/ai \
  modules/middleware \
  modules/shared \
  contracts/openapi \
  contracts/json-schema \
  contracts/events \
  tests \
  docs/architecture \
  docs/decisions \
  tools \
  deploy
