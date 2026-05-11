# 控制流 {#control-flow}

在我们目前看到的程序中，语句总是按照从上到下的精确顺序被 Python 忠实地执行。如果你想改变程序的执行流程呢？例如，你希望程序根据不同的情况做出不同的决策，比如根据一天中的不同时间打印"早上好"或"晚上好"？

你可能已经猜到了，这可以通过控制流语句来实现。Python 中有三种控制流语句——`if`、`for` 和 `while`。

## `if` 语句

`if` 语句用来检查一个条件：*如果*条件为真，我们就运行一个语句块（称为 _if 块_），*否则*我们处理另一个语句块（称为 _else 块_）。*else* 子句是可选的。

示例（保存为 `if.py`）：

<!-- Tags expansion does not happen inside code blocks https://github.com/GitbookIO/gitbook/issues/707 -->
<pre><code class="lang-python">{% include "programs/if.py" %}</code></pre>

输出：

<pre><code>{% include "programs/if.txt" %}</code></pre>

**工作原理**

在这个程序中，我们接收用户的猜测，并检查它是否是我们设定的数字。我们将变量 `number` 设置为我们想要的任何整数，比如 `23`。然后，我们使用 `input()` 函数获取用户的猜测。函数就是可重复使用的程序片段。我们将在[下一章](./functions.md#functions)中了解更多关于函数的知识。

我们向内置的 `input` 函数提供一个字符串，它会将其打印到屏幕上并等待用户输入。一旦我们输入内容并按下 kbd:[Enter] 键，`input()` 函数就会以字符串的形式返回我们输入的内容。然后我们使用 `int` 将这个字符串转换为整数，并将其存储在变量 `guess` 中。实际上，`int` 是一个类，但你现在只需要知道可以用它来将字符串转换为整数（假设字符串中包含有效的整数值）。

接下来，我们将用户的猜测与我们选择的数字进行比较。如果它们相等，我们就打印一条成功消息。请注意，我们使用缩进层级来告诉 Python 哪些语句属于哪个块。这就是为什么缩进在 Python 中如此重要。希望你一直在遵守"一致的缩进"规则。是吗？

注意 `if` 语句的末尾包含一个冒号——我们在告诉 Python 后面跟着一个语句块。

然后，我们检查猜测是否小于那个数字，如果是，我们通知用户需要猜得更大一些。我们在这里使用的是 `elif` 子句，它实际上将两个相关的 `if else-if else` 语句组合成一个 `if-elif-else` 语句。这使得程序更简洁，也减少了所需的缩进量。

`elif` 和 `else` 语句也必须在逻辑行的末尾有一个冒号，后面跟着相应的语句块（当然要有正确的缩进）。

你可以在 `if` 语句的 if 块中再嵌套一个 `if` 语句，以此类推——这被称为嵌套 `if` 语句。

请记住，`elif` 和 `else` 部分是可选的。一个最小的有效 `if` 语句是：

```python
if True:
    print('Yes, it is true')
```

在 Python 执行完完整的 `if` 语句以及相关的 `elif` 和 `else` 子句后，它会继续执行包含该 `if` 语句的块中的下一条语句。在这个例子中，就是主块（程序开始执行的地方），下一条语句是 `print('Done')` 语句。之后，Python 看到程序结束，就完成了运行。

虽然这是一个非常简单的程序，但我一直在指出很多你应该注意的细节。所有这些都相当直观（对于有 C/C++ 背景的人来说，甚至简单得出奇）。你最初需要了解所有这些细节，但经过一些练习后，你会变得很习惯，一切对你来说都会变得"自然"。

> **给 C/C++ 程序员的提示**
>
> Python 中没有 `switch` 语句。你可以使用 `if..elif..else` 语句来实现同样的功能（在某些情况下，可以使用[字典](./data_structures.md#dictionary)来快速实现）。

## `while` 语句

`while` 语句允许你只要条件为真就重复执行一个语句块。`while` 语句是所谓*循环*语句的一个例子。`while` 语句可以有一个可选的 `else` 子句。

示例（保存为 `while.py`）：

<pre><code class="lang-python">{% include "programs/while.py" %}</code></pre>

输出：

<pre><code>{% include "programs/while.txt" %}</code></pre>

**工作原理**

在这个程序中，我们仍然在玩猜数字游戏，但好处是用户可以不断猜测，直到猜对为止——不需要像我们在上一节中那样为每次猜测反复运行程序。这很好地演示了 `while` 语句的用法。

我们将 `input` 和 `if` 语句移到 `while` 循环内部，并在 while 循环之前将变量 `running` 设置为 `True`。首先，我们检查变量 `running` 是否为 `True`，然后继续执行相应的 *while 块*。这个块执行完毕后，会再次检查条件，在这个例子中就是 `running` 变量。如果为真，我们再次执行 while 块，否则我们继续执行可选的 else 块，然后继续下一条语句。

当 `while` 循环条件变为 `False` 时，`else` 块会被执行——这甚至可能是第一次检查条件的时候。如果 `while` 循环有一个 `else` 子句，除非你用 `break` 语句跳出循环，否则它总是会被执行。

`True` 和 `False` 被称为布尔类型，你可以将它们分别视为等价于值 `1` 和 `0`。

> **给 C/C++ 程序员的提示**
>
> 记住，`while` 循环也可以有一个 `else` 子句。

## `for` 循环

`for..in` 语句是另一种循环语句，它对一个对象序列进行*迭代*（iterate），即遍历序列中的每个项目。我们将在后面的章节中详细了解[序列](./data_structures.md#sequence)。你现在只需要知道序列就是一个有序的项目集合。

示例（保存为 `for.py`）：

<pre><code class="lang-python">{% include "programs/for.py" %}</code></pre>

输出：

<pre><code>{% include "programs/for.txt" %}</code></pre>

**工作原理**

在这个程序中，我们打印一个数字*序列*。我们使用内置的 `range` 函数来生成这个数字序列。

我们在这里做的是向它提供两个数字，`range` 返回一个从第一个数字开始到第二个数字结束的数字序列。例如，`range(1,5)` 给出序列 `[1, 2, 3, 4]`。默认情况下，`range` 的步长为 1。如果我们向 `range` 提供第三个数字，那么它就变成步长。例如，`range(1,5,2)` 给出 `[1,3]`。请记住，range 的范围*延伸到*第二个数字，即它*不包含*第二个数字。

请注意，`range()` 每次只生成一个数字，如果你想获得完整的数字列表，可以在 `range()` 上调用 `list()`，例如，`list(range(5))` 将得到 `[0, 1, 2, 3, 4]`。列表将在[数据结构章节](./data_structures.md#data-structures)中解释。

然后 `for` 循环对这个范围进行迭代——`for i in range(1,5)` 等同于 `for i in [1, 2, 3, 4]`，就像将序列中的每个数字（或对象）依次赋值给 i，然后为 `i` 的每个值执行语句块。在这个例子中，我们只是在语句块中打印值。

请记住，`else` 部分是可选的。当包含它时，它总是在 `for` 循环结束后执行一次，除非遇到 [break](#break-statement) 语句。

请记住，`for..in` 循环适用于任何序列。在这里，我们有一个由内置 `range` 函数生成的数字列表，但一般来说，我们可以使用任何类型的对象序列！我们将在后面的章节中详细探讨这个概念。

> **给 C/C++/Java/C# 程序员的提示**
>
> Python 的 `for` 循环与 C/C++ 的 `for` 循环截然不同。C# 程序员会注意到 Python 的 `for` 循环类似于 C# 中的 `foreach` 循环。Java 程序员会注意到它类似于 Java 1.5 中的 `for (int i : IntArray)`。
>
> 在 C/C++ 中，如果你想写 `for (int i = 0; i < 5; i++)`，那么在 Python 中你只需写 `for i in range(0,5)`。如你所见，Python 中的 `for` 循环更简单、更具表达力，也不容易出错。

## `break` 语句 {#break-statement}

`break` 语句用来*跳出*循环语句，即停止循环语句的执行，即使循环条件还没有变为 `False` 或者序列中的项目还没有被完全遍历。

需要注意的是，如果你从 `for` 或 `while` 循环中 *break* 出来，任何相应的循环 `else` 块都**不会**被执行。

示例（保存为 `break.py`）：

<pre><code class="lang-python">{% include "programs/break.py" %}</code></pre>

输出：

<pre><code>{% include "programs/break.txt" %}</code></pre>

**工作原理**

在这个程序中，我们反复获取用户的输入，并每次打印输入的长度。我们通过检查用户输入是否为 `'quit'` 来提供一个特殊的停止条件。我们通过 *break* 跳出循环来停止程序，到达程序的末尾。

输入字符串的长度可以使用内置的 `len` 函数来获取。

请记住，`break` 语句也可以与 `for` 循环一起使用。

**Swaroop 的诗意 Python**

我在这里使用的输入是我写的一首小诗：

```
Programming is fun
When the work is done
if you wanna make your work also fun:
    use Python!
```

## `continue` 语句 {#continue-statement}

`continue` 语句用来告诉 Python 跳过当前循环块中剩余的语句，*继续*到循环的下一次迭代。

示例（保存为 `continue.py`）：

<pre><code class="lang-python">{% include "programs/continue.py" %}</code></pre>

输出：

<pre><code>{% include "programs/continue.txt" %}</code></pre>

**工作原理**

在这个程序中，我们接受用户的输入，但只有当输入字符串长度至少为 3 个字符时才进行处理。因此，我们使用内置的 `len` 函数来获取长度，如果长度小于 3，我们使用 `continue` 语句跳过块中剩余的语句。否则，循环中剩余的语句会被执行，执行我们想要进行的任何处理。

请注意，`continue` 语句也可以与 `for` 循环一起使用。

## 小结

我们已经了解了如何使用三种控制流语句——`if`、`while` 和 `for`，以及它们相关的 `break` 和 `continue` 语句。这些是 Python 中最常用的部分之一，因此熟练掌握它们是至关重要的。

接下来，我们将学习如何创建和使用函数。
