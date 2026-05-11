# 更多

到目前为止，我们已经涵盖了你会使用的大部分 Python 方面。在本章中，我们将介绍更多方面，使我们的 Python 知识更加全面。

## 传递 tuple

你有没有想过从函数中返回两个不同的值？你可以做到。你只需要使用一个 tuple（元组）。

```python
>>> def get_error_details():
...     return (2, 'details')
...
>>> errnum, errstr = get_error_details()
>>> errnum
2
>>> errstr
'details'
```

注意 `a, b = <某个表达式>` 的用法将表达式的结果解释为一个包含两个值的 tuple。

这也意味着在 Python 中交换两个变量的最快方法是：

```python
>>> a = 5; b = 8
>>> a, b
(5, 8)
>>> a, b = b, a
>>> a, b
(8, 5)
```

## 特殊方法

有一些方法如 `__init__` 和 `__del__` 方法在类中具有特殊含义。

特殊方法用于模仿内置类型的某些行为。例如，如果你想对你的类使用 `x[key]` 索引操作（就像你对 list 和 tuple 使用的那样），那么你只需要实现 `__getitem__()` 方法就可以了。如果你仔细想想，这就是 Python 为 `list` 类本身所做的事情！

一些有用的特殊方法列在下表中。如果你想了解所有的特殊方法，[请参阅手册](http://docs.python.org/3/reference/datamodel.html#special-method-names)。

- `__init__(self, ...)`
    - 此方法在新创建的对象返回使用之前被调用。

- `__del__(self)`
    - 在对象被销毁之前调用（时间不可预测，因此避免使用此方法）

- `__str__(self)`
    - 当我们使用 `print` 函数或使用 `str()` 时被调用。

- `__lt__(self, other)`
    - 当使用_小于_运算符（<）时被调用。类似地，所有运算符（+、> 等）都有对应的特殊方法。

- `__getitem__(self, key)`
    - 当使用 `x[key]` 索引操作时被调用。

- `__len__(self)`
    - 当对序列对象使用内置的 `len()` 函数时被调用。

## 单语句块

我们已经看到每个语句块通过其自己的缩进级别与其他部分区分开来。不过有一个例外。如果你的语句块只包含一个语句，那么你可以将其指定在与条件语句或循环语句相同的行上。以下例子可以说明这一点：

```python
>>> flag = True
>>> if flag: print('Yes')
...
Yes
```

注意单个语句是就地使用的，而不是作为单独的块。虽然你可以使用这种方式使程序_更小_，但我强烈建议避免使用这种快捷方式，除了用于错误检查之外，主要是因为如果你使用正确的缩进，以后添加额外的语句会容易得多。

## Lambda 形式

`lambda` 语句用于创建新的函数对象。本质上，`lambda` 接受一个参数后跟一个表达式。Lambda 成为函数的主体。这个表达式的值由新函数返回。

示例（保存为 `more_lambda.py`）：

<pre><code class="lang-python">{% include "../programs/more_lambda.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/more_lambda.txt" %}</code></pre>

**工作原理**

注意 `list` 的 `sort` 方法可以接受一个 `key` 参数，该参数决定 list 如何排序（通常我们只知道升序或降序）。在我们的例子中，我们想要进行自定义排序，为此我们需要编写一个函数。与其为只在一个地方使用的函数编写一个单独的 `def` 块，我们使用 lambda 表达式来创建一个新函数。

## 列表推导式

列表推导式（list comprehension）用于从现有 list 派生出一个新的 list。假设你有一个数字 list，你想得到一个对应的 list，其中只有大于 2 的数字被乘以 2。列表推导式非常适合这种情况。

示例（保存为 `more_list_comprehension.py`）：

<pre><code class="lang-python">{% include "../programs/more_list_comprehension.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/more_list_comprehension.txt" %}</code></pre>

**工作原理**

在这里，我们通过指定在某些条件满足（`if i > 2`）时要执行的操作（`2*i`）来派生出一个新的 list。注意原始 list 保持不变。

使用列表推导式的好处是它减少了使用循环处理 list 的每个元素并将其存储在新 list 中所需的样板代码量。

## 在函数中接收 tuple 和 dict

有一种特殊的方式可以使用 `*` 或 `**` 前缀将函数的参数分别作为 tuple 或 dict（字典）来接收。这在函数接受可变数量的参数时非常有用。

```python
>>> def powersum(power, *args):
...     '''返回每个参数的指定幂次之和。'''
...     total = 0
...     for i in args:
...         total += pow(i, power)
...     return total
...
>>> powersum(2, 3, 4)
25
>>> powersum(2, 10)
100
```

因为我们在 `args` 变量上有 `*` 前缀，所以传递给函数的所有额外参数都作为 tuple 存储在 `args` 中。如果使用 `**` 前缀，则额外的参数将被视为 dict 的键/值对。

## assert 语句 {% raw %}{#assert}{% endraw %}

`assert` 语句用于断言某件事为真。例如，如果你非常确定你正在使用的 list 中至少有一个元素，并想检查这一点，如果它不为真则引发错误，那么 `assert` 语句在这种情况下非常合适。当 assert 语句失败时，会引发一个 `AssertionError`。
`pop()` 方法从 list 中移除并返回最后一个元素。

```python
>>> mylist = ['item']
>>> assert len(mylist) >= 1
>>> mylist.pop()
'item'
>>> assert len(mylist) >= 1
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AssertionError
```

`assert` 语句应该谨慎使用。大多数情况下，最好捕获异常，要么处理问题，要么向用户显示错误消息然后退出。

## 装饰器 {% raw %}{#decorator}{% endraw %}

装饰器（decorator）是应用包装函数的快捷方式。这对于用相同的代码反复"包裹"功能非常有帮助。例如，我为自己创建了一个 `retry` 装饰器，可以将其应用于任何函数，如果在运行期间抛出任何异常，它会重试，最多重试 5 次，每次重试之间有延迟。这对于尝试向远程计算机进行网络调用的情况特别有用：

<pre><code class="lang-python">{% include "../programs/more_decorator.py" %}</code></pre>

输出：

<pre><code>{% include "../programs/more_decorator.txt" %}</code></pre>

**工作原理**

参见：

- [视频：Python 装饰器入门](https://youtu.be/MYAEv3JoenI)
- http://www.ibm.com/developerworks/linux/library/l-cpdecor.html
- http://toumorokoshi.github.io/dry-principles-through-python-decorators.html

## Python 2 和 Python 3 之间的差异 {% raw %}{#two-vs-three}{% endraw %}

参见：

- ["Six" 库](http://pythonhosted.org/six/)
- [Armin 的迁移到 Python 3 Redux](http://lucumr.pocoo.org/2013/5/21/porting-to-python-3-redux/)
- [PyDanny 的 Python 3 体验](http://pydanny.com/experiences-with-django-python3.html)
- [Django 官方迁移到 Python 3 指南](https://docs.djangoproject.com/en/dev/topics/python3/)
- [关于 Python 3.x 有什么优势的讨论](http://www.reddit.com/r/Python/comments/22ovb3/what_are_the_advantages_to_python_3x/)

## 小结

我们在本章中介绍了 Python 的更多特性，但我们还没有涵盖 Python 的所有特性。不过，在这个阶段，我们已经涵盖了你在实践中会使用的大部分内容。这足以让你开始创建你想要的任何程序。

接下来，我们将讨论如何进一步探索 Python。
