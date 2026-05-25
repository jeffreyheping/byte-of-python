# A Byte of Python - 速查笔记

> 用代码+注释简化描述整本书，配合 ASP/C# 背景类比

---

## 第一部分：入门

### 1. 关于 Python（语言特性概览）

```python
# Python = 简洁 + 强大，像 ASP 的简洁脚本但企业级能力
# 类比：
#   - ASP Classic: 脚本语言，简单但缺乏结构
#   - C#: 强类型，OOP，功能强大但语法复杂
#   - Python: 两者优点兼顾，像 C# 一样强大，但像 ASP 一样简洁

# 核心特性
"""
1. 解释型语言（Interpreted）
   类比：ASP，不需要编译，直接运行
   不同于 C# 需要编译成 IL

2. 动态类型（Dynamic Typing）
   类比：ASP 的 Variant，但更智能
   不同：不像 C# 需要声明变量类型

3. 缩进语法（Indentation-based）
   不同：不像 C#/ASP 用 {} 包裹代码块
   Python 用缩进表示层级，像写诗一样优雅

4. "自带电池"哲学（Batteries Included）
   类似：C# 的 .NET Framework，但更全面
   安装即拥有：文件、网络、数据库、图像处理...

5. 一切皆对象
   类比：C# 一切皆对象，但 Python 更彻底
   数字、字符串、函数、类...都是对象
"""
```

### 2. 安装与运行

```python
# 安装检查
$ python3 --version  # 查看版本，像检查 .NET Framework 版本

# 运行方式1：交互式解释器（类似 ASP 的 <% %> 即时执行）
$ python3
>>> print("Hello")  # 立即看到结果

# 运行方式2：脚本文件（类似 .aspx 代码后置）
$ python hello.py
# 对应 C# 的：dotnet run 或直接运行 .dll

# IDE 推荐
#   - PyCharm（类似 Visual Studio）
#   - VS Code + Python 插件
#   - Jupyter Notebook（类似 LinqPad，适合实验）
```

---

## 第二部分：基础语法

### 3. 变量与数据类型

```python
# ========== 变量 ==========
# Python 变量 = ASP/C# 变量，但不需要声明
# 类似：JavaScript 的 var，但类型固定

name = "Jeffrey"        # 字符串（str）- 像 C# 的 string
age = 25                # 整数（int）- 像 C# 的 int
price = 99.99           # 浮点数（float）- 像 C# 的 double
is_active = True        # 布尔（bool）- 像 C# 的 bool（首字母大写）
nothing = None          # 空值 - 类似 C# 的 null，但写作 None

# ========== 字符串 ==========
# Python 字符串 = C# string 加强版

s1 = '单引号'           # 类似 ASP: s1 = "单引号"
s2 = "双引号"           # 更常用
s3 = """多行字符串"""   # 类似 C# 的 @"多行"

# 格式化（3种方式）
name = "Jeffrey"
age = 25

# 方式1: % 格式化（像 C 的 printf）
print("Name: %s, Age: %d" % (name, age))

# 方式2: format 方法（像 C# 的 string.Format）
print("Name: {}, Age: {}".format(name, age))

# 方式3: f-string（Python 3.6+，最简洁）
print(f"Name: {name}, Age: {age}")  # 推荐！

# 转义字符
path = "C:\\Users\\Jeffrey"          # \\ 转义反斜杠
path = r"C:\Users\Jeffrey"          # r 前缀 = 原始字符串（Raw）
newline = "Line1\nLine2"            # \n 换行

# ========== 数字 ==========
a = 10           # int，无大小限制（不像 C# 的 int32）
b = 3.14         # float
c = 10j          # 复数（Python 独有）
result = 10 / 3  # 除法：3.333...（总是浮点，不像 C# 需要注意）
result = 10 // 3 # 整除：3（向下取整）
result = 10 % 3  # 取余：1
result = 2 ** 10  # 幂运算：1024（Python 独有简写）
```

### 4. 注释

```python
# 单行注释（像 // in C#）

"""
多行注释
类似 C# 的 /* */，但用三引号
"""

# 文档字符串（Docstring）
def my_function():
    """
    这是函数的文档字符串
    可以用 help(my_function) 查看
    类似 C# 的 XML 文档注释 ///
    """
    pass
```

### 5. 运算符与表达式

