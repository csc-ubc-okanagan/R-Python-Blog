---
title: Python Data Types
date: '2023-06-15 09:00:00 -0800'
categories: [Python, P_Getting Started]
tags: [python] # tags always lowercase
author: madison
output: 
  html_document:
    keep_md: TRUE
---



When we talk about data, we can talk about data types, data classes, and data structures.

Data types are fundamental building blocks for storing information. Below, we can see a chart of all of the datatypes in Python.


| <span style="color:lightBlue">English name</span>  | <span style="color:lightBlue">Type name</span>  | <span style="color:lightBlue">Description</span>   | <span style="color:lightBlue">Example</span>  |
| :---         | :---:     | :---:                           | ---:    |
|integer       |**int**        |positive/negative whole numbers   |<span style="color:green">13</span>       |
|floating point number|**float** |real number in decimal form     |<span style="color:green">3.1415</span>|
|boolean       |**bool**        |true or false                    |<span style="color:green">True</span>|
|string        |**str**         |text                             |<span style="color:green">"Do you like Python?"</span>|
|list          |**list**        |a collection of objects - mutable & ordered |<span style="color:green">['Hi','Hello','Hola']</span>|
|tuple         |**tuple**       |a collection of objects - immutable & ordered|<span style="color:green">('Tuesday',3,14,2023)</span>|
|dictionary    |**dict**       |mapping of key-value pairs       |<span style="color:green">{'name':'Madison','Program':'Data Science','Age':23}</span>|
|none          |**NoneType**    |represents no value              |<span style="color:green">None</span>|

Note that character data, also known as strings, are always wrapped in “quotation marks”. You can use single quotes like ‘this’ or double quotes like “this”. As long as you use two of the same, it doesn’t matter which you use!

We can use the function `type()` to view the datatype of the stored value in a variable. Let’s explore a few examples of this.



```python
# Datatype 
x = 1 + 1
type(x)
```

```
## <class 'int'>
```


```python
x = 2.0
type(x)
```

```
## <class 'float'>
```


```python
# String
string = 'Okanagan'
print(string)
```

```
## Okanagan
```

```python
type(x)
```

```
## <class 'float'>
```
## Comparison Operators

We can compare objects (or variables) using comparison operators. The result is a Boolean value. Recall from above that a Boolean gives either a True or False.

First, let's look at a table of the different comparison operators.

#### Comparison Operators

|<span style="color:blue">Operator</span> | <span style="color:blue">Description</span> |
| :--- | :--- |
|<span style="color:green">x == y</span>|is <span style="color:green">x</span> equal to <span style="color:green">y</span>?|
|<span style="color:green">x != y</span>|is <span style="color:green">x</span> not equal to <span style="color:green">y</span>?|
|<span style="color:green">x > y</span>|is <span style="color:green">x</span> greater than <span style="color:green">y</span>?|
|<span style="color:green">x >= y</span>|is <span style="color:green">x</span> greater than or equal to <span style="color:green">y</span>?|
|<span style="color:green">x < y</span>|is <span style="color:green">x</span> less than <span style="color:green">y</span>?|
|<span style="color:green">x <= y</span>|is <span style="color:green">x</span> less than or equal to <span style="color:green">y</span>?|
|<span style="color:green">x is y</span>|is <span style="color:green">x</span> the same object as <span style="color:green">y</span>?|
|<span style="color:green">x and y</span>|are <span style="color:green">x</span> and <span style="color:green">y</span> both true?|
|<span style="color:green">x or y</span>| is at least one of <span style="color:green">x</span> and <span style="color:green">y</span> true?|
|<span style="color:green">not x</span>| is <span style="color:green">x</span> false? |

Now, let's look at a few examples.


```python
5 < 7
```

```
## True
```


```python
five = 5
seven = 7
five < seven
```

```
## True
```


```python
5.0 == 5
```

```
## True
```


```python
5.0 == '5'
```

```
## False
```


## Lists

Lists are an important tool used in Python. Lists can contain elements of mixed types as well. Let's look at a few examples.


```python
# List
list1 = []
list1
```

```
## []
```


```python
list2 = [1, 'UBC', 100]
list2
```

```
## [1, 'UBC', 100]
```

Now let's see a few operations we can perform on a list.


```python
len(list1)
```

```
## 0
```


```python
len(list2)
```

```
## 3
```


```python
# Indexing Example - we will talk more about this later on
list2[2]
```

```
## 100
```
Note - Python indexing starts at zero, so the first element in the list is 0, the second is 1, and the third is 2, so if we actually wanted the second element, we would have to do this:


```python
list2[1]
```

```
## 'UBC'
```


```python
type(list2)
```

