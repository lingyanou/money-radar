# 💰 Money Radar — 赚钱机会追踪系统

> 自动监控全网高价值信息源，AI筛选+定时推送，让赚钱机会主动找到你。

## 🎯 这是什么？

Money Radar 是一套基于 [blogwatcher-cli](https://github.com/JulienTant/blogwatcher-cli) + Hermes Agent 的赚钱机会自动追踪系统：

- **📡 信息监控**：自动订阅19+个高价值RSS源，覆盖AI/科技、创业、电商、商业分析
- **🤖 AI筛选**：每天自动扫描新文章，AI筛选出与赚钱最相关的机会
- **⏰ 定时推送**：早8点速报 + 晚8点深度分析，推送到你的聊天工具
- **🔍 深度拆解**：看到好机会，AI帮你做市场调研、竞品分析、落地计划

## 🏗️ 系统架构

```
┌─────────────────┐     ┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│  19+ RSS Sources │────▶│ blogwatcher  │────▶│  AI Filter   │────▶│   Discord    │
│  (HN/36kr/PH..) │     │  (scan+store)│     │ (筛选+分析)  │     │  (定时推送)  │
└─────────────────┘     └──────────────┘     └──────────────┘     └──────────────┘
```

## 📦 快速开始

### 前置条件

- Linux / macOS
- [Hermes Agent](https://hermes-agent.nousresearch.com/docs) 已安装并配置
- blogwatcher-cli（安装脚本会自动安装）

### 一键安装

```bash
git clone https://github.com/YOUR_USERNAME/money-radar.git
cd money-radar
chmod +x scripts/setup.sh
./scripts/setup.sh
```

### 手动安装

1. 安装 blogwatcher-cli：
```bash
# Linux amd64
curl -sL https://github.com/JulienTant/blogwatcher-cli/releases/latest/download/blogwatcher-cli_linux_amd64.tar.gz | sudo tar xz -C /usr/local/bin blogwatcher-cli

# macOS Apple Silicon
curl -sL https://github.com/JulienTant/blogwatcher-cli/releases/latest/download/blogwatcher-cli_darwin_arm64.tar.gz | tar xz -C /usr/local/bin blogwatcher-cli
```

2. 订阅信息源：
```bash
./scripts/add-feeds.sh
```

3. 设置定时推送（通过 Hermes cronjob）：
```bash
hermes cron create --name "早上赚钱机会速报" --schedule "0 8 * * *" --prompt-file config/morning-prompt.txt
hermes cron create --name "晚间深度机会分析" --schedule "0 20 * * *" --prompt-file config/evening-prompt.txt
```

## 📡 信息源列表

| 分类 | 信息源 | 内容类型 |
|---|---|---|
| 🤖 AI/科技 | TechCrunch-AI、TheVerge-AI、VentureBeat-AI、ArXiv-CS-AI | AI行业动态、新产品 |
| 💡 创业风向 | HackerNews、HackerNews-ShowHN、HN-AskHN、YCombinator-Blog | 创业讨论、新产品展示 |
| 🇨🇳 中文商业 | 36kr、虎嗅、少数派、小众软件 | 国内政策、风口、工具 |
| 🛒 电商/增长 | Ahrefs-Blog、Zapier-Blog | SEO、自动化变现 |
| 📊 战略分析 | BenThompson-Stratechery、SethGodin、WaitButWhy | 商业模式深度拆解 |
| 🚀 产品发现 | ProductHunt、GH-Trending | 全球新产品/新项目 |

想加新源？编辑 `config/feeds.csv` 然后运行 `./scripts/add-feeds.sh`。

## ⏰ 推送计划

| 时间 | 任务 | 内容 |
|---|---|---|
| 🌅 每天 08:00 | 赚钱机会速报 | 筛选5-8条高价值机会 + 变现路径 + 难度评级 |
| 🌙 每天 20:00 | 深度机会分析 | 选1-2个最值得做的机会，拆解到可执行步骤 |

## 🔧 自定义

### 添加信息源

编辑 `config/feeds.csv`，格式：
```csv
名称,网站URL,RSS地址
```

然后运行：
```bash
./scripts/add-feeds.sh
```

### 修改推送时间

通过 Hermes cronjob 修改 schedule 表达式：
```bash
hermes cron update --job-id JOB_ID --schedule "0 9 * * *"
```

### 调整筛选偏好

编辑 `config/morning-prompt.txt` 和 `config/evening-prompt.txt`，修改AI筛选的标准和输出格式。

## 📁 项目结构

```
money-radar/
├── README.md                  # 本文件
├── LICENSE                    # MIT 开源协议
├── config/
│   ├── feeds.csv              # 信息源配置
│   ├── morning-prompt.txt     # 早间推送AI提示词
│   └── evening-prompt.txt     # 晚间推送AI提示词
├── scripts/
│   ├── setup.sh               # 一键安装脚本
│   ├── add-feeds.sh           # 批量添加信息源
│   └── scan-now.sh            # 手动触发扫描
└── docs/
    ├── custom-feeds.md         # 如何添加自定义信息源
    └── deployment.md           # 部署详解
```

## 🤝 贡献

欢迎提交 PR：
- 新增高质量信息源 → 编辑 `config/feeds.csv`
- 改进AI筛选提示词 → 编辑 `config/*.txt`
- 修复/功能 → 提 Issue 或直接 PR

## 📄 License

MIT License — 自由使用、修改、分发。

---

**⭐ 如果这个项目对你有帮助，给个 Star！**
