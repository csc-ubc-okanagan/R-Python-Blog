---
title: Cleaning Data in Python
date: '2023-06-20 09:00:00 -0800'
categories: [Python, P_Data]
tags: [python] # tags always lowercase
author: madison
output: 
  html_document:
    keep_md: TRUE
---



Recall the URL with the country data. Let's use this to practice some preliminary cleaning techniques.


```python
import pandas as pd
url = 'https://raw.githubusercontent.com/jstaf/gapminder/master/gapminder/gapminder.csv'
df = pd.read_csv(url)
```

If we wanted to check and see if there are any empty values in the data frame, we could do so like this:


```python
df.isnull().sum().sum()
```

```
## 0
```

Above, we summed over all rows and columns to see if there were null values. if we wanted to check for null values in just one column, we could do so like this:


```python
df['country'].isnull().sum()
```

```
## 0
```

## Renaming Columns

If we wanted to look at changing the names of the columns in the data frame, whether it is because of formatting or lack of clarity in the existing titles, we can do so easily.

Let’s say we wanted to change `country` to `Country`. In order for the changes to save, we have to update our stored variable by starting the code with `df = ....`


```python
df = df.rename({'country': 'Country'}, axis = 1)
df.head()
```

```
##        Country continent  year  lifeExp       pop   gdpPercap
## 0  Afghanistan      Asia  1952   28.801   8425333  779.445314
## 1  Afghanistan      Asia  1957   30.332   9240934  820.853030
## 2  Afghanistan      Asia  1962   31.997  10267083  853.100710
## 3  Afghanistan      Asia  1967   34.020  11537966  836.197138
## 4  Afghanistan      Asia  1972   36.088  13079460  739.981106
```

Now let’s say we want to change `lifeExp` to `Life_Expectancy`, `pop` to `Population` and `gdpPercap` to `GDP_per_Cap`.


```python
df = df.rename({'lifeExp': 'Life_Expectancy',
                'pop': 'Population',
                'gdpPercap': 'GDP_per_Cap'}, axis = 1)
df.head()
```

```
##        Country continent  year  Life_Expectancy  Population  GDP_per_Cap
## 0  Afghanistan      Asia  1952           28.801     8425333   779.445314
## 1  Afghanistan      Asia  1957           30.332     9240934   820.853030
## 2  Afghanistan      Asia  1962           31.997    10267083   853.100710
## 3  Afghanistan      Asia  1967           34.020    11537966   836.197138
## 4  Afghanistan      Asia  1972           36.088    13079460   739.981106
```

Now that our column titles are in order, we can determine the relevance of all of them. Let’s say our analysis doesn’t need the `continent` column, so we can get rid of it to simplify our data. To delete columns, we can do so like this:


```python
df = df.drop(columns = {'continent'}, axis = 1)
df.head()
```

```
##        Country  year  Life_Expectancy  Population  GDP_per_Cap
## 0  Afghanistan  1952           28.801     8425333   779.445314
## 1  Afghanistan  1957           30.332     9240934   820.853030
## 2  Afghanistan  1962           31.997    10267083   853.100710
## 3  Afghanistan  1967           34.020    11537966   836.197138
## 4  Afghanistan  1972           36.088    13079460   739.981106
```

If we deleted the column by accident, you just have to go back and run the original line of code where we loaded the data set to start fresh and remove the changes.

Let’s take a look at the data types in our data frame.


```python
df.dtypes
```

```
## Country             object
## year                 int64
## Life_Expectancy    float64
## Population           int64
## GDP_per_Cap        float64
## dtype: object
```

Let’s say we want to change `Life_Expectancy` from a float (decimal value) to an integer.


```python
df['Life_Expectancy'] = df['Life_Expectancy'].astype(int)
df.dtypes
```

```
## Country             object
## year                 int64
## Life_Expectancy      int32
## Population           int64
## GDP_per_Cap        float64
## dtype: object
```

We could also convert multiple column types at once like this:


```python
df = df.astype({"Life_Expectancy": float, 
                "Population": float})
df.dtypes
```

```
## Country             object
## year                 int64
## Life_Expectancy    float64
## Population         float64
## GDP_per_Cap        float64
## dtype: object
```

If we wanted to count the number of unique values in a column, we could do so like this:


```python
df.Country.unique().size
```

```
## 142
```

