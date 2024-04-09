---
title: Sample Data Generation
date: '2024-04-09 09:00:00 -0800'
categories: [Python, R]
tags: [python, r] # tags always lowercase
author: nijiati
output: 
  html_document:
    keep_md: TRUE
---



## Creating Sample Datasets

This guide provides instructions on how to create sample datasets in `R` and `Python`. You can use these methods to generate a mini version of your original dataset for data consultations, enabling efficient and effective analysis on a manageable subset of your data. We assume you know how to read in your data, however, if you need step by step instructions on this, these are available further down the page for both `R` and `Python`.

### `R`

**Prerequisites**

You will need `dplyr` installed. You can double check that you have it installed:


```r
find.package("dplyr") # returns an error if the package is not installed, else returns the path to the package
```

```
## [1] "/Library/Frameworks/R.framework/Versions/4.3-arm64/Resources/library/dplyr"
```

And install it if necessary:


```r
install.packages("dplyr") # REQUIRED
```

We want a minimum of 10 samples per variable or a maximum of 40% of your data if there is concern that 10 samples per variable will be insufficient for demonstration purposes. We want to store the output as an `R` object.

**10 samples per variable**

* Replace `your_data_frame` in the second line with the name you assigned to your data on import.
* Replace `"path/to/your/file.RData"` in the last line with the path and file name to save your sampled data to.


```r
library(dplyr)
df_to_sample <- your_data_frame
n_samples <- ncol(df_to_sample) * 10 # calculate the number of variables in your data frame and multiply by 10
sampled_data <- df_to_sample %>% slice_sample(n_samples) # take the sample
save(sampled_data, file = "path/to/your/file.RData") # choose a location to save your RData file with the .RData extension
```

Bring the resulting .RData file with you to your consultation.

**40% of your observations**

* Replace `your_data_frame` in the second line with the name you assigned to your data on import.
* Replace `"path/to/your/file.RData"` in the last line with the path and file name to save your sampled data to.


```r
library(dplyr)
df_to_sample <- your_data_frame
n_samples <- round(nrow(df_to_sample) * 0.4) # calculate the number of observations in your data frame and multiply by 0.4
sampled_data <- df_to_sample %>% slice_sample(n_samples) # take the sample
save(sampled_data, file = "path/to/your/file.RData") # choose a location to save your RData file with the .RData extension
```

Bring the resulting .RData file with you to your consultation.

### `Python`

We want a minimum of 10 samples per variable or a maximum of 40% of your data if there is concern that 10 samples per variable will be insufficient for demonstration purposes. We want to store the output as a csv file.

**10 samples per variable**

* Replace `your_data_frame` in the second line with the name you assigned to your data on import.
* Replace `"path/to/your/file.RData"` in the last line with the path and file name to save your sampled data to.


```python
import pandas as pd
df_to_sample = your_data_frame
n_samples = len(df_to_sample.columns) * 10 # calculate the number of variables in your data frame and multiply by 10
sampled_data = df_to_sample.sample(n = n_samples) # take the sample
sampled_data.to_csv("path/to/your/file.csv") # choose a location to save your csv file with a .csv extension
```

Bring the resulting .csv filw with you to your consultation.

**40% of your observations**

* Replace `your_data_frame` in the second line with the name you assigned to your data on import.
* Replace `"path/to/your/file.RData"` in the last line with the path and file name to save your sampled data to.


```python
import pandas as pd
df_to_sample = your_data_frame
n_samples = round(df_to_sample.shape[0] * 0.4) # calculate the number of observations in your data frame and multiply by 0.4
sampled_data = df_to_sample.sample(n = n_samples) # take the sample
sampled_data.to_csv("path/to/your/file.csv") # choose a location to save your csv file with a .csv extension
```

## Importing data

### Importing Data into `R`

**Prerequisites**

Make sure you have the `readr` package for CSV, `readxl` package for Excel, or `jsonlite` package for JSON installed. If not, you can install them using:


```r
install.packages("readr") # if reading in csv or other delimited rectangular data
install.packages("readxl") # if reading in Excel files
install.packages("jsonlite") # if reading in JSON files
```

-   Import CSV file:


```r
library(readr)
df_to_sample <- read_csv('path/to/your/file.csv')
```

-   Import Excel file:


```r
library(readxl)
df_to_sample <- read_excel('path/to/your/file.xlsx')
```

-   Import JSON file


```r
library(jsonlite)
df_to_sample <- fromJSON('path/to/your/file.json')
```

### Importing Data in `Python`

-   Import CSV file:


```python
import pandas as pd
df_to_sample = pd.read_csv('path/to/your/file.csv')
```

-   Import Excel file:


```python
import pandas as pd
df_to_sample = pd.read_excel('path/to/your/file.xlsx')
```

-   Import JSON file:


```python
import pandas as pd
df_to_sample = pd.read_json('path/to/your/file.json')
```
