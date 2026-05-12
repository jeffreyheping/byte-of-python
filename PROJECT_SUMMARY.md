# Byte of Python 中文翻译项目 - 完整总结报告

## 项目概述

**项目名称**: A Byte of Python 简体中文翻译  
**项目地址**: https://github.com/jeffreyheping/byte-of-python  
**原作者**: Swaroop C H (https://python.swaroopch.com)  
**译者**: jeffreyheping  
**翻译时间**: 2026年5月  
**项目伙伴**: QClaw (AI Assistant)

---

## 一、项目起因

用户希望将经典的 Python 入门教程《A Byte of Python》翻译成简体中文，并通过 GitHub Pages 发布在线版本。项目涉及以下技术栈：

- **GitHub Fork** 工作流程
- **HonKit** (GitBook 分支) 静态网站生成器
- **GitHub Actions** CI/CD 自动化构建
- **GitHub Pages** 静态网站托管

---

## 二、接手前的背景

### 初始尝试

用户最初 fork 上游仓库后，直接在根目录修改英文文件。后来意识到应该保持上游原样，于是重构项目结构：

- **英文版**: 移到 `en/` 目录（从上游同步，保持原样）
- **中文版**: 放在 `zh-cn/` 目录（独立翻译）
- **目的**: 方便追踪上游更新，避免冲突

### 接手时的问题状态

- GitHub Actions 构建失败（权限不足、语法错误）
- 尝试过添加 `gitbook-plugin-include-codeblock` 插件（错误方向）
- 发现上游根本不用插件，HonKit 内置支持 `{% include %}`
- Release 里有英文版 PDF/EPUB（来自上游 workflow）

---

## 三、遇到的问题及解决方案

### 问题 1: HonKit 模板语法错误

**现象**: GitHub Actions 构建失败，报错 `Process completed with exit code 1`

**根本原因**:
1. 翻译过程中误添加了 `{% raw %}` 和 `{% endraw %}` 标签
2. `{% include %}` 路径使用了错误的 `../programs/` 相对路径

**正确做法**:
```markdown
# 错误 ❌
# 面向对象编程 {% raw %}{#oop}{% endraw %}
{% include "../programs/oop_simplestclass.py" %}

# 正确 ✅
# 面向对象编程 {#oop}
{% include "programs/oop_simplestclass.py" %}
```

### 问题 2: GitHub Actions Workflow 配置

**原始问题配置**:
```yaml
# 问题：缺少必要的依赖和权限
- name: Run Honkit
  run: npx honkit build ./zh-build ./public
```

**最终正确配置**:
```yaml
name: Build Chinese Translation

on:
  push:
    branches:
      - master
    paths:
      - 'zh-cn/**'
      - 'programs/**'
      - 'img/**'
      - '.github/workflows/build-zh-cn.yml'

permissions:
  contents: write
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'

      - name: Install Calibre + CJK Fonts
        run: |
          sudo apt update
          sudo apt install -y calibre fonts-noto-cjk

      - name: Prepare build directory
        run: |
          mkdir -p zh-build
          cp zh-cn/*.md zh-build/
          cp zh-cn/book.json zh-build/
          cp -r programs zh-build/
          cp -r img zh-build/

      - name: Install HonKit
        run: |
          cd zh-build
          npm install honkit --save-dev

      - name: Build HTML
        run: |
          cd zh-build
          npx honkit build . ../public

      - name: Build PDF
        run: |
          cd zh-build
          npx honkit pdf . ../python-jianming-jiaocheng.pdf

      - name: Build EPUB
        run: |
          cd zh-build
          npx honkit epub . ../python-jianming-jiaocheng.epub

      - name: Deploy to GitHub Pages
        if: success()
        uses: crazy-max/ghaction-github-pages@v4
        with:
          target_branch: gh-pages-zh
          build_dir: public
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

      - name: Generate tag name
        id: tag
        run: echo "TAG_NAME=v1.0.zh-cn.$(date +%Y%m%d)" >> $GITHUB_OUTPUT

      - name: Create Release
        if: success()
        uses: softprops/action-gh-release@v1
        with:
          tag_name: ${{ steps.tag.outputs.TAG_NAME }}
          name: Python简明教程 ${{ steps.tag.outputs.TAG_NAME }}
          body: |
            《A Byte of Python》简体中文翻译版
            
            - PDF: python-jianming-jiaocheng.pdf
            - EPUB: python-jianming-jiaocheng.epub
          files: |
            python-jianming-jiaocheng.pdf
            python-jianming-jiaocheng.epub
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

### 问题 3: 中文字体支持

**问题**: PDF 生成后中文显示为方块或乱码

**解决方案**:
```yaml
- name: Install Calibre + CJK Fonts
  run: |
    sudo apt update
    sudo apt install -y calibre fonts-noto-cjk
```

### 问题 4: GitHub Releases 需要 Tag

**问题**: `softprops/action-gh-release` 报错 "GitHub Releases requires a tag"

**解决方案**: 在 workflow 中自动生成 tag：
```yaml
- name: Generate tag name
  id: tag
  run: echo "TAG_NAME=v1.0.zh-cn.$(date +%Y%m%d)" >> $GITHUB_OUTPUT
```

---

## 四、关键修改对比

### 文件结构变更

**原始结构** (问题状态):
```
byte-of-python/
├── .github/workflows/
│   ├── build-zh-cn.yml    # 配置不完整
│   └── main.yml           # 上游 workflow，未禁用
├── zh-cn/
│   ├── oop.md             # 包含 {% raw %} 标签
│   └── ...                # 包含 ../programs/ 路径
└── ...
```

**最终结构** (正确状态):
```
byte-of-python/
├── .github/workflows/
│   └── build-zh-cn.yml    # 完整配置，支持 HTML/PDF/EPUB
├── zh-cn/
│   ├── oop.md             # 清理后的正确语法
│   └── ...                # 统一使用 programs/ 路径
├── en/                    # 英文原版独立目录
├── BUILD_GUIDE.md         # 构建指南文档
└── ...
```

### 核心文件修改摘要

| 文件 | 修改内容 |
|------|----------|
| `zh-cn/*.md` | 移除所有 `{% raw %}` / `{% endraw %}` 标签 |
| `zh-cn/*.md` | 修正 include 路径: `../programs/` → `programs/` |
| `.github/workflows/build-zh-cn.yml` | 完整重写，添加 PDF/EPUB 生成和 Release 发布 |
| `.github/workflows/main.yml` | 删除上游 workflow |
| `README.md` | 更新为双语 README |
| `BUILD_GUIDE.md` | 新增构建指南 |

---

## 五、正确执行步骤总结

### 步骤 1: Fork 和克隆

```bash
# 1. 在 GitHub 上 Fork 原仓库
# 2. 克隆到本地
git clone https://github.com/jeffreyheping/byte-of-python.git
cd byte-of-python
```

### 步骤 2: 准备翻译文件

```bash
# 创建中文目录结构
mkdir -p zh-cn

# 复制英文文件作为翻译基础
cp *.md zh-cn/

# 翻译并修复语法错误
# - 移除 {% raw %} {% endraw %} 标签
# - 修正 include 路径
```

### 步骤 3: 配置 HonKit

创建 `zh-cn/book.json`:
```json
{
    "title": "Python 简明教程",
    "description": "《A Byte of Python》简体中文翻译版",
    "author": "Swaroop C H",
    "language": "zh-cn",
    "variables": {
        "translator": "jeffreyheping",
        "translatorUrl": "https://github.com/jeffreyheping"
    }
}
```

### 步骤 4: 配置 GitHub Actions

创建 `.github/workflows/build-zh-cn.yml` (内容见上文)

### 步骤 5: 本地测试构建

```bash
# 安装依赖
npm install honkit --save-dev

# 本地预览
npx honkit serve zh-cn

# 构建测试
npx honkit build zh-cn ./public
```

### 步骤 6: 提交和推送

```bash
git add .
git commit -m "添加中文翻译和自动构建 workflow"
git push origin master
```

### 步骤 7: 配置 GitHub Pages

1. 进入仓库 Settings → Pages
2. Source 选择 `gh-pages-zh` 分支
3. 保存后等待部署完成

---

## 六、如何更新上游代码

为了保持 `en/` 目录与上游同步：

```bash
# 添加 upstream 远程
git remote add upstream https://github.com/swaroopch/byte-of-python.git

# 同步上游更新到 en/ 目录
git fetch upstream
git checkout upstream/master -- en/

# 提交更新
git commit -m "同步上游英文版更新"
git push origin master
```

---

## 七、技术要点总结

### HonKit 模板语法规则

1. **锚点语法**: `{#anchor-name}` 不需要 raw 标签包裹
2. **Include 路径**: 相对于 book.json 的目录，使用 `programs/` 而非 `../programs/`
3. **代码块**: 使用 `<pre><code>` 包裹 include 语句

### GitHub Actions 最佳实践

1. **权限设置**: 必须声明 `permissions` 以便创建 Release
2. **路径过滤**: 使用 `paths` 避免不必要的构建
3. **依赖安装**: Calibre 和 CJK 字体是 PDF 中文显示的必要条件
4. **分步构建**: HTML、PDF、EPUB 分开构建便于调试

### 目录结构规范

```
zh-cn/                      # 中文内容目录
├── book.json              # HonKit 配置文件
├── SUMMARY.md             # 目录结构
├── *.md                   # 章节文件
└── README.md              # 介绍页

programs/                  # 代码示例目录
├── *.py                   # Python 示例代码
└── *.txt                  # 示例输出

img/                       # 图片资源目录
```

---

## 八、项目成果

- ✅ 完整的简体中文翻译
- ✅ 自动化的 GitHub Actions 构建流程
- ✅ 支持 HTML、PDF、EPUB 三种格式输出
- ✅ 自动发布到 GitHub Pages (https://jeffreyheping.github.io/byte-of-python/)
- ✅ 自动创建 Release 并提供下载
- ✅ 正确的中文字体支持
- ✅ 与上游英文版结构对应，便于同步更新

---

## 九、经验教训

1. **翻译时注意 HonKit 语法**: 不要添加不必要的 raw 标签
2. **路径要正确**: include 路径是相对于 book.json 的
3. **测试本地构建**: 推送前先本地验证
4. **查看 Actions 日志**: 详细日志是排查问题的关键
5. **字体很重要**: PDF 中文需要安装 CJK 字体
6. **参考上游**: 遇到问题时先看看原作者是怎么做的
7. **保持简单**: 不要引入不必要的插件或复杂方案

---

## 十、项目记忆

这是一个由 **jeffreyheping** 主导、**QClaw** 协助完成的翻译项目。从最初 fork 后的迷茫，到重构项目结构，再到解决各种 CI/CD 问题，最终成功部署中文版网站并生成 PDF/EPUB。

**关键转折点**:
- 意识到应该保持上游原样，将英文版移到 `en/` 目录
- 发现 HonKit 内置支持 `{% include %}`，不需要额外插件
- 解决中文字体问题，让 PDF 正常显示中文

**项目精神**: 保持简洁、尊重上游、自动化一切。

---

**文档生成时间**: 2026-05-12  
**项目状态**: 已完成并成功部署  
**共同作者**: jeffreyheping & QClaw
