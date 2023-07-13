When we talk about data, we can talk about data types, data classes, and
data structures.

Data types are fundamental building blocks for storing information.
Below, we can see a chart of all of the datatypes in Python.

<table>
<colgroup>
<col style="width: 22%" />
<col style="width: 27%" />
<col style="width: 27%" />
<col style="width: 22%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;"><span style="color:lightBlue">English
name</span></th>
<th style="text-align: center;"><span style="color:lightBlue">Type
name</span></th>
<th style="text-align: center;"><span
style="color:lightBlue">Description</span></th>
<th style="text-align: right;"><span
style="color:lightBlue">Example</span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">integer</td>
<td style="text-align: center;"><strong>int</strong></td>
<td style="text-align: center;">positive/negative whole numbers</td>
<td style="text-align: right;"><span style="color:green">13</span></td>
</tr>
<tr class="even">
<td style="text-align: left;">floating point number</td>
<td style="text-align: center;"><strong>float</strong></td>
<td style="text-align: center;">real number in decimal form</td>
<td style="text-align: right;"><span
style="color:green">3.1415</span></td>
</tr>
<tr class="odd">
<td style="text-align: left;">boolean</td>
<td style="text-align: center;"><strong>bool</strong></td>
<td style="text-align: center;">true or false</td>
<td style="text-align: right;"><span
style="color:green">True</span></td>
</tr>
<tr class="even">
<td style="text-align: left;">string</td>
<td style="text-align: center;"><strong>str</strong></td>
<td style="text-align: center;">text</td>
<td style="text-align: right;"><span style="color:green">“Do you like
Python?”</span></td>
</tr>
<tr class="odd">
<td style="text-align: left;">list</td>
<td style="text-align: center;"><strong>list</strong></td>
<td style="text-align: center;">a collection of objects - mutable &amp;
ordered</td>
<td style="text-align: right;"><span
style="color:green">[‘Hi’,‘Hello’,‘Hola’]</span></td>
</tr>
<tr class="even">
<td style="text-align: left;">tuple</td>
<td style="text-align: center;"><strong>tuple</strong></td>
<td style="text-align: center;">a collection of objects - immutable
&amp; ordered</td>
<td style="text-align: right;"><span
style="color:green">(‘Tuesday’,3,14,2023)</span></td>
</tr>
<tr class="odd">
<td style="text-align: left;">dictionary</td>
<td style="text-align: center;"><strong>dict</strong></td>
<td style="text-align: center;">mapping of key-value pairs</td>
<td style="text-align: right;"><span
style="color:green">{‘name’:‘Madison’,‘Program’:‘Data
Science’,‘Age’:23}</span></td>
</tr>
<tr class="even">
<td style="text-align: left;">none</td>
<td style="text-align: center;"><strong>NoneType</strong></td>
<td style="text-align: center;">represents no value</td>
<td style="text-align: right;"><span
style="color:green">None</span></td>
</tr>
</tbody>
</table>

Note that character data, also known as strings, are always wrapped in
“quotation marks”. You can use single quotes like ‘this’ or double
quotes like “this”. As long as you use two of the same, it doesn’t
matter which you use!

We can use the function `type()` to view the datatype of the stored
value in a variable. Let’s explore a few examples of this.

    # Datatype 
    x = 1 + 1
    type(x)

    ## <class 'int'>

    x = 2.0
    type(x)

    ## <class 'float'>

    # String
    string = 'Okanagan'
    print(string)

    ## Okanagan

    type(x)

    ## <class 'float'>

## Comparison Operators

We can compare objects (or variables) using comparison operators. The
result is a Boolean value. Recall from above that a Boolean gives either
a True or False.

First, let’s look at a table of the different comparison operators.

