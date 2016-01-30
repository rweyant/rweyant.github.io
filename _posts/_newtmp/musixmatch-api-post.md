---
html_document:
    toc: true
title: "Musixmatch API Wrapper in R"
---


{% highlight text %}
## Error in file(filename, "r", encoding = encoding): cannot open the connection
{% endhighlight %}


<img src="/figure/source/musixmatch-api-post/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto auto auto 0;" />

[Musixmatch](https://www.musixmatch.com/) is a website that has lots of data on musicians, their album, songs and lyrics.  They've created an API, which anyone can use to collect data, such as lyrics, genres, album and track metadata, and much more.  The goal of this API wrapper is to facilitate using the API in R, and collecting data in a convenient fashion

## Installation


{% highlight r %}
devtools::install_github('rweyant/musixmatch')
{% endhighlight %}

## Basic Usage

First, you need to get an [API Key](https://developer.musixmatch.com/signup).

{% highlight r %}
library(musixmatch)

# Set API key in a place all the functions have access to
set_apikey(YOUR_APIKEY)
{% endhighlight %}

## Get basic data

### Search for specific artists

Here you can find basic information about artists that match the search term.  If you specify `simplify=FALSE` the result is the full XML document parsed.


{% highlight r %}
# Return list of full XML result in a list
result <- search_artist(q_artist = 'slayer',simplify=FALSE)
{% endhighlight %}

Otherwise, a simplified `data.frame` is returned.


{% highlight r %}
# Return data.frame of most useful fields to identify artist
head(search_artist('slayer'))
{% endhighlight %}



{% highlight text %}
## Error in head(search_artist("slayer")): could not find function "search_artist"
{% endhighlight %}

<a href="#top">Back to top</a>

### Get Artist Discography

This function identifies artists using the artist_id returned from the previous function.  It returns all the albums (sometimes multiple versions of an album) musixmatch has listed for an artist.  You can similarly get the full XML document as a list using the `simplify=FALSE` option.


{% highlight r %}
head(get_artist_albums(2683))
{% endhighlight %}



{% highlight text %}
## Error in head(get_artist_albums(2683)): could not find function "get_artist_albums"
{% endhighlight %}

## Next Steps

Currently supports all methods for the musixmatch API (e.g. track.lyrics.get, album.tracks.get, artist.related..get).  Not all methods have a `simplify` option yet, but these options are being actively developed.  Check the [GitHub](https://github.com/rweyant/musixmatch) for updates.


<br>

#### More Resources
- [Source as RMarkdown](https://github.com/rweyant/bertplot/blob/master/R/tutorials/musixmatch-api-post/musixmatch-api-post.Rmd)
- [Package Source on Github](https://github.com/rweyant/musixmatch)
- [Musixmatch API Documentation](https://developer.musixmatch.com/documentation)
