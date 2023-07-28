---
title: Visualizing with Altair in Python
date: '2023-06-15 09:00:00 -0800'
categories: [Python, P_Visualization]
tags: [python] # tags always lowercase
author: madison
output: 
  html_document:
    keep_md: TRUE
---



Matplotlib is a standard package used in Python for plotting. This is a basic plotting package, but does have limitations.

If you are familiar with R, you may have used ggplot2 before. In Python, the equivalent package would be Altair. We will take a look at some basic Altair plotting tools.

Let’s switch things up now and use a different data set to visualize. Like R, Python has a few built-in data sets. A popular R dataset, iris, can also be found in Python. Let’s load the iris data set here.


```python
import statsmodels.api as sm
iris = sm.datasets.get_rdataset('iris').data
iris
```

```
##      Sepal.Length  Sepal.Width  Petal.Length  Petal.Width    Species
## 0             5.1          3.5           1.4          0.2     setosa
## 1             4.9          3.0           1.4          0.2     setosa
## 2             4.7          3.2           1.3          0.2     setosa
## 3             4.6          3.1           1.5          0.2     setosa
## 4             5.0          3.6           1.4          0.2     setosa
## ..            ...          ...           ...          ...        ...
## 145           6.7          3.0           5.2          2.3  virginica
## 146           6.3          2.5           5.0          1.9  virginica
## 147           6.5          3.0           5.2          2.0  virginica
## 148           6.2          3.4           5.4          2.3  virginica
## 149           5.9          3.0           5.1          1.8  virginica
## 
## [150 rows x 5 columns]
```

Let’s first start by looking at matplotlib.

We will take a look at a scatterplot of the first two columns in iris.


```python
import matplotlib.pyplot as plt
plt.scatter(x = iris['Sepal.Length'], y = iris['Sepal.Width'])
```


![](/figures/altair-plot-1.png)<!-- -->


How about a boxplot?


```python
new_data = iris[["Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"]]
new_data.boxplot()
```

![](/figures/altair-plot-2.png)<!-- -->

If we wanted to add a title and axis labels to the plot:


```python
new_data.boxplot()
plt.title("Sample Boxplot")
plt.xlabel("Measurements")
plt.ylabel("Values")
```


![](/figures/altair-plot-3.png)<!-- -->

We can also use the functions `plt.hist()` and `plt.bar()` to generate histograms and boxplots, respectively.

Now, let’s take a look at a few of Altair’s functions.

In order to use Altair, we have to change the column names because it does not support the functionality with `Column.Name`.


```python
# rename columns
iris = iris.rename(columns={'Sepal.Length': 'SepalLength', 
                            'Sepal.Width': 'SepalWidth',
                           'Petal.Length': 'PetalLength',
                           'Petal.Width': 'PetalWidth'})
iris
```

```
##      SepalLength  SepalWidth  PetalLength  PetalWidth    Species
## 0            5.1         3.5          1.4         0.2     setosa
## 1            4.9         3.0          1.4         0.2     setosa
## 2            4.7         3.2          1.3         0.2     setosa
## 3            4.6         3.1          1.5         0.2     setosa
## 4            5.0         3.6          1.4         0.2     setosa
## ..           ...         ...          ...         ...        ...
## 145          6.7         3.0          5.2         2.3  virginica
## 146          6.3         2.5          5.0         1.9  virginica
## 147          6.5         3.0          5.2         2.0  virginica
## 148          6.2         3.4          5.4         2.3  virginica
## 149          5.9         3.0          5.1         1.8  virginica
## 
## [150 rows x 5 columns]
```

Let’s check the data types.


```python
iris.dtypes
```

```
## SepalLength    float64
## SepalWidth     float64
## PetalLength    float64
## PetalWidth     float64
## Species         object
## dtype: object
```

Now that we’re ready, let’s view a scatter plot of the first two columns in iris.


```python
import altair as alt
alt.Chart(iris).mark_point().encode(
      x = 'SepalLength',
      y = 'SepalWidth'
)
```

![](/figures/altair-1.png)<!-- -->

If we wanted to view this same scatterplot but also distinguish by colour, we could add in one small line at the end. Also, let’s add some axis titles and change the scale to reduce the white space.


```python
alt.Chart(iris, title="Comparing Sepal Length to Sepal Width").mark_point().encode(
      x = alt.X('SepalLength', title = 'Sepal Length', scale = alt.Scale(domain = (4,9))),
      y = alt.Y('SepalWidth', title = 'Sepal Width', scale = alt.Scale(domain = (1.5,4.5))),
      color = 'Species'
)
```

![](/figures/altair-2.png)<!-- -->

Unfortunately, Altair only accepts the US spelling of colour!

We see that the red and orange are a bit hard to distinguish. We can add in different shapes to help distinguish between species.


```python
alt.Chart(iris, title="Comparing Sepal Length to Sepal Width").mark_point().encode(
      x = alt.X('SepalLength', title = 'Sepal Length', scale = alt.Scale(domain = (4,9))),
      y = alt.Y('SepalWidth', title = 'Sepal Width', scale = alt.Scale(domain = (1.5,4.5))),
      color = 'Species',
      shape = 'Species'
)
```

![](/figures/altair-3.png)<!-- -->

## Tooltips

There is a feature in Altair called a `tooltip` that allows users to interact with the plot.

Let’s add a tooltip to the scatterplot above to see how it looks. Note that this blog formatting will not allow for the interactive elements, but if you copy this code into Jupyter Notebook or R Studio, you will see that when you hover over each individual point, it will list the values specified in the tooltip argument.


