# 标准库 {#stdlib}

Python 标准库包含大量有用的模块，是每个标准 Python 安装的一部分。熟悉 Python 标准库很重要，因为如果你了解这些库能做的事情的范围，很多问题可以快速解决。

我们将探索这个库中一些常用的模块。你可以在 Python 安装附带的文档的['库参考'部分](http://docs.python.org/3/library/)中找到 Python 标准库中所有模块的完整详细信息。

让我们探索一些有用的模块。

> **小心**：如果你觉得本章的主题太高级，你可以跳过本章。但是，我强烈建议在你对 Python 编程更加熟练之后回到本章。

## `sys` 模块 {#sys}

`sys` 模块包含系统特定的功能。我们已经看到 `sys.argv` **列表**包含命令行参数。

假设我们想检查正在使用的 Python 软件的版本，`sys` 模块可以给我们这些信息。

<!-- The output should match pythonVersion variable in book.json -->
```python
>>> import sys
>>> sys.version_info
sys.version_info(major=3, minor=6, micro=0, releaselevel='final', serial=0)
>>> sys.version_info.major == 3
True
```

**工作原理**

`sys` 模块有一个 `version_info` tuple，它给我们版本信息。第一个条目是主版本号。我们可以提取这些信息来使用它。

## `logging` 模块 {#logging}

如果你想将一些调试消息或重要消息存储在某处，以便你可以检查程序是否按预期运行怎么办？你如何将这些消息"存储在某处"？这可以使用 `logging` 模块来实现。

保存为 `stdlib_logging.py`：

<pre><code class="lang-python">{% include "./programs/stdlib_logging.py" %}</code></pre>

输出：

<pre><code>{% include "./programs/stdlib_logging.txt" %}</code></pre>

`cat` 命令用于在命令行中读取 'test.log' 文件。如果 `cat` 命令不可用，你可以在文本编辑器中打开 `test.log` 文件。

**工作原理**

我们使用了标准库中的三个模块——用于与操作系统交互的 `os` 模块、用于平台信息（即操作系统）的 `platform` 模块，以及用于*记录*信息的 `logging` 模块。

首先，我们通过检查 `platform.platform()` 返回的字符串来检查我们使用的是哪个操作系统（更多信息请参见 `import platform; help(platform)`）。如果是 Windows，我们确定主驱动器、主文件夹和我们想要存储信息的文件名。将这三个部分组合在一起，我们得到文件的完整位置。对于其他平台，我们只需要知道用户的主文件夹，然后我们就能得到文件的完整位置。

我们使用 `os.path.join()` 函数将位置的这三个部分组合在一起。使用特殊函数而不是简单地将字符串相加的原因是这个函数会确保完整位置符合操作系统期望的格式。注意：我们这里使用的 `join()` 方法是 `os` 模块的一部分，与我们在本书其他地方使用的字符串方法 `join()` 不同。

我们配置 `logging` 模块，将所有消息以特定格式写入我们指定的文件中。

最后，我们可以放入用于调试、信息、警告甚至关键消息的消息。程序运行后，我们可以检查这个文件，即使没有向运行程序的用户显示任何信息，我们也能知道程序中发生了什么。

## 模块周刊系列 {#motw}

标准库中还有更多值得探索的内容，如[调试](http://docs.python.org/3/library/pdb.html)、
[处理命令行选项](http://docs.python.org/3/library/argparse.html)、[正则表达式](http://docs.python.org/3/library/re.html)等等。

进一步探索标准库的最佳方式是阅读 Doug Hellmann 出色的 [Python Module of the Week](http://pymotw.com/2/contents.html) 系列（也有[书籍](http://amzn.com/0321767349)版本）以及阅读 [Python 文档](http://docs.python.org/3/)。

## 小结

我们探索了 Python 标准库中许多模块的一些功能。强烈建议浏览 [Python 标准库文档](http://docs.python.org/3/library/)，以了解所有可用的模块。

接下来，我们将介绍 Python 的各个方面，使我们对 Python 的了解更加_完整_。
