# A Byte of Python - 速查笔记

> 完全遵照原书顺序，用代码+注释简化描述，配合 ASP/C# 背景类比

---

## 第1章：前言

```python
# 本书目标
"""
- Python 简单又强大
- 适合初学者，也适合有经验的程序员
- 通过实践来学习
"""
```

---

## 第2章：关于 Python

```python
# ========== Python 特性 ==========

# 1. 简单且极简（Simple & Minimal）
# 类比：像 ASP 脚本一样简单，像 C# 一样强大

# 2. 易于学习（Easy to Learn）
# 语法简洁，上手快

# 3. 自由/开源（FLOSS）
# 可以自由修改和分发

# 4. 高级语言（High-Level）
# 不用管内存管理等底层细节
# 类比：C# 不需要手动内存管理，Python 更进一步

# 5. 可移植（Portable）
# 几乎在所有平台上都能运行：Linux, Windows, macOS...

# 6. 解释型（Interpreted）
# 无需编译，直接运行
# 类比：ASP 无需编译，直接执行；C# 需要编译成 IL
# Python：源代码 → 字节码 → 解释执行

# 7. 面向对象（OOP）
# 同时支持 面向过程 和 面向对象
# 类比：C# 主要面向对象，也可以写过程式代码

# 8. 可扩展（Extensible）
# 关键部分可以用 C/C++ 写，然后给 Python 调用

# 9. 可嵌入（Embeddable）
# 可以把 Python 嵌入到 C/C++ 程序里，作为脚本语言

# 10. 丰富的库（Batteries Included）
# 标准库非常丰富：正则表达式、测试、多线程、数据库、GUI...
# 类比：像 .NET Framework，但更丰富
```

---

## 第3章：安装

```python
# ========== 安装检查 ==========

# Windows
# 访问 https://www.python.org/downloads/
# 下载安装包，注意勾选 "Add Python to PATH"

# macOS
# 使用 Homebrew: brew install python3

# Linux
# Debian/Ubuntu: sudo apt-get install python3

# 验证安装
$ python3 --version
# 输出类似: Python 3.6.0
```

---

## 第4章：第一步

```python
# ========== 运行 Python ==========

# 方式1：交互式解释器（REPL）
$ python3
>>> print("Hello World")  # 输入后回车
Hello World
>>> exit()  # 或 Ctrl+D 退出

# 方式2：脚本文件
# 保存为 hello.py
print("Hello World")

# 运行
$ python hello.py

# ========== 选择编辑器 ==========
# 推荐：
#   - PyCharm（新手友好，类似 Visual Studio）
#   - VS Code + Python 插件
#   - Vim / Emacs（进阶用户）
# 避免：Windows 记事本（不处理换行）

# ========== 获取帮助 ==========
>>> help(len)  # 查看函数帮助
>>> help(str)  # 查看类帮助
>>> help()     # 进入交互帮助模式
```

---

## 第5章：基础

```python
# ========== 注释 ==========
# 这是单行注释（类似 // in C#）

"""
这是多行注释
类似 /* */ in C#
"""

# ========== 字面常量 ==========
5          # 整数
3.14       # 浮点数
"Hello"    # 字符串
'World'    # 字符串

# ========== 数字 ==========
age = 25            # int（无大小限制，不像 C# int32）
price = 99.99       # float

# ========== 字符串 ==========
s1 = '单引号'
s2 = "双引号"
s3 = '''三引号
多行字符串'''

# 字符串格式化
name = "Jeffrey"
age = 25

# 方式1: format()
print("{} is {} years old".format(name, age))

# 方式2: f-string（Python 3.6+，推荐）
print(f"{name} is {age} years old")

# 转义序列
print("Line1\nLine2")  # \n 换行
print(r"C:\Users\name")  # r = 原始字符串，不转义

# 字符串是不可变的（Immutable）
# 类比：C# 的 string 也是不可变的
s = "Hello"
# s[0] = "h"  # 错误！
s = "h" + s[1:]  # 只能重新赋值

# ========== 变量 ==========
# 无需声明类型，直接赋值
# 类比：JavaScript 的 var，但类型安全
x = 5
x = "Hello"  # 可以重新赋值不同类型（不推荐）

# ========== 标识符命名规则 ==========
"""
规则：
1. 首字符：字母、_、或 Unicode 字符
2. 其他字符：字母、数字、_、Unicode
3. 大小写敏感
4. 不能用关键字
"""
my_var = 1
_var = 2
# 1var = 3  # 错误！

# ========== 数据类型总结 ==========
# 一切皆对象！（类比：C# 一切皆对象，但 Python 更彻底）
# 数字、字符串、函数、类...都是对象

# ========== 物理行 vs 逻辑行 ==========
# 一行一条语句（推荐）
print("Hello")

# 一行多条语句（不推荐）
print("Hello"); print("World")

# 长语句换行
s = "This is a very long string " \
    "that spans two lines"

# ========== 缩进 ==========
# 缩进很重要！用来表示代码块
# 类比：C# 用 {}，Python 用缩进
if True:
    print("True")  # 缩进4空格（推荐）
    print("Another line")
# else:
#   print("False")  # 错误的缩进会导致 IndentationError
```