```
## <class 'list'>
```


```python
type(list2[1])
```

```
## <class 'str'>
```


As we mentioned earlier, a main difference between lists and tuples is that lists are mutable. Mutable means that elements in a list can be appended, changed, or deleted. 


```python
mixed_list = [1, 'UBC', 5.0, '1']
mixed_list.append('New')
mixed_list
```

```
## [1, 'UBC', 5.0, '1', 'New']
```
If we decided that we wanted to replace 'New' with 4, we could do so like this:


```python
mixed_list[4]= 4
mixed_list
```

```
## [1, 'UBC', 5.0, '1', 4]
```
If we wanted to remove elements from the list, we could do so like this:


```python
mixed_list.remove('UBC')
mixed_list
```

```
## [1, 5.0, '1', 4]
```

Note that this will only remove the first occurrence, if this happened to be in the list more than once. It would also call an error message if the element doesn't exist.

If we wanted to remove it based on the index of the list:


```python
del mixed_list[0]
mixed_list
```

```
## [5.0, '1', 4]
```

## Dictionaries

A dictionary lists key-value pairs, which could also be thought of as associated values where a key matches to the associated value. Let's look at a few examples.


```python
# Dictionary - mapping between values
house = {'bedrooms': 3, 'bathrooms': 2, 
         'city': 'Kelowna', 'price': 250000}
```



```python
house['price']
```

```
## 250000
```



```python
course = {'Data Science': ['DATA100', 'DATA200', 'DATA300'],
            'Science': ['SCIENCE100', 'SCIENCE200', 'SCIENCE300']}
```



```python
course['Data Science']
```

```
## ['DATA100', 'DATA200', 'DATA300']
```

## Loops

Loops are a common tool used in Python to help users iterate through lists, or perform the same operation numerous times without added efforts.

Let's look at a few examples:


```python
# Loops

for n in [0, 1, 5, 2, -5]:
    # this is inside the loop
    print("The number is", n, "and its squared value is", n**2)
# this is outside the loop
```

```
## The number is 0 and its squared value is 0
## The number is 1 and its squared value is 1
## The number is 5 and its squared value is 25
## The number is 2 and its squared value is 4
## The number is -5 and its squared value is 25
```


```python
## Loop
s = "Python"
for c in s:
    print(c + "!")
```

```
## P!
## y!
## t!
## h!
## o!
## n!
```


```python
# range(10) sets values 0-9, because recall Python starts at 0, not 1
for i in range(10):
    print(i)
```

```
## 0
## 1
## 2
## 3
## 4
## 5
## 6
## 7
## 8
## 9
```

This is equivalent to writing:


```python
for i in range(0,10):
    print(i)
```

```
## 0
## 1
## 2
## 3
## 4
## 5
## 6
## 7
## 8
## 9
```

If we wanted it to start at 1 and go to 10 (inclusive), we would write:


```python
for i in range(1,11):
    print(i)
```

```
## 1
## 2
## 3
## 4
## 5
## 6
## 7
## 8
## 9
## 10
```

Other examples:


```python
#(start,end,increments)
for i in range(0,101,10):
    print(i)
```

```
## 0
## 10
## 20
## 30
## 40
## 50
## 60
## 70
## 80
## 90
## 100
```


```python
n = 3
while n > 0:
    print(n)
    n = n - 1
```

```
## 3
## 2
## 1
```

```python
print("Smile!")
```

```
## Smile!
```

## Data Frames

A data frame essentially functions as a series of connected vectors or lists, where each vector or list is a column. In this sense a data frame is also a special kind of list.

In a data frame, all vectors need to be of the same length. And while each vector must hold the same data type, not all vectors need to be of the same data type. Data frames also allow us to apply column names.

Let's look at an example of creating a dataframe from two lists.


```python
letter_list = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i']
number_list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
import pandas as pd
df = pd.DataFrame(
    {'Letters': letter_list,
     'Numbers': number_list})

df
```

```
##   Letters  Numbers
## 0       a        1
## 1       b        2
## 2       c        3
## 3       d        4
## 4       e        5
## 5       f        6
## 6       g        7
## 7       h        8
## 8       i        9
```

Alternatively, you could write a data frame directly like this:


```python
df1 = pd.DataFrame({'x' : [1., 2., 3., 4.],
                   'y' : [4., 3., 2., 1.],
                   'z' : [1, 2, 3, 4]})
df1
```

```
##      x    y  z
## 0  1.0  4.0  1
## 1  2.0  3.0  2
## 2  3.0  2.0  3
## 3  4.0  1.0  4
```

Data frames are a VERY powerful data type in Python. We will spend most of our remaining time working with data frames because there is so much to learn about. 

