Occasionally we need to derive variables form existing information. A
good example of this is conversion between scales. If we wanted to
change a measurement from metres to kilometres or weight in pounds to
kilograms, we could do this simply by performing a basic operation on an
entire column. In this situation, let’s start by multiplying two columns
together to create a new column. Recall the GDP dataset from previous
articles. Let’s say we want to know the total GDP for the country. This
could be calculated by multiplying the population by the GDP\_per\_Cap.

If you are just starting here, let’s re-load in the original Gapminder
data:

    import pandas as pd
    url = 'https://raw.githubusercontent.com/jstaf/gapminder/master/gapminder/gapminder.csv'
    df = pd.read_csv(url)

    df['Total_GDP'] = df['pop'] * df['gdpPercap']
    df.head()

    ##        country continent  year  lifeExp       pop   gdpPercap     Total_GDP
    ## 0  Afghanistan      Asia  1952   28.801   8425333  779.445314  6.567086e+09
    ## 1  Afghanistan      Asia  1957   30.332   9240934  820.853030  7.585449e+09
    ## 2  Afghanistan      Asia  1962   31.997  10267083  853.100710  8.758856e+09
    ## 3  Afghanistan      Asia  1967   34.020  11537966  836.197138  9.648014e+09
    ## 4  Afghanistan      Asia  1972   36.088  13079460  739.981106  9.678553e+09

Since the number is too large to actually interpret, let’s divide it by
1 billion so that the unit of measure is in billions.

    df['Total_GDP'] = df['Total_GDP'] / 1000000000
    df = df.rename({'Total_GDP': 'TotalGDP_Bil'}, axis = 1)
    df.head()

    ##        country continent  year  lifeExp       pop   gdpPercap  TotalGDP_Bil
    ## 0  Afghanistan      Asia  1952   28.801   8425333  779.445314      6.567086
    ## 1  Afghanistan      Asia  1957   30.332   9240934  820.853030      7.585449
    ## 2  Afghanistan      Asia  1962   31.997  10267083  853.100710      8.758856
    ## 3  Afghanistan      Asia  1967   34.020  11537966  836.197138      9.648014
    ## 4  Afghanistan      Asia  1972   36.088  13079460  739.981106      9.678553

Note that if you were to run this multiple times, it would keep dividing
by 1 billion each time, so we want to ensure it is only run once.

Now, let’s say we want to create a new column that contains both the
country and continent information together. This is a useful tool if you
had information where a first name and last name were separated, or even
there was a username and you wanted to create a new column by combining
the username and an email extension. Let’s take a look at our example.

    df['Country_Cont'] = df['country'].astype(str) + '_' + df['continent']
    df.head()

    ##        country continent  year  ...   gdpPercap  TotalGDP_Bil      Country_Cont
    ## 0  Afghanistan      Asia  1952  ...  779.445314      6.567086  Afghanistan_Asia
    ## 1  Afghanistan      Asia  1957  ...  820.853030      7.585449  Afghanistan_Asia
    ## 2  Afghanistan      Asia  1962  ...  853.100710      8.758856  Afghanistan_Asia
    ## 3  Afghanistan      Asia  1967  ...  836.197138      9.648014  Afghanistan_Asia
    ## 4  Afghanistan      Asia  1972  ...  739.981106      9.678553  Afghanistan_Asia
    ## 
    ## [5 rows x 8 columns]

There are so many different ways to perform an operation like this. You
could use the `apply()` function, the `.agg()` function, `.map()`
function, and more!

As an exercise, try creating your own column using either a basic
mathematical operation on an existing column, or by combining two
columns, or anything else you can think of!

Some examples:

1.  Create a new column with the first three letters of the country name
2.  Convert the total GDP column back to the GDP per cap column by
    multiplying by 1 billion and then dividing by the population.
3.  Combine the country name with the year.

Here are the solutions to the examples provided above.

    # Solution to #1
    df['first_3_letters'] = df.country.str[:3]
    df.head()

    ##        country continent  year  ...  TotalGDP_Bil      Country_Cont  first_3_letters
    ## 0  Afghanistan      Asia  1952  ...      6.567086  Afghanistan_Asia              Afg
    ## 1  Afghanistan      Asia  1957  ...      7.585449  Afghanistan_Asia              Afg
    ## 2  Afghanistan      Asia  1962  ...      8.758856  Afghanistan_Asia              Afg
    ## 3  Afghanistan      Asia  1967  ...      9.648014  Afghanistan_Asia              Afg
    ## 4  Afghanistan      Asia  1972  ...      9.678553  Afghanistan_Asia              Afg
    ## 
    ## [5 rows x 9 columns]

    # Solution to #2
    df['converted_gdp_per_cap'] = df['TotalGDP_Bil'] * 1000000000
    df['converted_gdp_per_cap'] = df['converted_gdp_per_cap'] / df['pop']
    df.head()

    ##        country continent  ...  first_3_letters  converted_gdp_per_cap
    ## 0  Afghanistan      Asia  ...              Afg             779.445314
    ## 1  Afghanistan      Asia  ...              Afg             820.853030
    ## 2  Afghanistan      Asia  ...              Afg             853.100710
    ## 3  Afghanistan      Asia  ...              Afg             836.197138
    ## 4  Afghanistan      Asia  ...              Afg             739.981106
    ## 
    ## [5 rows x 10 columns]

    # Solution to #3
    df['Country_Year'] = df['country'].astype(str) + '_' + df['year'].astype(str)
    df.head()

    ##        country continent  ...  converted_gdp_per_cap      Country_Year
    ## 0  Afghanistan      Asia  ...             779.445314  Afghanistan_1952
    ## 1  Afghanistan      Asia  ...             820.853030  Afghanistan_1957
    ## 2  Afghanistan      Asia  ...             853.100710  Afghanistan_1962
    ## 3  Afghanistan      Asia  ...             836.197138  Afghanistan_1967
    ## 4  Afghanistan      Asia  ...             739.981106  Afghanistan_1972
    ## 
    ## [5 rows x 11 columns]