---

## 第6章：运算符与表达式

```python
# ========== 算术运算符 ==========
a + b      # 加
a - b      # 减
a * b      # 乘
a ** b     # 幂（a^b）
a / b      # 除（总是返回浮点数）
a // b     # 整除（向下取整）
a % b      # 取余

# ========== 比较运算符 ==========
a < b      # 小于
a > b      # 大于
a <= b     # 小于等于
a >= b     # 大于等于
a == b     # 等于
a != b     # 不等于

# ========== 逻辑运算符 ==========
not x      # 非（类似 !x in C#）
x and y    # 与（类似 && in C#，短路）
x or y     # 或（类似 || in C#，短路）

# ========== 位运算符 ==========
x << y     # 左移
x >> y     # 右移
x & y      # 按位与
x | y      # 按位或
x ^ y      # 按位异或
~x         # 按位取反

# ========== 赋值运算符 ==========
a = 5
a += 2     # a = a + 2
a *= 3     # a = a * 3
# ... 其他类似

# ========== 优先级 ==========
# 括号 > 幂 > 乘除 > 加减 > 比较 > 逻辑
# 建议：用括号使代码更清晰

# ========== 表达式示例 ==========
length = 5
breadth = 2
area = length * breadth
print("Area is", area)
print("Perimeter is", 2 * (length + breadth))
```

---

## 第7章：控制流

```python
# ========== if 语句 ==========
number = 23
guess = int(input("Enter an integer: "))  # 输入转整数

if guess == number:
    print("恭喜，猜对了！")
elif guess < number:
    print("太小了")
else:
    print("太大了")

# 注意：Python 没有 switch 语句

# ========== while 语句 ==========
running = True
while running:
    s = input("Enter something: ")
    if s == "quit":
        break      # 跳出循环
    if s == "skip":
        continue   # 跳过本次
    print("Length is", len(s))
else:
    print("循环正常结束（不用 break 时执行）")

# ========== for 语句 ==========
# 类比 C# foreach，不是传统 for

# 遍历 range
for i in range(1, 5):  # 1, 2, 3, 4
    print(i)

# 遍历列表
fruits = ["apple", "banana", "mango"]
for fruit in fruits:
    print("Current fruit:", fruit)

# else 子句
for item in [1, 2, 3]:
    print(item)
else:
    print("for 循环结束（不用 break 时执行）")

# ========== break 和 continue ==========
# break: 立即跳出循环
# continue: 跳过本次迭代，继续下一次
```

---

## 第8章：函数