```python
# ========== 算术运算符 ==========
# 类似 C#/ASP，但 ** 是 Python 独有
a + b    # 加法
a - b    # 减法
a * b    # 乘法
a / b    # 除法（总是浮点）
a // b   # 整除（向下取整）
a % b    # 取余
a ** b   # 幂运算（a 的 b 次方）

# ========== 比较运算符 ==========
# 类似 C#，但 != 而不是 <>
a == b   # 等于
a != b   # 不等于
a > b    # 大于
a < b    # 小于
a >= b   # 大于等于
a <= b   # 小于等于

# ========== 逻辑运算符 ==========
# 类似 C#，但用英文单词
True and False   # 逻辑与（类似 C# 的 &&）
True or False    # 逻辑或（类似 C# 的 ||）
not True         # 逻辑非（类似 C# 的 !）

# ========== 赋值运算符 ==========
# 类似 C#
a = 5
a += 3   # a = a + 3
a *= 2   # a = a * 2

# ========== 位运算符 ==========
# 类似 C#
a & b    # 按位与
a | b    # 按位或
a ^ b    # 按位异或
~a       # 按位取反
a << 2   # 左移（乘以 2^n）
a >> 2   # 右移（除以 2^n）
```

### 6. 控制流

```python
# ========== if 语句 ==========
# 类似 C# 的 if...else，但不用 ()
age = 18

if age < 18:
    print("未成年")      # 缩进 = 代码块（不用 {}）
elif age < 65:
    print("成年人")
else:
    print("老年人")

# 注意：Python 没有 switch，用 elif 链
# 类比：像 ASP 的 ElseIf，但不是关键字连写

# ========== while 循环 ==========
# 类似 C# 的 while
count = 0
while count < 5:
    print(count)
    count += 1

# while...else（C# 没有的语法）
while count < 5:
    print(count)
else:
    print("循环正常结束")  # 不用 break 时执行

# ========== for 循环 ==========
# 类似 C# 的 foreach，不是传统的 for

# 遍历范围
for i in range(5):       # 0, 1, 2, 3, 4
    print(i)

for i in range(1, 6):    # 1, 2, 3, 4, 5
    print(i)

for i in range(0, 10, 2): # 0, 2, 4, 6, 8（步长2）
    print(i)

# 遍历列表（类似 C# 的 foreach var）
fruits = ["苹果", "香蕉", "橙子"]
for fruit in fruits:
    print(fruit)

# 遍历字符串
for char in "Python":
    print(char)

# for...else
for item in items:
    if item == target:
        print("找到了")
        break
else:
    print("没找到")  # 没有 break 时执行

# ========== break 和 continue ==========
# 类似 C#
for i in range(10):
    if i == 5:
        break     # 跳出循环
    if i == 3:
        continue # 跳过本次迭代
    print(i)
```

### 7. 数据结构

