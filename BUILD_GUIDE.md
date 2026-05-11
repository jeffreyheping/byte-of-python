# 构建指南

## 项目结构说明

本项目是《A Byte of Python》的中文翻译版,基于原作者 Swaroop C H 的开源项目。

### 目录结构

```
byte-of-python/
├── en/                    # 英文原版 (来自上游,自动同步)
│   ├── book.json
│   ├── SUMMARY.md
│   └── *.md              # 上游原始英文文件
├── zh-cn/                 # 中文翻译 (您的工作目录)
│   ├── book.json
│   ├── SUMMARY.md
│   └── *.md              # 您的翻译文件
├── programs/              # Python 示例代码 (共享)
├── img/                   # 图片资源 (共享)
├── .github/workflows/     # GitHub Actions 配置
│   ├── main.yml          # 英文版构建 (已禁用)
│   └── build-zh-cn.yml   # 中文版构建 (推荐使用)
├── sync_en.ps1           # 同步上游文件脚本
└── README.md
```

## 重要原则

### 1. en/ 目录 - 上游镜像
- `en/` 目录用于**监控上游项目变化**
- 所有英文文件来自上游: https://github.com/swaroopch/byte-of-python
- **不要直接修改** `en/` 目录中的文件
- 使用 `sync_en.ps1` 脚本定期同步上游更新

### 2. zh-cn/ 目录 - 您的工作目录
- 所有翻译工作在 `zh-cn/` 进行
- 这是您自己的工作目录,可以自由修改
- 保持与 `en/` 相同的文件结构,便于对比

### 3. 共享资源
- `programs/` - Python 示例代码
- `img/` - 图片资源
- 这些文件被中英文版本共享

## 上游同步 - 感知上游变化

### 为什么需要同步?

当上游项目更新时,您需要:
1. 感知哪些章节有变化
2. 更新对应的中文翻译
3. 保持翻译与最新英文版同步

### 同步脚本用法

#### 方法 1: 查看变更(不自动提交)
```powershell
# 进入项目目录
cd C:\Users\jeffr\Documents\GitHub\byte-of-python

# 运行同步脚本(会显示变更但不提交)
.\sync_en.ps1
```

#### 方法 2: 自动同步并提交
```powershell
.\sync_en.ps1 -Auto
```

#### 方法 3: 手动 Git 命令
```bash
# 1. 获取上游最新代码
git fetch upstream

# 2. 查看上游有哪些变更
git diff en/ upstream/master --stat

# 3. 查看具体变更文件
git diff en/ upstream/master --name-only

# 4. 手动同步单个文件
git show upstream/master:control_flow.md > en/control_flow.md

# 5. 提交更改
git add en/
git commit -m "同步上游更新"
```

### 如何感知上游变化?

上游更新后,您可以:

1. **查看变更列表**
   ```bash
   git diff en/ upstream/master --name-only
   ```
   这会显示上游新增或修改的文件

2. **对比差异**
   ```bash
   git diff en/ upstream/master -- en/control_flow.md
   ```
   查看某个文件的详细变化

3. **批量同步**
   运行 `sync_en.ps1 -Auto` 自动同步所有文件

4. **GitHub 通知**
   在 GitHub 上 Watching 您的项目,上游有变更时会收到通知

## 构建中文版

### 自动构建

当以下文件变更时,GitHub Actions 会自动构建中文版:
- `zh-cn/**`
- `programs/**`
- `img/**`
- `.github/workflows/build-zh-cn.yml`

### 手动触发

访问: https://github.com/jeffreyheping/byte-of-python/actions
→ 选择 "Build Chinese Translation"
→ 点击 "Run workflow"

### 本地构建(可选)

```bash
# 1. 安装 Node.js (建议 v20)

# 2. 安装 HonKit
npm install honkit

# 3. 构建中文版
npx honkit build ./zh-cn ./public

# 4. 本地预览
npx honkit serve ./zh-cn
```

## 工作流程建议

### 日常翻译工作

1. **开始工作前**: 同步上游,检查是否有更新
   ```powershell
   .\sync_en.ps1
   git status en/  # 查看变更
   ```

2. **发现问题**: 如果上游有变更
   ```bash
   # 查看变更详情
   git diff en/ upstream/master --name-only
   
   # 对比具体文件
   git diff en/ upstream/master -- en/functions.md
   ```

3. **更新翻译**: 根据上游变更,更新 `zh-cn/` 中对应的文件

4. **提交推送**: GitHub Actions 自动构建
   ```bash
   git add zh-cn/
   git commit -m "翻译第X章: 函数"
   git push origin master
   ```

### 翻译策略

1. **逐章翻译**: 保持与 `en/` 相同的文件结构
2. **对比更新**: 定期对比 `en/` 和 `zh-cn/`,确保同步
3. **参考上游**: `en/` 是权威参考,始终保持最新

## 常见问题

### Q: 为什么 en/ 不能修改?
A: `en/` 是上游项目的镜像,用于:
- 监控上游变化
- 作为翻译参考
- 便于与上游保持同步
- 将来说不定能合并回上游

### Q: 上游更新了,我的翻译怎么办?
A:
1. 运行 `sync_en.ps1` 同步 `en/`
2. 查看哪些文件有变化: `git diff en/ upstream/master --name-only`
3. 对比变化内容
4. 更新 `zh-cn/` 中对应的翻译

### Q: 如何知道上游有更新?
A:
1. **GitHub Notifications**: 在 GitHub 上 Watching 项目
2. **定期检查**: 每周运行一次 `sync_en.ps1` 查看变更
3. **RSS 订阅**: 订阅上游项目的 Release 通知

### Q: 中文版构建失败怎么办?
A: 检查:
1. `zh-cn/book.json` 配置是否正确
2. `zh-cn/SUMMARY.md` 是否存在且格式正确
3. Markdown 文件是否有语法错误
4. `{% include %}` 标签路径是否正确

## 相关链接

- 上游项目: https://github.com/swaroopch/byte-of-python
- 在线阅读(英文): https://python.swaroopch.com/
- 翻译指南: https://github.com/swaroopch/byte-of-python/blob/master/translations.md
- 用户项目: https://github.com/jeffreyheping/byte-of-python