```python
# ========== 函数定义 ==========
# 用 def 关键字
def say_hello():
    print("Hello World!")

say_hello()  # 调用

# ========== 参数 ==========
def print_max(a, b):
    if a > b:
        print(a, "大")
    else:
        print(b, "大")

print_max(3, 5)

# ========== 局部变量 ==========
x = 50

def func(x):
    print("x is", x)
    x = 2
    print("Changed local x to", x)

func(x)
print("x is still", x)  # 全局 x 不变

# ========== global 语句 ==========
def func_global():
    global x  # 声明使用全局变量
    print("x is", x)
    x = 2
    print("Changed global x to", x)

func_global()
print("Now x is", x)  # 全局 x 被修改

# ========== 默认参数值 ==========
def say(message, times=1):
    print(message * times)

say("Hello")          # 用默认值
say("World", 3)       # 覆盖默认值

# 注意：默认参数必须在参数列表最后

# ========== 关键字参数 ==========
def func(a, b=5, c=10):
    print("a is", a, "b is", b, "c is", c)

func(3, 7)            # 位置参数
func(25, c=24)        # 混合
func(c=50, a=100)     # 全关键字参数（顺序无关）

# ========== 可变参数 ==========
# *args: 可变数量的位置参数
def sum_all(*numbers):
    total = 0
    for n in numbers:
        total += n
    return total

sum_all(1, 2, 3)  # 6

# **kwargs: 可变数量的关键字参数
def print_info(**kwargs):
    for k, v in kwargs.items():
        print(k, "=", v)

print_info(name="Jeffrey", age=25)

# ========== return 语句 ==========
def maximum(x, y):
    if x > y:
        return x
    else:
        return y

result = maximum(5, 3)
print("Max is", result)

# 无 return 或 return 无值，返回 None
# None 类似 C# 的 null

# ========== DocString（文档字符串）==========
def print_max(x, y):
    """打印两个数的最大值。

    两个值必须都是整数。
    """
    x = int(x)
    y = int(y)
    if x > y:
        print(x, "大")
    else:
        print(y, "大")

# 查看文档
print(print_max.__doc__)
help(print_max)
```

---

## 第9章：模块

```python
# ========== 导入模块 ==========
import sys               # 导入整个模块
from os import getcwd    # 导入特定函数
from os import *         # 不推荐（命名冲突）
from os import path as op  # 导入并重命名

# 使用
sys.argv  # 命令行参数列表
sys.path  # 模块搜索路径

# ========== __name__ ==========
# 判断是作为主程序运行，还是作为模块被导入
if __name__ == "__main__":
    print("程序自己运行")
else:
    print("被其他模块导入")

# ========== 创建你自己的模块 ==========
# 保存为 mymodule.py
def say_hello():
    print("Hello!")

__version__ = "0.1"

# 在另一个文件导入
import mymodule
mymodule.say_hello()
print("Version", mymodule.__version__)

# ========== dir() 函数 ==========
# 列出对象的所有属性/方法
import sys
dir(sys)     # 列出 sys 模块的所有内容
dir()        # 列出当前模块的内容
a = 5
dir()        # 现在会看到 'a'

# ========== 包（Package）==========
# 类比 C# 的命名空间
"""
目录结构：
- mypackage/
    - __init__.py（必需，表示这是个包）
    - module1.py
    - module2.py
    - subpackage/
        - __init__.py
        - module3.py
"""
# 导入
from mypackage import module1
from mypackage.subpackage import module3
```

---

## 第10章：数据结构

