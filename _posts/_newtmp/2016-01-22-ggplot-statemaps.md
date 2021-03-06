---
layout: post
title: "State Maps with ggplot2"
categories: [R]
tags: [R, ggplot2 ]
excerpt: #
modified: 2013-05-31
comments: true
image:
  feature: current-feature.jpg
---

<img src="figure/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />


# Basic Syntax


{% highlight r %}
# Load Census Data
census_data_url <- 'http://www.bertplot.com/visualization/wp-content/uploads/2015/08/ACS_13_1YR_DP02_with_ann.csv'
census_data <- read.csv(census_data_url)
census_data$region = tolower(census_data$GEO.display.label)
census_data <- census_data %>% rename(born_in_us=HC03_VC132)
 
library(ggplot2)
# Load US State Coordinates
state_coords <- map_data("state")

# Join Census data with map data
state_data <- left_join(state_coords,
                       census_data,
                       by='region')

# Basic plot
map <- 
  ggplot(state_data) +
  geom_polygon(aes(x = long, y = lat,
                   group = group,
                   fill = born_in_us))
map
{% endhighlight %}

<img src="figure/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />

<a href="#top">Back to top</a>

# Change Coordinate Projection
Requires installation of <b>{mapproj}</b> package

{% highlight r %}
map+coord_map(project='conic',lat0=30)
{% endhighlight %}

<img src="figure/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />

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
map  
{% endhighlight %}

<img src="figure/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />

# More Resources
- [Source as RMarkdown](https://github.com/rweyant/bertplot/blob/master/R/tutorials/ggplot-statemaps/ggplot-statemaps.Rmd)
- [docs.ggplot2.org](http://docs.ggplot2.org/current/geom_polygon.html)
- [ggplot2 themes](http://docs.ggplot2.org/dev/vignettes/themes.html)
