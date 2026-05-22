#!/usr/bin/env bash
set -euo pipefail

# ============================================
# Money Radar 一键安装脚本
# ============================================

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${YELLOW}💰 Money Radar — 赚钱机会追踪系统${NC}"
echo -e "${YELLOW}=================================${NC}"
echo ""

# 1. 检测操作系统
OS="$(uname -s)"
ARCH="$(uname -m)"
echo -e "${GREEN}[1/4]${NC} 检测系统: ${OS} ${ARCH}"

# 2. 安装 blogwatcher-cli
if command -v blogwatcher-cli &> /dev/null; then
    echo -e "${GREEN}[2/4]${NC} blogwatcher-cli 已安装: $(blogwatcher-cli --version 2>/dev/null || echo 'unknown')"
else
    echo -e "${YELLOW}[2/4]${NC} 正在安装 blogwatcher-cli..."
    case "${OS}-${ARCH}" in
        Linux-x86_64|Linux-amd64)
            curl -sL https://github.com/JulienTant/blogwatcher-cli/releases/latest/download/blogwatcher-cli_linux_amd64.tar.gz | sudo tar xz -C /usr/local/bin blogwatcher-cli
            ;;
        Linux-aarch64|Linux-arm64)
            curl -sL https://github.com/JulienTant/blogwatcher-cli/releases/latest/download/blogwatcher-cli_linux_arm64.tar.gz | sudo tar xz -C /usr/local/bin blogwatcher-cli
            ;;
        Darwin-arm64)
            curl -sL https://github.com/JulienTant/blogwatcher-cli/releases/latest/download/blogwatcher-cli_darwin_arm64.tar.gz | tar xz -C /usr/local/bin blogwatcher-cli
            ;;
        Darwin-x86_64)
            curl -sL https://github.com/JulienTant/blogwatcher-cli/releases/latest/download/blogwatcher-cli_darwin_amd64.tar.gz | tar xz -C /usr/local/bin blogwatcher-cli
            ;;
        *)
            echo -e "${RED}不支持的系统: ${OS} ${ARCH}${NC}"
            echo "请手动安装: https://github.com/JulienTant/blogwatcher-cli"
            exit 1
            ;;
    esac
    echo -e "${GREEN}blogwatcher-cli 安装完成!${NC}"
fi

# 3. 添加信息源
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FEEDS_FILE="${SCRIPT_DIR}/../config/feeds.csv"

if [ ! -f "$FEEDS_FILE" ]; then
    echo -e "${RED}[3/4] 找不到 feeds.csv: ${FEEDS_FILE}${NC}"
    exit 1
fi

echo -e "${YELLOW}[3/4]${NC} 正在添加信息源..."

ADDED=0
FAILED=0
SKIP=0

while IFS=',' read -r name url feed_url category; do
    # Skip header
    [[ "$name" == "name" ]] && continue
    # Skip empty lines
    [[ -z "$name" ]] && continue

    if blogwatcher-cli add "$name" "$url" --feed-url "$feed_url" 2>/dev/null; then
        echo -e "  ${GREEN}✅${NC} ${name}"
        ((ADDED++))
    else
        # Might already exist
        echo -e "  ${YELLOW}⏭️${NC} ${name} (已存在或添加失败)"
        ((SKIP++))
    fi
done < "$FEEDS_FILE"

echo -e "${GREEN}新增: ${ADDED}, 跳过: ${SKIP}${NC}"

# 4. 首次扫描
echo -e "${YELLOW}[4/4]${NC} 正在首次扫描..."
BLOGWATCHER_WORKERS=10 blogwatcher-cli scan

echo ""
echo -e "${GREEN}=================================${NC}"
echo -e "${GREEN}💰 Money Radar 安装完成！${NC}"
echo ""
echo "接下来设置定时推送："
echo "  1. 确保已安装 Hermes Agent"
echo "  2. 运行 hermes cron create 设置推送任务"
echo "  3. 详见 README.md"
echo ""
echo "手动扫描: blogwatcher-cli scan"
echo "查看文章: blogwatcher-cli articles"
echo -e "${GREEN}=================================${NC}"
