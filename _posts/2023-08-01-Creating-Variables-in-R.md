---
title: Creating Variables in R
date: '2023-08-01 09:00:00 -0800'
categories: [R, R_Data]
tags: [R, cleaning] # tags always lowercase
author: madison
output: 
  html_document:
    keep_md: TRUE
---




Occasionally we need to derive variables form existing information. A good example of this is conversion between scales. If we wanted to change a measurement from metres to kilometres or weight in pounds to kilograms, we could do this simply by performing a basic operation on an entire column. In this situation, let’s start by multiplying two columns together to create a new column. Recall the GDP dataset from previous articles. Let’s say we want to know the total GDP for the country. This could be calculated by multiplying the population by the GDP_per_Cap.

If you are just starting here, let’s re-load in the Gapminder data that we have been using in previous posts:


```r
link <- 'https://raw.githubusercontent.com/jstaf/gapminder/master/gapminder/gapminder.csv'
df <- read.csv(url(link))
```


```r
df$Total_GDP <- df$pop * df$gdpPercap
head(df)
```

```
##       country continent year lifeExp      pop gdpPercap   Total_GDP
## 1 Afghanistan      Asia 1952  28.801  8425333  779.4453  6567086330
## 2 Afghanistan      Asia 1957  30.332  9240934  820.8530  7585448670
## 3 Afghanistan      Asia 1962  31.997 10267083  853.1007  8758855797
## 4 Afghanistan      Asia 1967  34.020 11537966  836.1971  9648014150
## 5 Afghanistan      Asia 1972  36.088 13079460  739.9811  9678553274
## 6 Afghanistan      Asia 1977  38.438 14880372  786.1134 11697659231
```

Since the number is too large to actually interpret, let’s divide it by 1 billion so that the unit of measure is in billions. We will also rename the column to represent this change.


```r
df$Total_GDP <- df$Total_GDP / 1000000000
# names(df)[names(df) == 'old.var.name'] <- 'new.var.name'
names(df)[names(df) == 'Total_GDP'] <- 'TotalGDP_Bil'
head(df)
```

```
##       country continent year lifeExp      pop gdpPercap TotalGDP_Bil
## 1 Afghanistan      Asia 1952  28.801  8425333  779.4453     6.567086
## 2 Afghanistan      Asia 1957  30.332  9240934  820.8530     7.585449
## 3 Afghanistan      Asia 1962  31.997 10267083  853.1007     8.758856
## 4 Afghanistan      Asia 1967  34.020 11537966  836.1971     9.648014
## 5 Afghanistan      Asia 1972  36.088 13079460  739.9811     9.678553
## 6 Afghanistan      Asia 1977  38.438 14880372  786.1134    11.697659
```

Note that if you were to run this multiple times, it would keep dividing by 1 billion each time, so we want to ensure it is only run once.

Now, let’s say we want to create a new column that contains both the country and continent information together. This is a useful tool if you had information where a first name and last name were separated, or even there was a username and you wanted to create a new column by combining the username and an email extension. Let’s take a look at our example.


```r
df$Country_Cont <- paste(df$country, '_', df$continent)
head(df)
```

```
##       country continent year lifeExp      pop gdpPercap TotalGDP_Bil
## 1 Afghanistan      Asia 1952  28.801  8425333  779.4453     6.567086
## 2 Afghanistan      Asia 1957  30.332  9240934  820.8530     7.585449
## 3 Afghanistan      Asia 1962  31.997 10267083  853.1007     8.758856
## 4 Afghanistan      Asia 1967  34.020 11537966  836.1971     9.648014
## 5 Afghanistan      Asia 1972  36.088 13079460  739.9811     9.678553
## 6 Afghanistan      Asia 1977  38.438 14880372  786.1134    11.697659
##         Country_Cont
## 1 Afghanistan _ Asia
## 2 Afghanistan _ Asia
## 3 Afghanistan _ Asia
## 4 Afghanistan _ Asia
## 5 Afghanistan _ Asia
## 6 Afghanistan _ Asia
```

