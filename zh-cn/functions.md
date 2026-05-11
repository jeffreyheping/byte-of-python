# 函数

函数（function）是可重复使用的程序片段。它们允许你给一个语句块命名，以便你可以在程序的任何位置、任意次数地使用该名称来运行这个语句块。这被称为*调用*（calling）函数。我们已经使用了许多内置函数，如 `len` 和 `range`。

函数概念可能是任何非平凡软件（在任何编程语言中）中*最*重要的构建块，因此我们将在本章中探索函数的各个方面。

函数使用 `def` 关键字来定义。在这个关键字之后是函数的*标识符*名称，后面跟着一对圆括号，圆括号中可以包含一些变量名，最后以冒号结束该行。接下来是属于该函数的语句块。一个例子可以说明这实际上非常简单：

示例（保存为 `function1.py`）：

<pre><code class="lang-python">{% include "../programs/function1.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/function1.txt" %}</code></pre>

**工作原理**

我们使用上面解释的语法定义了一个名为 `say_hello` 的函数。这个函数不接受任何参数，因此圆括号中没有声明变量。函数的参数（parameter）就是函数的输入，这样我们可以传入不同的值并获得相应的结果。

请注意，我们可以调用同一个函数两次，这意味着我们不需要再次编写相同的代码。

## 函数参数

函数可以接受参数（parameter），即你提供给函数的值，以便函数可以利用这些值来*执行*某些操作。这些参数就像变量一样，只不过这些变量的值在我们调用函数时才被定义，在函数运行时已经被赋值。

参数在函数定义的圆括号中指定，用逗号分隔。当我们调用函数时，也以同样的方式提供值。请注意使用的术语——函数定义中给出的名称称为*形参*（parameter），而你在函数调用中提供的值称为*实参*（argument）。

示例（保存为 `function_param.py`）：

<pre><code class="lang-python">{% include "../programs/function_param.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/function_param.txt" %}</code></pre>

**工作原理**

在这里，我们定义了一个名为 `print_max` 的函数，它使用两个参数 `a` 和 `b`。我们使用一个简单的 `if..else` 语句找出较大的数字，然后打印它。

第一次调用函数 `print_max` 时，我们直接提供数字作为实参。在第二种情况下，我们用变量作为实参来调用函数。`print_max(x, y)` 使得实参 `x` 的值被赋给形参 `a`，实参 `y` 的值被赋给形参 `b`。`print_max` 函数在两种情况下的工作方式是相同的。

## 局部变量

当你在函数定义内部声明变量时，它们与函数外部使用的同名变量没有任何关系——即变量名对函数来说是*局部*的（local）。这被称为变量的*作用域*（scope）。所有变量的作用域都是从定义点开始的声明所在的块。

示例（保存为 `function_local.py`）：

<pre><code class="lang-python">{% include "../programs/function_local.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/function_local.txt" %}</code></pre>

**工作原理**

第一次在函数体的第一行打印名称 *x* 的*值*时，Python 使用的是在主块中、函数定义上方声明的参数的值。

接下来，我们将值 `2` 赋给 `x`。名称 `x` 对我们的函数来说是局部的。因此，当我们在函数中改变 `x` 的值时，主块中定义的 `x` 不受影响。

通过最后的 `print` 语句，我们显示主块中定义的 `x` 的值，从而确认它实际上不受之前调用的函数中局部赋值的影响。

## `global` 语句 {% raw %}{#global-statement}{% endraw %}

如果你想给一个在程序顶层定义的名称（即不在函数或类等任何作用域内）赋值，那么你必须告诉 Python 这个名称不是局部的，而是*全局*的（global）。我们使用 `global` 语句来实现这一点。如果没有 `global` 语句，就不可能给函数外部定义的变量赋值。

你可以使用函数外部定义的这类变量的值（假设函数内部没有同名的变量）。但是，不鼓励这样做，应该避免，因为程序的读者会不清楚该变量的定义在哪里。使用 `global` 语句可以清楚地表明变量是在最外层块中定义的。

示例（保存为 `function_global.py`）：

<pre><code class="lang-python">{% include "../programs/function_global.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/function_global.txt" %}</code></pre>

**工作原理**

`global` 语句用于声明 `x` 是一个全局变量——因此，当我们在函数内部给 `x` 赋值时，这个变化会反映到我们在主块中使用 `x` 的值时。

你可以使用同一个 `global` 语句指定多个全局变量，例如 `global x, y, z`。

## 默认参数值 {% raw %}{#default-arguments}{% endraw %}

对于某些函数，你可能想让一些参数变成*可选的*，并在用户不想为它们提供值时使用默认值。这可以通过默认参数值来实现。你可以在函数定义中，在参数名后面加上赋值运算符（`=`）和默认值来指定默认参数值。

请注意，默认参数值应该是一个常量。更准确地说，默认参数值应该是不可变的（immutable）——这将在后面的章节中详细解释。现在，只需记住这一点。

示例（保存为 `function_default.py`）：

<pre><code class="lang-python">{% include "../programs/function_default.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/function_default.txt" %}</code></pre>

**工作原理**

名为 `say` 的函数用于将字符串打印指定的次数。如果我们不提供值，则默认只打印一次字符串。我们通过为参数 `times` 指定默认参数值 `1` 来实现这一点。

在第一次使用 `say` 时，我们只提供了字符串，它打印了一次字符串。在第二次使用 `say` 时，我们同时提供了字符串和实参 `5`，表示我们想要将字符串消息*打印* 5 次。

