---
title: Packages in Python
date: '2023-06-15 09:00:00 -0800'
categories: [Python, P_Getting Started]
tags: [python] # tags always lowercase
author: madison
output: 
  html_document:
    keep_md: TRUE
---



Since Python is so widely used, there are many people who contribute to continuously improving and developing it. Let’s imagine Python as a base version. It can do basic calculations, but it requires extra efforts to do more complicated things. People have created extras or add-ons to help create shortcuts for more complicated specific tasks or functions. These ‘add-ons’ are called modules. A module allows us to use already defined classes, functions, variables, and more. Packages are a collection of similar modules. These modules are stored together in a package to help with storage and ease of use.

Packages can be imported to use to help make things easier. For example, there is a Python package called math that helps with basic mathematical operations.

To use a package or specific module within it, we use the `import` command. The format of these commands is as followed:

`import package.subpackage.modulename`

We can also nickname the packages to make it easier when we use them. This is done using the `as` statement. An example of this is `import pandas as pd`. By doing this, whenever a function from pandas is used, instead of having to type `pandas.function_name`, we can type `pd.function_name`. This may not seem like a big difference, but when it is used repeatedly, this can save a lot of time and effort.

A few of the main packages used in python include:

Package Name | Usage | Standard Import Command
--- | --- | ---
NumPy |	Used for arrays, matricies and mathematical functions |	import numpy as np
pandas |	Used with data frames	| import pandas as pd
matplotlib | Typically used for plotting functions | from matplotlib import pyplot as plt
altair |	More advanced plotting options	| import altair as alt
SciPy	| Used for scientific and technical computing	| import scipy

There are many other packages available, and you can even create your own as well! To see a list of the top packages available in Python, visit this [link](https://www.ubuntupit.com/best-python-libraries-and-packages-for-beginners/#:~:text=Best%20Python%20Libraries%20and%20Packages.%2001.%20Pillow.%20Pillow,Matplotlib.%2003.%20Numpy.%2004.%20OpenCV%20Python.%2005.%20Requests.).
