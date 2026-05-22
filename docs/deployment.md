# 部署详解

## 系统要求

- Linux 或 macOS
- [Hermes Agent](https://hermes-agent.nousresearch.com/docs) 已安装并配置
- 网络可访问 RSS 源（部分源可能需要代理）

## 安装步骤

### 1. 克隆项目

```bash
git clone https://github.com/YOUR_USERNAME/money-radar.git
cd money-radar
```

### 2. 运行安装脚本

```bash
chmod +x scripts/*.sh
./scripts/setup.sh
```

脚本会自动：
- 安装 blogwatcher-cli
- 从 feeds.csv 添加所有信息源
- 执行首次扫描

### 3. 配置定时推送

通过 Hermes Agent 的 cronjob 功能设置：

#### 早间速报（每天 8:00）

```bash
hermes cron create \
  --name "早上赚钱机会速报" \
  --schedule "0 8 * * *" \
  --prompt-file config/morning-prompt.txt \
  --toolsets terminal,web
```

#### 晚间深析（每天 20:00）

```bash
hermes cron create \
  --name "晚间深度机会分析" \
  --schedule "0 20 * * *" \
  --prompt-file config/evening-prompt.txt \
  --toolsets terminal,web
```

### 4. 自定义筛选偏好

编辑 `config/morning-prompt.txt` 和 `config/evening-prompt.txt`：

- 修改筛选关键词
- 调整输出格式
- 加入个人偏好（如风险偏好、关注领域）

## 日常操作

| 操作 | 命令 |
|---|---|
| 手动扫描 | `./scripts/scan-now.sh` 或 `blogwatcher-cli scan` |
| 查看未读 | `blogwatcher-cli articles` |
| 标记已读 | `blogwatcher-cli read <ID>` |
| 全部已读 | `blogwatcher-cli read-all --yes` |
| 添加信息源 | 编辑 `config/feeds.csv` → `./scripts/add-feeds.sh` |
| 查看推送记录 | `hermes cron list` |

## 故障排查

### 信息源扫描失败

- 检查网络连接
- 部分源可能封禁服务器IP，需要代理
- RSS地址可能已变更，检查并更新 `config/feeds.csv`
- 运行 `blogwatcher-cli remove "源名称" --yes` 删除无效源

### 推送未收到

- 检查 Hermes Agent 是否在运行
- 运行 `hermes cron list` 查看任务状态
- 检查聊天平台连接是否正常
