---
title: Basic Model Fitting in R
date: '2023-08-01 09:00:00 -0800'
categories: [R, R_Modelling]
tags: [R, modelling] # tags always lowercase
author: madison
output: 
  html_document:
    keep_md: TRUE
---



In previous categories we have looked at cleaning, summarizing, and subsetting data, with some minor calculations, but we haven’t yet looked at analyzing our data.

R is a very powerful tool for data analysis. We can fit linear models and view graphs. First, we will look at some basic data analysis processes in R.

Let’s re-load in our Gapminder data:


```r
link <- 'https://raw.githubusercontent.com/jstaf/gapminder/master/gapminder/gapminder.csv'
df <- read.csv(url(link))
head(df)
```

```
##       country continent year lifeExp      pop gdpPercap
## 1 Afghanistan      Asia 1952  28.801  8425333  779.4453
## 2 Afghanistan      Asia 1957  30.332  9240934  820.8530
## 3 Afghanistan      Asia 1962  31.997 10267083  853.1007
## 4 Afghanistan      Asia 1967  34.020 11537966  836.1971
## 5 Afghanistan      Asia 1972  36.088 13079460  739.9811
## 6 Afghanistan      Asia 1977  38.438 14880372  786.1134
```

# Linear Modelling

Let’s say we want to fit a linear model to see if there is a relationship between population and time. First, let’s do this with the entire dataset with all countries. 

We know that there is Simple Linear Regression (SLR) and Multiple Linear Regression (MLR). See the pseudocode below for a layout on how to form both in R.


```r
# Simple Linear Regression
# model_name <- lm(Y ~ X, data = dataframe)

# Multiple Linear Regression
# model_name <- lm(Y ~ X1 + X2 + ..., data = dataframe)
# model_name <- lm(Y ~ ., data = dataframe) to use all variables except Y
```

Now that we have the layout of the code down, let's use Y as population and X as year for an SLR model.


```r
model1 <- lm(pop ~ year, data = df)
summary(model1)
```

```
## 
## Call:
## lm(formula = pop ~ year, data = df)
## 
## Residuals:
##        Min         1Q     Median         3Q        Max 
##  -43318856  -27548179  -18558743   -9628265 1275164661 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -972185807  294031308  -3.306 0.000965 ***
## year            506081     148533   3.407 0.000672 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 105800000 on 1702 degrees of freedom
## Multiple R-squared:  0.006775,	Adjusted R-squared:  0.006191 
## F-statistic: 11.61 on 1 and 1702 DF,  p-value: 0.0006716
```
Now, let's perform MLR with two variables, year and lifeExp.


```r
model2 <- lm(pop ~ year + lifeExp, data = df)
summary(model2)
```

```
## 
## Call:
## lm(formula = pop ~ year + lifeExp, data = df)
## 
## Residuals:
##        Min         1Q     Median         3Q        Max 
##  -47148304  -27382074  -18454446   -8444157 1273829226 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)  
## (Intercept) -799315581  321078589  -2.489   0.0129 *
## year            409882     164973   2.485   0.0131 *
## lifeExp         295176     220507   1.339   0.1809  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 105800000 on 1701 degrees of freedom
## Multiple R-squared:  0.00782,	Adjusted R-squared:  0.006653 
## F-statistic: 6.703 on 2 and 1701 DF,  p-value: 0.00126
```

Finally, let's perform MLR with all variables in the dataset.


```r
model3 <- lm(pop ~ ., data = df)
summary(model3)
```