There are so many different ways to perform an operation like this.

As an exercise, try creating your own column using either a basic mathematical operation on an existing column, or by combining two columns, or anything else you can think of!

Some examples:

1. Create a new column with the first three letters of the country name
2. Create a column to show TRUE if the `TotalGDP_Bil` is greater than 5, FALSE if not.
3. Combine the country name with the year.

Here are the solutions to the examples provided above.


```r
# Solution to #1
df$first_3_letters <- substr(df$country, 1, 3)
head(df)
```

```
##       country continent year lifeExp      pop gdpPercap TotalGDP_Bil
## 1 Afghanistan      Asia 1952  28.801  8425333  779.4453     6.567086
## 2 Afghanistan      Asia 1957  30.332  9240934  820.8530     7.585449
## 3 Afghanistan      Asia 1962  31.997 10267083  853.1007     8.758856
## 4 Afghanistan      Asia 1967  34.020 11537966  836.1971     9.648014
## 5 Afghanistan      Asia 1972  36.088 13079460  739.9811     9.678553
## 6 Afghanistan      Asia 1977  38.438 14880372  786.1134    11.697659
##         Country_Cont first_3_letters
## 1 Afghanistan _ Asia             Afg
## 2 Afghanistan _ Asia             Afg
## 3 Afghanistan _ Asia             Afg
## 4 Afghanistan _ Asia             Afg
## 5 Afghanistan _ Asia             Afg
## 6 Afghanistan _ Asia             Afg
```


```r
# Solution to #2
df$GDP_Bool <- ifelse(df$TotalGDP_Bil > 5, "TRUE", "FALSE")
head(df)
```

```
##       country continent year lifeExp      pop gdpPercap TotalGDP_Bil
## 1 Afghanistan      Asia 1952  28.801  8425333  779.4453     6.567086
## 2 Afghanistan      Asia 1957  30.332  9240934  820.8530     7.585449
## 3 Afghanistan      Asia 1962  31.997 10267083  853.1007     8.758856
## 4 Afghanistan      Asia 1967  34.020 11537966  836.1971     9.648014
## 5 Afghanistan      Asia 1972  36.088 13079460  739.9811     9.678553
## 6 Afghanistan      Asia 1977  38.438 14880372  786.1134    11.697659
##         Country_Cont first_3_letters GDP_Bool
## 1 Afghanistan _ Asia             Afg     TRUE
## 2 Afghanistan _ Asia             Afg     TRUE
## 3 Afghanistan _ Asia             Afg     TRUE
## 4 Afghanistan _ Asia             Afg     TRUE
## 5 Afghanistan _ Asia             Afg     TRUE
## 6 Afghanistan _ Asia             Afg     TRUE
```


```r
# Solution to #3
df$Country_Year <- paste(df$country, '_', df$year)
head(df)
```

```
##       country continent year lifeExp      pop gdpPercap TotalGDP_Bil
## 1 Afghanistan      Asia 1952  28.801  8425333  779.4453     6.567086
## 2 Afghanistan      Asia 1957  30.332  9240934  820.8530     7.585449
## 3 Afghanistan      Asia 1962  31.997 10267083  853.1007     8.758856
## 4 Afghanistan      Asia 1967  34.020 11537966  836.1971     9.648014
## 5 Afghanistan      Asia 1972  36.088 13079460  739.9811     9.678553
## 6 Afghanistan      Asia 1977  38.438 14880372  786.1134    11.697659
##         Country_Cont first_3_letters GDP_Bool       Country_Year
## 1 Afghanistan _ Asia             Afg     TRUE Afghanistan _ 1952
## 2 Afghanistan _ Asia             Afg     TRUE Afghanistan _ 1957
## 3 Afghanistan _ Asia             Afg     TRUE Afghanistan _ 1962
## 4 Afghanistan _ Asia             Afg     TRUE Afghanistan _ 1967
## 5 Afghanistan _ Asia             Afg     TRUE Afghanistan _ 1972
## 6 Afghanistan _ Asia             Afg     TRUE Afghanistan _ 1977
```
