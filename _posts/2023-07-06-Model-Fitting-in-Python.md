---
title: Basic Model Fitting in Python
date: '2023-06-15 09:00:00 -0800'
categories: [Python, Modelling]
tags: [python] # tags always lowercase
author: madison
output:
  html_document:
    keep_md: TRUE
---



In previous categories we have looked at cleaning, summarizing, and subsetting data, with some minor calculations, but we haven’t yet looked at analyzing our data.

Python is a very powerful tool for data analysis. Similarly to R, we can fit linear models and view graphs. First, we will look at some basic data analysis processes in Python.

Let’s re-load in our Gapminder data:


```python
import pandas as pd
url = 'https://raw.githubusercontent.com/jstaf/gapminder/master/gapminder/gapminder.csv'
df = pd.read_csv(url)
```

Let’s say we want to fit a linear model to see if there is a relationship between population and time. First, let’s do this with the entire dataset with all countries. 

Note that OLS stands for ordinary least squares.


```python
import statsmodels.api as sm
# define our x and y variables for clarity
y = df['pop']
x = df['year']
x = sm.add_constant(x)
model = sm.OLS(y,x).fit()
model.summary()
```

```{=html}
<table class="simpletable">
<caption>OLS Regression Results</caption>
<tr>
  <th>Dep. Variable:</th>           <td>pop</td>       <th>  R-squared:         </th> <td>   0.007</td> 
</tr>
<tr>
  <th>Model:</th>                   <td>OLS</td>       <th>  Adj. R-squared:    </th> <td>   0.006</td> 
</tr>
<tr>
  <th>Method:</th>             <td>Least Squares</td>  <th>  F-statistic:       </th> <td>   11.61</td> 
</tr>
<tr>
  <th>Date:</th>             <td>Thu, 06 Jul 2023</td> <th>  Prob (F-statistic):</th> <td>0.000672</td> 
</tr>
<tr>
  <th>Time:</th>                 <td>14:40:46</td>     <th>  Log-Likelihood:    </th> <td> -33902.</td> 
</tr>
<tr>
  <th>No. Observations:</th>      <td>  1704</td>      <th>  AIC:               </th> <td>6.781e+04</td>
</tr>
<tr>
  <th>Df Residuals:</th>          <td>  1702</td>      <th>  BIC:               </th> <td>6.782e+04</td>
</tr>
<tr>
  <th>Df Model:</th>              <td>     1</td>      <th>                     </th>     <td> </td>    
</tr>
<tr>
  <th>Covariance Type:</th>      <td>nonrobust</td>    <th>                     </th>     <td> </td>    
</tr>
</table>
<table class="simpletable">
<tr>
    <td></td>       <th>coef</th>     <th>std err</th>      <th>t</th>      <th>P>|t|</th>  <th>[0.025</th>    <th>0.975]</th>  
</tr>
<tr>
  <th>const</th> <td>-9.722e+08</td> <td> 2.94e+08</td> <td>   -3.306</td> <td> 0.001</td> <td>-1.55e+09</td> <td>-3.95e+08</td>
</tr>
<tr>
  <th>year</th>  <td> 5.061e+05</td> <td> 1.49e+05</td> <td>    3.407</td> <td> 0.001</td> <td> 2.15e+05</td> <td> 7.97e+05</td>
</tr>
</table>
<table class="simpletable">
<tr>
  <th>Omnibus:</th>       <td>2403.823</td> <th>  Durbin-Watson:     </th>  <td>   0.187</td> 
</tr>
<tr>
  <th>Prob(Omnibus):</th>  <td> 0.000</td>  <th>  Jarque-Bera (JB):  </th> <td>438354.240</td>
</tr>
<tr>
  <th>Skew:</th>           <td> 8.286</td>  <th>  Prob(JB):          </th>  <td>    0.00</td> 
</tr>
<tr>
  <th>Kurtosis:</th>       <td>79.807</td>  <th>  Cond. No.          </th>  <td>2.27e+05</td> 
</tr>
</table><br/><br/>Notes:<br/>[1] Standard Errors assume that the covariance matrix of the errors is correctly specified.<br/>[2] The condition number is large, 2.27e+05. This might indicate that there are<br/>strong multicollinearity or other numerical problems.
```