```python
# ========== 列表（List）==========
# 类似 C# 的 List<T>，但更灵活

# 创建
fruits = ["苹果", "香蕉", "橙子"]
numbers = list(range(5))  # [0, 1, 2, 3, 4]
empty = []

# 访问（下标从 0 开始，像 C# 数组）
print(fruits[0])     # "苹果"
print(fruits[-1])    # "橙子"（倒数第一）
print(fruits[-2])    # "香蕉"（倒数第二）

# 切片（Python 独有，类似 LINQ Skip/Take）
numbers = [0, 1, 2, 3, 4, 5]
print(numbers[1:4])   # [1, 2, 3]（索引1到3，不含4）
print(numbers[::2])   # [0, 2, 4]（步长2）
print(numbers[::-1])  # [5, 4, 3, 2, 1, 0]（反转）

# 修改
fruits.append("葡萄")        # 添加到末尾（类似 List.Add）
fruits.insert(1, "草莓")    # 插入到指定位置
fruits.remove("香蕉")       # 移除指定元素
del fruits[0]              # 按索引删除
popped = fruits.pop()      # 弹出并返回最后一个

# 常用操作
len(fruits)    # 长度（类似 List.Count）
fruits.sort()  # 排序（修改原列表）
fruits.reverse()  # 反转
"苹果" in fruits  # 是否存在（True/False）
fruits.count("苹果")  # 计数

# ========== 元组（Tuple）==========
# 类似 C# 的 Tuple，但语法更简洁

# 创建
point = (10, 20)           # 类似 Tuple<int, int>
rgb = ("红", "绿", "蓝")
single = (5,)              # 单元素元组需要逗号

# 访问
print(point[0])   # 10
print(point[1])   # 20

# 解包（Python 独有，像多返回值）
x, y = point      # x=10, y=20

# 特点：不可变（类似 string），性能更好
# 用途：函数多返回值、坐标、固定数据结构

# ========== 字典（Dictionary）==========
# 类似 C# 的 Dictionary<TKey, TValue>

# 创建
person = {
    "name": "Jeffrey",
    "age": 25,
    "city": "北京"
}
empty_dict = {}

# 访问
print(person["name"])      # "Jeffrey"
print(person.get("email", "N/A"))  # 安全访问，不存在返回默认值

# 修改
person["age"] = 26         # 修改
person["email"] = "a@b.com"  # 添加
del person["city"]         # 删除

# 遍历
for key in person:         # 遍历键
    print(key, person[key])

for key, value in person.items():  # 遍历键值对
    print(f"{key}: {value}")

for value in person.values():      # 遍历值
    print(value)

# 常用操作
len(person)    # 键值对数量
"name" in person  # 是否存在键
person.keys()  # 所有键
person.values()  # 所有值
person.items()  # 所有键值对

# ========== 集合（Set）==========
# 类似 C# 的 HashSet<T>

# 创建
colors = {"红", "绿", "蓝"}
prime_set = {2, 3, 5, 7}

# 特点：无序、不重复
colors.add("黄")    # 添加
colors.remove("红")  # 移除（不存在会报错）
colors.discard("紫")  # 移除（不存在不报错）

# 集合运算
a = {1, 2, 3}
b = {2, 3, 4}
print(a | b)   # 并集：{1, 2, 3, 4}
print(a & b)   # 交集：{2, 3}
print(a - b)   # 差集：{1}
print(a ^ b)   # 对称差集：{1, 4}

# ========== 字符串方法 ==========
s = "  Hello, Python!  "

s.strip()      # 去除首尾空格（类似 Trim）
s.lower()      # 转小写
s.upper()      # 转大写
s.startswith("Hello")  # 是否以...开头
s.endswith("!")        # 是否以...结尾
s.replace("Python", "World")  # 替换
s.split(",")           # 分割（类似 Split）
",".join(["a", "b"])   # 拼接（Join）
s.find("Python")       # 查找位置（-1表示未找到）
s.count("o")           # 计数
```

---

## 第三部分：函数

### 8. 函数定义与调用

```python
# ========== 基本函数 ==========
# 类似 C# 的方法，但用 def 关键字

def say_hello():
    """无参数函数"""
    print("Hello!")

say_hello()  # 调用

# ========== 带参数 ==========
# 类似 C# 方法参数

def greet(name, greeting="你好"):
    """有默认参数的函数"""
    print(f"{greeting}, {name}!")

greet("Jeffrey")              # 使用默认参数
greet("Jeffrey", "Hi")        # 覆盖默认参数

# ========== 关键字参数 ==========
# 类似 C# 的命名参数

def connect(host, port, timeout=30):
    pass

connect(host="localhost", port=8080)  # 按名字传递
connect(port=8080, host="localhost")  # 可以颠倒顺序

# ========== 可变参数 ==========
# 类似 C# 的 params

def sum_all(*numbers):
    """*args: 接收任意数量的位置参数"""
    total = 0
    for n in numbers:
        total += n
    return total

print(sum_all(1, 2, 3, 4, 5))  # 15

def print_info(**kwargs):
    """**kwargs: 接收任意数量的关键字参数"""
    for key, value in kwargs.items():
        print(f"{key}: {value}")

print_info(name="Jeffrey", age=25)

# ========== 返回值 ==========
# 类似 C#

def divide(a, b):
    if b == 0:
        return None  # 返回空值
    return a / b

result = divide(10, 2)  # 5.0
result = divide(10, 0)  # None

# 多返回值（Python 独有）
def get_stats(numbers):
    return min(numbers), max(numbers), sum(numbers)

min_val, max_val, total = get_stats([1, 2, 3, 4, 5])

# ========== 变量作用域 ==========
# 类似 C#

x = "全局变量"

def test_scope():
    x = "局部变量"  # 局部变量，不会修改全局
    print(x)  # 打印局部

def test_global():
    global x   # 声明使用全局变量
    x = "修改全局"
    print(x)

# ========== Lambda 函数 ==========
# 类似 C# 的 LINQ 表达式

square = lambda x: x ** 2
print(square(5))  # 25

# 配合内置函数使用
numbers = [1, 2, 3, 4, 5]
squares = list(map(lambda x: x ** 2, numbers))
evens = list(filter(lambda x: x % 2 == 0, numbers))
```