#### Comparison Operators

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;"><span
style="color:blue">Operator</span></th>
<th style="text-align: left;"><span
style="color:blue">Description</span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><span style="color:green">x ==
y</span></td>
<td style="text-align: left;">is <span style="color:green">x</span>
equal to <span style="color:green">y</span>?</td>
</tr>
<tr class="even">
<td style="text-align: left;"><span style="color:green">x !=
y</span></td>
<td style="text-align: left;">is <span style="color:green">x</span> not
equal to <span style="color:green">y</span>?</td>
</tr>
<tr class="odd">
<td style="text-align: left;"><span style="color:green">x &gt;
y</span></td>
<td style="text-align: left;">is <span style="color:green">x</span>
greater than <span style="color:green">y</span>?</td>
</tr>
<tr class="even">
<td style="text-align: left;"><span style="color:green">x &gt;=
y</span></td>
<td style="text-align: left;">is <span style="color:green">x</span>
greater than or equal to <span style="color:green">y</span>?</td>
</tr>
<tr class="odd">
<td style="text-align: left;"><span style="color:green">x &lt;
y</span></td>
<td style="text-align: left;">is <span style="color:green">x</span> less
than <span style="color:green">y</span>?</td>
</tr>
<tr class="even">
<td style="text-align: left;"><span style="color:green">x &lt;=
y</span></td>
<td style="text-align: left;">is <span style="color:green">x</span> less
than or equal to <span style="color:green">y</span>?</td>
</tr>
<tr class="odd">
<td style="text-align: left;"><span style="color:green">x is
y</span></td>
<td style="text-align: left;">is <span style="color:green">x</span> the
same object as <span style="color:green">y</span>?</td>
</tr>
<tr class="even">
<td style="text-align: left;"><span style="color:green">x and
y</span></td>
<td style="text-align: left;">are <span style="color:green">x</span> and
<span style="color:green">y</span> both true?</td>
</tr>
<tr class="odd">
<td style="text-align: left;"><span style="color:green">x or
y</span></td>
<td style="text-align: left;">is at least one of <span
style="color:green">x</span> and <span style="color:green">y</span>
true?</td>
</tr>
<tr class="even">
<td style="text-align: left;"><span style="color:green">not
x</span></td>
<td style="text-align: left;">is <span style="color:green">x</span>
false?</td>
</tr>
</tbody>
</table>

Now, let’s look at a few examples.

    5 < 7

    ## True

    five = 5
    seven = 7
    five < seven

    ## True

    5.0 == 5

    ## True

    5.0 == '5'

    ## False

## Lists

Lists are an important tool used in Python. Lists can contain elements
of mixed types as well. Let’s look at a few examples.

    # List
    list1 = []
    list1

    ## []

    list2 = [1, 'UBC', 100]
    list2

    ## [1, 'UBC', 100]

Now let’s see a few operations we can perform on a list.

    len(list1)

    ## 0

    len(list2)

    ## 3

    # Indexing Example - we will talk more about this later on
    list2[2]

    ## 100

Note - Python indexing starts at zero, so the first element in the list
is 0, the second is 1, and the third is 2, so if we actually wanted the
second element, we would have to do this:

    list2[1]

    ## 'UBC'

    type(list2)

    ## <class 'list'>

    type(list2[1])

    ## <class 'str'>

As we mentioned earlier, a main difference between lists and tuples is
that lists are mutable. Mutable means that elements in a list can be
appended, changed, or deleted.

    mixed_list = [1, 'UBC', 5.0, '1']
    mixed_list.append('New')
    mixed_list

    ## [1, 'UBC', 5.0, '1', 'New']

If we decided that we wanted to replace ‘New’ with 4, we could do so
like this:

    mixed_list[4]= 4
    mixed_list

    ## [1, 'UBC', 5.0, '1', 4]

If we wanted to remove elements from the list, we could do so like this:

    mixed_list.remove('UBC')
    mixed_list

    ## [1, 5.0, '1', 4]

Note that this will only remove the first occurrence, if this happened
to be in the list more than once. It would also call an error message if
the element doesn’t exist.

