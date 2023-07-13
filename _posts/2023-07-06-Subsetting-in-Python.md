Sometimes the data frame we are working with can be very large and take
a while to process. Alternatively, we could only need a portion of the
information. There is a way to filter through a data frame such that
only the specified information is used, which saves space and time!

Let’s re-load in our Gapminder data:

    import pandas as pd
    url = 'https://raw.githubusercontent.com/jstaf/gapminder/master/gapminder/gapminder.csv'
    df = pd.read_csv(url)

We know that we can select just one column like this below:

    df['country']

    ## 0       Afghanistan
    ## 1       Afghanistan
    ## 2       Afghanistan
    ## 3       Afghanistan
    ## 4       Afghanistan
    ##            ...     
    ## 1699       Zimbabwe
    ## 1700       Zimbabwe
    ## 1701       Zimbabwe
    ## 1702       Zimbabwe
    ## 1703       Zimbabwe
    ## Name: country, Length: 1704, dtype: object

So if we wanted to create a new data frame by filtering our existing
data frame for entries where the country column has the value ‘Canada’,
we can do so like this:

    df_2 = df[df['country'] == 'Canada']
    df_2.head()

    ##     country continent  year  lifeExp       pop    gdpPercap
    ## 240  Canada  Americas  1952    68.75  14785584  11367.16112
    ## 241  Canada  Americas  1957    69.96  17010154  12489.95006
    ## 242  Canada  Americas  1962    71.30  18985849  13462.48555
    ## 243  Canada  Americas  1967    72.13  20819767  16076.58803
    ## 244  Canada  Americas  1972    72.88  22284500  18970.57086

Alternatively, if we didn’t want to create a new data frame, but we
wanted to view just a subset of the data frame temporarily, we could
write this:

    cols = ['country', 'continent', 'pop']
    df[cols]

    ##           country continent       pop
    ## 0     Afghanistan      Asia   8425333
    ## 1     Afghanistan      Asia   9240934
    ## 2     Afghanistan      Asia  10267083
    ## 3     Afghanistan      Asia  11537966
    ## 4     Afghanistan      Asia  13079460
    ## ...           ...       ...       ...
    ## 1699     Zimbabwe    Africa   9216418
    ## 1700     Zimbabwe    Africa  10704340
    ## 1701     Zimbabwe    Africa  11404948
    ## 1702     Zimbabwe    Africa  11926563
    ## 1703     Zimbabwe    Africa  12311143
    ## 
    ## [1704 rows x 3 columns]

We could also perform operations such as `.mean()`, `.median()`,
`.max()`, etc. using filtering. An example of this can be found below.

    cols = ['lifeExp', 'pop', 'gdpPercap']
    df[cols].mean()

    ## lifeExp      5.947444e+01
    ## pop          2.960121e+07
    ## gdpPercap    7.215327e+03
    ## dtype: float64

We can select different row & column combinations as well by indexing.
If we wanted to select just the first entry in the first row and column,
remembering that Python starts indexing at 0, it would look like this:

    df.iloc[0,0]

    ## 'Afghanistan'

`.iloc()` is a function that helps us select a particular cell in the
data set. We can also use it to select the first row entirely.

    df.iloc[0]

    ## country      Afghanistan
    ## continent           Asia
    ## year                1952
    ## lifeExp           28.801
    ## pop              8425333
    ## gdpPercap     779.445314
    ## Name: 0, dtype: object

We could also use it to select the first 3 rows like this:

    df.iloc[:3]

    ##        country continent  year  lifeExp       pop   gdpPercap
    ## 0  Afghanistan      Asia  1952   28.801   8425333  779.445314
    ## 1  Afghanistan      Asia  1957   30.332   9240934  820.853030
    ## 2  Afghanistan      Asia  1962   31.997  10267083  853.100710

Which is equivalent to:

    df.iloc[0:3]

    ##        country continent  year  lifeExp       pop   gdpPercap
    ## 0  Afghanistan      Asia  1952   28.801   8425333  779.445314
    ## 1  Afghanistan      Asia  1957   30.332   9240934  820.853030
    ## 2  Afghanistan      Asia  1962   31.997  10267083  853.100710

If we wanted to select the first column only:

    df.iloc[:,0]

    ## 0       Afghanistan
    ## 1       Afghanistan
    ## 2       Afghanistan
    ## 3       Afghanistan
    ## 4       Afghanistan
    ##            ...     
    ## 1699       Zimbabwe
    ## 1700       Zimbabwe
    ## 1701       Zimbabwe
    ## 1702       Zimbabwe
    ## 1703       Zimbabwe
    ## Name: country, Length: 1704, dtype: object

And then if we wanted to select all rows but only the second and third
columns, we could do so like this:

    df.iloc[:, 1:3]

    ##      continent  year
    ## 0         Asia  1952
    ## 1         Asia  1957
    ## 2         Asia  1962
    ## 3         Asia  1967
    ## 4         Asia  1972
    ## ...        ...   ...
    ## 1699    Africa  1987
    ## 1700    Africa  1992
    ## 1701    Africa  1997
    ## 1702    Africa  2002
    ## 1703    Africa  2007
    ## 
    ## [1704 rows x 2 columns]

## Logical Subsetting

So far, we haven’t applied many conditions to our subsets, but we can.
In logical subsetting, the subset defaults to returning the results
where the condition is TRUE.

Recall, Python allows us to specify several conditions:

-   less than &gt;
-   greater than &lt;
-   less than or equal to &lt;=
-   greater than or equal &gt;=
-   equivalent to ==
-   not equivalent to !=

As well as boolean operators

-   or |
-   and &

<!-- -->

    df_3 = df[df['pop'] > 10000000] # all variables for when population is greater than 10 million
    df_3.head() 

    ##        country continent  year  lifeExp       pop   gdpPercap
    ## 2  Afghanistan      Asia  1962   31.997  10267083  853.100710
    ## 3  Afghanistan      Asia  1967   34.020  11537966  836.197138
    ## 4  Afghanistan      Asia  1972   36.088  13079460  739.981106
    ## 5  Afghanistan      Asia  1977   38.438  14880372  786.113360
    ## 6  Afghanistan      Asia  1982   39.854  12881816  978.011439

If we wanted to filter by country name and year, without saving to a new
data frame, we can do so like this:

    df[(df['country'] == 'Canada') & (df['year'] >= 2000)]

    ##     country continent  year  lifeExp       pop    gdpPercap
    ## 250  Canada  Americas  2002   79.770  31902268  33328.96507
    ## 251  Canada  Americas  2007   80.653  33390141  36319.23501

Let’s say you want to know the average life expectancy in Australia for
all recorded years before 2000. Try this as an exercise. To calculate
this, we will first have to filter our data frame with two conditions,
and then we will have to calculate the mean.

Hint: We can calculate the mean for all columns at once, and then just
read off the Life Expectancy value to get the answer we are looking for.

There are multiple ways to solve this. See the solutions below:

    # Solution 1
    df[(df['country'] == 'Australia') & (df['year'] < 2000)].mean(numeric_only = True)

    ## year         1.974500e+03
    ## lifeExp      7.343500e+01
    ## pop          1.358108e+07
    ## gdpPercap    1.746440e+04
    ## dtype: float64

    # Solution 2
    filtered_df = df[(df['country'] == 'Australia') & (df['year'] < 2000)]
    filtered_df['lifeExp'].mean()

    ## 73.435

There are many different ways that will lead to the same answer! Try to
think of another way to do it!
