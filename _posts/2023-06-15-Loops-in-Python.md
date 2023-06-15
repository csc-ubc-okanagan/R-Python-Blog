---
title: Loops in Python
date: '2023-06-15 09:00:00 -0800'
categories: [Python, Getting Started]
tags: [python] # tags always lowercase
author: madison
output:
  html_document:
    keep_md: TRUE
---



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
