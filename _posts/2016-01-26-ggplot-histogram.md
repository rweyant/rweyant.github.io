---
html_document:
  toc: true
title: "Histogram Basics in ggplot2"
---


{% highlight text %}
## Error in file(filename, "r", encoding = encoding): cannot open the connection
{% endhighlight %}

# Basic Syntax


{% highlight r %}
library(ggplot2)
ggplot(iris,aes(Sepal.Width))+geom_histogram()
{% endhighlight %}



{% highlight text %}
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/figure/source/2016-01-26-ggplot-histogram/unnamed-chunk-1-1.png)

<a href="#top">Back to top</a>

# Additional Features

## Add Groups


{% highlight r %}
ggplot(iris,aes(Sepal.Width,fill=Species))+geom_histogram()
{% endhighlight %}



{% highlight text %}
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
{% endhighlight %}

![plot of chunk unnamed-chunk-2](/figure/source/2016-01-26-ggplot-histogram/unnamed-chunk-2-1.png)

## Fix Binwidth


{% highlight r %}
ggplot(iris,aes(Sepal.Width,fill=Species))+geom_histogram(binwidth=.10)
{% endhighlight %}

![plot of chunk unnamed-chunk-3](/figure/source/2016-01-26-ggplot-histogram/unnamed-chunk-3-1.png)

## As a Density


{% highlight r %}
ggplot(iris,
       aes(Sepal.Width,fill=Species))+geom_histogram(aes(y=..density..))
{% endhighlight %}



{% highlight text %}
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
{% endhighlight %}

![plot of chunk unnamed-chunk-4](/figure/source/2016-01-26-ggplot-histogram/unnamed-chunk-4-1.png)

<a href="#top">Back to top</a>
 
# Aesthetics

## Add Outlines to Bars


{% highlight r %}
ggplot(iris,aes(Sepal.Width,fill=Species))+
  geom_histogram(binwidth=.1,    # Fixed Bin-width
                 alpha=0.7,      # Make Slightly transparent
                 color='black',  # Add Outline
                 size=0.4)       # Thickness of Outline
{% endhighlight %}

![plot of chunk unnamed-chunk-5](/figure/source/2016-01-26-ggplot-histogram/unnamed-chunk-5-1.png)

## Modify Axes


{% highlight r %}
ggplot(iris,aes(Sepal.Width,fill=Species))+
  geom_histogram(binwidth=.1,alpha=0.7,color='black',size=0.4) +
  scale_x_continuous('Sepal Width')+          # Add label to x-axis
  scale_y_continuous('Count')+                # Add label to y-axis
  scale_fill_discrete('Iris Species')+        # Add label to legend
  theme(axis.text.x=element_text(size=14),    # Change x-axis value text-size
        axis.title.x=element_text(size=18),   # Change x-axis label text-size
        axis.text.y=element_text(size=14),    # Change y-axis value text-size
        axis.title.y=element_text(size=18),   # Change y-axis label text-size
        legend.text=element_text(size=14),    # Change legend value text-size
        legend.title=element_text(size=16))   # Change legend title text-size
{% endhighlight %}

![plot of chunk unnamed-chunk-6](/figure/source/2016-01-26-ggplot-histogram/unnamed-chunk-6-1.png)

<a href="#top">Back to top</a>

# More Resources
- [Source as RMarkdown](https://github.com/rweyant/bertplot/blob/master/R/tutorials/ggplot-histogram/ggplot-histogram.Rmd)
- [docs.ggplot2.org](http://docs.ggplot2.org/0.9.3/geom_histogram.html)