---

## 第四部分：高级特性

### 9. 模块与导入

```python
# ========== 导入模块 ==========
# 类似 C# 的 using/import

import os                    # 导入整个模块
from os import getcwd        # 导入特定函数
from os import path as op    # 重命名（as）
from os import *             # 不推荐：导入所有

# 使用
os.getcwd()        # 模块.函数
getcwd()           # 直接使用

# ========== 标准库常用模块 ==========
import sys        # 系统相关（argv, path, version...）
import os         # 操作系统（文件, 目录, 环境变量...）
import math       # 数学运算（sqrt, pi, e...）
import random     # 随机数（random, choice, shuffle...）
import datetime   # 日期时间
import json       # JSON 处理
import re         # 正则表达式
import urllib.request  # 网络请求

# ========== __name__ ==========
# 类似 C# Console app 的 Main 判断

if __name__ == "__main__":
    # 直接运行此文件时执行的代码
    print("作为主程序运行")
else:
    # 被导入时执行的代码
    print("作为模块被导入")

# ========== 包（Package）==========
# 类似 C# 的命名空间

# mypackage/
#   __init__.py
#   module1.py
#   module2.py

from mypackage import module1
from mypackage.module1 import my_function
```

### 10. 面向对象编程

```python
# ========== 类定义 ==========
# 类似 C# 的 class

class Person:
    """人类（类似 C# 的 class Person）"""

    # 类变量（类似 C# static 字段）
    species = "智人"

    # 构造方法（类似 C# 构造函数）
    def __init__(self, name, age=0):
        """初始化（__init__ 类似构造函数）"""
        self.name = name        # 实例变量（类似字段）
        self.age = age

    # 实例方法（类似 C# 实例方法）
    def say_hello(self):
        return f"你好，我是{self.name}"

    # __str__（类似 C# 的 ToString）
    def __str__(self):
        return f"Person({self.name}, {self.age})"

    # 类方法（类似 C# static 方法）
    @classmethod
    def create_baby(cls, name):
        return cls(name, 0)

    # 静态方法（类似 C# static 方法，不访问实例）
    @staticmethod
    def is_adult(age):
        return age >= 18

# ========== 创建对象 ==========
# 类似 C# 的 new

person = Person("Jeffrey", 25)
print(person.name)          # 访问属性
print(person.say_hello())   # 调用方法

# ========== 继承 ==========
# 类似 C# 的冒号继承

class Student(Person):
    """学生类继承人类"""

    def __init__(self, name, age, grade):
        super().__init__(name, age)  # 调用父类构造
        self.grade = grade           # 新增属性

    def say_hello(self):
        return super().say_hello() + f"，我在{self.grade}年级"

# 多继承（Python 独有，C# 不支持）
class Teacher(Person):
    pass

class TeachingAssistant(Student, Teacher):
    pass

# ========== 访问控制 ==========
# 类似 C# 的访问修饰符，但更简单

class MyClass:
    def __init__(self):
        self.public_var = "公开"      # 公开（默认）
        self._protected_var = "保护"  # 受保护（惯例）
        self.__private_var = "私有"   # 私有（名称重整）

# ========== 属性（Property）==========
# 类似 C# 的 Property

class Temperature:
    def __init__(self):
        self._celsius = 0

    @property
    def celsius(self):
        return self._celsius

    @celsius.setter
    def celsius(self, value):
        if value < -273.15:
            raise ValueError("温度不能低于绝对零度")
        self._celsius = value

    @property
    def fahrenheit(self):
        return self._celsius * 9/5 + 32

temp = Temperature()
temp.celsius = 25          # 像访问字段一样
print(temp.fahrenheit)    # 77.0
```

### 11. 异常处理

