---
layout: post
title: "Google Flights QPX Express API Wrapper in R"
categories: [R, API]
tags: [R, API]
excerpt: #
modified: 2016-01-30
comments: true
image:
  feature: current-feature.jpg
---



I'm working on an R package that facilitates getting data out of the [QPX Express API](https://developers.google.com/qpx-express/) and into R.  QPX Express API offers global airline pricing in a single, standard API.  You can search it and get data on flight prices across lots of different carriers.

## Installation


{% highlight r %}
devtools::install_github('rweyant/googleflights')
{% endhighlight %}

## Basic Usage

First, you need to get an [API Key](https://developers.google.com/qpx-express/).

{% highlight r %}
library(googleflights)

# Set API key in a place all the functions have access to
set_apikey(YOUR_APIKEY)
{% endhighlight %}

## Get data


{% highlight r %}
result <- search(origin='DTW',dest='SFO',startDate='2016-03-01',endDate='2016-03-08')
{% endhighlight %}

The API returns data in JSON format.  The `search` function will parse it with `fromJSON.` This will return a list of lists.  More information on the response format can be found [here](https://developers.google.com/qpx-express/v1/trips/search#response).

## Next Steps

The actual API only has one method, so there's not much else to say about working with it.  The data is very rich though, but hard to use directly from JSON.  My main focus moving forward here is to add functions that will make working with the returned data easier.

## More Resources
- [Source as RMarkdown](https://github.com/rweyant/bertplot/)
- [Package Source on Github](https://github.com/rweyant/googleflights)
- [QPX Express API Documentation](https://developers.google.com/qpx-express/v1/)

