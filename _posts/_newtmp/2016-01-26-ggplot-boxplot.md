---
html_document:
  toc: true
title: "Boxplot Basics in ggplot2"
---


{% highlight text %}
## Error in file(filename, "r", encoding = encoding): cannot open the connection
{% endhighlight %}

# Basic Syntax


{% highlight r %}
library(ggplot2)
ggplot(mtcars,aes(factor(vs),mpg))+geom_boxplot()
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/figure/source/2016-01-26-ggplot-boxplot/unnamed-chunk-1-1.png)

<a href="#top">Back to top</a>

# Additional Features

## Add Colors


{% highlight r %}
ggplot(mtcars,aes(factor(vs),mpg,fill=factor(vs)))+geom_boxplot()
{% endhighlight %}

![plot of chunk unnamed-chunk-2](/figure/source/2016-01-26-ggplot-boxplot/unnamed-chunk-2-1.png)

## Multiple Groups


{% highlight r %}
ggplot(mtcars,aes(factor(vs),mpg,fill=factor(am)))+geom_boxplot()
{% endhighlight %}

![plot of chunk unnamed-chunk-3](/figure/source/2016-01-26-ggplot-boxplot/unnamed-chunk-3-1.png)

## Edit Width/Spacing


{% highlight r %}
ggplot(mtcars,aes(factor(vs),mpg,fill=factor(am)))+
  geom_boxplot(width=0.4,                    # Controls Width of Boxes
               position=position_dodge(0.5), # Controls Space between Boxes
               size=1.2)                     # Controls Whisker Thickness
{% endhighlight %}

![plot of chunk unnamed-chunk-4](/figure/source/2016-01-26-ggplot-boxplot/unnamed-chunk-4-1.png)

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

![plot of chunk unnamed-chunk-5](/figure/source/2016-01-26-ggplot-boxplot/unnamed-chunk-5-1.png)

<a href="#top">Back to top</a>

# More Resources
- [Source as RMarkdown](https://github.com/rweyant/bertplot/blob/master/R/tutorials/ggplot-boxplot/ggplot-boxplot.Rmd)
- [docs.ggplot2.org](http://docs.ggplot2.org/0.9.3/geom_boxplot.html)
