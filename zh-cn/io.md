# 输入与输出 {#io}

在某些情况下，你的程序需要与用户交互。例如，你可能想从用户那里获取输入，然后打印一些结果。我们可以分别使用 `input()` 函数和 `print` 函数来实现这一点。

对于输出，我们还可以使用 `str`（string，字符串）类的各种方法。例如，你可以使用 `rjust` 方法来获取一个右对齐到指定宽度的字符串。更多详情请参见 `help(str)`。

另一种常见的输入/输出类型是处理文件。创建、读取和写入文件的能力对于许多程序来说是必不可少的，我们将在本章中探索这一方面。

## 从用户获取输入

将此程序保存为 `io_input.py`：

<pre><code class="lang-python">{% include "./programs/io_input.py" %}</code></pre>

输出：

<pre><code>{% include "./programs/io_input.txt" %}</code></pre>

**工作原理**

我们使用切片功能来反转文本。我们已经见过如何使用 `seq[a:b]` 代码从位置 `a` 到位置 `b` 对序列进行[切片](./data_structures.md#sequence)。我们还可以提供第三个参数来确定切片的_步长_。默认步长是 `1`，因此它返回文本的连续部分。给定一个负步长，即 `-1`，将返回反转后的文本。

`input()` 函数接受一个字符串作为参数并将其显示给用户。然后它等待用户输入内容并按回车键。一旦用户输入并按下回车键，`input()` 函数就会返回用户输入的文本。

我们获取该文本并将其反转。如果原始文本和反转后的文本相等，那么该文本就是一个[回文](http://en.wiktionary.org/wiki/palindrome)（palindrome）。

### 课后练习

检查文本是否为回文时还应该忽略标点符号、空格和大小写。例如，"Rise to vote, sir." 也是一个回文，但我们当前的程序不会这么说。你能改进上面的程序来识别这个回文吗？

如果你需要提示，思路是……[^1]

## 文件

你可以通过创建 `file` 类的对象并适当地使用其 `read`、`readline` 或 `write` 方法来打开和使用文件进行读取或写入。读取或写入文件的能力取决于你为文件打开指定的模式。最后，当你完成文件操作后，调用 `close` 方法告诉 Python 我们已经完成了对文件的使用。

示例（保存为 `io_using_file.py`）：

<pre><code class="lang-python">{% include "./programs/io_using_file.py" %}</code></pre>

输出：

<pre><code>{% include "./programs/io_using_file.txt" %}</code></pre>

**工作原理**

注意我们可以简单地使用 `open` 方法创建一个新的文件对象。我们使用内置的 `open` 函数打开文件（如果文件不存在则创建它），并指定文件名和我们想要打开文件的模式。模式可以是读模式（`'r'`）、写模式（`'w'`）或追加模式（`'a'`）。我们还可以指定是以文本模式（`'t'`）还是二进制模式（`'b'`）进行读取、写入或追加。实际上还有更多可用的模式，`help(open)` 会给你更多关于它们的详细信息。默认情况下，`open()` 将文件视为文本文件并以读模式打开。

在我们的例子中，我们首先以写文本模式打开/创建文件，并使用文件对象的 `write` 方法将我们的字符串变量 `poem` 写入文件，然后我们最终 `close` 文件。

接下来，我们再次打开同一个文件进行读取。我们不需要指定模式，因为'读文本文件'是默认模式。我们使用 `readline` 方法在循环中逐行读取文件。这个方法返回一个完整的行，包括行末的换行符。当返回_空_字符串时，意味着我们已经到达文件末尾，我们 `break` 跳出循环。

最后，我们最终 `close` 文件。

从我们的 `readline` 输出中可以看到，这个程序确实已经写入并读取了我们的新 `poem.txt` 文件。

## Pickle

Python 提供了一个名为 `pickle` 的标准模块，你可以用它将_任何_纯 Python 对象存储在文件中，然后稍后取回它。这被称为*持久化*（persistently）存储对象。

示例（保存为 `io_pickle.py`）：

<pre><code class="lang-python">{% include "./programs/io_pickle.py" %}</code></pre>

输出：

<pre><code>{% include "./programs/io_pickle.txt" %}</code></pre>

**工作原理**

要将对象存储在文件中，我们首先必须以写二进制模式（__w__rite __b__inary）`open` 文件，然后调用 `pickle` 模块的 `dump` 函数。这个过程被称为_序列化_（pickling）。

接下来，我们使用 `pickle` 模块的 `load` 函数检索对象，该函数返回该对象。这个过程被称为_反序列化_（unpickling）。

## Unicode

到目前为止，当我们编写和使用字符串，或读写文件时，我们只使用了简单的英文字符。英文和非英文字符都可以用 Unicode 表示（详情请参阅本节末尾的文章），Python 3 默认以 Unicode 存储字符串变量（想想我们用单引号、双引号或三引号写的所有文本）。

> 注意：如果你使用的是 Python 2，并且希望能够读写其他非英语语言，我们需要使用 `unicode` 类型，它以字符 `u` 开头，例如 `u"hello world"`

```python
>>> "hello world"
'hello world'
>>> type("hello world")
<class 'str'>
>>> u"hello world"
'hello world'
>>> type(u"hello world")
<class 'str'>
```

当数据通过互联网发送时，我们需要以字节形式发送……这是你的计算机容易理解的形式。将 Unicode（Python 存储字符串时使用的格式）转换为字节的规则称为编码（encoding）。一种流行的编码是 UTF-8。我们可以通过在 `open` 函数中使用一个简单的关键字参数来进行 UTF-8 的读写。

<pre><code class="lang-python">{% include "./programs/io_unicode.py" %}</code></pre>

**工作原理**

我们使用 `io.open`，然后在第一个 open 语句中使用 `encoding` 参数来编码消息，在第二个 open 语句中再次使用 `encoding` 参数来解码消息。注意，我们应该只在文本模式下的 open 语句中使用编码。

每当我们编写使用 Unicode 字面量（在字符串前加 `u`）的程序时，就像我们上面使用的那样，我们必须确保告诉 Python 本身我们的程序使用 UTF-8，我们必须在程序顶部放置 `# encoding=utf-8` 注释。

你应该通过阅读以下资料来了解更多关于这个主题的内容：

- ["每个软件开发者绝对、肯定必须了解的 Unicode 和字符集的最基本知识"](http://www.joelonsoftware.com/articles/Unicode.html)
- [Python Unicode Howto](http://docs.python.org/3/howto/unicode.html)
- [Nat Batchelder 的实用 Unicode 演讲](http://nedbatchelder.com/text/unipain.html)

## 小结

我们讨论了各种类型的输入/输出、文件处理、pickle 模块和 Unicode。

接下来，我们将探索异常的概念。

---

[^1]: 使用一个 tuple（你可以在这里找到_所有_[标点符号的列表](http://grammar.ccc.commnet.edu/grammar/marks/marks.htm)）来保存所有禁止的字符，然后使用成员测试来确定一个字符是否应该被删除，即 forbidden = (`!`, `?`, `.`, ...)。