```python
# ========== 列表（List）==========
# 类似 C# 的 List<T>，但更灵活

shoplist = ["apple", "mango", "carrot", "banana"]

# 访问
print(shoplist[0])       # "apple"
print(shoplist[-1])      # "banana"（倒数第一）

# 切片（类似 LINQ Skip/Take）
print(shoplist[1:3])     # [1,2) = ["mango", "carrot"]
print(shoplist[:])       # 复制整个列表

# 修改
shoplist.append("grape")    # 添加
shoplist.insert(1, "strawberry")  # 插入
shoplist.remove("mango")   # 移除
del shoplist[0]            # 按索引删除
shoplist.sort()            # 排序（原地修改）

# ========== 元组（Tuple）==========
# 类似列表，但不可变（Immutable）
# 类比：C# 的 ValueTuple

point = (2, 3)
rgb = ("red", "green", "blue")

# 访问
print(point[0])

# 解包（多返回值）
x, y = point

# 单元素元组需要逗号
single = (5,)

# ========== 字典（Dictionary）==========
# 类似 C# 的 Dictionary<TKey, TValue>

address = {
    "Guido": "guido@python.org",
    "Larry": "larry@wall.org",
    "Matsumoto": "matz@ruby-lang.org"
}

# 访问
print(address["Guido"])
print(address.get("Unknown", "N/A"))  # 安全访问

# 添加/修改
address["Jeffrey"] = "jeffrey@example.com"
del address["Larry"]

# 遍历
for name, email in address.items():
    print(name, ":", email)

# ========== 序列（Sequence）==========
# 列表、元组、字符串 都是序列
# 序列支持：索引、切片、len()、in、+、*

# ========== 集合（Set）==========
# 类似 C# 的 HashSet<T>

bri = {"brazil", "russia", "india"}
"india" in bri  # True
bric = bri.copy()
bric.add("china")
bric.remove("russia")
print(bri & bric)  # 交集
print(bri | bric)  # 并集
print(bri - bric)  # 差集

# ========== 引用（References）==========
# 变量是引用，不是值！
# 类比：C# 的引用类型（class）

a = [1, 2, 3]
b = a  # b 引用同一个对象
b.append(4)
print(a)  # [1, 2, 3, 4]

# 真正的复制
b = a[:]  # 切片复制
b = a.copy()  # copy 方法

# ========== 更多字符串方法 ==========
s = "Hello, Python!"
s.startswith("Hello")  # True
s.endswith("!")        # True
s.find("Python")       # 7
s.replace("Python", "World")  # "Hello, World!"
s.split(",")           # ["Hello", " Python!"]
", ".join(["a", "b"])  # "a, b"
```

---

## 第11章：解决问题

```python
# ========== 案例：备份脚本 ==========
# 完整开发流程：分析 → 设计 → 实现 → 测试 → 优化

import os
import time

# ===== 版本1：基本功能 =====
source = ['/home/swaroop/byte']
target_dir = '/home/swaroop/backup'

if not os.path.exists(target_dir):
    os.mkdir(target_dir)

today = target_dir + os.sep + time.strftime('%Y%m%d')
now = time.strftime('%H%M%S')

target = today + os.sep + now + '.zip'

if not os.path.exists(today):
    os.mkdir(today)

zip_command = 'zip -r {0} {1}'.format(target, ' '.join(source))

print('Zip command is:', zip_command)
print('Running...')
if os.system(zip_command) == 0:
    print('Successful backup to', target)
else:
    print('Backup FAILED')

# ===== 版本2：改进（日期目录）=====
# ...

# ===== 版本3：添加注释 =====
# ...

# ===== 版本4：最终版 =====
# ...（略，代码较长，原理：添加注释、错误检查）

# ========== 软件开发流程 ==========
"""
1. 是什么（分析）
2. 怎么做（设计）
3. 开始做（实现）
4. 测试（测试与调试）
5. 使用（运行/部署）
6. 维护（改进）
"""
```

---

## 第12章：面向对象编程

```python
# ========== 类与对象 ==========
# 类比 C# 的 class

class Person:
    """表示一个人。"""

    # 类变量（所有实例共享）
    population = 0

    # 构造方法（类似 C# 构造函数）
    def __init__(self, name):
        """初始化。"""
        self.name = name  # 实例变量
        print("(初始化 {})".format(self.name))
        Person.population += 1  # 访问类变量

    # 析构方法（不保证立即调用）
    def __del__(self):
        """销毁。"""
        print("{} 走了".format(self.name))
        Person.population -= 1

    # 方法
    def say_hi(self):
        """打招呼。"""
        print("你好，我是{}".format(self.name))

    # 类方法
    @classmethod
    def how_many(cls):
        print("我们有 {} 个人".format(cls.population))

# 创建对象
p1 = Person("Jeffrey")
p1.say_hi()
Person.how_many()

p2 = Person("Larry")
Person.how_many()

del p1  # 显式删除
del p2

# ========== 继承 ==========
# 类比 C# 的 : 继承

class SchoolMember:
    """学校成员基类。"""

    def __init__(self, name, age):
        self.name = name
        self.age = age
        print("创建 SchoolMember: {}".format(self.name))

    def tell(self):
        print("姓名:{} 年龄:{}".format(self.name, self.age), end=" ")

class Teacher(SchoolMember):
    """老师。"""

    def __init__(self, name, age, salary):
        super().__init__(name, age)  # 调用父类构造
        self.salary = salary
        print("创建 Teacher: {}".format(self.name))

    def tell(self):
        super().tell()  # 调用父类方法
        print("工资: {}".format(self.salary))

class Student(SchoolMember):
    """学生。"""

    def __init__(self, name, age, marks):
        super().__init__(name, age)
        self.marks = marks
        print("创建 Student: {}".format(self.name))

    def tell(self):
        super().tell()
        print("分数: {}".format(self.marks))

# 使用
t = Teacher("Smith", 40, 30000)
s = Student("John", 20, 75)
members = [t, s]

for m in members:
    m.tell()  # 多态！
```

