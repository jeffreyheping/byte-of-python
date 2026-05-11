# 模块

你已经看到了如何通过定义函数来在程序中复用代码。如果你想在你编写的其他程序中复用多个函数呢？你可能已经猜到了，答案就是模块（module）。

编写模块有各种方法，但最简单的方式是创建一个 `.py` 扩展名的文件，其中包含函数和变量。

另一种方法是用 Python 解释器本身的编写语言（即原生语言）来编写模块。例如，你可以用 [C 编程语言](http://docs.python.org/3/extending/)编写模块，编译后可以在使用标准 Python 解释器时从你的 Python 代码中使用。

一个模块可以被另一个程序*导入*（import）以使用其功能。这也是我们使用 Python 标准库的方式。首先，我们来看看如何使用标准库模块。

示例（保存为 `module_using_sys.py`）：

<pre><code class="lang-python">{% include "../programs/module_using_sys.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/module_using_sys.txt" %}</code></pre>

**工作原理**

首先，我们使用 `import` 语句*导入* `sys` 模块。基本上，这等同于告诉 Python 我们想要使用这个模块。`sys` 模块包含与 Python 解释器及其环境相关的功能，即 **sys**tem（系统）。

当 Python 执行 `import sys` 语句时，它会查找 `sys` 模块。在这个例子中，它是内置模块之一，因此 Python 知道在哪里找到它。

如果它不是一个编译后的模块，即用 Python 编写的模块，那么 Python 解释器会在其 `sys.path` 变量中列出的目录中搜索。如果找到了模块，那么该模块主体中的语句会被执行，模块变得*可用*供你使用。请注意，初始化只在*第一次*导入模块时进行。

`sys` 模块中的 `argv` 变量使用点号表示法来访问，即 `sys.argv`。这清楚地表明这个名称是 `sys` 模块的一部分。这种方法的另一个好处是，该名称不会与你的程序中使用的任何 `argv` 变量冲突。

`sys.argv` 变量是一个字符串的 *list*（列表）（列表将在[后面的章节](./data_structures.md#data-structures)中详细解释）。具体来说，`sys.argv` 包含*命令行参数*（command line argument）的列表，即通过命令行传递给你的程序的参数。

如果你使用 IDE 来编写和运行这些程序，请在菜单中查找为程序指定命令行参数的方法。

在这里，当我们执行 `python module_using_sys.py we are arguments` 时，我们用 `python` 命令运行模块 `module_using_sys.py`，后面跟着的是传递给程序的参数。Python 将命令行参数存储在 `sys.argv` 变量中供我们使用。

请记住，正在运行的脚本名称始终是 `sys.argv` 列表的第一个元素。因此，在这个例子中，`'module_using_sys.py'` 是 `sys.argv[0]`，`'we'` 是 `sys.argv[1]`，`'are'` 是 `sys.argv[2]`，`'arguments'` 是 `sys.argv[3]`。请注意 Python 从 0 开始计数，而不是从 1。

`sys.path` 包含导入模块时搜索的目录名称列表。请注意 `sys.path` 中的第一个字符串是空的——这个空字符串表示当前目录也是 `sys.path` 的一部分，这与 `PYTHONPATH` 环境变量相同。这意味着你可以直接导入位于当前目录中的模块。否则，你必须将模块放在 `sys.path` 中列出的某个目录中。

请注意，当前目录是启动程序的目录。运行 `import os; print(os.getcwd())` 来查找你程序的当前目录。

## 字节编译的 .pyc 文件 {% raw %}{#pyc}{% endraw %}

导入模块是一个相对昂贵的操作，所以 Python 做了一些优化来加快速度。一种方法是创建扩展名为 `.pyc` 的*字节编译*（byte-compiled）文件，这是 Python 将程序转换成的中间形式（还记得[介绍部分](./about_python.md#interpreted)关于 Python 工作原理的说明吗？）。当你下次从另一个程序导入该模块时，这个 `.pyc` 文件就很有用——它会快得多，因为导入模块所需的部分处理工作已经完成了。此外，这些字节编译文件是平台无关的。

注意：这些 `.pyc` 文件通常创建在与相应 `.py` 文件相同的目录中。如果 Python 没有权限写入该目录中的文件，那么 `.pyc` 文件将_不会_被创建。

## `from..import` 语句 {% raw %}{#from-import-statement}{% endraw %}

如果你想直接将 `argv` 变量导入到你的程序中（以避免每次都输入 `sys.`），那么你可以使用 `from sys import argv` 语句。

> 警告：一般来说，*避免*使用 `from..import` 语句，而应使用 `import` 语句。这是因为你的程序会避免名称冲突，并且更加易读。

示例：

```python
from math import sqrt
print("Square root of 16 is", sqrt(16))
```

## 模块的 `__name__` {% raw %}{#module-name}{% endraw %}

每个模块都有一个名称，模块中的语句可以找出其模块的名称。这对于判断模块是作为独立程序运行还是被导入特别有用。如前所述，当模块第一次被导入时，它包含的代码会被执行。我们可以利用这一点，根据模块是被自身使用还是从另一个模块导入来让模块表现出不同的行为。这可以通过使用模块的 `__name__` 属性来实现。

示例（保存为 `module_using_name.py`）：

<pre><code class="lang-python">{% include "../programs/module_using_name.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/module_using_name.txt" %}</code></pre>

**工作原理**

每个 Python 模块都有其 `__name__` 定义。如果它是 `'__main__'`，这意味着该模块正由用户作为独立程序运行，我们可以采取相应的操作。

## 创建你自己的模块

创建你自己的模块很简单，你其实一直在这样做！这是因为每个 Python 程序也是一个模块。你只需要确保它有 `.py` 扩展名。下面的例子应该能说明这一点。

示例（保存为 `mymodule.py`）：

<pre><code class="lang-python">{% include "../programs/mymodule.py" %}</code></pre>

上面是一个示例*模块*。如你所见，与我们通常的 Python 程序相比，它没有什么特别之处。接下来我们将看到如何在其他 Python 程序中使用这个模块。

请记住，模块应该放在与导入它的程序相同的目录中，或者放在 `sys.path` 中列出的某个目录中。

另一个模块（保存为 `mymodule_demo.py`）：

<pre><code class="lang-python">{% include "../programs/mymodule_demo.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/mymodule_demo.txt" %}</code></pre>

**工作原理**

请注意，我们使用相同的点号表示法来访问模块的成员。Python 很好地复用了相同的表示法，赋予它独特的"Pythonic"风格，这样我们就不需要不断学习新的做事方式。

下面是一个使用 `from..import` 语法的版本（保存为 `mymodule_demo2.py`）：

<pre><code class="lang-python">{% include "../programs/mymodule_demo2.py" %}</code></pre>

`mymodule_demo2.py` 的输出与 `mymodule_demo.py` 的输出相同。

请注意，如果在导入 mymodule 的模块中已经声明了一个 `__version__` 名称，就会发生冲突。这也很可能发生，因为每个模块使用这个名称来声明其版本号是一种常见做法。因此，即使 `import` 语句可能让你的程序稍长一些，也总是推荐优先使用它。

你也可以使用：

```python
from mymodule import *
```

这将导入所有公共名称，如 `say_hi`，但不会导入 `__version__`，因为它以双下划线开头。

> 警告：请记住你应该避免使用 import-star，即 `from mymodule import *`。

<!-- -->

> **Python 之禅**
>
> Python 的指导原则之一是"显式优于隐式"（Explicit is better than Implicit）。在 Python 中运行 `import this` 来了解更多。

## `dir` 函数 {% raw %}{#dir-function}{% endraw %}

内置的 `dir()` 函数返回由对象定义的名称列表。
如果对象是一个模块，该列表包括在该模块中定义的函数、类和变量。

该函数可以接受参数。
如果参数是模块的名称，则函数返回该指定模块的名称列表。
如果没有参数，则函数返回当前模块的名称列表。

示例：

```python
$ python
>>> import sys

# 获取 sys 模块中的属性名称
>>> dir(sys)
['__displayhook__', '__doc__',
'argv', 'builtin_module_names',
'version', 'version_info']
# 此处仅显示部分条目

# 获取当前模块的属性名称
>>> dir()
['__builtins__', '__doc__',
'__name__', '__package__', 'sys']

# 创建一个新变量 'a'
>>> a = 5

>>> dir()
['__builtins__', '__doc__', '__name__', '__package__', 'sys', 'a']

# 删除/移除一个名称
>>> del a

>>> dir()
['__builtins__', '__doc__', '__name__', '__package__', 'sys']
```

**工作原理**

首先，我们看到在导入的 `sys` 模块上使用 `dir` 的情况。我们可以看到它包含的大量属性。

接下来，我们在不传递参数的情况下使用 `dir` 函数。默认情况下，它返回当前模块的属性列表。请注意，已导入模块的列表也是这个列表的一部分。

为了观察 `dir` 的实际效果，我们定义一个新变量 `a` 并赋值，然后检查 `dir`，我们观察到列表中多了一个同名条目。我们使用 `del` 语句删除当前模块的变量/属性，变化再次反映在 `dir` 函数的输出中。

关于 `del` 的说明：这个语句用于*删除*一个变量/名称，在该语句运行后，在这个例子中是 `del a`，你将不能再访问变量 `a`——就好像它从未存在过一样。

请注意，`dir()` 函数适用于*任何*对象。例如，运行 `dir(str)` 可以查看 `str`（字符串）类的属性。

还有一个 [`vars()`](http://docs.python.org/3/library/functions.html#vars) 函数，它可以给你提供属性及其值，但它并不适用于所有情况。

## 包（Packages）

到现在为止，你一定已经开始注意到组织程序的层次结构了。变量通常放在函数内部。函数和全局变量通常放在模块内部。如果你想组织模块呢？这就是包发挥作用的地方。

包就是包含模块的文件夹，其中有一个特殊的 `__init__.py` 文件，它告诉 Python 这个文件夹是特殊的，因为它包含 Python 模块。

假设你想创建一个名为 'world' 的包，其中包含子包 'asia'、'africa' 等，这些子包又包含 'india'、'madagascar' 等模块。

你的文件夹结构应该是这样的：

```
- <sys.path 中存在的某个文件夹>/
    - world/
        - __init__.py
        - asia/
            - __init__.py
            - india/
                - __init__.py
                - foo.py
        - africa/
            - __init__.py
            - madagascar/
                - __init__.py
                - bar.py
```

包只是一种方便地按层次结构组织模块的方式。你将在[标准库](./stdlib.md#stdlib)中看到许多这样的例子。

## 小结

就像函数是程序的可复用部分一样，模块是可复用的程序。包是组织模块的另一种层次结构。Python 附带的标准库就是这种包和模块集合的一个例子。

我们已经了解了如何使用这些模块以及创建自己的模块。

接下来，我们将学习一些被称为数据结构的有趣概念。
