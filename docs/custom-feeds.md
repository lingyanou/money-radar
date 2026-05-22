# 添加自定义信息源

## 方法一：编辑 feeds.csv

编辑 `config/feeds.csv`，按格式添加新行：

```csv
名称,网站URL,RSS地址,分类
```

例如：
```csv
YourBlog,https://example.com,https://example.com/feed.xml,你的分类
```

然后运行：
```bash
./scripts/add-feeds.sh
```

## 方法二：手动添加单条

```bash
blogwatcher-cli add "博客名" "https://example.com" --feed-url "https://example.com/feed.xml"
```

## 如何找到 RSS 地址？

1. 查看网页源码，搜索 `rss` 或 `atom` 或 `feed`
2. 常见路径：`/feed`、`/rss`、`/feed.xml`、`/atom.xml`
3. 使用浏览器扩展如 RSS Subscription Extension
4. 如果网站没有 RSS，可以用 RSS Hub：`https://docs.rsshub.app/`

## 推荐信息源

以下是一些值得考虑的高价值信息源：

### 中文
- 即刻热门（通过 RSS Hub）
- 少数派 - https://sspai.com/feed
- 小众软件 - https://www.appinn.com/feed/
- 36氪 - https://36kr.com/feed

### 英文
- Hacker News - https://hnrss.org/frontpage
- Product Hunt - https://www.producthunt.com/feed
- Indie Hackers - https://www.indiehackers.com/feed
- Ben Thompson (Stratechery) - https://stratechery.com/feed/

### AI 专项
- TechCrunch AI - https://techcrunch.com/category/artificial-intelligence/feed/
- The Verge AI - https://www.theverge.com/rss/ai-artificial-intelligence/index.xml
- VentureBeat AI - https://venturebeat.com/category/ai/feed
