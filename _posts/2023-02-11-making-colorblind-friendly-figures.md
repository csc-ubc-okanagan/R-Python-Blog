---
title: Making colorblind-friendly figures
date: '2023-02-11 10:00:00 -0800'
categories: [figures, ggplot]
tags: [r, figures, ggplot, colorblind] # tags always lowercase
author: stefano
math: false # to enable math (not on by default)
output:
  html_document:
    keep_md: TRUE
---

<!-- https://chirpy.cotes.page/posts/write-a-new-post/ -->



The default color palettes `ggplot2` provides are generally good enough for a quick check, but they are overused and do not have very high contrast:


```r
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

![](/figures/2023-02-11-making-colorblind-friendly-figures_files/figure-html/unnamed-chunk-1-1.png)<!-- -->

Additionally, they are not colorblind-friendly:


```r
cvd_grid(p)
```

![](/figures/2023-02-11-making-colorblind-friendly-figures_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

While `ggplot2` offers additional color palettes with more contrast, many of them are still not colorblind-friendly:


```r
p + scale_color_brewer(type = 'qual', palette = 6)
```

![](/figures/2023-02-11-making-colorblind-friendly-figures_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

```r
cvd_grid(p + scale_color_brewer(type = 'qual', palette = 6))
```

![](/figures/2023-02-11-making-colorblind-friendly-figures_files/figure-html/unnamed-chunk-3-2.png)<!-- -->

And while the `viridis` palette (from the `viridisLite` package and included in the `ggplot2` package) can be a good option for continuous palettes, it can still be hard to distinguish between colors in qualitative palettes:


```r
p + scale_color_viridis_d()
```

![](/figures/2023-02-11-making-colorblind-friendly-figures_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

```r
cvd_grid(p + scale_color_viridis_d())
```

![](/figures/2023-02-11-making-colorblind-friendly-figures_files/figure-html/unnamed-chunk-4-2.png)<!-- -->

The `khroma` package provides multiple high-contrast, colorblind-friendly palettes for qualitative, diverging and sequential data, based on the work of Paul Tol (https://personal.sron.nl/~pault/) and Fabio Crameri (https://www.fabiocrameri.ch/).


```r
p + khroma::scale_color_bright()
```

![](/figures/2023-02-11-making-colorblind-friendly-figures_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

```r
cvd_grid(p + scale_color_bright())
```

![](/figures/2023-02-11-making-colorblind-friendly-figures_files/figure-html/unnamed-chunk-5-2.png)<!-- -->

However, it is best to also use different shapes (in addition to different colors), when possible, to ensure people are able to distinguish between each legend item (which can be difficult with many colors -- compare colors for 3 and 8 for deutan and protan versions, as well as the desaturated version). We can do this by specifying the `shape` argument. Note that we also need to change the name of the shape legend to ensure we get a single legend:


```r
p_sh <-
  ggplot(mtcars, aes(disp, mpg, color = factor(carb))) +
  geom_point(aes(shape = factor(carb))) +
  labs(x = 'Displacement (cubic inches)', y = 'Miles per gallon (US)',
       color = 'Carburetors', shape = 'Carburetors')
p_sh
```

![](/figures/2023-02-11-making-colorblind-friendly-figures_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

```r
cvd_grid(p_sh)
```

![](/figures/2023-02-11-making-colorblind-friendly-figures_files/figure-html/unnamed-chunk-6-2.png)<!-- -->

### Continuous vs discrete `khroma` color palettes

Unlike with the `ggplot` functions for color palettes, the `khroma` function names do not specify whether the function will produce a continuous or discrete color palette. To avoid confusion, you can type `khroma::scale_color_` and press `Tab` to see what functions the package offers, and a helpful window should show up beside the function suggestion:

![](/figures/khroma-function-help.png)

(*If you want to change your RStudio theme, see [this tutorial](https://csc-ubc-okanagan.github.io/R-Python-Blog/posts/changing-rstudio-theme/).*)

### Installing the necessary packages

To install `colorblindr`, you will first need to install the `cowplot` and `colorspace` packages:


```r
remotes::install_github("wilkelab/cowplot")
install.packages("colorspace", repos = "http://R-Forge.R-project.org")
remotes::install_github("clauswilke/colorblindr")
install.packages('khroma')
```

To read the help files for any of the functions in the packages, use the `?` function, e.g. `?scale_color_bright`.
