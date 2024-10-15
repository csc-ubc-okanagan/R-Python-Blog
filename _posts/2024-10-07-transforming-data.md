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