Let’s try fitting another linear model, but using only data from Africa.


```python
df_AF = df[df['continent'] == 'Africa']
df_AF.head()
```

```
##     country continent  year  lifeExp       pop    gdpPercap
## 24  Algeria    Africa  1952   43.077   9279525  2449.008185
## 25  Algeria    Africa  1957   45.685  10270856  3013.976023
## 26  Algeria    Africa  1962   48.303  11000948  2550.816880
## 27  Algeria    Africa  1967   51.407  12760499  3246.991771
## 28  Algeria    Africa  1972   54.518  14760787  4182.663766
```

```python
y = df_AF['pop']
x = df_AF['year']
x = sm.add_constant(x)
model1 = sm.OLS(y,x).fit()
model1.summary()
```

```{=html}
<table class="simpletable">
<caption>OLS Regression Results</caption>
<tr>
  <th>Dep. Variable:</th>           <td>pop</td>       <th>  R-squared:         </th> <td>   0.074</td> 
</tr>
<tr>
  <th>Model:</th>                   <td>OLS</td>       <th>  Adj. R-squared:    </th> <td>   0.072</td> 
</tr>
<tr>
  <th>Method:</th>             <td>Least Squares</td>  <th>  F-statistic:       </th> <td>   49.66</td> 
</tr>
<tr>
  <th>Date:</th>             <td>Thu, 06 Jul 2023</td> <th>  Prob (F-statistic):</th> <td>4.87e-12</td> 
</tr>
<tr>
  <th>Time:</th>                 <td>14:40:46</td>     <th>  Log-Likelihood:    </th> <td> -11192.</td> 
</tr>
<tr>
  <th>No. Observations:</th>      <td>   624</td>      <th>  AIC:               </th> <td>2.239e+04</td>
</tr>
<tr>
  <th>Df Residuals:</th>          <td>   622</td>      <th>  BIC:               </th> <td>2.240e+04</td>
</tr>
<tr>
  <th>Df Model:</th>              <td>     1</td>      <th>                     </th>     <td> </td>    
</tr>
<tr>
  <th>Covariance Type:</th>      <td>nonrobust</td>    <th>                     </th>     <td> </td>    
</tr>
</table>
<table class="simpletable">
<tr>
    <td></td>       <th>coef</th>     <th>std err</th>      <th>t</th>      <th>P>|t|</th>  <th>[0.025</th>    <th>0.975]</th>  
</tr>
<tr>
  <th>const</th> <td>-4.728e+08</td> <td> 6.85e+07</td> <td>   -6.902</td> <td> 0.000</td> <td>-6.07e+08</td> <td>-3.38e+08</td>
</tr>
<tr>
  <th>year</th>  <td> 2.438e+05</td> <td> 3.46e+04</td> <td>    7.047</td> <td> 0.000</td> <td> 1.76e+05</td> <td> 3.12e+05</td>
</tr>
</table>
<table class="simpletable">
<tr>
  <th>Omnibus:</th>       <td>477.344</td> <th>  Durbin-Watson:     </th> <td>   0.284</td>
</tr>
<tr>
  <th>Prob(Omnibus):</th> <td> 0.000</td>  <th>  Jarque-Bera (JB):  </th> <td>7771.738</td>
</tr>
<tr>
  <th>Skew:</th>          <td> 3.336</td>  <th>  Prob(JB):          </th> <td>    0.00</td>
</tr>
<tr>
  <th>Kurtosis:</th>      <td>18.950</td>  <th>  Cond. No.          </th> <td>2.27e+05</td>
</tr>
</table><br/><br/>Notes:<br/>[1] Standard Errors assume that the covariance matrix of the errors is correctly specified.<br/>[2] The condition number is large, 2.27e+05. This might indicate that there are<br/>strong multicollinearity or other numerical problems.
```

