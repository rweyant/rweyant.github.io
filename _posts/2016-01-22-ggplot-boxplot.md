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
ggplot(mtcars,aes(factor(vs),mpg))+geom_boxplot()
{% endhighlight %}

<img src="figure/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />

<a href="#top">Back to top</a>

# Additional Features

## Add Colors


{% highlight r %}
ggplot(mtcars,aes(factor(vs),mpg,fill=factor(vs)))+geom_boxplot()
{% endhighlight %}

<img src="figure/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />

## Multiple Groups


{% highlight r %}
ggplot(mtcars,aes(factor(vs),mpg,fill=factor(am)))+geom_boxplot()
{% endhighlight %}

<img src="figure/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />

## Edit Width/Spacing


{% highlight r %}
ggplot(mtcars,aes(factor(vs),mpg,fill=factor(am)))+
  geom_boxplot(width=0.4,                    # Controls Width of Boxes
               position=position_dodge(0.5), # Controls Space between Boxes
               size=1.2)                     # Controls Whisker Thickness
{% endhighlight %}

<img src="figure/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />

<a href="#top">Back to top</a>
 
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

ggplot(mtcars,aes(factor(vs),mpg,fill=factor(am)))+
  geom_boxplot(width=0.4,                    
               position=position_dodge(0.5), 
               size=1.2)+
  scale_x_discrete('VS')+
  scale_y_continuous('Miles Per Gallon (MPG)')+
  scale_fill_discrete('AM')+
  standard_theme
{% endhighlight %}

<img src="figure/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />

<a href="#top">Back to top</a>

# More Resources
- [Source as RMarkdown](https://github.com/rweyant/bertplot/blob/master/R/tutorials/ggplot-boxplot/ggplot-boxplot.Rmd)
- [docs.ggplot2.org](http://docs.ggplot2.org/0.9.3/geom_boxplot.html)
