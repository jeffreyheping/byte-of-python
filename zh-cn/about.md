# 附录：关于 {#colophon}

我在创建本书时使用的几乎所有软件都是 [FLOSS](./floss.md#floss)。

## 本书的诞生

在本书的第一稿中，我使用 Red Hat 9.0 Linux 作为我的环境基础，在第六稿中，我使用 Fedora Core 3 Linux 作为我的环境基础。

最初，我使用 KWord 来编写本书（如[历史课](./revision_history.md#history-lesson)中所述）。

## 成长期

后来，我切换到使用 Kate 编辑 DocBook XML，但我发现这太繁琐了。于是，我切换到 OpenOffice，它在格式控制和 PDF 生成方面表现出色，但它从文档生成的 HTML 非常粗糙。

最后，我发现了 XEmacs，在我确定这种格式是长期解决方案后，我用 DocBook XML（再次）从头重写了本书。

在第六稿中，我决定使用 Quanta+ 来进行所有编辑。使用的是 Fedora Core 3 Linux 附带的标准 XSL 样式表。不过，我编写了一个 CSS 文档来为 HTML 页面添加颜色和样式。我还用 Python 编写了一个粗略的词法分析器，自动为所有程序清单提供语法高亮。

在第七稿中，我使用 [MediaWiki](http://www.mediawiki.org) 作为我的环境基础。我习惯在线编辑所有内容，读者可以直接在 wiki 网站中阅读/编辑/讨论，但我最终花了更多时间对抗垃圾信息而不是写作。

在第八稿中，我使用了 [Vim]({{ book.vimBookUrl }})、[Pandoc](http://johnmacfarlane.net/pandoc/README.html) 和 Mac OS X。

在第九稿中，我切换到 [AsciiDoc 格式](http://asciidoctor.org/docs/what-is-asciidoc/)，使用 [Emacs 24.3](http://www.masteringemacs.org/articles/2013/03/11/whats-new-emacs-24-3/)、
[tomorrow 主题](https://github.com/chriskempson/tomorrow-theme)、
[Fira Mono 字体](https://www.mozilla.org/en-US/styleguide/products/firefox-os/typeface/#download-primary) 和 [adoc-mode](https://github.com/sensorflo/adoc-mode/wiki) 来编写。

## 现在

2016 年：我对 AsciiDoctor 中的几个小渲染问题感到厌倦，比如 `C/C++` 中的 `++` 会消失，很难跟踪这些小问题的转义。此外，由于复杂的 Asciidoc 格式，我变得不太愿意编辑文本。

在第十稿中，我切换到使用 Markdown + [GitBook](https://www.gitbook.com) 格式编写，使用 [Spacemacs 编辑器](http://spacemacs.org)。

2020 年 11 月：由于 Gitbook 放弃了他们的开源软件，迁移到了 [Honkit，一个社区维护的 GitBook legacy 分支](https://github.com/honkit/honkit)。

## 关于作者

参见 {{ book.authorUrl }}
