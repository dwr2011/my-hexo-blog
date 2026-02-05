#!/usr/bin/env bash
set -e
REPO_URL="https://github.com/dwr2011/my-hexo-blog.git"
BRANCH="main"

# 如果当前目录不是空的话请在空目录执行
git init
git checkout -b ${BRANCH}

# 创建目录与文件
mkdir -p .github/workflows source/_posts themes

cat > package.json <<'EOF'
{
  "name": "my-hexo-blog",
  "version": "1.0.0",
  "description": "Hexo 博客（dwr2011/my-hexo-blog）",
  "scripts": {
    "start": "hexo server",
    "build": "hexo generate",
    "deploy": "hexo deploy"
  },
  "dependencies": {
    "hexo": "^6.4.0",
    "hexo-deployer-git": "^4.0.0",
    "hexo-generator-sitemap": "^2.0.0",
    "hexo-generator-feed": "^4.0.0",
    "hexo-renderer-marked": "^5.0.0"
  }
}
EOF

cat > .gitignore <<'EOF'
node_modules/
public/
.npm/
db.json
.deploy_*
.env
.DS_Store
EOF

cat > _config.yml <<'EOF'
# Hexo 全局配置（中文）
title: 我的 Hexo 博客
subtitle: 技术 · 生活
description: 在这里记录技术笔记与生活点滴
author: dwr2011
language: zh-CN
timezone: Asia/Shanghai

url: https://dwr2011.github.io
root: /
permalink: :year/:month/:day/:title/
source_dir: source
public_dir: public
theme: butterfly

menu:
  首页: /
  归档: /archives
  标签: /tags
  关于: /about

auto_excerpt: true

deploy:
  type: git
  repo: https://github.com/dwr2011/my-hexo-blog.git
  branch: gh-pages
EOF

cat > .github/workflows/deploy.yml <<'EOF'
name: Deploy Hexo to GitHub Pages
on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository (with submodules)
        uses: actions/checkout@v4
        with:
          submodules: true
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 18
      - name: Install dependencies
        run: npm ci
      - name: Generate site (Hexo)
        run: npx hexo generate
      - name: Deploy to gh-pages
        uses: peaceiris/actions-gh-pages@v4
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_branch: gh-pages
          publish_dir: ./public
EOF

mkdir -p source/_posts
cat > source/_posts/first-post.md <<'EOF'
---
title: 欢迎来到我的博客
date: 2026-02-05 12:00:00
tags:
- hexo
- 初始
---

这是使用 Hexo + butterfly 主题初始化的示例文章。
EOF

cat > README.md <<'EOF'
# my-hexo-blog

这是为 dwr2011 准备的 Hexo 博客模版仓库（使用 butterfly 主题占位）。  
EOF

# 提交并推送
git add .
git commit -m "初始化 Hexo 博客骨架（butterfly 占位）"
git remote add origin "${REPO_URL}"
git push -u origin ${BRANCH}
echo "完成：已推送到 ${REPO_URL}（分支 ${BRANCH}）。接下来运行：git submodule add https://github.com/jerryc127/hexo-theme-butterfly.git themes/butterfly"
EOF