---

## 第13章：输入与输出

```python
# ========== 用户输入 ==========
s = input("Enter something: ")
print("You entered", s)

# 回文判断（示例）
def is_palindrome(s):
    # 忽略空格、标点，大小写不敏感
    forbidden = (" ", "!", "?", ".", ",")
    s = s.lower()
    filtered = []
    for c in s:
        if c not in forbidden:
            filtered.append(c)
    filtered = "".join(filtered)
    return filtered == filtered[::-1]

# ========== 文件操作 ==========
# 写入
poem = '''\
Programming is fun
When the work is done
if you wanna make your work also fun:
    use Python!
'''

with open("poem.txt", "w", encoding="utf-8") as f:
    f.write(poem)

# 读取
with open("poem.txt", "r", encoding="utf-8") as f:
    content = f.read()  # 读全部
    # content = f.readline()  # 读一行
    # lines = f.readlines()  # 读所有行

print(content)

# ========== pickle（对象持久化）==========
import pickle

# 写入
data = {"name": "Jeffrey", "age": 25}
with open("data.pkl", "wb") as f:
    pickle.dump(data, f)

# 读取
with open("data.pkl", "rb") as f:
    loaded = pickle.load(f)
print(loaded)

# ========== Unicode ==========
# Python 3 默认 Unicode 字符串
s = "你好，世界！"
print(s)

# 编码
encoded = s.encode("utf-8")
print(encoded)  # b'\xe4\xbd...'

# 解码
decoded = encoded.decode("utf-8")
print(decoded)
```

---

## 第14章：异常

```python
# ========== 错误示例 ==========
# Print("hello")  # NameError（大小写错误）
# 1 / 0          # ZeroDivisionError

# ========== 处理异常 ==========
try:
    text = input("Enter something: ")
except EOFError:
    print("EOF Error!")
except KeyboardInterrupt:
    print("Canceled!")
else:
    print("You entered", text)

# ========== 抛出异常 ==========
class ShortInputException(Exception):
    """自定义异常类。"""
    def __init__(self, length, atleast):
        Exception.__init__(self)
        self.length = length
        self.atleast = atleast

try:
    text = input("Enter something: ")
    if len(text) < 3:
        raise ShortInputException(len(text), 3)
except ShortInputException as e:
    print(f"ShortInput: got {e.length}, expected {e.atleast}")

# ========== try...finally ==========
# 类似 C# 的 try...finally

try:
    f = open("poem.txt")
    while True:
        line = f.readline()
        if len(line) == 0:
            break
        print(line, end="")
finally:
    f.close()
    print("文件已关闭")

# ========== with 语句 ==========
# 类似 C# 的 using（更简洁）

with open("poem.txt") as f:
    for line in f:
        print(line, end="")
# 自动关闭！
```

---

## 第15章：标准库

```python
# ========== sys 模块 ==========
import sys

print(sys.version_info)
# sys.version_info(major=3, minor=6, micro=0, ...)

if sys.version_info.major < 3:
    print("需要 Python 3+")
    sys.exit(1)

# ========== logging 模块 ==========
import logging
import os

# 配置
if os.name == "nt":
    logfile = os.path.join("C:\\", "test.log")
else:
    logfile = os.path.join(os.getenv("HOME"), "test.log")

logging.basicConfig(
    level=logging.INFO,
    filename=logfile,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

logging.info("开始")
logging.warning("警告")
logging.error("错误")

# ========== 更多标准库 ==========
"""
- os: 操作系统接口
- shutil: 文件操作
- re: 正则表达式
- urllib: 网络请求
- json: JSON 处理
- datetime: 日期时间
- random: 随机数
- math: 数学
- argparse: 命令行参数
"""
```