```python
alt.Chart(iris, title="Comparing Sepal Length to Sepal Width").mark_point().encode(
      x = alt.X('SepalLength', title = 'Sepal Length', scale = alt.Scale(domain = (4,9))),
      y = alt.Y('SepalWidth', title = 'Sepal Width', scale = alt.Scale(domain = (1.5,4.5))),
      color = 'Species',
      shape = 'Species',
      tooltip = ('Species'))
```

![](/figures/altair-4.png)<!-- -->

Notice that when you hover over the point, it lists the species value, because that is the one variable that we specified under the tooltip argument.

We can add as many different columns to the tooltip as we want.


```python
alt.Chart(iris, title="Comparing Sepal Length to Sepal Width").mark_point().encode(
      x = alt.X('SepalLength', title = 'Sepal Length', scale = alt.Scale(domain = (4,9))),
      y = alt.Y('SepalWidth', title = 'Sepal Width', scale = alt.Scale(domain = (1.5,4.5))),
      color = 'Species',
      shape = 'Species',
      tooltip = (['Species','SepalLength','SepalWidth','PetalLength','PetalWidth'])
)
```

![](/figures/altair-5.png)<!-- -->

Another feature we can add is the ability to make the graph interactive. This would allow the user to scroll or zoom. Note that this blog formatting will not allow for the interactive elements, but if you copy this code into Jupyter Notebook or R Studio, you will see that you can zoom to change the X and Y axis ranges.


```python
alt.Chart(iris, title="Comparing Sepal Length to Sepal Width").mark_point().encode(
      x = alt.X('SepalLength', title = 'Sepal Length', scale = alt.Scale(domain = (4,9))),
      y = alt.Y('SepalWidth', title = 'Sepal Width', scale = alt.Scale(domain = (1.5,4.5))),
      color = 'Species',
      shape = 'Species',
      tooltip = (['Species','SepalLength','SepalWidth','PetalLength','PetalWidth'])
).interactive()
```

![](/figures/altair-6.png)<!-- -->

Notice also there is a function called `mark_circle()` which is different than `mark_point()`.

We can show the same graph as above, but with `mark_circle()` instead of `mark_point()`.


```python
alt.Chart(iris, title="Comparing Sepal Length to Sepal Width").mark_circle().encode(
      x = alt.X('SepalLength', title = 'Sepal Length', scale = alt.Scale(domain = (4,9))),
      y = alt.Y('SepalWidth', title = 'Sepal Width', scale = alt.Scale(domain = (1.5,4.5))),
      color = 'Species',
      shape = 'Species',
      tooltip = (['Species','SepalLength','SepalWidth','PetalLength','PetalWidth'])
).interactive()
```

![](/figures/altair-7.png)<!-- -->

Let’s take a look at `mark_line()`, and let’s remove the shape argument.


```python
alt.Chart(iris, title="Comparing Sepal Length to Sepal Width").mark_line().encode(
      x = alt.X('SepalLength', title = 'Sepal Length', scale = alt.Scale(domain = (4,9))),
      y = alt.Y('SepalWidth', title = 'Sepal Width', scale = alt.Scale(domain = (1.5,4.5))),
      color = 'Species',
      tooltip = (['Species','SepalLength','SepalWidth','PetalLength','PetalWidth'])
).interactive()
```

![](/figures/altair-8.png)<!-- -->

We can overlay plots on top of each other. Let’s plot the scatterplot and lines together.


```python
line = alt.Chart(iris, title="Comparing Sepal Length to Sepal Width").mark_line().encode(
      x = alt.X('SepalLength', title = 'Sepal Length', scale = alt.Scale(domain = (4,9))),
      y = alt.Y('SepalWidth', title = 'Sepal Width', scale = alt.Scale(domain = (1.5,4.5))),
      color = 'Species',
      tooltip = (['Species','SepalLength','SepalWidth','PetalLength','PetalWidth'])
).interactive()

point = alt.Chart(iris).mark_point().encode(
  x = 'SepalLength',
  y = 'SepalWidth',
   color = 'Species')

line + point
```

![](/figures/altair-9.png)<!-- -->

We can also show multiple plots at once using the arguments we learned in part 3.

Recall:

- or means horizontal and it is represented by `|`
- and means vertical and it is represented by `&`

Try looking at them horizontally by typing `line | point`

Then, try looking at them stacked vertically by typing `line & point`

We can also combine these features to design whatever layout you would like. First, let’s introduce a boxplot.

If we wanted to show a boxplot for the different petal lengths, we could do so like this:


```python
alt.Chart(iris, title = 'Petal Lengths of Species').mark_boxplot().encode(
      x = alt.X('Species', title = 'Type of Species'),
      y = alt.Y('PetalLength', title = 'Petal Length')
)
```
![](/figures/altair-10.png)<!-- -->

To make it look nicer, we could add colour to each species, and then store it as a variable.


```python
box = alt.Chart(iris, title = 'Petal Lengths of Species').mark_boxplot().encode(
      x = alt.X('Species', title = 'Type of Species'),
      y = alt.Y('PetalLength', title = 'Petal Length'),
      color = 'Species'
)
box
```

![](/figures/altair-11.png)<!-- -->

If you want to show multiple plots in the same window, you can show 2 or more. Try writing `line | point | box`.

You can also mix and match operators. Using brackets will help to organize the layout. Try writing `line | (point & box)`.

Many different Altair charts can be created using `mark_bar()`, `mark_line()`, `mark_point()`, `mark_rect()`, and so many more!

A complete list can be found [here](https://altair-viz.github.io/gallery/index.html)!



