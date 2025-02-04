---
title: 'Simple linear regression'
date: '2025-02-04 09:00:00 -0800'
categories: [R, R_Modelling]
tags: [r, modelling, linear_models, fitting_models_to_data] # tags always lowercase
author: stefano
output: 
  html_document:
    keep_md: TRUE
---



The original `R` code was written by Stefano Mezzini under the MIT licence and shared in [this GitHub repo](https://github.com/csc-ubc-okanagan/ubco-csc-modeling-workshop/tree/main). The workshop series can be found by clicking [this link](https://events.ok.ubc.ca/series/fitting-models-to-data-not-data-to-models-workshop-series/).

Let's start by attaching all necessary packages and setting the default `ggplot` theme:


``` r
library('dplyr')   # for data wrangling
library('mgcv')    # for modeling
library('ggplot2') # for fancy plots
library('gratia')  # for ggplot-based model graphics
theme_set(theme_classic(base_size = 15))
```

# The assumptions of simple linear regression

To illustrate the assumptions of simple linear regression (and linear models at large), we can simulate some data from a known linear model. Linear models with a single predictor have the form $$Y = \beta_0 + \beta_1 x + \epsilon,$$ where $Y$ is the response (i.e., dependent) variable, $\beta_0$ is the intercept term (i.e. the average $Y$ when $x = 0$), $\beta_1$ is the estimated effect of the predictor (i.e., independent) variable $x$, and $\epsilon$ is the error in $Y$ after accounting for the effect of $x$ (i.e., $\epsilon = Y - \beta_0 - \beta_1 x$). Let $\mu$ be the mean of $Y$ (also known as the expectation: $\mathbb E(Y)$) so that $$\mu = \mathbb E(Y) = \beta_0 + \beta_1 x.$$ Note that now there is no error term because $\mu - (\beta_0 + \beta_1 x) = 0$ by definition since that $Y = \mu + \epsilon$. In linear models, the error should follow a normal distribution with mean zero and variance $\sigma^2$, which we write as $\epsilon \sim N(0, \sigma^2)$. This implies that $Y \sim N(\mu, \sigma^2)$.

The code below simulates data from a linear model with intercept $\beta_0 = 4$, slope $\beta_1 = -3$, and error sampled from a normal distribution with mean 0 (since we want the data to have no bias) and standard deviation $\sigma = 1$, which we can write as $\epsilon \sim N(0, 1)$, conditional on the model (i.e., after accounting for $x$).


``` r
set.seed(-100) # for consistent results
d0 <- tibble(x = runif(n = 100), # predictor of Y
             mu = 4 - 3 * x, # true mean of Y
             e = rnorm(n = length(x), mean = 0, sd = 1), # simulated Gaussian error
             Y = mu + e) # simulated values of Y
```

The figure shows the simulated data as points and the true relationship as the red line:

![](/figures/2025-02-04-simple-linear-regression/figure-html/unnamed-chunk-4-1.png)<!-- -->

Single linear regression is based on five assumptions (although some people group some of them together):

1. **$Y$ is random while $x$ is fixed**: $Y$ is a random variable, so it has a nonzero variance, and its mean can only be estimated rather than known. In contrast, $x$ is assumed to be known exactly, so there is no error or uncertainty in $x$. This is because the experimenter is in control of the dependent variable but not of the independent variable (its response). While $x$ may have some measurement error, we assume it's negligible. There are ways to account for error in $x$, but they require more complex models.

*Note: In statistics, random variables are generally indicated using capital letters (e.g., $Y$), while values that are (assumed to be) known and fixed are indicated with lowercase letters (e.g., $x$).*

![](/figures/2025-02-04-simple-linear-regression/figure-html/unnamed-chunk-5-1.png)<!-- -->

2. **Linearity**: The true relationship between $x$ and the mean of $Y$, $\mathbb E(Y) = \mu,$ is linear.

![](/figures/2025-02-04-simple-linear-regression/figure-html/unnamed-chunk-6-1.png)<!-- -->

3. **Homoscedasticity**: The variance of the error term, $\epsilon$, is constant. This should be reflected in the estimated error, $e$, which we call the residuals (i.e., what is left over after explaining the change in $Y$ due to $x$).

![](/figures/2025-02-04-simple-linear-regression/figure-html/unnamed-chunk-7-1.png)<!-- -->

4. **Independence**: Errors are independent of each other. This means that no two values $e_i$ and $e_j$ should depend on one another (for $i \ne j$). For example, in the plot below, there should be no trends in the residuals over the observation order; the line should move up and down like random noise. If there are trends, you should try understanding why and account for this in the model (e.g., acconting for differences between groups; explained in a later post). In the example below, the error I generated is random, so there should be no trends **on average**, but our eyes are often good at finding patterns that occur by change (see observations 1 to 12).

![](/figures/2025-02-04-simple-linear-regression/figure-html/unnamed-chunk-8-1.png)<!-- -->

5. **Normality of the errors**: The error follows a Gaussian (i.e., normal) distribution with mean 0 and variance $\sigma^2$, i.e., $\epsilon \sim N(0, \sigma^2)$. If the assumption is true, the residuals should (generally) follow an approximately Gaussian distribution. We can check this assumption with a histogram and a quantile-quantile plot (also referred to as a Q-Q plot). Histograms should show a relatively bell-shaped distribution, and points in a Q-Q plot should fall close to the reference line, with more points near zero and less far from zero. Histograms are helpful for visualizing the overall relationship, while Q-Q plots are helpful for visualizing the thickness of the tails of the distribution. In the example below, 

*Note: Your sample of residuals may not quite have a Gaussian distribution even if when the true error is actually Gaussian.*

![](/figures/2025-02-04-simple-linear-regression/figure-html/unnamed-chunk-9-1.png)<!-- -->![](/figures/2025-02-04-simple-linear-regression/figure-html/unnamed-chunk-9-2.png)<!-- -->

You may see assumptions 4 and 5 grouped together as $\epsilon \overset{\text{iid}} \sim N(0,\sigma^2)$, which means that the errors are independent and identically distributed (iid) following a Gaussian distribution with mean 0 and variance $\sigma^2$.

If you're interested on seeing some examples on checking assumptions using models fit to real data, see [this post](missing).
