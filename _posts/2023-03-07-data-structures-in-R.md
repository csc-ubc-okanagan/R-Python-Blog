There are many different data structure types in `R`, each with varying
levels of complexity and uses. The simplest data structure in `R` is a
vector. Vectors are one-dimensional arrays (i.e., sets of values) of a
single class (such as characters, numbers, dates, etc.), and they have a
similar structure to the mathematical concept of vectors. For example,
the vector *v⃗* with values 1, 4, 6, 2 would be:

$$\vec v = \begin{bmatrix}1 \\\\ 4 \\\\ 6 \\\\ 2\end{bmatrix}.$$

In `R` we can create vectors using the `c()` function, as follows:

    v <- c(1, 4, 6, 2)
    v

    ## [1] 1 4 6 2

(`R` prints vectors in a line rather than as columns to improve
readability.)

Since vectors can only contain elements of a common type, `c()` will
force all elements to be of a single class. In the example below, I
create a vector with the number 1, the letter “a”, today’s date, and the
value `TRUE` (a boolean value), but `c()` coerces all values to be
characters:

    c(1, 'a', Sys.Date(), TRUE)

    ## [1] "1"     "a"     "19551" "TRUE"

If we place two vectors (of the same class) side by side, we can create
a matrix. Matrices are thus two-dimensional arrays

    # 2D arrays: matrices
    matrix(data = 1:8, nrow = 2)

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    3    5    7
    ## [2,]    2    4    6    8

    matrix(data = 1:8, ncol = 2)

    ##      [,1] [,2]
    ## [1,]    1    5
    ## [2,]    2    6
    ## [3,]    3    7
    ## [4,]    4    8

    matrix(data = 1:8, ncol = 2, byrow = TRUE)

    ##      [,1] [,2]
    ## [1,]    1    2
    ## [2,]    3    4
    ## [3,]    5    6
    ## [4,]    7    8

    # matrix operations
    matrix(1:9, ncol = 3)

    ##      [,1] [,2] [,3]
    ## [1,]    1    4    7
    ## [2,]    2    5    8
    ## [3,]    3    6    9

    matrix(1:9, ncol = 3) + 3

    ##      [,1] [,2] [,3]
    ## [1,]    4    7   10
    ## [2,]    5    8   11
    ## [3,]    6    9   12

    matrix(1:9, ncol = 3) * 2 # NOT matrix multiplication

    ##      [,1] [,2] [,3]
    ## [1,]    2    8   14
    ## [2,]    4   10   16
    ## [3,]    6   12   18

    matrix(1:9, ncol = 3) %*% 6:8 # matrix multiplication

    ##      [,1]
    ## [1,]   90
    ## [2,]  111
    ## [3,]  132

    matrix(1:9, ncol = 3) %*% matrix(1:6, ncol = 2)

    ##      [,1] [,2]
    ## [1,]   30   66
    ## [2,]   36   81
    ## [3,]   42   96

    # grouping objects with different and types: lists
    l <- list(letters = c('a', 'b', 'c'),
              numbers = 1:10,
              today = Sys.Date())
    l

    ## $letters
    ## [1] "a" "b" "c"
    ## 
    ## $numbers
    ##  [1]  1  2  3  4  5  6  7  8  9 10
    ## 
    ## $today
    ## [1] "2023-07-13"

    l$letters

    ## [1] "a" "b" "c"

    l$today

    ## [1] "2023-07-13"

    # lists with a table-like structure: data frames
    #' note: `data.frame()` recycles elements if the longest vector is a multiple
    data.frame(numbers = 1:10,
               letters = c('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'))

    ##    numbers letters
    ## 1        1       a
    ## 2        2       b
    ## 3        3       c
    ## 4        4       d
    ## 5        5       e
    ## 6        6       f
    ## 7        7       g
    ## 8        8       h
    ## 9        9       i
    ## 10      10       j
