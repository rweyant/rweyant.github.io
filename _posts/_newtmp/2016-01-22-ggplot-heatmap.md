---
layout: post
title: Boxplot Basics in ggplot2
categories: [R]
tags: [R, ggplot2, data-visualization ]
excerpt: #
modified: 2013-05-31
comments: true
image:
  feature: current-feature.jpg
---



# Basic Syntax


{% highlight r %}
library(ggplot2)
library(hflights)
head(hflights)
{% endhighlight %}

{% highlight r %}
     Year Month DayofMonth DayOfWeek DepTime ArrTime
5424 2011     1          1         6    1400    1500
5425 2011     1          2         7    1401    1501
5426 2011     1          3         1    1352    1502
5427 2011     1          4         2    1403    1513
5428 2011     1          5         3    1405    1507
5429 2011     1          6         4    1359    1503
     UniqueCarrier FlightNum TailNum ActualElapsedTime
5424            AA       428  N576AA                60
5425            AA       428  N557AA                60
5426            AA       428  N541AA                70
5427            AA       428  N403AA                70
5428            AA       428  N492AA                62
5429            AA       428  N262AA                64
     AirTime ArrDelay DepDelay Origin Dest Distance TaxiIn
5424      40      -10        0    IAH  DFW      224      7
5425      45       -9        1    IAH  DFW      224      6
5426      48       -8       -8    IAH  DFW      224      5
5427      39        3        3    IAH  DFW      224      9
5428      44       -3        5    IAH  DFW      224      9
5429      45       -7       -1    IAH  DFW      224      6
     TaxiOut Cancelled CancellationCode Diverted
5424      13         0                         0
5425       9         0                         0
5426      17         0                         0
5427      22         0                         0
5428       9         0                         0
5429      13         0                         0
{% endhighlight %}

{% highlight r %}
hflights.agg <- hflights %>% group_by(Month,DayofMonth) %>% summarize(mean.time=mean(DepDelay,na.rm=TRUE))
ggplot(hflights.agg,aes(Month,DayofMonth,fill=mean.time))+geom_tile()
{% endhighlight %}

<img src="figure/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />

<a href="#top">Back to top</a>

# More Resources
- [Source as RMarkdown](https://github.com/rweyant/bertplot/tree/master/R/tutorials/ggplot-heatmap/ggplot-heatmap.Rmd)
- [docs.ggplot2.org](http://docs.ggplot2.org/current/geom_tile.html)
