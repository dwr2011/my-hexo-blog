# 克隆空仓库到本地
git clone https://github.com/dwr2011/my-hexo-blog.git
cd my-hexo-blog

# 将上面那些文件放到这个目录（你可以直接复制粘贴文件内容，或把我准备的文件保存为对应文件）

# 添加 butterfly 主题（作为子模块，便于后续更新）
git submodule add https://github.com/jerryc127/hexo-theme-butterfly.git themes/butterfly

# 安装依赖
npm ci

# 本地预览（开发时）
npx hexo server

# 第一次提交并推送到 main
git add .
git commit -m "初始化 Hexo 博客骨架（butterfly 占位）"
git push -u origin main