```
## 
## Call:
## lm(formula = pop ~ ., data = df)
## 
## Residuals:
##        Min         1Q     Median         3Q        Max 
## -375691051   -5548380    -604356    4854327  391492520 
## 
## Coefficients: (4 not defined because of singularities)
##                                   Estimate Std. Error t value Pr(>|t|)    
## (Intercept)                     -2.211e+08  1.677e+08  -1.319 0.187435    
## countryAlbania                  -5.423e+07  1.431e+07  -3.789 0.000157 ***
## countryAlgeria                  -2.412e+07  1.347e+07  -1.790 0.073575 .  
## countryAngola                   -8.521e+06  1.259e+07  -0.677 0.498532    
## countryArgentina                -2.796e+07  1.449e+07  -1.930 0.053788 .  
## countryAustralia                -4.731e+07  1.550e+07  -3.053 0.002304 ** 
## countryAustria                  -5.220e+07  1.533e+07  -3.405 0.000678 ***
## countryBahrain                  -4.982e+07  1.443e+07  -3.453 0.000568 ***
## countryBangladesh                5.839e+07  1.287e+07   4.538 6.10e-06 ***
## countryBelgium                  -5.088e+07  1.537e+07  -3.310 0.000954 ***
## countryBenin                    -2.687e+07  1.282e+07  -2.096 0.036235 *  
## countryBolivia                  -2.992e+07  1.302e+07  -2.299 0.021637 *  
## countryBosnia and Herzegovina   -5.198e+07  1.424e+07  -3.650 0.000271 ***
## countryBotswana                 -3.697e+07  1.316e+07  -2.808 0.005043 ** 
## countryBrazil                    7.429e+07  1.376e+07   5.400 7.68e-08 ***
## countryBulgaria                 -4.978e+07  1.450e+07  -3.432 0.000614 ***
## countryBurkina Faso             -1.793e+07  1.268e+07  -1.414 0.157468    
## countryBurundi                  -2.106e+07  1.268e+07  -1.661 0.096887 .  
## countryCambodia                 -2.130e+07  1.278e+07  -1.666 0.095911 .  
## countryCameroon                 -2.008e+07  1.280e+07  -1.569 0.116755    
## countryCanada                   -3.735e+07  1.563e+07  -2.389 0.017010 *  
## countryCentral African Republic -2.179e+07  1.266e+07  -1.722 0.085353 .  
## countryChad                     -2.287e+07  1.274e+07  -1.795 0.072860 .  
## countryChile                    -4.360e+07  1.427e+07  -3.056 0.002279 ** 
## countryChina                     9.099e+08  1.366e+07  66.602  < 2e-16 ***
## countryColombia                 -2.330e+07  1.388e+07  -1.679 0.093446 .  
## countryComoros                  -3.532e+07  1.300e+07  -2.718 0.006646 ** 
## countryCongo, Dem. Rep.          7.368e+06  1.267e+07   0.581 0.561055    
## countryCongo, Rep.              -3.354e+07  1.302e+07  -2.576 0.010080 *  
## countryCosta Rica               -5.633e+07  1.453e+07  -3.876 0.000111 ***
## countryCote d'Ivoire            -2.113e+07  1.281e+07  -1.650 0.099208 .  
## countryCroatia                  -5.353e+07  1.460e+07  -3.666 0.000255 ***
## countryCuba                     -5.049e+07  1.464e+07  -3.448 0.000580 ***
## countryCzech Republic           -4.891e+07  1.490e+07  -3.283 0.001050 ** 
## countryDenmark                  -5.625e+07  1.554e+07  -3.620 0.000304 ***
## countryDjibouti                 -2.712e+07  1.274e+07  -2.129 0.033376 *  
## countryDominican Republic       -4.194e+07  1.366e+07  -3.071 0.002169 ** 
## countryEcuador                  -4.060e+07  1.381e+07  -2.941 0.003322 ** 
## countryEgypt                     6.005e+06  1.325e+07   0.453 0.650446    
## countryEl Salvador              -4.046e+07  1.352e+07  -2.993 0.002807 ** 
## countryEquatorial Guinea        -2.252e+07  1.264e+07  -1.781 0.075048 .  
## countryEritrea                  -2.446e+07  1.271e+07  -1.924 0.054538 .  
## countryEthiopia                  1.638e+07  1.267e+07   1.293 0.196194    
## countryFinland                  -5.543e+07  1.520e+07  -3.648 0.000273 ***
## countryFrance                   -8.804e+06  1.541e+07  -0.571 0.567874    
## countryGabon                    -3.138e+07  1.310e+07  -2.396 0.016694 *  
## countryGambia                   -2.432e+07  1.267e+07  -1.920 0.055049 .  
## countryGermany                   1.733e+07  1.538e+07   1.127 0.259883    
## countryGhana                    -2.306e+07  1.299e+07  -1.775 0.076090 .  
## countryGreece                   -5.244e+07  1.515e+07  -3.460 0.000555 ***
## countryGuatemala                -3.413e+07  1.329e+07  -2.567 0.010339 *  
## countryGuinea                   -1.818e+07  1.264e+07  -1.438 0.150520    
## countryGuinea-Bissau            -1.729e+07  1.258e+07  -1.374 0.169663    
## countryHaiti                    -2.725e+07  1.288e+07  -2.115 0.034566 *  
## countryHonduras                 -3.889e+07  1.337e+07  -2.909 0.003672 ** 
## countryHong Kong, China         -5.631e+07  1.521e+07  -3.703 0.000220 ***
## countryHungary                  -4.642e+07  1.457e+07  -3.186 0.001473 ** 
## countryIceland                  -6.410e+07  1.575e+07  -4.071 4.91e-05 ***
## countryIndia                     6.643e+08  1.304e+07  50.949  < 2e-16 ***
## countryIndonesia                 1.101e+08  1.311e+07   8.396  < 2e-16 ***
## countryIran                     -6.002e+05  1.349e+07  -0.045 0.964511    
## countryIraq                     -2.588e+07  1.334e+07  -1.939 0.052645 .  
## countryIreland                  -5.722e+07  1.513e+07  -3.781 0.000162 ***
## countryIsrael                   -5.786e+07  1.515e+07  -3.819 0.000139 ***
## countryItaly                    -7.265e+06  1.527e+07  -0.476 0.634287    
## countryJamaica                  -5.453e+07  1.439e+07  -3.789 0.000157 ***
## countryJapan                     4.916e+07  1.542e+07   3.187 0.001465 ** 
## countryJordan                   -4.258e+07  1.351e+07  -3.151 0.001656 ** 
## countryKenya                    -1.790e+07  1.301e+07  -1.376 0.169170    
## countryKorea, Dem. Rep.         -3.402e+07  1.383e+07  -2.459 0.014037 *  
## countryKorea, Rep.              -1.476e+07  1.406e+07  -1.050 0.293722    
## countryKuwait                   -4.441e+07  1.832e+07  -2.424 0.015450 *  
## countryLebanon                  -4.982e+07  1.412e+07  -3.528 0.000431 ***
## countryLesotho                  -3.122e+07  1.287e+07  -2.425 0.015431 *  
## countryLiberia                  -2.074e+07  1.263e+07  -1.643 0.100642    
## countryLibya                    -3.974e+07  1.365e+07  -2.911 0.003652 ** 
## countryMadagascar               -1.960e+07  1.278e+07  -1.534 0.125294    
## countryMalawi                   -1.672e+07  1.264e+07  -1.322 0.186342    
## countryMalaysia                 -3.626e+07  1.393e+07  -2.602 0.009349 ** 
## countryMali                     -1.668e+07  1.264e+07  -1.319 0.187231    
## countryMauritania               -3.379e+07  1.299e+07  -2.600 0.009400 ** 
## countryMauritius                -5.093e+07  1.399e+07  -3.641 0.000280 ***
## countryMexico                    1.651e+07  1.409e+07   1.172 0.241337    
## countryMongolia                 -3.857e+07  1.321e+07  -2.919 0.003558 ** 
## countryMontenegro               -5.799e+07  1.458e+07  -3.977 7.29e-05 ***
## countryMorocco                  -2.191e+07  1.334e+07  -1.642 0.100692    
## countryMozambique               -7.711e+06  1.259e+07  -0.612 0.540438    
## countryMyanmar                  -3.676e+06  1.305e+07  -0.282 0.778138    
## countryNamibia                  -3.556e+07  1.308e+07  -2.719 0.006626 ** 
## countryNepal                    -1.469e+07  1.283e+07  -1.145 0.252448    
## countryNetherlands              -4.915e+07  1.569e+07  -3.132 0.001769 ** 
## countryNew Zealand              -5.847e+07  1.530e+07  -3.821 0.000138 ***
## countryNicaragua                -4.023e+07  1.340e+07  -3.001 0.002732 ** 
## countryNiger                    -1.845e+07  1.267e+07  -1.456 0.145611    
## countryNigeria                   4.984e+07  1.265e+07   3.940 8.51e-05 ***
## countryNorway                   -5.822e+07  1.597e+07  -3.646 0.000275 ***
## countryOman                     -4.030e+07  1.359e+07  -2.965 0.003069 ** 
## countryPakistan                  5.468e+07  1.315e+07   4.159 3.37e-05 ***
## countryPanama                   -5.350e+07  1.429e+07  -3.745 0.000187 ***
## countryParaguay                 -5.108e+07  1.415e+07  -3.611 0.000315 ***
## countryPeru                     -2.598e+07  1.347e+07  -1.928 0.054039 .  
## countryPhilippines               5.621e+06  1.360e+07   0.413 0.679421    
## countryPoland                   -2.383e+07  1.459e+07  -1.633 0.102628    
## countryPortugal                 -4.834e+07  1.470e+07  -3.289 0.001028 ** 
## countryPuerto Rico              -5.801e+07  1.494e+07  -3.882 0.000108 ***
## countryReunion                  -5.358e+07  1.415e+07  -3.785 0.000159 ***
## countryRomania                  -3.503e+07  1.437e+07  -2.438 0.014885 *  
## countryRwanda                   -1.591e+07  1.261e+07  -1.262 0.207196    
## countrySao Tome and Principe    -4.295e+07  1.335e+07  -3.217 0.001324 ** 
## countrySaudi Arabia             -2.802e+07  1.391e+07  -2.015 0.044058 *  
## countrySenegal                  -2.684e+07  1.291e+07  -2.080 0.037702 *  
## countrySerbia                   -4.703e+07  1.444e+07  -3.257 0.001151 ** 
## countrySierra Leone             -1.122e+07  1.258e+07  -0.892 0.372703    
## countrySingapore                -5.517e+07  1.499e+07  -3.680 0.000241 ***
## countrySlovak Republic          -5.370e+07  1.470e+07  -3.653 0.000268 ***
## countrySlovenia                 -5.719e+07  1.491e+07  -3.835 0.000130 ***
## countrySomalia                  -1.526e+07  1.260e+07  -1.211 0.226045    
## countrySouth Africa             -6.780e+06  1.316e+07  -0.515 0.606543    
## countrySpain                    -2.663e+07  1.521e+07  -1.750 0.080268 .  
## countrySri Lanka                -3.997e+07  1.410e+07  -2.834 0.004649 ** 
## countrySudan                    -8.692e+06  1.281e+07  -0.679 0.497470    
## countrySwaziland                -3.013e+07  1.284e+07  -2.346 0.019114 *  
## countrySweden                   -5.577e+07  1.568e+07  -3.557 0.000386 ***
## countrySwitzerland              -5.543e+07  1.595e+07  -3.475 0.000525 ***
## countrySyria                    -3.750e+07  1.364e+07  -2.749 0.006043 ** 
## countryTaiwan                   -4.115e+07  1.466e+07  -2.808 0.005049 ** 
## countryTanzania                 -9.287e+06  1.278e+07  -0.726 0.467660    
## countryThailand                 -3.539e+06  1.371e+07  -0.258 0.796393    
## countryTogo                     -3.164e+07  1.295e+07  -2.443 0.014670 *  
## countryTrinidad and Tobago      -5.277e+07  1.423e+07  -3.709 0.000216 ***
## countryTunisia                  -3.975e+07  1.359e+07  -2.924 0.003502 ** 
## countryTurkey                    1.033e+06  1.352e+07   0.076 0.939115    
## countryUganda                   -1.504e+07  1.277e+07  -1.178 0.239162    
## countryUnited Kingdom           -4.993e+06  1.538e+07  -0.325 0.745519    
## countryUnited States             1.690e+08  1.566e+07  10.794  < 2e-16 ***
## countryUruguay                  -5.631e+07  1.463e+07  -3.848 0.000124 ***
## countryVenezuela                -3.789e+07  1.426e+07  -2.658 0.007945 ** 
## countryVietnam                   1.200e+07  1.332e+07   0.901 0.367650    
## countryWest Bank and Gaza       -4.401e+07  1.356e+07  -3.245 0.001201 ** 
## countryYemen, Rep.              -1.729e+07  1.274e+07  -1.357 0.175082    
## countryZambia                   -2.077e+07  1.272e+07  -1.633 0.102627    
## countryZimbabwe                 -2.855e+07  1.301e+07  -2.194 0.028351 *  
## continentAmericas                       NA         NA      NA       NA    
## continentAsia                           NA         NA      NA       NA    
## continentEurope                         NA         NA      NA       NA    
## continentOceania                        NA         NA      NA       NA    
## year                             9.442e+04  8.804e+04   1.072 0.283681    
## lifeExp                          1.339e+06  2.189e+05   6.118 1.19e-09 ***
## gdpPercap                       -1.908e+02  1.655e+02  -1.153 0.248975    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 30810000 on 1559 degrees of freedom
## Multiple R-squared:  0.9229,	Adjusted R-squared:  0.9158 
## F-statistic: 129.6 on 144 and 1559 DF,  p-value: < 2.2e-16
```


Note that the outputs give us a lot of information. We see the default hypotheses tested, with p-values for each coefficient and for the model as a whole. We see the RSE and the degrees of freedom, F-test, R-squared values, and much more! There are a lot of insights that we can extract from this simple output.