```python
# ========== 异常概念 ==========
# 类似 C# 的 try...catch

try:
    result = 10 / 0
except ZeroDivisionError:
    print("不能除以零")

# ========== 捕获多种异常 ==========
try:
    value = int("abc")
    result = 10 / 0
except ValueError:
    print("转换错误")
except ZeroDivisionError:
    print("除以零错误")
except Exception as e:  # 捕获所有异常
    print(f"其他错误: {e}")

# ========== try...except...else...finally ==========
# 类似 C#，但多了 else

try:
    file = open("test.txt", "r")
except FileNotFoundError:
    print("文件不存在")
else:
    content = file.read()  # 只有没有异常时执行
    file.close()
finally:
    print("总是执行")  # 类似 C# 的 finally

# ========== with 语句 ==========
# 类似 C# 的 using，简化资源管理

# 旧写法
file = open("test.txt", "r")
try:
    content = file.read()
finally:
    file.close()

# 新写法（推荐）
with open("test.txt", "r") as file:
    content = file.read()
# 自动关闭文件

# ========== 抛出异常 ==========
# 类似 C# 的 throw

raise ValueError("无效的值")
raise Exception("自定义错误")

# 自定义异常
class MyException(Exception):
    pass

# ========== 常用异常类型 ==========
ValueError      # 值错误（类似参数验证失败）
TypeError       # 类型错误
KeyError        # 字典键不存在
IndexError      # 列表索引越界
FileNotFoundError  # 文件不存在
AttributeError  # 属性不存在
```

### 12. 文件操作

```python
# ========== 读写文本文件 ==========
# 类似 C# 的 File 类

# 读取
with open("test.txt", "r", encoding="utf-8") as f:
    content = f.read()        # 读取全部
    lines = f.readlines()     # 读取所有行
    line = f.readline()      # 读取一行

# 逐行读取（推荐）
with open("test.txt", "r") as f:
    for line in f:
        print(line.strip())

# 写入
with open("test.txt", "w", encoding="utf-8") as f:
    f.write("Hello\n")        # 写入字符串
    f.writelines(["Line1\n", "Line2\n"])  # 写入多行

# 追加
with open("test.txt", "a") as f:
    f.write("追加内容\n")

# ========== 文件模式 ==========
# "r"  - 读（默认）
# "w"  - 写（覆盖）
# "a"  - 追加
# "x"  - 新建（文件存在则报错）
# "b"  - 二进制模式
# "t"  - 文本模式（默认）
# 组合："rb", "wb", "r+b"

# ========== JSON 处理 ==========
import json

data = {"name": "Jeffrey", "age": 25}

# 序列化（类似 C# 的 JsonConvert.SerializeObject）
json_str = json.dumps(data, ensure_ascii=False, indent=2)

# 反序列化
data = json.loads(json_str)

# 文件操作
with open("data.json", "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=2)

with open("data.json", "r", encoding="utf-8") as f:
    data = json.load(f)

# ========== pickle（Python 对象序列化）==========
# 类似 C# 的 BinaryFormatter，但更强
import pickle

# 序列化
with open("data.pkl", "wb") as f:
    pickle.dump(data, f)

# 反序列化
with open("data.pkl", "rb") as f:
    data = pickle.load(f)
```

### 13. 列表推导式与生成器

```python
# ========== 列表推导式 ==========
# 类似 C# 的 LINQ Select

numbers = [1, 2, 3, 4, 5]

# 基础用法
squares = [x ** 2 for x in numbers]       # [1, 4, 9, 16, 25]

# 带条件
evens = [x for x in numbers if x % 2 == 0]  # [2, 4]

# 复杂逻辑
matrix = [[i * j for j in range(1, 4)] for i in range(1, 4)]
# [[1, 2, 3], [2, 4, 6], [3, 6, 9]]

# ========== 生成器 ==========
# 类似 C# 的 yield return

def count_up_to(n):
    i = 1
    while i <= n:
        yield i
        i += 1

# 使用（返回生成器对象）
gen = count_up_to(5)
print(next(gen))  # 1
print(next(gen))  # 2

# 迭代
for num in count_up_to(5):
    print(num)

# ========== 字典/集合推导式 ==========
# Python 独有

# 字典推导式
squares_dict = {x: x**2 for x in range(5)}
# {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}

# 集合推导式
squares_set = {x**2 for x in range(5)}
# {0, 1, 4, 9, 16}
```

### 14. 装饰器

```python
# ========== 装饰器概念 ==========
# 类似 C# 的 AOP/Attribute，但更灵活

# 简单装饰器
def my_decorator(func):
    def wrapper(*args, **kwargs):
        print("调用前")
        result = func(*args, **kwargs)
        print("调用后")
        return result
    return wrapper

@my_decorator
def say_hello():
    print("Hello!")

# 等价于
say_hello = my_decorator(say_hello)

# ========== 带参数的装饰器 ==========
def repeat(times):
    def decorator(func):
        def wrapper(*args, **kwargs):
            for _ in range(times):
                func(*args, **kwargs)
        return wrapper
    return decorator

@repeat(3)
def greet():
    print("Hi!")

greet()  # 输出3次Hi!

# ========== 内置装饰器 ==========
@property          # 属性方法（类似 C# Property）
@classmethod       # 类方法（类似 static 方法）
@staticmethod      # 静态方法
```

