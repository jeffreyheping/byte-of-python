# Python 简明教程 | A Byte of Python

[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-blue.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![GitHub Pages](https://img.shields.io/badge/中文版-Web-blue?style=flat-square)](https://jeffreyheping.github.io/byte-of-python/)
[![Original](https://img.shields.io/badge/原版-Python.swaroopch.com-green?style=flat-square)](https://python.swaroopch.com)

> 📘 《A Byte of Python》简体中文翻译版 — 适合编程初学者的 Python 入门教程

[🌐 在线阅读](https://jeffreyheping.github.io/byte-of-python/) • [📖 目录](zh-cn/SUMMARY.md) • [🐛 问题反馈](https://github.com/jeffreyheping/byte-of-python/issues) • [⭐ Star 一下](https://github.com/jeffreyheping/byte-of-python/stargazers)

---

## 📖 关于本书

《A Byte of Python》是一本免费的 Python 编程书籍。它面向初学者，如果你只懂得如何保存文本文件，这本书就是为你准备的。

本书将教你使用 **Python 3**。

### 谁在读这本书？

> 这本书彻底改变了我对计算机和生活的看法。
> — [Rahul](https://twitter.com/unrahu1/status/12887430296379591282)

> 这本书带我从零走进了编程的世界。谢谢你改变了我的人生。
> — [Stefan Froelich](https://twitter.com/TheDumbTechGuy/status/1157245235052929024)

> 这是我见过的最好的初学者教程！
> — [Walt Michalik](mailto:wmich50@theramp.net)

> 可能是世界上最好的 Python 新手指南。
> — [Nickson Kaigi](https://twitter.com/nickaigi/status/1136963950711648256)

本书甚至被 **NASA** 在其喷气推进实验室使用！

---

## 🚀 快速开始

### 在线阅读

👉 **简体中文版**: [https://jeffreyheping.github.io/byte-of-python/](https://jeffreyheping.github.io/byte-of-python/)

👉 **English Version**: [https://python.swaroopch.com/](https://python.swaroopch.com/)

### 本地构建

```bash
# 克隆仓库
git clone https://github.com/jeffreyheping/byte-of-python.git
cd byte-of-python

# 安装依赖
npm install honkit

# 构建中文版
cd zh-cn
npx honkit build . ../_book

# 构建完成，访问 _book 目录
```

---

## 📂 项目结构

```
byte-of-python/
├── zh-cn/              # 简体中文翻译版
│   ├── SUMMARY.md      # 目录
│   ├── book.json       # 配置文件
│   └── *.md            # 各章节内容
├── en/                 # 英文原版（上游）
│   └── ...
├── programs/           # 书中的示例代码
├── img/                # 图片资源
└── .github/            # GitHub Actions 配置
```

---

## 🤝 参与翻译

欢迎参与本书的翻译和完善！

1. 📋 查看 [待翻译章节](zh-cn/SUMMARY.md)
2. 🍴 Fork 本仓库
3. 🌿 创建分支：`git checkout -b translation/章节名`
4. ✏️ 开始翻译
5. 📝 提交 Pull Request

### 翻译规范

- 术语统一参考 [Python 官方文档中文版](https://docs.python.org/zh-cn/3/)
- 代码示例保持英文原样
- 保留原文链接和参考文献
- 使用与原书相同的 CC BY-SA 4.0 许可证

---

## 📜 许可证

本书采用 [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/)。

- ✅ 可以自由分享
- ✅ 可以自由修改（尤其是翻译）
- ✅ 必须署名原作者
- ✅ 衍生作品必须使用相同许可证

---

## 🙏 致谢

- 原著作者 [Swaroop C H](https://swaroopch.com/about/)
- 所有参与翻译和校对的朋友

---

## 📚 相关链接

| 资源 | 链接 |
|------|------|
| 原版官网 | [python.swaroopch.com](https://python.swaroopch.com) |
| 原版源码 | [GitHub](https://github.com/swaroopch/byte-of-python) |
| 购买原版 | [swaroopch.com/buybook](https://swaroopch.com/buybook/) |
| Python 文档 | [docs.python.org](https://docs.python.org/zh-cn/3/) |

---

*Made with ❤️ by [jeffreyheping](https://github.com/jeffreyheping) · Translated from [A Byte of Python](https://github.com/swaroopch/byte-of-python) by [Swaroop C H](https://swaroopch.com)*
