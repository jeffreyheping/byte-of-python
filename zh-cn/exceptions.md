# 异常

当你的程序中出现_异常_情况时，就会发生异常（exception）。例如，如果你要读取一个文件但文件不存在怎么办？或者如果程序运行时你不小心删除了它怎么办？这些情况使用**异常**来处理。

类似地，如果你的程序中有一些无效的语句怎么办？这由 Python 来处理，它会**抛出**错误并告诉你有一个**错误**。

## 错误

考虑一个简单的 `print` 函数调用。如果我们把 `print` 拼写成了 `Print` 怎么办？注意大小写。在这种情况下，Python 会_抛出_一个语法错误。

```python
>>> Print("Hello World")
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'Print' is not defined
>>> print("Hello World")
Hello World
```

观察到一个 `NameError` 被抛出，并且打印了检测到错误的位置。这就是这个错误的**错误处理器**所做的事情。

## 异常

我们将**尝试**从用户那里读取输入。输入下面的第一行并按回车键。当你的计算机提示你输入时，在 Mac 上按 `[ctrl-d]` 或在 Windows 上按 `[ctrl-z]`，看看会发生什么。（如果你使用的是 Windows 并且两个选项都不起作用，你可以在命令提示符中尝试 `[ctrl-c]` 来生成一个 KeyboardInterrupt 错误）。

```python
>>> s = input('Enter something --> ')
Enter something --> Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
EOFError
```

Python 抛出了一个名为 `EOFError` 的错误，这基本上意味着它在没有预期的情况下发现了一个*文件结束*（end of file）符号（由 `ctrl-d` 表示）。

## 处理异常

我们可以使用 `try..except` 语句来处理异常。基本上，我们将通常的语句放在 try 块中，将所有错误处理器放在 except 块中。

示例（保存为 `exceptions_handle.py`）：

<pre><code class="lang-python">{% include "programs/exceptions_handle.py" %}</code></pre>

输出：

<pre><code>{% include "programs/exceptions_handle.txt" %}</code></pre>

**工作原理**

我们将所有可能引发异常/错误的语句放在 `try` 块中，然后在 `except` 子句/块中为相应的错误/异常放置处理器。`except` 子句可以处理单个指定的错误或异常，或者一个括号括起来的错误/异常列表。如果没有提供错误或异常的名称，它将处理_所有_错误和异常。

注意每个 `try` 子句必须至少关联一个 `except` 子句。否则，有 try 块有什么意义呢？

如果任何错误或异常没有被处理，那么将调用默认的 Python 处理器，它只是停止程序的执行并打印错误消息。我们在上面已经看到了这种情况。

你还可以有一个与 `try..except` 块关联的 `else` 子句。如果没有发生异常，则执行 `else` 子句。

在下一个例子中，我们还将看到如何获取异常对象，以便我们可以检索额外的信息。

## 抛出异常

你可以使用 `raise` 语句通过提供错误/异常的名称和要_抛出_的异常对象来_抛出_异常。

你可以抛出的错误或异常应该是一个类，它必须直接或间接地是 `Exception` 类的派生类。

示例（保存为 `exceptions_raise.py`）：

<pre><code class="lang-python">{% include "programs/exceptions_raise.py" %}</code></pre>

输出：

<pre><code>{% include "programs/exceptions_raise.txt" %}</code></pre>

**工作原理**

在这里，我们创建了自己的异常类型。这个新的异常类型叫做 `ShortInputException`。它有两个字段——`length` 是给定输入的长度，`atleast` 是程序期望的最小长度。

在 `except` 子句中，我们提到错误的类将被存储 `as` 变量名来保存相应的错误/异常对象。这类似于函数调用中的参数和实参。在这个特定的 `except` 子句中，我们使用异常对象的 `length` 和 `atleast` 字段向用户打印适当的消息。

## Try ... Finally {#try-finally}

假设你在程序中读取一个文件。你如何确保无论是否引发异常，文件对象都被正确关闭？这可以使用 `finally` 块来完成。

将此程序保存为 `exceptions_finally.py`：

<pre><code class="lang-python">{% include "programs/exceptions_finally.py" %}</code></pre>

输出：

<pre><code>{% include "programs/exceptions_finally.txt" %}</code></pre>

**工作原理**

我们做的是通常的文件读取操作，但我们使用 `time.sleep` 函数在打印每一行之后任意地休眠 2 秒，使程序运行缓慢（Python 本身运行速度非常快）。当程序仍在运行时，按 `ctrl + c` 来中断/取消程序。

观察到 `KeyboardInterrupt` 异常被抛出，程序退出。然而，在程序退出之前，finally 子句被执行，文件对象总是被关闭。

注意，被赋值为 0 或 `None` 的变量，或者是空序列或集合的变量，被 Python 认为是 `False`。这就是为什么我们可以在上面的代码中使用 `if f:`。

还要注意我们在 `print` 之后使用了 `sys.stdout.flush()`，以便它立即打印到屏幕上。

## with 语句 {#with}

在 `try` 块中获取资源，然后在 `finally` 块中释放资源是一种常见的模式。因此，还有一个 `with` 语句，可以以简洁的方式实现这一点：

保存为 `exceptions_using_with.py`：

<pre><code class="lang-python">{% include "programs/exceptions_using_with.py" %}</code></pre>

**工作原理**

输出应该与前面的例子相同。这里的区别在于我们使用 `open` 函数配合 `with` 语句——我们将文件的关闭留给 `with open` 自动处理。

幕后发生的事情是 `with` 语句使用了一个协议。它获取 `open` 语句返回的对象，在这种情况下我们称之为 "thefile"。

它_总是_在开始其下的代码块之前调用 `thefile.__enter__` 函数，并在完成代码块之后_总是_调用 `thefile.__exit__`。

因此，我们本来会写在 `finally` 块中的代码应该由 `__exit__` 方法自动处理。这就是帮助我们避免反复使用显式的 `try..finally` 语句的原因。

关于这个主题的更多讨论超出了本书的范围，请参阅 [PEP 343](http://www.python.org/dev/peps/pep-0343/) 获取全面的解释。

## 小结

我们讨论了 `try..except` 和 `try..finally` 语句的使用。我们还学习了如何创建自己的异常类型以及如何抛出异常。

接下来，我们将探索 Python 标准库。