If we wanted to remove it based on the index of the list:

    del mixed_list[0]
    mixed_list

    ## [5.0, '1', 4]

## Dictionaries

A dictionary lists key-value pairs, which could also be thought of as
associated values where a key matches to the associated value. Let’s
look at a few examples.

    # Dictionary - mapping between values
    house = {'bedrooms': 3, 'bathrooms': 2, 
             'city': 'Kelowna', 'price': 250000}

    house['price']

    ## 250000

    course = {'Data Science': ['DATA100', 'DATA200', 'DATA300'],
                'Science': ['SCIENCE100', 'SCIENCE200', 'SCIENCE300']}

    course['Data Science']

    ## ['DATA100', 'DATA200', 'DATA300']

## Loops

Loops are a common tool used in Python to help users iterate through
lists, or perform the same operation numerous times without added
efforts.

Let’s look at a few examples:

    # Loops

    for n in [0, 1, 5, 2, -5]:
        # this is inside the loop
        print("The number is", n, "and its squared value is", n**2)
    # this is outside the loop

    ## The number is 0 and its squared value is 0
    ## The number is 1 and its squared value is 1
    ## The number is 5 and its squared value is 25
    ## The number is 2 and its squared value is 4
    ## The number is -5 and its squared value is 25

    ## Loop
    s = "Python"
    for c in s:
        print(c + "!")

    ## P!
    ## y!
    ## t!
    ## h!
    ## o!
    ## n!

    # range(10) sets values 0-9, because recall Python starts at 0, not 1
    for i in range(10):
        print(i)

    ## 0
    ## 1
    ## 2
    ## 3
    ## 4
    ## 5
    ## 6
    ## 7
    ## 8
    ## 9

This is equivalent to writing:

    for i in range(0,10):
        print(i)

    ## 0
    ## 1
    ## 2
    ## 3
    ## 4
    ## 5
    ## 6
    ## 7
    ## 8
    ## 9

If we wanted it to start at 1 and go to 10 (inclusive), we would write:

    for i in range(1,11):
        print(i)

    ## 1
    ## 2
    ## 3
    ## 4
    ## 5
    ## 6
    ## 7
    ## 8
    ## 9
    ## 10

Other examples:

    #(start,end,increments)
    for i in range(0,101,10):
        print(i)

    ## 0
    ## 10
    ## 20
    ## 30
    ## 40
    ## 50
    ## 60
    ## 70
    ## 80
    ## 90
    ## 100

    n = 3
    while n > 0:
        print(n)
        n = n - 1

    ## 3
    ## 2
    ## 1

    print("Smile!")

    ## Smile!

## Data Frames

A data frame essentially functions as a series of connected vectors or
lists, where each vector or list is a column. In this sense a data frame
is also a special kind of list.

In a data frame, all vectors need to be of the same length. And while
each vector must hold the same data type, not all vectors need to be of
the same data type. Data frames also allow us to apply column names.

Let’s look at an example of creating a dataframe from two lists.

    letter_list = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i']
    number_list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    import pandas as pd
    df = pd.DataFrame(
        {'Letters': letter_list,
         'Numbers': number_list})

    df

    ##   Letters  Numbers
    ## 0       a        1
    ## 1       b        2
    ## 2       c        3
    ## 3       d        4
    ## 4       e        5
    ## 5       f        6
    ## 6       g        7
    ## 7       h        8
    ## 8       i        9

Alternatively, you could write a data frame directly like this:

    df1 = pd.DataFrame({'x' : [1., 2., 3., 4.],
                       'y' : [4., 3., 2., 1.],
                       'z' : [1, 2, 3, 4]})
    df1

    ##      x    y  z
    ## 0  1.0  4.0  1
    ## 1  2.0  3.0  2
    ## 2  3.0  2.0  3
    ## 3  4.0  1.0  4

Data frames are a VERY powerful data type in Python. We will spend most
of our remaining time working with data frames because there is so much
to learn about.
