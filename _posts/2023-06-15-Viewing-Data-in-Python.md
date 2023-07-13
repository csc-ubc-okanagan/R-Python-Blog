---
title: Viewing Data in Python
date: '2023-06-15 09:00:00 -0800'
categories: [Python, P_Data]
tags: [python] # tags always lowercase
author: madison
output: 
  html_document:
    keep_md: TRUE
---



The Pandas package is the go-to package in Python for data frames and data set analysis.

Let's load in a dataset from a URL and then explore the data. We can enter the URL to the data set and save it as a variable so that it is easily accessible. Since the data set is a `.csv` file, we can use the pandas function `read_csv()` to save the data into a data frame!


```python
import pandas as pd # we nickname it pd to save time when calling it later
url = 'https://raw.githubusercontent.com/jstaf/gapminder/master/gapminder/gapminder.csv'
df = pd.read_csv(url)
```

We name the data set `df` which is short for data frame. This is just a common name used for naming data, but any name could be used depending on preference.

The `head()` function is often used to show the first few rows of a data frame. The default is the first five rows, but you can enter a different value inside the brackets to get the first n number of rows.


```python
df.head()
```

```
##        country continent  year  lifeExp       pop   gdpPercap
## 0  Afghanistan      Asia  1952   28.801   8425333  779.445314
## 1  Afghanistan      Asia  1957   30.332   9240934  820.853030
## 2  Afghanistan      Asia  1962   31.997  10267083  853.100710
## 3  Afghanistan      Asia  1967   34.020  11537966  836.197138
## 4  Afghanistan      Asia  1972   36.088  13079460  739.981106
```

But if we only wanted to see the first 3 rows...

```python
df.head(3)
```

```
##        country continent  year  lifeExp       pop   gdpPercap
## 0  Afghanistan      Asia  1952   28.801   8425333  779.445314
## 1  Afghanistan      Asia  1957   30.332   9240934  820.853030
## 2  Afghanistan      Asia  1962   31.997  10267083  853.100710
```

Remember, Python starts at 0 and not 1, so the first row of data is technically zero! Also, notice that pandas noticed that the first row of the csv file was header names, so it automatically created column titles.

We can also do this for the last few rows of the data set, know as the tail.


```python
df.tail()
```

```
##        country continent  year  lifeExp       pop   gdpPercap
## 1699  Zimbabwe    Africa  1987   62.351   9216418  706.157306
## 1700  Zimbabwe    Africa  1992   60.377  10704340  693.420786
## 1701  Zimbabwe    Africa  1997   46.809  11404948  792.449960
## 1702  Zimbabwe    Africa  2002   39.989  11926563  672.038623
## 1703  Zimbabwe    Africa  2007   43.487  12311143  469.709298
```

We can now explore the data a bit more, looking at the data types and data structures.

We can use the `.info()` function to get a summary of data frame information, such as the count of null values, data types, etc. Take a look below.


```python
df.info()
```

```
## <class 'pandas.core.frame.DataFrame'>
## RangeIndex: 1704 entries, 0 to 1703
## Data columns (total 6 columns):
##  #   Column     Non-Null Count  Dtype  
## ---  ------     --------------  -----  
##  0   country    1704 non-null   object 
##  1   continent  1704 non-null   object 
##  2   year       1704 non-null   int64  
##  3   lifeExp    1704 non-null   float64
##  4   pop        1704 non-null   int64  
##  5   gdpPercap  1704 non-null   float64
## dtypes: float64(2), int64(2), object(2)
## memory usage: 80.0+ KB
```

We can also quickly see summary statistics using the `.describe()` function.


```python
df.describe()
```

```
##              year      lifeExp           pop      gdpPercap
## count  1704.00000  1704.000000  1.704000e+03    1704.000000
## mean   1979.50000    59.474439  2.960121e+07    7215.327081
## std      17.26533    12.917107  1.061579e+08    9857.454543
## min    1952.00000    23.599000  6.001100e+04     241.165876
## 25%    1965.75000    48.198000  2.793664e+06    1202.060309
## 50%    1979.50000    60.712500  7.023596e+06    3531.846988
## 75%    1993.25000    70.845500  1.958522e+07    9325.462346
## max    2007.00000    82.603000  1.318683e+09  113523.132900
```

If we wanted to know the number of unique values of a specific column, we could use the `value_counts()` function.


```python
df.country.value_counts()
```

```
## Afghanistan          12
## Pakistan             12
## New Zealand          12
## Nicaragua            12
## Niger                12
##                      ..
## Eritrea              12
## Equatorial Guinea    12
## El Salvador          12
## Egypt                12
## Zimbabwe             12
## Name: country, Length: 142, dtype: int64
```

