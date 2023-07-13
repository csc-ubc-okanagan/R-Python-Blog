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
