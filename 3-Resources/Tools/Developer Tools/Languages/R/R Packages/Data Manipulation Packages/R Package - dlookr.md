---
Date: 2022-02-05
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool/R", "#Topic/Dev/R", "#Type/Tool", "#Topic/Dev/Data"]
Alias: ["R Package - dlookr", "dlookr"]
---

# R Package - `dlookr`

*Source: [choonghyunryu/dlookr: Tools for Data Diagnosis, Exploration, Transformation (github.com)](https://github.com/choonghyunryu/dlookr)*

## Contents

- [[#Overview|Overview]]
- [[#Install `dlookr`|Install `dlookr`]]
- [[#Usage|Usage]]
	- [[#Data Quality Diagnosis|Data Quality Diagnosis]]
		- [[#Data: `nycflights13`|Data: `nycflights13`]]
		- [[#General Diagnosis of All Variables with `diagnose()`|General Diagnosis of All Variables with `diagnose()`]]
		- [[#Diagnosis of numeric variables with `diagnose_numeric()`|Diagnosis of numeric variables with `diagnose_numeric()`]]
		- [[#Diagnosis of Categorical Variables with `diagnose_category()`|Diagnosis of Categorical Variables with `diagnose_category()`]]
		- [[#Diagnosing Outliers with `diagnose_outlier()`|Diagnosing Outliers with `diagnose_outlier()`]]
		- [[#Visualization of outliers using `plot_outlier()`|Visualization of outliers using `plot_outlier()`]]
	- [[#To Be Continued...|To Be Continued...]]
- [[#Appendix: Links|Appendix: Links]]



## Overview

Diagnose, explore and transform data with `dlookr`.

Features:

-   Diagnose data quality.
-   Find appropriate scenarios to pursuit the follow-up analysis through data exploration and understanding.
-   Derive new variables or perform variable transformations.
-   Automatically generate reports for the above three tasks.
-   Supports quality diagnosis and EDA of table of DBMS.
    -   version (≥ 0.3.2)

The name `dlookr` comes from `looking at the data` in the data analysis process.

## Install `dlookr`

The released version is available on CRAN

```R
install.packages("dlookr")
```

Or you can get the development version without vignettes from GitHub:

```R
devtools::install_github("choonghyunryu/dlookr")
```

Or you can get the development version with vignettes from GitHub:

```R
install.packages(c("nycflights13", "ISLR", "DBI", "RSQLite"))
devtools::install_github("choonghyunryu/dlookr", build_vignettes = TRUE)
```

## Usage

`dlookr` includes several vignette files, which we use throughout the documentation.

Provided vignettes is as follows.

-   Data quality diagnosis for `data.frame`, `tbl_df`, and `table` of [[Database Management System (DBMS)|DBMS]]
-   Exploratory Data Analysis for `data.frame`, `tbl_df`, and `table` of [[Database Management System (DBMS)|DBMS]]
-   Data Transformation
-   Data diagnosis and EDA for table of [[Database Management System (DBMS)|DBMS]]

```R
browseVignettes(package = "dlookr")
```

### Data Quality Diagnosis

#### Data: `nycflights13`

To illustrate basic use of the `dlookr` package, use the `flights` data from the `nycflights13` package. Once loading `nycflights13` library, the `flights` data frame is available. The `flights` data frame contains departure and arrival information on all flights departing from NYC(i.e. JFK, LGA or EWR) in 2013.

``` r
library(nycflights13)
dim(flights)
#> [1] 336776     19
flights
#> # A tibble: 336,776 x 19
#>     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
#>    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
#>  1  2013     1     1      517            515         2      830            819
#>  2  2013     1     1      533            529         4      850            830
#>  3  2013     1     1      542            540         2      923            850
#>  4  2013     1     1      544            545        -1     1004           1022
#>  5  2013     1     1      554            600        -6      812            837
#>  6  2013     1     1      554            558        -4      740            728
#>  7  2013     1     1      555            600        -5      913            854
#>  8  2013     1     1      557            600        -3      709            723
#>  9  2013     1     1      557            600        -3      838            846
#> 10  2013     1     1      558            600        -2      753            745
#> # … with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
#> #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
#> #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>
```

#### General Diagnosis of All Variables with `diagnose()`

`diagnose()` allows you to diagnose variables on a data frame. Like any other `dplyr` functions, the first argument is the tibble (or data frame). The second and subsequent arguments refer to variables within the data frame.

The variables of the `tbl_df` object returned by `diagnose ()` are as follows.

-   `variables` : variable names
-   `types` : the data type of the variables
-   `missing_count` : number of missing values
-   `missing_percent` : percentage of missing values
-   `unique_count` : number of unique values
-   `unique_rate` : rate of unique value. unique_count / number of observation

For example, we can diagnose all variables in `flights`:

``` r
library(dlookr)
library(dplyr)

diagnose(flights)
#> # A tibble: 19 x 6
#>    variables     types    missing_count missing_percent unique_count unique_rate
#>    <chr>         <chr>            <int>           <dbl>        <int>       <dbl>
#>  1 year          integer              0           0                1  0.00000297
#>  2 month         integer              0           0               12  0.0000356 
#>  3 day           integer              0           0               31  0.0000920 
#>  4 dep_time      integer           8255           2.45          1319  0.00392   
#>  5 sched_dep_ti… integer              0           0             1021  0.00303   
#>  6 dep_delay     numeric           8255           2.45           528  0.00157   
#>  7 arr_time      integer           8713           2.59          1412  0.00419   
#>  8 sched_arr_ti… integer              0           0             1163  0.00345   
#>  9 arr_delay     numeric           9430           2.80           578  0.00172   
#> 10 carrier       charact…             0           0               16  0.0000475 
#> 11 flight        integer              0           0             3844  0.0114    
#> 12 tailnum       charact…          2512           0.746         4044  0.0120    
#> 13 origin        charact…             0           0                3  0.00000891
#> 14 dest          charact…             0           0              105  0.000312  
#> 15 air_time      numeric           9430           2.80           510  0.00151   
#> 16 distance      numeric              0           0              214  0.000635  
#> 17 hour          numeric              0           0               20  0.0000594 
#> 18 minute        numeric              0           0               60  0.000178  
#> 19 time_hour     POSIXct              0           0             6936  0.0206
```

-   `Missing Value(NA)` : Variables with many missing values, i.e. those with a `missing_percent` close to 100, should be excluded from the analysis.
-   `Unique value` : Variables with a unique value (`unique_count` = 1) are considered to be excluded from data analysis. And if the data type is not numeric (integer, numeric) and the number of unique values is equal to the number of observations (unique_rate = 1), then the variable is likely to be an identifier. Therefore, this variable is also not suitable for the analysis model.

`year` can be considered not to be used in the analysis model since `unique_count` is 1. However, you do not have to remove it if you configure `date` as a combination of `year`, `month`, and `day`.

For example, we can diagnose only a few selected variables:

``` r
# Select columns by name
diagnose(flights, year, month, day)
#> # A tibble: 3 x 6
#>   variables types   missing_count missing_percent unique_count unique_rate
#>   <chr>     <chr>           <int>           <dbl>        <int>       <dbl>
#> 1 year      integer             0               0            1  0.00000297
#> 2 month     integer             0               0           12  0.0000356 
#> 3 day       integer             0               0           31  0.0000920
# Select all columns between year and day (include)
diagnose(flights, year:day)
#> # A tibble: 3 x 6
#>   variables types   missing_count missing_percent unique_count unique_rate
#>   <chr>     <chr>           <int>           <dbl>        <int>       <dbl>
#> 1 year      integer             0               0            1  0.00000297
#> 2 month     integer             0               0           12  0.0000356 
#> 3 day       integer             0               0           31  0.0000920
# Select all columns except those from year to day (exclude)
diagnose(flights, -(year:day))
#> # A tibble: 16 x 6
#>    variables     types    missing_count missing_percent unique_count unique_rate
#>    <chr>         <chr>            <int>           <dbl>        <int>       <dbl>
#>  1 dep_time      integer           8255           2.45          1319  0.00392   
#>  2 sched_dep_ti… integer              0           0             1021  0.00303   
#>  3 dep_delay     numeric           8255           2.45           528  0.00157   
#>  4 arr_time      integer           8713           2.59          1412  0.00419   
#>  5 sched_arr_ti… integer              0           0             1163  0.00345   
#>  6 arr_delay     numeric           9430           2.80           578  0.00172   
#>  7 carrier       charact…             0           0               16  0.0000475 
#>  8 flight        integer              0           0             3844  0.0114    
#>  9 tailnum       charact…          2512           0.746         4044  0.0120    
#> 10 origin        charact…             0           0                3  0.00000891
#> 11 dest          charact…             0           0              105  0.000312  
#> 12 air_time      numeric           9430           2.80           510  0.00151   
#> 13 distance      numeric              0           0              214  0.000635  
#> 14 hour          numeric              0           0               20  0.0000594 
#> 15 minute        numeric              0           0               60  0.000178  
#> 16 time_hour     POSIXct              0           0             6936  0.0206
```

By using with dplyr, variables including missing values can be sorted by the weight of missing values.:

``` r
flights %>%
  diagnose() %>%
  select(-unique_count, -unique_rate) %>% 
  filter(missing_count > 0) %>% 
  arrange(desc(missing_count))
#> # A tibble: 6 x 4
#>   variables types     missing_count missing_percent
#>   <chr>     <chr>             <int>           <dbl>
#> 1 arr_delay numeric            9430           2.80 
#> 2 air_time  numeric            9430           2.80 
#> 3 arr_time  integer            8713           2.59 
#> 4 dep_time  integer            8255           2.45 
#> 5 dep_delay numeric            8255           2.45 
#> 6 tailnum   character          2512           0.746
```

#### Diagnosis of numeric variables with `diagnose_numeric()`

`diagnose_numeric()` diagnoses numeric(continuous and discrete) variables in a data frame. Usage is the same as `diagnose()` but returns more diagnostic information. However, if you specify a non-numeric variable in the second and subsequent argument list, the variable is automatically ignored.

The variables of the `tbl_df` object returned by `diagnose_numeric()` are as follows.

-   `min` : minimum value
-   `Q1` : 1/4 quartile, 25th percentile
-   `mean` : arithmetic mean
-   `median` : median, 50th percentile
-   `Q3` : 3/4 quartile, 75th percentile
-   `max` : maximum value
-   `zero` : number of observations with a value of 0
-   `minus` : number of observations with negative numbers
-   `outlier` : number of outliers

The summary() function summarizes the distribution of individual variables in the data frame and outputs it to the console. The summary values of numeric variables are `min`, `Q1`, `mean`, `median`, `Q3` and `max`, which help to understand the distribution of data.

However, the result displayed on the console has the disadvantage that the analyst has to look at it with the eyes. However, when the summary information is returned in a data frame structure such as tbl_df, the scope of utilization is expanded. `diagnose_numeric()` supports this.

`zero`, `minus`, and `outlier` are useful measures to diagnose data integrity. For example, numerical data in some cases cannot have zero or negative numbers. A numeric variable called `employee salary` cannot have negative numbers or zeros. Therefore, this variable should be checked for the inclusion of zero or negative numbers in the data diagnosis process.

`diagnose_numeric()` can diagnose all numeric variables of `flights` as follows.:

``` r
diagnose_numeric(flights)
#> # A tibble: 14 x 10
#>    variables        min    Q1    mean median    Q3   max  zero  minus outlier
#>    <chr>          <dbl> <dbl>   <dbl>  <dbl> <dbl> <dbl> <int>  <int>   <int>
#>  1 year            2013  2013 2013      2013  2013  2013     0      0       0
#>  2 month              1     4    6.55      7    10    12     0      0       0
#>  3 day                1     8   15.7      16    23    31     0      0       0
#>  4 dep_time           1   907 1349.     1401  1744  2400     0      0       0
#>  5 sched_dep_time   106   906 1344.     1359  1729  2359     0      0       0
#>  6 dep_delay        -43    -5   12.6      -2    11  1301 16514 183575   43216
#>  7 arr_time           1  1104 1502.     1535  1940  2400     0      0       0
#>  8 sched_arr_time     1  1124 1536.     1556  1945  2359     0      0       0
#>  9 arr_delay        -86   -17    6.90     -5    14  1272  5409 188933   27880
#> 10 flight             1   553 1972.     1496  3465  8500     0      0       1
#> 11 air_time          20    82  151.      129   192   695     0      0    5448
#> 12 distance          17   502 1040.      872  1389  4983     0      0     715
#> 13 hour               1     9   13.2      13    17    23     0      0       0
#> 14 minute             0     8   26.2      29    44    59 60696      0       0
```

If a numeric variable can not logically have a negative or zero value, it can be used with `filter()` to easily find a variable that does not logically match:

``` r
diagnose_numeric(flights) %>% 
  filter(minus > 0 | zero > 0) 
#> # A tibble: 3 x 10
#>   variables   min    Q1  mean median    Q3   max  zero  minus outlier
#>   <chr>     <dbl> <dbl> <dbl>  <dbl> <dbl> <dbl> <int>  <int>   <int>
#> 1 dep_delay   -43    -5 12.6      -2    11  1301 16514 183575   43216
#> 2 arr_delay   -86   -17  6.90     -5    14  1272  5409 188933   27880
#> 3 minute        0     8 26.2      29    44    59 60696      0       0
```

#### Diagnosis of Categorical Variables with `diagnose_category()`

`diagnose_category()` diagnoses the categorical(factor, ordered, character) variables of a data frame. The usage is similar to `diagnose()` but returns more diagnostic information. If you specify a non-categorical variable in the second and subsequent argument list, the variable is automatically ignored.

The `top` argument specifies the number of levels to return for each variable. The default is 10, which returns the top 10 level. Of course, if the number of levels is less than 10, all levels are returned.

The variables of the `tbl_df` object returned by `diagnose_category()` are as follows.

-   `variables` : variable names
-   `levels`: level names
-   `N` : number of observation
-   `freq` : number of observation at the levels
-   `ratio` : percentage of observation at the levels
-   `rank` : rank of occupancy ratio of levels

`diagnose_category()` can diagnose all categorical variables of `flights` as follows.:

``` r
diagnose_category(flights)
#> # A tibble: 43 x 6
#>    variables levels      N  freq ratio  rank
#>    <chr>     <chr>   <int> <int> <dbl> <int>
#>  1 carrier   UA     336776 58665 17.4      1
#>  2 carrier   B6     336776 54635 16.2      2
#>  3 carrier   EV     336776 54173 16.1      3
#>  4 carrier   DL     336776 48110 14.3      4
#>  5 carrier   AA     336776 32729  9.72     5
#>  6 carrier   MQ     336776 26397  7.84     6
#>  7 carrier   US     336776 20536  6.10     7
#>  8 carrier   9E     336776 18460  5.48     8
#>  9 carrier   WN     336776 12275  3.64     9
#> 10 carrier   VX     336776  5162  1.53    10
#> # … with 33 more rows
```

In collaboration with `filter()` in the `dplyr` package, we can see that the `tailnum` variable is ranked in top 1 with 2,512 missing values in the case where the missing value is included in the top 10:

``` r
diagnose_category(flights) %>% 
  filter(is.na(levels))
#> # A tibble: 1 x 6
#>   variables levels      N  freq ratio  rank
#>   <chr>     <chr>   <int> <int> <dbl> <int>
#> 1 tailnum   <NA>   336776  2512 0.746     1
```

The following example returns a list where the level’s relative percentage is 0.01% or less. Note that the value of the `top` argument is set to a large value such as 500. If the default value of 10 was used, values below 0.01% would not be included in the list:

``` r
flights %>%
  diagnose_category(top = 500)  %>%
  filter(ratio <= 0.01)
#> # A tibble: 10 x 6
#>    variables levels      N  freq    ratio  rank
#>    <chr>     <chr>   <int> <int>    <dbl> <int>
#>  1 carrier   OO     336776    32 0.00950     16
#>  2 dest      JAC    336776    25 0.00742     97
#>  3 dest      PSP    336776    19 0.00564     98
#>  4 dest      EYW    336776    17 0.00505     99
#>  5 dest      HDN    336776    15 0.00445    100
#>  6 dest      MTJ    336776    15 0.00445    100
#>  7 dest      SBN    336776    10 0.00297    102
#>  8 dest      ANC    336776     8 0.00238    103
#>  9 dest      LEX    336776     1 0.000297   104
#> 10 dest      LGA    336776     1 0.000297   104
```

In the analytics model, you can also consider removing levels where the relative frequency is very small in the observations or, if possible, combining them together.

#### Diagnosing Outliers with `diagnose_outlier()`

`diagnose_outlier()` diagnoses the outliers of the numeric (continuous and discrete) variables of the data frame. The usage is the same as `diagnose()`.

The variables of the `tbl_df` object returned by `diagnose_outlier()` are as follows.

-   `outliers_cnt` : number of outliers
-   `outliers_ratio` : percent of outliers
-   `outliers_mean` : arithmetic average of outliers
-   `with_mean` : arithmetic average of with outliers
-   `without_mean` : arithmetic average of without outliers

`diagnose_outlier()` can diagnose outliers of all numerical variables on `flights` as follows:

``` r
diagnose_outlier(flights)
#> # A tibble: 14 x 6
#>    variables    outliers_cnt outliers_ratio outliers_mean with_mean without_mean
#>    <chr>               <int>          <dbl>         <dbl>     <dbl>        <dbl>
#>  1 year                    0       0                NaN     2013        2013    
#>  2 month                   0       0                NaN        6.55        6.55 
#>  3 day                     0       0                NaN       15.7        15.7  
#>  4 dep_time                0       0                NaN     1349.       1349.   
#>  5 sched_dep_t…            0       0                NaN     1344.       1344.   
#>  6 dep_delay           43216      12.8               93.1     12.6         0.444
#>  7 arr_time                0       0                NaN     1502.       1502.   
#>  8 sched_arr_t…            0       0                NaN     1536.       1536.   
#>  9 arr_delay           27880       8.28             121.       6.90       -3.69 
#> 10 flight                  1       0.000297        8500     1972.       1972.   
#> 11 air_time             5448       1.62             400.     151.        146.   
#> 12 distance              715       0.212           4955.    1040.       1032.   
#> 13 hour                    0       0                NaN       13.2        13.2  
#> 14 minute                  0       0                NaN       26.2        26.2
```

Numeric variables that contained outliers are easily found with `filter()`.:

``` r
diagnose_outlier(flights) %>% 
  filter(outliers_cnt > 0) 
#> # A tibble: 5 x 6
#>   variables outliers_cnt outliers_ratio outliers_mean with_mean without_mean
#>   <chr>            <int>          <dbl>         <dbl>     <dbl>        <dbl>
#> 1 dep_delay        43216      12.8               93.1     12.6         0.444
#> 2 arr_delay        27880       8.28             121.       6.90       -3.69 
#> 3 flight               1       0.000297        8500     1972.       1972.   
#> 4 air_time          5448       1.62             400.     151.        146.   
#> 5 distance           715       0.212           4955.    1040.       1032.
```

The following example finds a numeric variable with an outlier ratio of 5% or more, and then returns the result of dividing mean of outliers by total mean in descending order:

``` r
diagnose_outlier(flights) %>% 
  filter(outliers_ratio > 5) %>% 
  mutate(rate = outliers_mean / with_mean) %>% 
  arrange(desc(rate)) %>% 
  select(-outliers_cnt)
#> # A tibble: 2 x 6
#>   variables outliers_ratio outliers_mean with_mean without_mean  rate
#>   <chr>              <dbl>         <dbl>     <dbl>        <dbl> <dbl>
#> 1 arr_delay           8.28         121.       6.90       -3.69  17.5 
#> 2 dep_delay          12.8           93.1     12.6         0.444  7.37
```

In cases where the mean of the outliers is large relative to the overall average, it may be desirable to impute or remove the outliers.

#### Visualization of outliers using `plot_outlier()`

`plot_outlier()` visualizes outliers of numerical variables(continuous and discrete) of data.frame. Usage is the same `diagnose()`.

The plot derived from the numerical data diagnosis is as follows.

-   With outliers box plot
-   Without outliers box plot
-   With outliers histogram
-   Without outliers histogram

The following example uses `diagnose_outlier()`, `plot_outlier()`, and `dplyr` packages to visualize all numerical variables with an outlier ratio of 0.5% or higher.

``` r
flights %>%
  plot_outlier(diagnose_outlier(flights) %>% 
                 filter(outliers_ratio >= 0.5) %>% 
                 select(variables) %>% 
                 unlist())
```

[![](https://github.com/choonghyunryu/dlookr/raw/master/figures/README-plot_outlier_pipe-1.png)](https://github.com/choonghyunryu/dlookr/blob/master/figures/README-plot_outlier_pipe-1.png)[![](https://github.com/choonghyunryu/dlookr/raw/master/figures/README-plot_outlier_pipe-2.png)](https://github.com/choonghyunryu/dlookr/blob/master/figures/README-plot_outlier_pipe-2.png)[![](https://github.com/choonghyunryu/dlookr/raw/master/figures/README-plot_outlier_pipe-3.png)](https://github.com/choonghyunryu/dlookr/blob/master/figures/README-plot_outlier_pipe-3.png)

Analysts should look at the results of the visualization to decide whether to remove or replace outliers. In some cases, you should consider removing variables with outliers from the data analysis model.

Looking at the results of the visualization, `arr_delay` shows that the observed values without outliers are similar to the normal distribution. In the case of a linear model, we might consider removing or imputing outliers. And `air_time` has a similar shape before and after removing outliers.

### To Be Continued...



***

## Appendix: Links

- [[Tools]]
- [[Development]]
<<<<<<< HEAD:3-Resources/Tools/R/R Packages/Data Manipulation Packages/R Package - dlookr.md
- [[R]]
- [[R Database Packages]]
=======
- [[2-Areas/MOCs/R]]
- [[R - Database Packages List]]
>>>>>>> develop:3-Resources/Tools/Developer Tools/Languages/R/R Packages/Data Manipulation Packages/R Package - dlookr.md


*Backlinks:*

```dataview
list from [[R Package - dlookr]] AND -"Changelog"
```