---

## 第五部分：常用模式

### 15. 迭代器与 enumerate/zip

```python
# ========== enumerate ==========
# 类似 C# 的 Enumerable.Select with index

fruits = ["苹果", "香蕉", "橙子"]

for i, fruit in enumerate(fruits, start=1):
    print(f"{i}. {fruit}")

# ========== zip ==========
# 类似 C# 的 Zip LINQ 方法

names = ["Alice", "Bob", "Charlie"]
scores = [85, 90, 95]

for name, score in zip(names, scores):
    print(f"{name}: {score}")

# ========== any/all ==========
# 类似 C# 的 Any/All LINQ

numbers = [1, 2, 3, 4, 5]

any_positive = any(n > 0 for n in numbers)  # True
all_positive = all(n > 0 for n in numbers)  # True
```

### 16. 实用技巧

```python
# ========== 解包 ==========
# 类似 C# 7 的元组解构

a, b, c = [1, 2, 3]
first, *rest, last = [1, 2, 3, 4, 5]  # first=1, rest=[2,3,4], last=5

# ========== 链式比较 ==========
# Python 独有

if 0 < x < 10:       # 类似 0 < x && x < 10
    print("x 在0-10之间")

# ========== 三元运算符 ==========
# 类似 C# 的 ?:

age = 20
status = "成年" if age >= 18 else "未成年"

# ========== assert ==========
# 类似 C# 的 Debug.Assert

assert age >= 18, "必须成年"  # 失败时抛出 AssertionError

# ========== 交换变量 ==========
# Python 独有简写

a, b = 5, 10
a, b = b, a  # 不需要 temp

# ========== * 和 ** 解包 ==========
# 类似 C# 的 params展开

numbers = [1, 2, 3]
print(*numbers)  # 1 2 3

dict1 = {"a": 1, "b": 2}
dict2 = {"c": 3, **dict1}  # 合并字典
```

---

## 附录：ASP/C# 到 Python 对照速查

| C#/ASP | Python | 说明 |
|--------|---------|------|
| `int x = 5;` | `x = 5` | 无需声明类型 |
| `string.Format()` | `f"{}"` 或 `.format()` | 字符串格式化 |
| `if (x > 0) {}` | `if x > 0:` | 无括号，冒号结束 |
| `for (int i=0; i<5; i++)` | `for i in range(5):` | 更简洁 |
| `foreach (var item in list)` | `for item in list:` | 无类型声明 |
| `Console.WriteLine()` | `print()` | 输出 |
| `class MyClass {}` | `class MyClass:` | 冒号代替括号 |
| `public void Method()` | `def method(self):` | self 必须 |
| `try {} catch {}` | `try: except:` | else/finally可选 |
| `throw new Exception()` | `raise Exception()` | 抛出异常 |
| `using (var f = new FileStream())` | `with open() as f:` | 上下文管理 |
| `Dictionary<K,V>` | `dict` | 字典 |
| `List<T>` | `list` | 列表 |
| `Tuple<T1,T2>` | `tuple` | 元组 |
| `HashSet<T>` | `set` | 集合 |

---

## 总结：Python vs C#/ASP

```
┌─────────────────────────────────────────────────────────┐
│                      Python 哲学                        │
├─────────────────────────────────────────────────────────┤
│  简洁优先   │ 用更少的代码做更多的事                     │
│  可读性强   │ 缩进即结构，代码即文档                     │
│  动态类型   │ 不用声明，灵活高效                         │
│  自带电池   │ 标准库丰富，开箱即用                       │
│  万物皆对象 │ 统一的设计哲学                            │
│  多种范式   │ 面向过程 + 面向对象 + 函数式              │
└─────────────────────────────────────────────────────────┘

类比记忆：
- 像 C# 一样强大：完整的 OOP、异常、模块、标准库
- 像 ASP 一样简洁：无需编译、无需声明、交互执行
- 比两者都优雅：缩进语法、列表推导、简洁语法
```

---

> 📚 完整学习建议：
> 1. 先用 Jupyter Notebook 实践每个概念
> 2. 尝试用 Python 重写你之前的 ASP/C# 项目
> 3. 学习 Flask/Django 做 Web 开发
> 4. 探索数据分析（Pandas）或机器学习（TensorFlow）
