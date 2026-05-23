# 🤝 贡献指南

感谢你对 Money Radar 的关注！以下是贡献方式：

## 📡 新增信息源

1. 编辑 `config/feeds.csv`，按格式添加新行：
   ```csv
   名称,网站URL,RSS地址,分类
   ```
2. 提交 PR，标题格式：`📡 新增信息源: 源名称`

**信息源质量标准：**
- 必须有可用的 RSS/Atom 地址
- 内容与赚钱/创业/AI/商业相关
- 更新频率 ≥ 每周一篇
- 非纯转载/聚合内容

## 🤖 改进 AI 提示词

1. 编辑 `config/morning-prompt.txt` 或 `config/evening-prompt.txt`
2. 提交 PR，标题格式：`🤖 优化提示词: 简要说明`

## 🐛 Bug 修复

1. Fork → 修复 → 提交 PR
2. 关联对应 Issue（如有）
3. 标题格式：`🐛 修复: 简要说明`

## 📝 代码规范

- Shell 脚本使用 `set -euo pipefail`
- 提交信息使用 emoji 前缀：📡🤖🐛📝🎨
- 保持简洁，一行说清楚改动

## ⚠️ 注意事项

- 不要提交 API Key 或个人配置
- 新增信息源请确保 RSS 可正常访问
- 提示词修改请附带测试效果说明
