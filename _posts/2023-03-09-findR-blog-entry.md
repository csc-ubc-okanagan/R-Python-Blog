---
title: Searching for files with the `findR` package
date: '2023-03-09 18:00:00 -0800'
categories: [r]
tags: [r, windows] # tags always lowercase
author: stefano
math: false # to enable math (not on by default)
output:
  html_document:
    keep_md: TRUE
---

<!-- https://chirpy.cotes.page/posts/write-a-new-post/ -->

It is good practice to have descriptive but concise file names so one can easily find the code they are looking for. But as projects grow, the number of scripts can become quite large (unless you are one of those chaotic people that put everything in a single script...). With UNIX computers, one can easily search for code in the a file explorer window, but this does not work with Windows. It is possible to search for files by name, but it is not possible to search for specific content in `R` scripts.

The `findR` package allows Windows users to search for specific strings of code within directories using a simple syntax:


```r
library('findR')
findRscript(pattern = 'a string of code',
            path = 'my-folder',
            case.sensitive = TRUE)
```



The `pattern` argument can be any code string, but note that single and double quotes need to be escaped by placing a `\` before them (i.e., `\'` and `\"`), while some special characters need to be preceeded by `\\`, such as `+`, `(`. Failing to escape and double-escape special characters will cause the function to miss the files or fail:


```r
findRscript('library(\'ctmm\')', path = 'H:/GitHub/env-var-review/analysis')
## Number of R scripts scanned: 5
## Number of R scripts with matching content: 0
## Total number of matches: 0
findRscript('library\\(\'ctmm\'\\)', path = 'H:/GitHub/env-var-review/analysis')
## Number of R scripts scanned: 5
## Number of R scripts with matching content: 3
## Total number of matches: 3
##                                                          path_to_file line
## 1     H:/GitHub/env-var-review/analysis/figures/delta-t-sensitivity.R    2
## 2 H:/GitHub/env-var-review/analysis/hr-simulation-extreme-scenarios.R    1
## 3                  H:/GitHub/env-var-review/analysis/movement-model.R    1
```

The package can also search for `R` Markdown files, PDFs, and text (`.txt`) files via the `findRmd()`, `findPDF()`, and `findtxt()` functions, respectively. Each of the functions can also copy the files that matched the `pattern` argument to a new folder (if `copy = TRUE`, but it is `FALSE` by default). You can decide which folder the files get copied to using the `folder` argument. Note that by default `overwrite` is set to `TRUE`, so any files present with the same name will be overwritten.
