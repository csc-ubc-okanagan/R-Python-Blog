---
title: Introduction to Python
date: '2023-02-15 09:00:00 -0800'
categories: [Python, P_Getting Started]
tags: [python] # tags always lowercase
author: madison
output: 
  html_document:
    keep_md: TRUE
---



## Python can be used as a calculator


```python
1 + 1
```

```
## 2
```




```python
2-3
```

```
## -1
```




```python
6 / 2
```

```
## 3.0
```




```python
3 * 4
```

```
## 12
```



Since Python is so widely used, there are many people who contribute to continuously improving and developing it. Let's imagine Python as a base version. It can do basic calculations, but it requires extra efforts to do more complicated things. People have created extras or add-ons to help create shortcuts for more complicated specific tasks or functions. These 'add-ons' are called packages. Packages can be imported to use to help make things easier. For example, there is a Python package called math that helps with basic mathematical operations. Let's look at an example here of calling the package using the ```import``` command.


```python
import math
math.sqrt(9)
```

```
## 3.0
```

Once it has been imported, it does not need to be re-imported for the rest of this document. You can also import multiple packages within the same document. We will get into more useful packages later on!


```python
math.log(100)
```

```
## 4.605170185988092
```

For now, practice typing basic calculations into your Python terminal to get used to the syntax, and see how easy it is to calculate things!