---

## 第16章：更多

```python
# ========== 传递元组（多返回值）==========
def get_error_details():
    return (2, "details")

errnum, errstr = get_error_details()
print(errnum, errstr)

# 快速交换
a, b = 5, 10
a, b = b, a

# ========== 特殊方法 ==========
# __init__, __del__, __str__, __repr__, __lt__, __getitem__, __len__...

class MyClass:
    def __init__(self, x):
        self.x = x

    def __str__(self):
        return f"MyClass({self.x})"

# ========== Lambda 形式 ==========
# 类似 C# 的 lambda 表达式

points = [ (1,2), (4,1), (5,-3), (10,0) ]
points.sort(key=lambda p: p[1])  # 按y坐标排序
print(points)

# ========== 列表推导式 ==========
# 类似 LINQ Select

numbers = [1, 2, 3, 4, 5]
squares = [x**2 for x in numbers]
evens = [x for x in numbers if x % 2 == 0]

# ========== * 和 ** 接收参数 ==========
def powersum(power, *args):
    total = 0
    for i in args:
        total += i ** power
    return total

powersum(2, 1, 2, 3)  # 14

# ========== assert 语句 ==========
x = 5
assert x > 0, "x 必须大于0"
# assert x > 10, "x 太小了"  # 抛出 AssertionError

# ========== 装饰器 ==========
# 类似 C# 的 AOP/属性

def log(func):
    def wrapper(*args, **kwargs):
        print(f"调用 {func.__name__}")
        return func(*args, **kwargs)
    return wrapper

@log
def add(a, b):
    return a + b

print(add(2, 3))  # 先打印 "调用 add"，再返回5
```

---

## 第17章：接下来做什么

```python
# ========== 建议项目 ==========
"""
1. 命令行通讯录程序（使用类、字典、pickle）
2. 替换命令工具（类似 sed/replace）
3. 个人待办事项管理

其他方向：
- Web 开发：Flask, Django
- 数据分析：Pandas, NumPy
- 机器学习：TensorFlow, scikit-learn
- GUI 开发：PyQt, Kivy
- 自动化脚本
"""

# ========== 进阶资源 ==========
"""
- Python 官方文档
- Python Cookbook
- Python Module of the Week
- Flask Mega-Tutorial
"""
```

---

## 附录：C#/ASP 到 Python 速查表

| C#/ASP | Python | 说明 |
|--------|---------|------|
| `int x = 5;` | `x = 5` | 变量赋值，无需类型 |
| `string s = "hello";` | `s = "hello"` | 字符串 |
| `if (x > 0) {}` | `if x > 0:` | if 语句 |
| `for (int i=0; i<5; i++)` | `for i in range(5):` | 循环 |
| `foreach (var item in list)` | `for item in list:` | 遍历 |
| `class MyClass {}` | `class MyClass:` | 类定义 |
| `public void Method()` | `def method(self):` | 方法 |
| `Console.WriteLine()` | `print()` | 输出 |
| `Console.ReadLine()` | `input()` | 输入 |
| `try {} catch {}` | `try: except:` | 异常 |
| `throw new Exception()` | `raise Exception()` | 抛出异常 |
| `using (var f = ...)` | `with open(...) as f:` | 资源管理 |
| `Dictionary<K,V>` | `dict` | 字典 |
| `List<T>` | `list` | 列表 |
| `HashSet<T>` | `set` | 集合 |
| `Tuple<T1,T2>` | `tuple` | 元组 |
| `return null` | `return None` | 空值 |
| `string.Format("{0}", x)` | `f"{x}"` 或 `.format(x)` | 字符串格式化 |
| `x?.y` | `x.y if x else None` | 空值传播（需要手动） |
| `nameof(MyClass)` | `MyClass.__name__` | 获取名称 |
