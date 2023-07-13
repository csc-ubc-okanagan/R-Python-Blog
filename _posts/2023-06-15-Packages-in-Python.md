Since Python is so widely used, there are many people who contribute to
continuously improving and developing it. Let’s imagine Python as a base
version. It can do basic calculations, but it requires extra efforts to
do more complicated things. People have created extras or add-ons to
help create shortcuts for more complicated specific tasks or functions.
These ‘add-ons’ are called modules. A module allows us to use already
defined classes, functions, variables, and more. Packages are a
collection of similar modules. These modules are stored together in a
package to help with storage and ease of use.

Packages can be imported to use to help make things easier. For example,
there is a Python package called math that helps with basic mathematical
operations.

To use a package or specific module within it, we use the `import`
command. The format of these commands is as followed:

`import package.subpackage.modulename`

We can also nickname the packages to make it easier when we use them.
This is done using the `as` statement. An example of this is
`import pandas as pd`. By doing this, whenever a function from pandas is
used, instead of having to type `pandas.function_name`, we can type
`pd.function_name`. This may not seem like a big difference, but when it
is used repeatedly, this can save a lot of time and effort.

A few of the main packages used in python include:

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>Package Name</th>
<th>Usage</th>
<th>Standard Import Command</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>NumPy</td>
<td>Used for arrays, matricies and mathematical functions</td>
<td>import numpy as np</td>
</tr>
<tr class="even">
<td>pandas</td>
<td>Used with data frames</td>
<td>import pandas as pd</td>
</tr>
<tr class="odd">
<td>matplotlib</td>
<td>Typically used for plotting functions</td>
<td>from matplotlib import pyplot as plt</td>
</tr>
<tr class="even">
<td>altair</td>
<td>More advanced plotting options</td>
<td>import altair as alt</td>
</tr>
<tr class="odd">
<td>SciPy</td>
<td>Used for scientific and technical computing</td>
<td>import scipy</td>
</tr>
</tbody>
</table>

There are many other packages available, and you can even create your
own as well! To see a list of the top packages available in Python,
visit this
[link](https://www.ubuntupit.com/best-python-libraries-and-packages-for-beginners/#:~:text=Best%20Python%20Libraries%20and%20Packages.%2001.%20Pillow.%20Pillow,Matplotlib.%2003.%20Numpy.%2004.%20OpenCV%20Python.%2005.%20Requests.).
