---
title: 快速理解Py装饰器
date: 2022-08-18
categories:
    - DevLog
tags:
    - DevLog
    - Python
---

一文理解Python装饰器

<!-- more -->

## 本文提示
文章来自学习笔记,**目前本文仍然在排版中**
## 概念快解
### 装饰器模式
这是一种设计模式，它允许向一个现有的对象添加新的功能，同时又不改变其结构。这种类型的设计模式属于结构型模式，它是作为现有的类的一个包装。
### Python的装饰器
Python中的装饰器类似，在现有功能上进行添加功能并且不改变原代码结构。
## 前言故事
最近在学习Python看到方法前面一行@开头代码(如下)很好奇
```python
@test
def demo()
  ...
```
查阅资料后发现其实这是Python装饰器，类似的设计模式称为装饰器模式。
## 一切皆是对象
先别急，我们先理解一个概念，我们在Python可以将一切东西理解为对象，就像Linux一切皆文件的思想。甚至是一个函数其实也是对象
```python
def b():
    print("hi")
a = b
b()
a()
# 结果毫无疑问是两个hi a与b同时将指向同一个函数对象
# a() b() 产生的结果固然一样
```
那么根据以上我们可以知道函数也是可以作为参数进行传递
Python中的一切(是的，甚至是类)都是对象。 我们定义的名称只是绑定到这些对象的标识符。 函数也不例外，它们也是对象(带有属性)。 
## 将函数作为参数
```python
def a1(x):
    return x + 5

def b1(x):
    return x - 5

def operate(func, x):
    result = func(x)
    return result
operate(a1,5)
operate(b1,5)
```
结果是10和0
相信熟悉PHP同学感觉很熟悉了，有类似的感觉了，该函数是一个高阶函数(将其他函数作为参数的函数也称为高阶函数)
## 尝试在函数返回另一个函数
```python
def hi():
    def ret_p():
        print("HelloWorld")
    return ret_p # 返回ret_p函数对象

ret_f = hi() # 获取ret_p函数对象
ret_f() # 执行ret_p函数
```
结果输出HelloWorld，那么这些都是非常简单的，就像新手入门一样。
## 回归装饰器
细细观察以下代码
```python
def a(func):
    def inner():
        print("decorated")
        func()
    return inner

def b():
    print("function")
b()
```
我们发现这段代码这里输出结果是 function
但是我们稍加修改就会实现特殊功能
```python
def a(func):
    def inner():
        print("decorated")
        func()
    return inner

def b():
    print("function")
c = a(b)
c()
```
这样你就会发现结果是decorated和function，
b函数的结果并没有进行任何修改我们就实现了对功能增加
那么我们还可以稍加优化，去掉c直接将修饰好的函数覆盖原来的函数
```python
def a(func):
    def inner():
        print("decorated")
        func()
    return inner

def b():
    print("function")
b = a(b)
b()
```
我们可以发现如果将最后一行c改成b你就发现原b函数的功能被增加了，并且覆盖原功能了，这就Python基础修饰器
但是这和@那行实现的装饰器有什么区别呢，其实以下代码等价于以上代码
```python
def a(func):
    def inner():
        print("decorated")
        func()
    return inner
@a
def b():
    print("function")
b()
```
那么@a的功能代替了原本`b = a(b)`，对函数进行修饰。
那么这样我们就完成了一个最基本的修饰器
## 参数装饰函数
## 待补充
## 待排版
实际上，只要这个对象使用特殊方法实现了__call__()，那么这个对象就是可以被可调用。 
