<div align="center">

<img src="assets/banner.svg" alt="Money Radar" width="100%">

# 💰 Money Radar

### 让赚钱机会主动找到你

[![GitHub stars](https://img.shields.io/github/stars/lingyanou/money-radar?style=social)](https://github.com/lingyanou/money-radar)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](.github/CONTRIBUTING.md)
[![Made with Hermes](https://img.shields.io/badge/powered%20by-Hermes%20Agent-orange)](https://hermes-agent.nousresearch.com/docs)

自动监控全网 19+ 高价值信息源 → AI 智能筛选赚钱机会 → 定时推送到你的聊天工具

[🚀 一键部署](#-快速开始) · [📖 文档](docs/deployment.md) · [🌐 在线预览](https://lingyanou.github.io/money-radar) · [💡 添加信息源](docs/custom-feeds.md)

</div>

---

## ✨ 核心能力

| 📡 信息监控 | 🤖 AI 筛选 | ⏰ 定时推送 | 🔍 深度拆解 |
|:---:|:---:|:---:|:---:|
| 19+ 高价值 RSS 源 | 从海量文章筛选赚钱机会 | 早8点速报 + 晚8点深析 | 市场调研 + 落地计划 |
| 6大方向全覆盖 | 变现路径 + 难度评级 | Discord / Telegram | 竞品分析 + 风险提示 |

## 🏗️ 系统架构

```
📡 19+ RSS Sources ──→ 🗃️ blogwatcher ──→ 🤖 AI Filter ──→ 💬 Chat Push
   HN / 36kr / PH         scan + store      筛选 + 分析      Discord / TG
```

## 📡 信息源一览

| 分类 | 信息源 | 内容类型 |
|---|---|---|
| 🤖 AI/科技 | TechCrunch-AI、TheVerge-AI、VentureBeat-AI、ArXiv-CS-AI | AI 行业动态、新产品 |
| 💡 创业风向 | HackerNews、ShowHN、AskHN、YCombinator Blog | 创业讨论、新产品展示 |
| 🇨🇳 中文商业 | 36氪、虎嗅、少数派、小众软件 | 国内政策、风口、工具 |
| 🛒 电商/增长 | Ahrefs Blog、Zapier Blog | SEO、自动化变现 |
| 📊 战略分析 | Stratechery、Seth Godin、Wait But Why | 商业模式深度拆解 |
| 🚀 产品发现 | ProductHunt、GitHub Trending | 全球新产品/新项目 |

> 💡 想加新源？编辑 `config/feeds.csv` 然后运行 `./scripts/add-feeds.sh`

## ⏰ 推送计划

| 时间 | 推送 | 内容 |
|---|---|---|
| 🌅 每天 08:00 | **赚钱机会速报** | 筛选 5-8 条高价值机会 + 变现路径 + 难度评级 |
| 🌙 每天 20:00 | **深度机会分析** | 1-2 个最值得做的机会，拆解到可执行步骤 + 30天落地计划 |

## 🚀 快速开始

### 前置条件

- Linux / macOS
- [Hermes Agent](https://hermes-agent.nousresearch.com/docs) 已安装并配置

### 一键安装

```bash
git clone https://github.com/lingyanou/money-radar.git
cd money-radar
chmod +x scripts/setup.sh && ./scripts/setup.sh
```

安装脚本会自动：
- ✅ 安装 blogwatcher-cli
- ✅ 从 feeds.csv 添加 19 个信息源
- ✅ 执行首次扫描

### 配置定时推送

```bash
# 早间速报
hermes cron create --name "早间速报" --schedule "0 8 * * *" \
  --prompt-file config/morning-prompt.txt --toolsets terminal,web

# 晚间深析
hermes cron create --name "晚间深析" --schedule "0 20 * * *" \
  --prompt-file config/evening-prompt.txt --toolsets terminal,web
```

## 🎨 自定义

<details>
<summary>🔧 添加信息源</summary>

编辑 `config/feeds.csv`，格式：
```csv
名称,网站URL,RSS地址,分类
```

然后运行：
```bash
./scripts/add-feeds.sh
```

如何找到 RSS 地址？查看网页源码搜索 `rss`/`atom`/`feed`，或用 [RSS Hub](https://docs.rsshub.app/)

</details>

<details>
<summary>⚙️ 调整筛选偏好</summary>

编辑 `config/morning-prompt.txt` 和 `config/evening-prompt.txt`：
- 修改筛选关键词和关注方向
- 调整输出格式
- 加入个人偏好（风险偏好、关注领域等）

</details>

<details>
<summary>🕐 修改推送时间</summary>

```bash
hermes cron update --job-id JOB_ID --schedule "0 9 * * *"
```

</details>

## 📁 项目结构

```
money-radar/
├── index.html                 # GitHub Pages 主页
├── README.md                  # 本文件
├── LICENSE                    # MIT 开源协议
├── assets/
│   ├── banner.svg             # 项目 Banner（带动画）
│   └── icon.svg               # 项目图标
├── config/
│   ├── feeds.csv              # 信息源配置（19个）
│   ├── morning-prompt.txt     # 早间推送 AI 提示词
│   └── evening-prompt.txt     # 晚间推送 AI 提示词
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
- 📡 新增高质量信息源 → 编辑 `config/feeds.csv`
- 🤖 改进 AI 筛选提示词 → 编辑 `config/*.txt`
- 🐛 修复/功能 → 提 Issue 或直接 PR

详见 [贡献指南](.github/CONTRIBUTING.md)

## 📄 License

[MIT License](LICENSE) — 自由使用、修改、分发。

---

<div align="center">

**⭐ 如果 Money Radar 对你有帮助，给个 Star！**

[▲ 回到顶部](#-money-radar--赚钱机会追踪系统)

</div>