This shows that there are 12 occurrences of each unique country value.

If we wanted to know the number of countries recorded for each year, how would we find that information?

We can do so like this:


```python
df.year.value_counts()
```

```
## 1952    142
## 1957    142
## 1962    142
## 1967    142
## 1972    142
## 1977    142
## 1982    142
## 1987    142
## 1992    142
## 1997    142
## 2002    142
## 2007    142
## Name: year, dtype: int64
```

If we wanted to find specific values, let’s say the maximum values, we could use the function `.max()`.


```python
df.max()
```

```
## country         Zimbabwe
## continent        Oceania
## year                2007
## lifeExp           82.603
## pop           1318683096
## gdpPercap    113523.1329
## dtype: object
```

Other similar functions include `.min()`, `.mean()`, and `.median()`.

If we wanted to group by specific data, let’s say country, and then apply an aggregate function, we could do it like this:


```python
df.groupby('country').max()
```

```
##                    continent  year  lifeExp       pop     gdpPercap
## country                                                            
## Afghanistan             Asia  2007   43.828  31889923    978.011439
## Albania               Europe  2007   76.423   3600523   5937.029526
## Algeria               Africa  2007   72.301  33333216   6223.367465
## Angola                Africa  2007   42.731  12420476   5522.776375
## Argentina           Americas  2007   75.320  40301927  12779.379640
## ...                      ...   ...      ...       ...           ...
## Vietnam                 Asia  2007   74.249  85262356   2441.576404
## West Bank and Gaza      Asia  2007   73.422   4018332   7110.667619
## Yemen, Rep.             Asia  2007   62.698  22211743   2280.769906
## Zambia                Africa  2007   51.821  11746035   1777.077318
## Zimbabwe              Africa  2007   62.351  12311143    799.362176
## 
## [142 rows x 5 columns]
```

We can also group by multiple columns.


```python
df.groupby(['country', 'year']).max()
```

```
##                  continent  lifeExp       pop   gdpPercap
## country     year                                         
## Afghanistan 1952      Asia   28.801   8425333  779.445314
##             1957      Asia   30.332   9240934  820.853030
##             1962      Asia   31.997  10267083  853.100710
##             1967      Asia   34.020  11537966  836.197138
##             1972      Asia   36.088  13079460  739.981106
## ...                    ...      ...       ...         ...
## Zimbabwe    1987    Africa   62.351   9216418  706.157306
##             1992    Africa   60.377  10704340  693.420786
##             1997    Africa   46.809  11404948  792.449960
##             2002    Africa   39.989  11926563  672.038623
##             2007    Africa   43.487  12311143  469.709298
## 
## [1704 rows x 4 columns]
```

If we wanted to know the number of countries in each continent recorded for each year, how would we find that information?


```python
df.groupby(['year']).continent.value_counts()
```

```
## year  continent
## 1952  Africa       52
##       Asia         33
##       Europe       30
##       Americas     25
##       Oceania       2
## 1957  Africa       52
##       Asia         33
##       Europe       30
##       Americas     25
##       Oceania       2
## 1962  Africa       52
##       Asia         33
##       Europe       30
##       Americas     25
##       Oceania       2
## 1967  Africa       52
##       Asia         33
##       Europe       30
##       Americas     25
##       Oceania       2
## 1972  Africa       52
##       Asia         33
##       Europe       30
##       Americas     25
##       Oceania       2
## 1977  Africa       52
##       Asia         33
##       Europe       30
##       Americas     25
##       Oceania       2
## 1982  Africa       52
##       Asia         33
##       Europe       30
##       Americas     25
##       Oceania       2
## 1987  Africa       52
##       Asia         33
##       Europe       30
##       Americas     25
##       Oceania       2
## 1992  Africa       52
##       Asia         33
##       Europe       30
##       Americas     25
##       Oceania       2
## 1997  Africa       52
##       Asia         33
##       Europe       30
##       Americas     25
##       Oceania       2
## 2002  Africa       52
##       Asia         33
##       Europe       30
##       Americas     25
##       Oceania       2
## 2007  Africa       52
##       Asia         33
##       Europe       30
##       Americas     25
##       Oceania       2
## Name: continent, dtype: int64
```

Notice that we did not change anything in our original data that we loaded in all of the code blocks above. We just simply viewed the data in different ways. If you wanted to clean the data or create a permanent copy of the grouped values, you would have to save it as a variable by typing a name on the left hand side, the equals sign, and then the action you want saved on the right hand side. For example:


```python
df2 = df.groupby(['year']).continent.value_counts()
```

Here we just did the same thing as earlier, but saved it to a new variable called df2.
