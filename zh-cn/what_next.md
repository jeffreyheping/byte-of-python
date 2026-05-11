# 接下来学什么

如果你已经彻底阅读了本书并练习编写了大量程序，那么你一定已经对 Python 感到自如和熟悉了。你可能已经创建了一些 Python 程序来尝试各种东西并锻炼你的 Python 技能。如果你还没有这样做，你应该去试试。现在的问题是"接下来学什么？"。

我建议你尝试解决这个问题：

> 创建你自己的命令行*通讯录*程序，通过它你可以浏览、添加、修改、删除或搜索你的联系人，如朋友、家人和同事，以及他们的信息，如电子邮件地址和/或电话号码。详细信息必须存储以备日后检索。

如果你想想我们到目前为止遇到的各种内容，这其实相当简单。如果你仍然需要关于如何进行的指导，这里有一个提示[^1]。

一旦你能做到这一点，你就可以自称是一名 Python 程序员了。现在，立即[给我发一封电子邮件]({{ book.contactUrl }}) 感谢我写了这本好书 ;-)。这一步是可选的但推荐这样做。另外，请考虑[购买一本印刷版]({{ book.buyBookUrl }}) 以支持本书的持续开发。

如果你觉得那个程序很简单，这里还有一个：

> 实现 [replace 命令](http://unixhelp.ed.ac.uk/CGI/man-cgi?replace)。这个命令将在提供的文件列表中将一个字符串替换为另一个字符串。

replace 命令可以简单也可以复杂，从简单的字符串替换到查找模式（正则表达式）。

## 下一个项目

如果你觉得上面的程序很容易创建，那么看看这个全面的项目列表，尝试编写你自己的程序：https://github.com/thekarangoel/Projects#numbers（同样的列表也在 [Martyr2 的超级项目列表](http://www.dreamincode.net/forums/topic/78802-martyr2s-mega-project-ideas-list/)中）。

另请参阅：

- [程序员练习册：57 个挑战来提升你的编程技能](https://pragprog.com/book/bhwb/exercises-for-programmers)
- [中级 Python 项目](https://openhatch.org/wiki/Intermediate_Python_Workshop/Projects)。

## 示例代码

学习编程语言的最好方法是编写大量代码和阅读大量代码：

- [Python Cookbook](http://code.activestate.com/recipes/langs/python/) 是一个极其宝贵的技巧集或关于如何使用 Python 解决某些类型问题的指南。这是每个 Python 用户的必读之作。
- [Python Module of the Week](http://pymotw.com/2/contents.html) 是另一个优秀的必读指南，介绍[标准库](./stdlib.md#stdlib)。

## 建议

- [Python 逍遥指南！](http://docs.python-guide.org/en/latest/)
- [Python 风格要素](https://github.com/amontalenti/elements-of-python-style)
- [Python 全景图](http://slott-softwarearchitect.blogspot.ca/2013/06/python-big-picture-whats-roadmap.html)
- ["编写地道的 Python" 电子书](http://www.jeffknupp.com/writing-idiomatic-python-ebook/)（付费）

## 视频

- [使用 Flask 进行全栈 Web 开发](https://github.com/realpython/discover-flask)
- [PyVideo](http://www.pyvideo.org)

## 问答

- [Python 官方注意事项](http://docs.python.org/3/howto/doanddont.html)
- [Python 官方 FAQ](http://www.python.org/doc/faq/general/)
- [Norvig 的不常见问题列表](http://norvig.com/python-iaq.html)
- [Python 面试问答](http://dev.fyicenter.com/Interview-Questions/Python/index.html)
- [StackOverflow 上标记为 python 的问题](http://stackoverflow.com/questions/tagged/python)

## 教程

- [Python 的隐藏功能](http://stackoverflow.com/q/101268/4869)
- [你在学 Python 时希望早就知道的代码片段/技巧是什么？](http://www.reddit.com/r/Python/comments/19dir2/whats_the_one_code_snippetpython_tricketc_did_you/)
- [Awaretek 的 Python 教程综合列表](http://www.awaretek.com/tutorials.html)

## 讨论

如果你遇到了 Python 问题，不知道该问谁，那么 [python-tutor 邮件列表](http://mail.python.org/mailman/listinfo/tutor) 是提问的最佳场所。

确保你先自己尝试解决问题，然后[提出聪明的问题](http://catb.org/~esr/faqs/smart-questions.html)。

## 新闻

如果你想了解 Python 世界的最新动态，请关注 [Python 官方 Planet](http://planet.python.org)。

## 安装库

[Python 包索引](http://pypi.python.org/pypi)上有大量开源库，你可以在自己的程序中使用它们。

要安装和使用这些库，你可以使用 [pip](http://www.pip-installer.org/en/latest/)。

## 创建网站

学习 [Flask](http://flask.pocoo.org) 来创建你自己的网站。一些入门资源：

- [Flask 官方快速入门](http://flask.pocoo.org/docs/quickstart/)
- [Flask 超级教程](http://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world)
- [Flask 示例项目](https://github.com/mitsuhiko/flask/tree/master/examples)

## 图形界面软件

假设你想使用 Python 创建自己的图形界面程序。这可以通过使用带有 Python 绑定的 GUI（图形用户界面）库来实现。绑定（binding）允许你用 Python 编写程序并使用本身用 C 或 C++ 或其他语言编写的库。

使用 Python 的 GUI 有很多选择：

- Kivy
    - http://kivy.org

- PyGTK
    - 这是 GTK+ 工具包的 Python 绑定，GTK+ 是构建 GNOME 的基础。GTK+ 在使用上有很多怪癖，但一旦你熟悉了，就可以快速创建 GUI 应用程序。Glade 图形界面设计器是不可或缺的。文档还有待改进。GTK+ 在 GNU/Linux 上运行良好，但其在 Windows 上的移植还不完整。你可以使用 GTK+ 创建自由软件和专有软件。入门请阅读 [PyGTK 教程](http://www.pygtk.org/tutorial.html)。

- PyQt
    - 这是 Qt 工具包的 Python 绑定，Qt 是构建 KDE 的基础。Qt 非常易于使用且功能强大，特别是由于 Qt Designer 和出色的 Qt 文档。如果你想创建开源（GPL 许可的）软件，PyQt 是免费的；如果你想创建专有的闭源软件，则需要购买。从 Qt 4.5 开始，你也可以使用它来创建非 GPL 软件。入门请阅读关于 [PySide](http://qt-project.org/wiki/PySide) 的内容。

- wxPython
    - 这是 wxWidgets 工具包的 Python 绑定。wxPython 有一定的学习曲线。但是，它的可移植性非常好，可以在 GNU/Linux、Windows、Mac 甚至嵌入式平台上运行。有许多可用的 IDE，包括 GUI 设计器，如 [SPE (Stani's Python Editor)](http://spe.pycs.net/) 和 [wxGlade](http://wxglade.sourceforge.net/) GUI 构建器。你可以使用 wxPython 创建自由软件和专有软件。入门请阅读 [wxPython 教程](http://zetcode.com/wxpython/)。

### GUI 工具总结

更多选择请参见 [Python 官方网站的 GuiProgramming wiki 页面](http://www.python.org/cgi-bin/moinmoin/GuiProgramming)。

遗憾的是，Python 没有一个标准的 GUI 工具。我建议你根据自己的情况选择上述工具之一。第一个因素是你是否愿意付费使用任何 GUI 工具。第二个因素是你希望程序只在 Windows 上运行，还是在 Mac 和 GNU/Linux 上运行，或者在所有平台上运行。第三个因素，如果 GNU/Linux 是你选择的平台，那么你在 GNU/Linux 上是 KDE 还是 GNOME 用户。

更详细和全面的分析，请参见 ['The Python Papers, Volume 3, Issue 1' (PDF)](http://archive.pythonpapers.org/ThePythonPapersVolume3Issue1.pdf) 的第 26 页。

## 各种实现

编程语言通常有两个部分——语言和软件。语言是你_如何_编写东西的方式。软件是_实际_运行我们程序的东西。

我们一直在使用 _CPython_ 软件来运行我们的程序。它被称为 CPython，因为它是用 C 语言编写的，是_经典的 Python 解释器_。

还有其他可以运行你的 Python 程序的软件：

- [Jython](http://www.jython.org)
    - 运行在 Java 平台上的 Python 实现。这意味着你可以在 Python 语言中使用 Java 库和类，反之亦然。

- [IronPython](http://www.codeplex.com/Wiki/View.aspx?ProjectName=IronPython)
    - 运行在 .NET 平台上的 Python 实现。这意味着你可以在 Python 语言中使用 .NET 库和类，反之亦然。

- [PyPy](http://codespeak.net/pypy/dist/pypy/doc/home.html)
    - 用 Python 编写的 Python 实现！这是一个研究项目，旨在使解释器变得快速且易于改进，因为解释器本身是用动态语言编写的（与上述三种实现中使用的 C、Java 或 C# 等静态语言不同）。

还有其他的实现，如 [CLPython](http://common-lisp.net/project/clpython/)——用 Common Lisp 编写的 Python 实现，以及 [Brython](http://brython.info/)——在 JavaScript 解释器之上的实现，这意味着你可以使用 Python（而不是 JavaScript）来编写你的网页浏览器（"Ajax"）程序。

每种实现都有其适用的专门领域。

## 函数式编程（面向高级读者） {#functional-programming}

当你开始编写更大的程序时，你一定要学习更多关于函数式编程方法的知识，这与我们在[面向对象编程章节](./oop.md#oop)中学到的基于类的方法不同：

- [A.M. Kuchling 的函数式编程 Howto](http://docs.python.org/3/howto/functional.html)
- ['Dive Into Python' 书中的函数式编程章节](http://www.diveintopython.net/functional_programming/index.html)
- [使用 Python 进行函数式编程的演示](http://ua.pycon.org/static/talks/kachayev/index.html)
- [Funcy 库](https://github.com/Suor/funcy)
- [PyToolz 库](http://toolz.readthedocs.org/en/latest/)

## 小结

我们现在已经到了本书的结尾，但正如他们所说，这是_结束的开始_！你现在是一个热切的 Python 用户，毫无疑问已经准备好用 Python 解决许多问题了。你可以开始自动化你的计算机来做各种以前不可想象的事情，或者编写你自己的游戏等等。所以，开始行动吧！

---

[^1]: 创建一个类来表示人的信息。使用一个 dict（字典）以姓名为键来存储人对象。使用 pickle 模块将对象持久化存储在硬盘上。使用 dict 的内置方法来添加、删除和修改人员。
