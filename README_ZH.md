# 《A Byte of Python》简体中文翻译版

> 原著：[Swaroop C H](https://swaroopch.com/about/)
> 原文：https://python.swaroopch.com
> 许可证：[Creative Commons Attribution-ShareAlike 4.0](https://creativecommons.org/licenses/by-sa/4.0/)

## 📖 项目简介

这是《A Byte of Python》的简体中文翻译版。原书是一本面向编程初学者的 Python 入门教程，以简洁易懂的方式介绍了 Python 编程的基础知识。

## 📁 目录结构

```
byte-of-python-zh-cn/
├── en/                  ← 英文原版（用于对比和同步上游更新）
├── zh-cn/               ← 简体中文翻译
│   ├── SUMMARY.md       ← 目录
│   ├── preface.md       ← 前言
│   ├── basics.md        ← 基础
│   ├── ...              ← 其他章节
│   └── book.json        ← HonKit 配置
├── programs/            ← 代码示例（英文原版共用）
├── img/                 ← 图片资源
├── diff_check.sh        ← 差异对比脚本
└── README_ZH.md         ← 本文件
```

## 🚀 如何推送到你的 GitHub

### 1. 初始化 Git 仓库

```bash
cd byte-of-python-zh-cn
git init
git add .
git commit -m "初始化简体中文翻译项目"
```

### 2. 关联你的 Fork 并推送

```bash
# 添加你 fork 的仓库作为 remote
git remote add origin https://github.com/jeffreyheping/byte-of-python.git

# 添加上游仓库（用于未来同步更新）
git remote add upstream https://github.com/swaroopch/byte-of-python.git

# 推送到你的 GitHub
git push -u origin master
```

### 3. 本地预览（可选）

```bash
# 安装 HonKit（需要先安装 Node.js）
npm install -g honkit

# 将中文翻译文件复制到根目录进行预览
# 注意：HonKit 需要 .md 文件在根目录才能正确解析 {% include %} 指令
cp zh-cn/*.md .
honkit serve
# 浏览器打开 http://localhost:4000
```

## 🔄 同步上游更新

当原作者更新了英文版时：

```bash
# 拉取上游最新代码
git fetch upstream
git merge upstream/master

# 运行差异对比脚本
bash diff_check.sh

# 查看具体某一章的差异
bash diff_check.sh basics.md
```

## 📝 翻译说明

- **翻译范围**：所有 `.md` 文件中的自然语言文本
- **未翻译**：代码块中的代码、程序输出
- **术语处理**：技术术语保留英文原文，首次出现时附中文解释
- **代码注释**：已翻译为中文

## 📄 许可证

本项目遵循与原书相同的 [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/) 许可证。

翻译时必须：
- 保留原作者署名
- 标注原文链接
- 使用相同或兼容的许可证发布
