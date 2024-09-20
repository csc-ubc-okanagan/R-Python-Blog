---
title: Making Colorblind-Friendly Figures
date: '2023-02-11 10:00:00 -0800'
categories: [R, R_Visualization]
tags: [R, figures, ggplot, colorblind] # tags always lowercase
author: stefano
math: false # to enable math (not on by default)
output: 
  html_document:
    keep_md: TRUE
---


The default color palettes `ggplot2` provides are generally good enough for a quick check, but they are overused and do not have very high contrast:


``` r
library('ggplot2')     # for fancy figures
library('khroma')      # for fancy palettes
library('cowplot')     # for fancy multi-panel figures
library('colorspace')  # required by colorblindr
library('colorblindr') # to simulate colorblind vision

theme_set(theme_bw()) # change default ggplot theme

p <-
  ggplot(mtcars, aes(disp, mpg, color = factor(carb))) +
  geom_point() +
  labs(x = 'Displacement (cubic inches)', y = 'Miles per gallon (US)',
       color = 'Carburetors')
p
```

![](/figures/2023-02-11-making-colorblind-friendly-figures_files/figure-html/unnamed-chunk-1-1.png)

