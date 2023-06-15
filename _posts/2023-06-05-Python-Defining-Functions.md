---
title: Defining Functions in Python
date: '2023-06-15 09:00:00 -0800'
categories: [Python, Getting Started]
tags: [python] # tags always lowercase
author: madison
output:
  html_document:
    keep_md: TRUE
---

Functions take in data and do things with that data. We can write our own functions, but generally in Python we’ll be using functions that have already been written or built. 

Simple functions can be in base Python or in different packages. Take these base Python functions for example:


```python
sum((1,1))
```

```
## 2
```



```python
max([1, 2, 5, 8, 3])
```

```
## 8
```

Calling a function requires 2 things: the function itself and any arguments the function allows us to specify – one of these arguments is the data source, but there are usually other parameters we can specify.

If we want to understand how the built-in functions work, let’s define our own function for addition. We start by naming it, and then defining the arguments. Here, let's call it 'add' and it will take in two numbers, so we set the arbitrary names of these arguments to x and y.


```python
def add(x,y):
    answer = x + y
    return answer

add(1,1)
```

```
## 2
```

This is cool, but unnecessary work. It’s much easier to use the built-in function that we use above. This is why packages are so useful. Other people have spent time defining functions to do typical tasks, so we can use the existing work rather than duplicating effort. 

Note that there may be limitations or unexpected behaviours to a function. What would happen if we added x+y in this function?


```python
add('x','y')
```

```
## 'xy'
```

This is something to consider when creating functions! It may not always be used for its intended use.

If we wanted to create a function to reverse a number, we could do that first by defining the name of our function, as well as how many arguments it requires. At the end, a function will need to do something either by using the command `return` or `print` or something else, otherwise it serves no purpose.

With this function, if we input the number 12345, we would expect it to return 54321.


```python
def reverse_num(number):
  num = number
  reversed_num = 0
  while num != 0:
    digit = num % 10
    reversed_num = reversed_num * 10 + digit
    num //= 10
  print("Reversed Number: " + str(reversed_num))
  
reverse_num(12345)
```

```
## Reversed Number: 54321
```

It works! Can you think of any limitations or unexpected uses for this function?
