---
html_document:
  toc: true
title: "Scatterplot Basics in ggplot2"
---


{% highlight text %}
## Error in file(filename, "r", encoding = encoding): cannot open the connection
{% endhighlight %}

# Basic Syntax


{% highlight r %}
library(ggplot2)
ggplot(iris,aes(Sepal.Width,Sepal.Length))+geom_point()
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/figure/source/ggplot-scatterplot/unnamed-chunk-1-1.png)

<a href="#top">Back to top</a>

# Additional Features

## Add Groups/Colors


{% highlight r %}
ggplot(iris,aes(Sepal.Width,Sepal.Length,color=Species))+geom_point()
{% endhighlight %}

![plot of chunk unnamed-chunk-2](/figure/source/ggplot-scatterplot/unnamed-chunk-2-1.png)

## Increase Size


{% highlight r %}
ggplot(iris,aes(Sepal.Width,Sepal.Length,color=Species))+geom_point(size=4)
{% endhighlight %}

![plot of chunk unnamed-chunk-3](/figure/source/ggplot-scatterplot/unnamed-chunk-3-1.png)

## Variable Size


{% highlight r %}
ggplot(iris,aes(Sepal.Width,Sepal.Length,color=Species,size=Petal.Length))+geom_point()
{% endhighlight %}

![plot of chunk unnamed-chunk-4](/figure/source/ggplot-scatterplot/unnamed-chunk-4-1.png)

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

![plot of chunk unnamed-chunk-5](/figure/source/ggplot-scatterplot/unnamed-chunk-5-1.png)

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

![plot of chunk unnamed-chunk-6](/figure/source/ggplot-scatterplot/unnamed-chunk-6-1.png)

<a href="#top">Back to top</a>

# More Resources
- [Source as RMarkdown](https://github.com/rweyant/bertplot/blob/master/R/tutorials/ggplot-scatterplot/ggplot-scatterplot.Rmd)
- [docs.ggplot2.org](http://docs.ggplot2.org/0.9.3/geom_point.html)
