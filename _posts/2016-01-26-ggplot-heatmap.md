---
layout: post
title: Boxplot Basics in ggplot2
categories: [R]
tags: [R, ggplot2, data-visualization ]
excerpt: #
modified: 2016-01-30
comments: true
image:
  feature: current-feature.jpg
---



{% highlight text %}
## Error in loadNamespace(name): there is no package called 'devtools'
{% endhighlight %}

# Basic Syntax


{% highlight r %}
library(ggplot2)
library(hflights)
{% endhighlight %}



{% highlight text %}
Error in library(hflights): there is no package called 'hflights'
{% endhighlight %}



{% highlight r %}
head(hflights)
{% endhighlight %}



{% highlight text %}
Error in head(hflights): object 'hflights' not found
{% endhighlight %}



{% highlight r %}
hflights.agg <- hflights %>% group_by(Month,DayofMonth) %>% summarize(mean.time=mean(DepDelay,na.rm=TRUE))
{% endhighlight %}



{% highlight text %}
Error in eval(expr, envir, enclos): could not find function "%>%"
{% endhighlight %}



{% highlight r %}
ggplot(hflights.agg,aes(Month,DayofMonth,fill=mean.time))+geom_tile()
{% endhighlight %}



{% highlight text %}
Error in ggplot(hflights.agg, aes(Month, DayofMonth, fill = mean.time)): object 'hflights.agg' not found
{% endhighlight %}

<a href="#top">Back to top</a>

# More Resources
- [Source as RMarkdown](https://github.com/rweyant/bertplot/tree/master/R/tutorials/ggplot-heatmap/ggplot-heatmap.Rmd)
- [docs.ggplot2.org](http://docs.ggplot2.org/current/geom_tile.html)
