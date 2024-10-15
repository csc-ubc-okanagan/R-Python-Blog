---
title: Transforming data
date: '2024-10-07 14:00:00 -0800'
categories: [R, modeling]
tags: [R, rstudio] # tags always lowercase
author: stefano
output: 
  html_document:
    keep_md: TRUE
editor_options: 
  chunk_output_type: console
---



<!-- This blog covers data transformations in `R`. If you use `Python`, see [this post](needs-a-url). -->

# Transforming response variables

Data transformations are often taught in introductory quantitative and statistics courses as methods for dealing with non-Gaussian (i.e., not normal) data, whether it be bounded (e.g, strictly positive) or skewed ([https://ubco-biology.github.io/BIOL202/transform.html](https://ubco-biology.github.io/BIOL202/transform.html); Section 13.3 in Whitlock & Schluter 2020). In this post, I use simulated data to demonstrate issues that might arise with transforming data. I use a simulated dataset rather than an empirical one so we can compare the model results to the truth.

Imagine that a dangerous intersection has been causing frequent accidents between motored vehicles. A local group of concerned citizens decides to count the number of monthly accidents and report it to City Council. City Council decides to intervene by placing better street signs and lighting. The group of citizens then decided to count the number of accidents again to test whether or not there was an improvement in the number of accidents.

For the sake of this post, let's assume that the mean number of accidents in the 12 months before the intervention was $\lambda_0=2$ per month. In the 12 months after the intervention, the mean number of monthly accidents decreases to $\lambda_1 = 0.4$. We can then simulate data for before and after the intervention as follows:


``` r
library('dplyr')   # for data wrangling
library('tidyr')   # for data wrangling
library('mgcv')    # for modeling
library('ggplot2') # for fancy plots
library('gratia')  # for diagnostic plots in ggplot

# change default ggplot theme
theme_set(theme_bw() +
            theme(panel.grid = element_blank(), legend.position = 'top',
                  text = element_text(face = 'bold')))

set.seed(2024+10+7) # for reproducible results
d <- expand_grid(month = 1:12,
                 period = factor(c('before', 'after'),
                                 levels = c('before', 'after'))) %>%
  mutate(lambda = if_else(period == 'before', true = 2, false = 0.4),
         accidents = rpois(n = n(), lambda = lambda))

ggplot(d) +
  facet_wrap(~ period, ncol = 1) +
  geom_histogram(aes(accidents), binwidth = 1, fill = 'grey',
                 color = 'black') +
  geom_vline(aes(xintercept = lambda), color = 'darkorange', lwd = 1) +
  labs(x = 'Accidents per month', y = 'Count')
```

![](figures/2024-10-07-transforming-data/unnamed-chunk-1-1.png)

