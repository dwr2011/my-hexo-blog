# my-hexo-blog

这是为 dwr2011 准备的 Hexo 博客模版仓库（使用 butterfly 主题占位）。  

快速步骤：
1. 在本地 clone 本仓库：`git clone https://github.com/dwr2011/my-hexo-blog.git`
2. 添加 butterfly 主题：`git submodule add https://github.com/jerryc127/hexo-theme-butterfly.git themes/butterfly`
3. 安装依赖：`npm ci`
4. 修改主题配置（在 themes/butterfly/_config.yml 中），并在根目录 _config.yml 中按需修改站点信息
5. 提交并推送到 main：`git add . && git commit -m "init hexo" && git push -u origin main`
6. GitHub Actions 会在 push 到 main 后自动构建并把 public 发布到 gh-pages（供 GitHub Pages 使用）

Giscus 评论：
- 我在主题中留有 Giscus 占位说明，打开仓库 Discussions（或使用 Issues）并在 https://giscus.app 生成相关配置后把数据填入即可启用评论。

License: MIT