#!/usr/bin/env bash
set -euo pipefail

# ============================================
# 手动触发扫描
# ============================================

echo "📡 扫描所有信息源..."
BLOGWATCHER_WORKERS=10 blogwatcher-cli scan

echo ""
echo "📰 未读文章："
blogwatcher-cli articles

echo ""
echo "💡 运行 blogwatcher-cli read <ID> 标记已读"
echo "💡 运行 blogwatcher-cli read-all --yes 全部标记已读"
