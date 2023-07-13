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

What if we wanted to turn the following information into a dictionary.

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Name</th>
<th style="text-align: left;">ID</th>
<th style="text-align: left;">Campus</th>
<th style="text-align: left;">Courses</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Dan</td>
<td style="text-align: left;">12345678</td>
<td style="text-align: left;">Okanagan</td>
<td style="text-align: left;">DATA100, ENGL100, HIST100, CHEM100</td>
</tr>
</tbody>
</table>

This is how we would do this:

    student = {'Name' : 'Dan',
                'ID' : 12345678,
                'Campus' : 'Okanagan',
                'Courses': ['DATA100', 'ENGL100', 'HIST100', 'CHEM100']}
    student

    ## {'Name': 'Dan', 'ID': 12345678, 'Campus': 'Okanagan', 'Courses': ['DATA100', 'ENGL100', 'HIST100', 'CHEM100']}