> *注意*
>
> 只有那些位于参数列表末尾的参数才能被赋予默认参数值，即你不能在函数的参数列表中让一个有默认值的参数位于一个没有默认值的参数之前。
>
> 这是因为值是按位置赋给参数的。例如，`def func(a, b=5)` 是有效的，但 `def func(a=5, b)` 是*无效的*。

## 关键字参数

如果你有一些函数有很多参数，而你只想指定其中一些，那么你可以通过命名来为这些参数提供值——这被称为*关键字参数*（keyword argument）——我们使用名称（关键字）而不是位置（我们一直使用的方式）来指定函数的参数。

这有两个好处：第一，使用函数更容易，因为我们不需要担心参数的顺序。第二，我们可以只为我们想要的参数提供值，前提是其他参数有默认参数值。

示例（保存为 `function_keyword.py`）：

<pre><code class="lang-python">{% include "../programs/function_keyword.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/function_keyword.txt" %}</code></pre>

**工作原理**

名为 `func` 的函数有一个没有默认参数值的参数，后面跟着两个有默认参数值的参数。

在第一次使用中，`func(3, 7)`，参数 `a` 得到值 `3`，参数 `b` 得到值 `7`，`c` 得到默认值 `10`。

在第二次使用中 `func(25, c=24)`，变量 `a` 由于实参的位置而得到值 25。然后，参数 `c` 由于命名即关键字参数而得到值 `24`。变量 `b` 得到默认值 `5`。

在第三次使用中 `func(c=50, a=100)`，我们对所有指定的值都使用了关键字参数。请注意，我们为参数 `c` 指定的值在 `a` 之前，尽管 `a` 在函数定义中在 `c` 之前定义。

## 可变参数

有时你可能想定义一个可以接受_任意_数量参数的函数，即可**变**数量的**参数**（varargs），这可以通过使用星号来实现（保存为 `function_varargs.py`）：

<pre><code class="lang-python">{% include "../programs/function_varargs.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/function_varargs.txt" %}</code></pre>

**工作原理**

当我们声明一个带星号的参数如 `*param` 时，从该位置到末尾的所有位置参数都会被收集为一个名为 'param' 的 tuple。

类似地，当我们声明一个带双星号的参数如 `**param` 时，从该位置到末尾的所有关键字参数都会被收集为一个名为 'param' 的 dict（字典）。

我们将在[后面的章节](./data_structures.md#data-structures)中探索 tuple 和 dict。

## `return` 语句 {% raw %}{#return-statement}{% endraw %}

`return` 语句用于从函数中*返回*，即跳出函数。我们还可以选择性地从函数中*返回一个值*。

示例（保存为 `function_return.py`）：

<pre><code class="lang-python">{% include "../programs/function_return.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/function_return.txt" %}</code></pre>

**工作原理**

`maximum` 函数返回参数中的最大值，在这个例子中就是提供给函数的数字。它使用一个简单的 `if..else` 语句来找出较大的值，然后*返回*该值。

请注意，没有值的 `return` 语句等价于 `return None`。`None` 是 Python 中的一种特殊类型，表示"没有值"。例如，如果一个变量的值为 `None`，就表示该变量没有值。

每个函数在末尾都隐含地包含一个 `return None` 语句，除非你自己编写了 `return` 语句。你可以通过运行 `print(some_function())` 来验证这一点，其中函数 `some_function` 没有使用 `return` 语句，例如：

```python
def some_function():
    pass
```

`pass` 语句在 Python 中用于表示一个空的语句块。

> 提示：有一个名为 `max` 的内置函数已经实现了"查找最大值"的功能，所以请尽可能使用这个内置函数。

## 文档字符串（DocStrings）

Python 有一个很棒的功能叫做*文档字符串*（documentation string），通常简称为 *docstring*。DocStrings 是一个你应该使用的重要工具，因为它有助于更好地记录程序，使程序更容易理解。令人惊喜的是，我们甚至可以在程序运行时从函数中获取 docstring！

示例（保存为 `function_docstring.py`）：

<pre><code class="lang-python">{% include "../programs/function_docstring.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/function_docstring.txt" %}</code></pre>

**工作原理**

函数第一个逻辑行上的字符串就是该函数的 *docstring*。请注意，DocStrings 也适用于[模块](./modules.md#modules)和[类](./oop.md#oop)，我们将在各自的章节中学习。

docstring 的惯例是多行字符串，第一行以大写字母开头并以句号结尾。然后第二行是空行，接着从第三行开始是详细的解释。你*强烈建议*对所有非平凡函数的所有 docstring 都遵循这个惯例。

我们可以使用函数的 `__doc__`（注意*双下划线*）属性（属于该函数的名称）来访问 `print_max` 函数的 docstring。请记住，Python 将*一切*视为对象，包括函数。我们将在[类](./oop.md#oop)章节中了解更多关于对象的知识。

如果你在 Python 中使用过 `help()`，那么你已经看到了 docstring 的使用！它所做的就是获取该函数的 `__doc__` 属性并以整洁的方式显示给你。你可以在上面的函数上试试——只需在你的程序中加入 `help(print_max)` 即可。记得按 `q` 键退出 `help`。

自动化工具可以以这种方式从你的程序中获取文档。因此，我*强烈建议*你为你编写的任何非平凡函数使用 docstring。你的 Python 发行版附带的 `pydoc` 命令的工作方式类似于 `help()`，也是使用 docstring。

## 小结

我们已经了解了函数的许多方面，但请注意我们还没有涵盖所有方面。不过，我们已经涵盖了你在日常使用 Python 函数时最需要的大部分知识。

接下来，我们将学习如何使用以及创建 Python 模块。
