---
layout: post
title: "State Maps with ggplot2"
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


<img src="/figure/source/2016-01-26-ggplot-statemaps/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />


# Basic Syntax


{% highlight r %}
# Load Census Data
census_data_url <- 'http://www.bertplot.com/visualization/wp-content/uploads/2015/08/ACS_13_1YR_DP02_with_ann.csv'
census_data <- read.csv(census_data_url)
census_data$region = tolower(census_data$GEO.display.label)
census_data <- census_data %>% rename(born_in_us=HC03_VC132)
{% endhighlight %}



{% highlight text %}
Error in eval(expr, envir, enclos): could not find function "%>%"
{% endhighlight %}



{% highlight r %}
library(ggplot2)
# Load US State Coordinates
state_coords <- map_data("state")
{% endhighlight %}



{% highlight text %}
Error: Package `maps` required for `map_data`.
Please install and try again.
{% endhighlight %}



{% highlight r %}
# Join Census data with map data
state_data <- left_join(state_coords,
                       census_data,
                       by='region')
{% endhighlight %}



{% highlight text %}
Error in eval(expr, envir, enclos): could not find function "left_join"
{% endhighlight %}



{% highlight r %}
# Basic plot
map <- 
  ggplot(state_data) +
  geom_polygon(aes(x = long, y = lat,
                   group = group,
                   fill = born_in_us))
{% endhighlight %}



{% highlight text %}
Error in ggplot(state_data): object 'state_data' not found
{% endhighlight %}



{% highlight r %}
map
{% endhighlight %}



{% highlight text %}
Error in eval(expr, envir, enclos): object 'map' not found
{% endhighlight %}

<a href="#top">Back to top</a>

# Change Coordinate Projection
Requires installation of <b>{mapproj}</b> package

{% highlight r %}
map+coord_map(project='conic',lat0=30)
{% endhighlight %}



{% highlight text %}
Error in eval(expr, envir, enclos): object 'map' not found
{% endhighlight %}

<a href="#top">Back to top</a>

# Aesthetics

Here we remove axes text and make legend text larger.  We also remove the background so the only elements visible are the map and the legend


{% highlight r %}
library(grid)

# Purely aesthetic changes
map_theme <- 
  theme(axis.ticks=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        legend.title=element_text(size=16),
        legend.text=element_text(size=12),
        legend.key.size=(unit(x=0.5,units='cm')),
        panel.background=element_rect(fill='white'))

map <- 
  ggplot(state_data) +
  geom_polygon(aes(x = long, y = lat,
                   group = group,
                   fill = born_in_us),
               color='black',           # Add an black outline to the states
               size=0.4) +
  coord_map(project='conic',lat0=30)+
  scale_fill_gradient('% Born in US')+  # Change Legend Label
  map_theme
{% endhighlight %}



{% highlight text %}
Error in ggplot(state_data): object 'state_data' not found
{% endhighlight %}



{% highlight r %}
map  
{% endhighlight %}



{% highlight text %}
Error in eval(expr, envir, enclos): object 'map' not found
{% endhighlight %}

# More Resources
- [Source as RMarkdown](https://github.com/rweyant/bertplot/blob/master/R/tutorials/ggplot-statemaps/ggplot-statemaps.Rmd)
- [docs.ggplot2.org](http://docs.ggplot2.org/current/geom_polygon.html)
- [ggplot2 themes](http://docs.ggplot2.org/dev/vignettes/themes.html)
