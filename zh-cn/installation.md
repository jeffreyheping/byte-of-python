# 安装 {% raw %}{#installation}{% endraw %}

当我们在本书中提到"Python 3"时，指的是任何等于或大于 [Python {{ book.pythonVersion }}](https://www.python.org/downloads/) 的版本。

## 在 Windows 上安装

访问 https://www.python.org/downloads/ 并下载最新版本。在撰写本文时，最新版本是 Python 3.5.1。安装过程与其他基于 Windows 的软件一样。

注意，如果你的 Windows 版本是 Vista 之前的版本，你应该[只下载 Python 3.4](https://www.python.org/downloads/windows/)，因为更新的版本需要更新版本的 Windows。

注意：请确保勾选 `Add Python 3.5 to PATH` 选项。

要更改安装位置，点击 `Customize installation`，然后点击 `Next`，输入 `C:\python35`（或其他合适的位置）作为安装位置。

如果你之前没有勾选 `Add Python 3.5 PATH` 选项，请勾选 `Add Python to environment variables`。这与第一个安装界面上的 `Add Python 3.5 to PATH` 效果相同。

你可以选择是否为所有用户安装启动器，这影响不大。启动器用于在安装的多个 Python 版本之间切换。

如果你的路径没有正确设置（通过勾选 `Add Python 3.5 Path` 或 `Add Python to environment variables` 选项），请按照下一节（`DOS 提示符`）中的步骤进行修复。否则，请跳转到本文档中的 `在 Windows 上运行 Python 提示符` 部分。

注意：对于已经了解编程的人，如果你熟悉 Docker，可以查看 [Python in Docker](https://hub.docker.com/_/python/) 和 [Docker on Windows](https://docs.docker.com/windows/)。

### DOS 提示符 {% raw %}{#dos-prompt}{% endraw %}

如果你希望能够从 Windows 命令行（即 DOS 提示符）使用 Python，那么你需要正确设置 PATH 环境变量。

对于 Windows 2000、XP、2003，点击 `控制面板` -> `系统` -> `高级` -> `环境变量`。在_系统变量_部分找到名为 `PATH` 的变量，然后选择 `编辑`，在已有内容的末尾添加 `;C:\Python35`（请确认此文件夹存在，较新版本的 Python 路径会有所不同）。当然，请使用实际的目录名。

<!-- The directory should match pythonVersion variable in book.json -->
对于更旧版本的 Windows，打开文件 `C:\AUTOEXEC.BAT` 并添加一行 `PATH=%PATH%;C:\Python35`，然后重启系统。对于 Windows NT，使用 `AUTOEXEC.NT` 文件。

对于 Windows Vista：

- 点击开始按钮，选择 `控制面板`
- 点击系统，在右侧你会看到"查看有关计算机的基本信息"
- 左侧是任务列表，最后一项是 `高级系统设置`。点击它。
- 显示 `系统属性` 对话框的 `高级` 选项卡。点击右下角的 `环境变量` 按钮。
- 在标题为 `系统变量` 的下方框中，向下滚动找到 Path，点击 `编辑` 按钮。
- 根据需要修改你的路径。
- 重启系统。在我重启之前，Vista 不会识别系统路径环境变量的更改。

对于 Windows 7 和 8：

- 在桌面上右键点击计算机并选择 `属性`，或点击 `开始` 并选择 `控制面板` -> `系统和安全` -> `系统`。点击左侧的 `高级系统设置`，然后点击 `高级` 选项卡。在底部点击 `环境变量`，在 `系统变量` 下找到 `PATH` 变量，选中后按 `编辑`。
- 转到变量值的行末，在已有内容的末尾追加 `;C:\Python35`（请确认此文件夹存在，较新版本的 Python 路径会有所不同）。当然，请使用实际的文件夹名。
- 如果原来的值是 `%SystemRoot%\system32;`，现在将变成 `%SystemRoot%\system32;C:\Python36` <!-- The directory should match pythonVersion variable in book.json -->
- 点击 `确定` 即可。无需重启，但你可能需要关闭并重新打开命令行。

对于 Windows 10：

Windows 开始菜单 > `设置` > `关于` > `系统信息`（在最右侧）> `高级系统设置` > `环境变量`（在底部附近）>（然后高亮 `Path` 变量并点击 `编辑`）> `新建` >（输入你的 Python 安装位置，例如 `C:\Python35\`）

### 在 Windows 上运行 Python 提示符

对于 Windows 用户，如果你已经[正确设置了 `PATH` 变量](#dos-prompt)，就可以在命令行中运行解释器。

要在 Windows 中打开终端，点击开始按钮并点击 `运行`。在对话框中输入 `cmd` 并按 `[回车]` 键。

然后，输入 `python` 并确保没有错误。

## 在 Mac OS X 上安装

对于 Mac OS X 用户，使用 [Homebrew](http://brew.sh)：`brew install python3`。

要验证安装，按 `[Command + Space]` 键（打开 Spotlight 搜索），输入 `Terminal` 并按 `[回车]` 键来打开终端。然后运行 `python3` 并确保没有错误。

## 在 GNU/Linux 上安装

对于 GNU/Linux 用户，使用你的发行版的包管理器来安装 Python 3，例如在 Debian 和 Ubuntu 上：`sudo apt-get update && sudo apt-get install python3`。

要验证安装，通过打开 `Terminal` 应用程序或按 `Alt + F2` 并输入 `gnome-terminal` 来打开终端。如果这不起作用，请参考你使用的 GNU/Linux 发行版的文档。然后运行 `python3` 并确保没有错误。

你可以通过运行以下命令在屏幕上看到 Python 的版本：

<!-- The output should match pythonVersion variable in book.json -->
```
$ python3 -V
Python 3.6.0
```

注意：`$` 是 shell 的提示符。根据你计算机操作系统的设置，你的提示符可能会有所不同，因此我只用 `$` 符号来表示提示符。

注意：根据你计算机上安装的 Python 版本不同，输出可能会有所不同。

## 总结

从现在开始，我们假设你已经在系统上安装了 Python。

接下来，我们将编写我们的第一个 Python 程序。
