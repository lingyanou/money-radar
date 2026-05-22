#!/usr/bin/env bash
set -euo pipefail

# ============================================
# 批量添加信息源脚本
# ============================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FEEDS_FILE="${SCRIPT_DIR}/../config/feeds.csv"

if [ ! -f "$FEEDS_FILE" ]; then
    echo "❌ 找不到 feeds.csv: ${FEEDS_FILE}"
    exit 1
fi

echo "📡 正在从 feeds.csv 添加信息源..."
echo ""

ADDED=0
SKIP=0

while IFS=',' read -r name url feed_url category; do
    [[ "$name" == "name" ]] && continue
    [[ -z "$name" ]] && continue

    if blogwatcher-cli add "$name" "$url" --feed-url "$feed_url" 2>/dev/null; then
        echo "  ✅ ${name} [${category}]"
        ((ADDED++))
    else
        echo "  ⏭️  ${name} (已存在或失败)"
        ((SKIP++))
    fi
done < "$FEEDS_FILE"

echo ""
echo "📊 新增: ${ADDED}, 跳过: ${SKIP}"
