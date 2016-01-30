---
layout: post
title: Basics of magrittr in R
excerpt: #
modified: 2013-01-30
categories: [R]
tags: [R, magrittr]
comments: true
image:
  feature: current-feature.jpg
---

<img src="/figure/source/2016-01-26-magrittr-basics/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />

<br>

The [magrittr](https://github.com/smbache/magrittr) package offers a new operator that can help improve readability of your code, and make it easier to update and modify data wrangling code.  The %>% operator has been adopted into `dplyr` and many of [Hadley Wickham's](https://github.com/hadley) packages are written to be pipe-friendly.

# The Problem

### R code can get hard to read


{% highlight r %}
sapply(iris[iris$Sepal.Length < mean(iris$Sepal.Length),-5],FUN = mean)
{% endhighlight %}

### A (Possible) Solution - the pipe %>% 

- Similar to Unix pipe |
- Code can be written in the order of execution, left to right
- `%>%` will "pipe" information from one statement to the next
  * `x %>% f` is equivalent to `f(x)`
  * `x %>% f(y)` is equivalent to `f(x,y)`
  * `x %>% f %>% g %>% h` is equivalent to `h(g(f(x)))`

<b>{magittr} provides 4 special operators</b>

- `%>%` - pipe operators
- `%T>%` - tee operator
- `%$%` - exposition operator
- `%<>%` - compound assignment pipe operator



# What %>% is doing

The `%>%` is taking the output of the left-hand side and using that for
the first argument of the right-hand side, or where it finds a *`.`*

### Basic Example


{% highlight r %}
df <- data.frame(x1=rnorm(100),x2=rnorm(100),x3=rnorm(100))

df %>% head(1)  # same as using head(df,1)
{% endhighlight %}



{% highlight text %}
##          x1          x2       x3
## 1 0.6022856 -0.01663281 1.280829
{% endhighlight %}



{% highlight r %}
df %>% head(.,1)  # same as using head(df,1)
{% endhighlight %}



{% highlight text %}
##          x1          x2       x3
## 1 0.6022856 -0.01663281 1.280829
{% endhighlight %}

### Slightly more complicated example


{% highlight r %}
library(ggplot2)
mtcars %>%
  xtabs(~gear+carb,data=.) %>%
  as.data.frame %>%
  ggplot(.,aes(x=gear,y=carb,size=Freq)) +
  geom_point()
{% endhighlight %}

<img src="/figure/source/2016-01-26-magrittr-basics/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />

### Even more complicated example


{% highlight r %}
# Generate some sample data.
df <-
  data.frame(
    Price    = 1:100 %>% sample(replace = TRUE),
    Quantity = 1:10  %>% sample(replace = TRUE),
    Type     =
      0:1 %>%
      sample(replace = TRUE) %>%
      factor(labels = c("Buy", "Sell"))
  )
{% endhighlight %}
[Source](http://www.r-statistics.com/2014/08/simpler-r-coding-with-pipes-the-present-and-future-of-the-magrittr-package/)



## The combination of %>% with {dplyr}

- `filter()`
- `group_by()`
- `summarise()`,`summarize()`
- `arrange()`
- `mutate()`
- `select()`


{% highlight r %}
sapply(iris[iris$Sepal.Length < mean(iris$Sepal.Length),-5],FUN = mean)
{% endhighlight %}



{% highlight text %}
## Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
##      5.19875      3.13375      2.46250      0.66375
{% endhighlight %}



{% highlight r %}
iris %>%
  mutate(avg.length=mean(Sepal.Length)) %>%
  filter(Sepal.Length<avg.length) %>%
  select(-Species,-avg.length) %>%
  summarise_each(funs(mean))
{% endhighlight %}



{% highlight text %}
##   Sepal.Length Sepal.Width Petal.Length Petal.Width
## 1      5.19875     3.13375       2.4625     0.66375
{% endhighlight %}

## %$% The exposition operator

- Similar to `with()` or `attach()`
- Useful for functions that don't take a data parameter


{% highlight r %}
table(CO2$Treatment,CO2$Type)
{% endhighlight %}



{% highlight text %}
##             
##              Quebec Mississippi
##   nonchilled     21          21
##   chilled        21          21
{% endhighlight %}



{% highlight r %}
# with(CO2,table(Treatment,Type))
CO2 %$% table(Treatment,Type)
{% endhighlight %}



{% highlight text %}
##             Type
## Treatment    Quebec Mississippi
##   nonchilled     21          21
##   chilled        21          21
{% endhighlight %}

## %T>% The Tee Operator

- Allows a "break" in the pipe.
- Executes right-hand side of `%T>%`, but will continue to pipe through to next statement


{% highlight r %}
iris %>%
filter(Species != 'virginica') %>%
select(Sepal.Width,Sepal.Length) %T>%
plot %>%  # Make scatterplot and keep going
colMeans
{% endhighlight %}

![plot of chunk unnamed-chunk-10](/figure/source/2016-01-26-magrittr-basics/unnamed-chunk-10-1.png)

{% highlight text %}
##  Sepal.Width Sepal.Length 
##        3.099        5.471
{% endhighlight %}

## %<>% The Compound Assignment Operator
- Combines a pipe and an assignment operator
- Think `i++` or `x+=z` from the C family, Python, Ruby, etc.

## %<>% The Compound Assignment Operator

{% highlight r %}
df <- rexp(5,.5) %>% data.frame(col1=.)
df
{% endhighlight %}



{% highlight text %}
##        col1
## 1 1.5308088
## 2 0.2098324
## 3 3.5493290
## 4 0.7945075
## 5 2.0478644
{% endhighlight %}



{% highlight r %}
df %<>% arrange(col1)
df
{% endhighlight %}



{% highlight text %}
##        col1
## 1 0.2098324
## 2 0.7945075
## 3 1.5308088
## 4 2.0478644
## 5 3.5493290
{% endhighlight %}

# More Resources
- [Source as RMarkdown](https://github.com/rweyant/bertplot/blob/master/R/tutorials/magrittr-basics/magrittr-basics.Rmd)
- [magrittr on GitHub](https://github.com/smbache/magrittr)
- [dplyr and pipes: the basics](http://seananderson.ca/2014/09/13/dplyr-intro.html)
- [pipeR vs. magrittr](http://renkun.me/blog/2014/08/08/difference-between-magrittr-and-pipeR.html)
