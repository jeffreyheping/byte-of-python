# 关于 Python

Python 是少数可以称得上既_简单_又_强大_的语言之一。你会惊喜地发现，专注于解决问题本身，而不是纠结于编程语言的语法和结构，是一件多么轻松的事情。

Python 的官方介绍是：

> Python 是一种易于学习、功能强大的编程语言。它具有高效的高级数据结构，以及简单但有效的面向对象编程方法。Python 优雅的语法和动态类型，再加上其解释型语言的特性，使其成为大多数平台上脚本编写和快速应用开发的理想语言。

我将在下一节中更详细地讨论这些特性。

## 名字的由来

Python 语言的创始人 Guido van Rossum 是以 BBC 节目《Monty Python's Flying Circus》来命名的。他并不特别喜欢那种用长长的身体缠绕猎物并将其勒死的蛇。

## Python 的特性

### 简单

Python 是一种简单而极简的语言。阅读一段优秀的 Python 代码，感觉几乎就像在读英语，尽管是非常严格的英语！这种伪代码的特性是 Python 最大的优势之一。它让你能够专注于解决问题，而不是语言本身。

### 易于学习

正如你将看到的，Python 非常容易上手。前面已经提到过，Python 的语法极其简单。

### 自由且开源

Python 是 _FLOSS_（自由/Libre 及开源软件）的一个典型例子。简单来说，你可以自由地分发这个软件的副本、阅读它的源代码、对它进行修改，并将其中的一部分用于新的自由程序。FLOSS 基于一个共享知识的社区理念。这也是 Python 如此优秀的原因之一——它由一个希望让 Python 变得更好的社区创建并不断改进。

### 高级语言

当你用 Python 编写程序时，你永远不需要操心底层细节，比如管理程序使用的内存等。

### 可移植

由于其开源的特性，Python 已经被移植到（即修改以适配）许多平台上。如果你足够小心地避免使用依赖系统的特性，那么你所有的 Python 程序可以在这些平台中的任何一个上运行，而无需任何修改。

你可以在 GNU/Linux、Windows、FreeBSD、Macintosh、Solaris、OS/2、Amiga、AROS、AS/400、BeOS、OS/390、z/OS、Palm OS、QNX、VMS、Psion、Acorn RISC OS、VxWorks、PlayStation、Sharp Zaurus、Windows CE 和 PocketPC 上使用 Python！

你甚至可以使用像 [Kivy](http://kivy.org) 这样的平台来为电脑_以及_ iPhone、iPad 和 Android 创建游戏。

### 解释型

这需要做一些解释。

用 C 或 C++ 等编译型语言编写的程序，需要通过编译器（带各种标志和选项）将源语言（即 C 或 C++）转换为计算机能理解的二进制代码（即 0 和 1）。当你运行程序时，链接器/加载器软件将程序从硬盘复制到内存并开始运行。

而 Python 不需要编译成二进制。你只需直接从源代码_运行_程序。在内部，Python 将源代码转换为一种称为字节码的中间形式，然后将其翻译成你计算机的原生语言并运行。实际上，这一切使得使用 Python 变得更加容易，因为你不需要操心编译程序、确保链接和加载了正确的库等问题。这也使你的 Python 程序更加可移植——你只需将 Python 程序复制到另一台计算机上，它就能直接运行！

### 面向对象

Python 既支持面向过程编程，也支持面向对象编程（OOP）。在_面向过程_的语言中，程序围绕过程或函数构建，这些不过是可以重复使用的程序片段。在_面向对象_的语言中，程序围绕对象构建，对象将数据和功能结合在一起。Python 有一种非常强大但简洁的面向对象编程方式，尤其是与 C++ 或 Java 等大型语言相比。

### 可扩展

如果你需要某段关键代码运行得非常快，或者想让某个算法不公开，你可以用 C 或 C++ 编写程序的那部分，然后在 Python 程序中使用它。

### 可嵌入

你可以将 Python 嵌入到你的 C/C++ 程序中，为程序的用户提供_脚本_功能。

### 丰富的库

Python 标准库确实非常庞大。它可以帮助你完成各种任务，包括正则表达式、文档生成、单元测试、线程、数据库、Web 浏览器、CGI、FTP、电子邮件、XML、XML-RPC、HTML、WAV 文件、加密、GUI（图形用户界面）以及其他依赖系统的功能。请记住，所有这些功能在任何安装了 Python 的地方都是可用的。这就是 Python 的_自带电池_哲学。

除了标准库之外，还有许多其他高质量的库，你可以在 [Python Package Index](http://pypi.python.org/pypi) 中找到它们。

### 总结

Python 确实是一门令人兴奋且功能强大的语言。它在性能和特性之间取得了恰当的平衡，使得用 Python 编写程序既有趣又轻松。

## Python 3 与 2 的区别

如果你对"Python 2"和"Python 3"之间的区别不感兴趣，可以跳过本节。但请注意你正在使用的是哪个版本。本书是为 Python 3 编写的。

请记住，一旦你真正理解并学会了使用一个版本，你就可以轻松地学习它们之间的差异并使用另一个版本。困难的部分是学习编程和理解 Python 语言本身的基础知识。这就是我们在本书中的目标，一旦你实现了这个目标，你就可以根据实际情况轻松使用 Python 2 或 Python 3。

有关 Python 2 和 Python 3 之间差异的详细信息，请参阅：

- [Python 2 的未来](http://lwn.net/Articles/547191/)
- [将 Python 2 代码移植到 Python 3](https://docs.python.org/3/howto/pyporting.html)
- [编写同时兼容 Python 2 和 3 的代码](https://wiki.python.org/moin/PortingToPy3k/BilingualQuickRef)
- [支持 Python 3：深入指南](http://python3porting.com)

## 程序员们怎么说

你可能会觉得阅读像 Eric S. Raymond（ESR）这样的大牛对 Python 的评价很有趣：

- _Eric S. Raymond_ 是《大教堂与集市》的作者，也是提出_开源_一词的人。他说 [Python 已经成为他最喜欢的编程语言](http://www.python.org/about/success/esr/)。这篇文章是我第一次接触 Python 的真正灵感来源。
- _Bruce Eckel_ 是著名的《Thinking in Java》（《Java 编程思想》）和《Thinking in C++》（《C++ 编程思想》）的作者。他说没有哪种语言能让他比 Python 更高效。他说 Python 也许是唯一一门专注于让程序员工作更轻松的语言。阅读[完整访谈](http://www.artima.com/intv/aboutme.html)了解更多详情。
- _Peter Norvig_ 是知名的 Lisp 作者，也是 Google 搜索质量总监（感谢 Guido van Rossum 指出这一点）。他说 [用 Python 编程就像写伪代码一样](https://news.ycombinator.com/item?id=1803815)。他说 Python 一直是 Google 不可或缺的一部分。你实际上可以通过查看 [Google 招聘](http://www.google.com/jobs/index.html)页面来验证这个说法，该页面将 Python 知识列为软件工程师的要求之一。
