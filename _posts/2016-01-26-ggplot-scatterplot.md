---
layout: post
title: "Scatterplot Basics in ggplot2"
categories: [R]
tags: [R, ggplot2 ]
excerpt: #
modified: 2016-01-30
comments: true
image:
  feature: current-feature.jpg
---



{% highlight text %}
## Error: Can't find '/media/roberto/Main Storage/Documents/R/packages/musixmatch'.
{% endhighlight %}

# Basic Syntax


{% highlight r %}
library(ggplot2)
ggplot(iris,aes(Sepal.Width,Sepal.Length))+geom_point()
{% endhighlight %}

<img src="/figure/source/2016-01-26-ggplot-scatterplot/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />

<a href="#top">Back to top</a>

# Additional Features

## Add Groups/Colors


{% highlight r %}
ggplot(iris,aes(Sepal.Width,Sepal.Length,color=Species))+geom_point()
{% endhighlight %}

<img src="/figure/source/2016-01-26-ggplot-scatterplot/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />

## Increase Size


{% highlight r %}
ggplot(iris,aes(Sepal.Width,Sepal.Length,color=Species))+geom_point(size=4)
{% endhighlight %}

<img src="/figure/source/2016-01-26-ggplot-scatterplot/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />

## Variable Size


{% highlight r %}
ggplot(iris,aes(Sepal.Width,Sepal.Length,color=Species,size=Petal.Length))+geom_point()
{% endhighlight %}

<img src="/figure/source/2016-01-26-ggplot-scatterplot/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />

<a href="#top">Back to top</a>
 
# Aesthetics

## Add Outlines to points
Here the key is to use `shape=21` or `pch=21.` Values from 21-25 in the `shape` or `pch` parameter will separately specify the fill and color argument

{% highlight r %}
ggplot(iris,aes(Sepal.Width,
                Sepal.Length,
                size=Petal.Length,
                fill=Species))+     # Change Fill color based on Species
  geom_point(shape=21,              # Set shape/pch to be circle with outline
             color='black',         # Set outline to be black
             alpha=0.8)             # Add some transparency
{% endhighlight %}

<img src="/figure/source/2016-01-26-ggplot-scatterplot/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />

# Changing Themes

## Modify Axes


{% highlight r %}
standard_theme <- 
  theme(axis.text.x=element_text(size=14),    # Change x-axis value text-size
        axis.title.x=element_text(size=18),   # Change x-axis label text-size
        axis.text.y=element_text(size=14),    # Change y-axis value text-size
        axis.title.y=element_text(size=18),   # Change y-axis label text-size
        legend.text=element_text(size=14),    # Change legend value text-size
        legend.title=element_text(size=16))   # Change legend title text-size

ggplot(iris,aes(Sepal.Width,
                Sepal.Length,
                size=Petal.Length,
                fill=Species))+     # Change Fill color based on Species
  geom_point(shape=21,              # Set shape/pch to be circle with outline
             color='black',         # Set outline to be black
             alpha=0.8)+            # Add some transparency
  scale_x_continuous('Sepal Width')+          # Add label to x-axis
  scale_y_continuous('Sepal Length')+         # Add label to y-axis
  scale_fill_discrete('Iris Species')+        # Add label to Legend
  scale_size_continuous('Petal Length')+      # Add Label to Legend
  standard_theme                            # Modify axis/legend element size
{% endhighlight %}

<img src="/figure/source/2016-01-26-ggplot-scatterplot/unnamed-chunk-6-1.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" style="display: block; margin: auto;" />

<a href="#top">Back to top</a>

# More Resources
- [Source as RMarkdown](https://github.com/rweyant/bertplot/blob/master/R/tutorials/ggplot-scatterplot/ggplot-scatterplot.Rmd)
- [docs.ggplot2.org](http://docs.ggplot2.org/0.9.3/geom_point.html)
