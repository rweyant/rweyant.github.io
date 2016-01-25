---
layout: post
title: Musixmatch API Wrapper in R
excerpt: "Musixmatch API Wrapper in R"
modified: 2013-05-31
tags: [intro, beginner, jekyll, tutorial]
comments: true
image:
  feature: sample-image-5.jpg
  credit: WeGraphics
  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
---


<img src="figure/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto auto auto 0;" />

[Musixmatch](https://www.musixmatch.com/) is a website that has lots of data on musicians, their album, songs and lyrics.  They've created an API, which anyone can use to collect data, such as lyrics, genres, album and track metadata, and much more.  The goal of this API wrapper is to facilitate using the API in R, and collecting data in a convenient fashion

## Installation


```r
devtools::install_github('rweyant/musixmatch')
```

## Basic Usage

First, you need to get an [API Key](https://developer.musixmatch.com/signup).

```r
library(musixmatch)

# Set API key in a place all the functions have access to
set_apikey(YOUR_APIKEY)
```

## Get basic data

### Search for specific artists

Here you can find basic information about artists that match the search term.  If you specify `simplify=FALSE` the result is the full XML document parsed.


```r
# Return list of full XML result in a list
result <- search_artist(q_artist = 'slayer',simplify=FALSE)
```

Otherwise, a simplified `data.frame` is returned.


```r
# Return data.frame of most useful fields to identify artist
head(search_artist('slayer'))
```

```
        id                          name country
1     2683                        Slayer      US
2 11222667                        Slayer      GB
3     7679                     Leo Sayer      GB
4 24760214      Buffy the Vampire Slayer    <NA>
5 27767004 Buffy the Vampire Slayer Cast    <NA>
6 24945497         Slayer feat. Revmatix    <NA>
```

<a href="#top">Back to top</a>

### Get Artist Discography

This function identifies artists using the artist_id returned from the previous function.  It returns all the albums (sometimes multiple versions of an album) musixmatch has listed for an artist.  You can similarly get the full XML document as a list using the `simplify=FALSE` option.


```r
head(get_artist_albums(2683))
```

```
  album_id                           album_mbid
1 10351455 4f4bca2a-b1d4-42fb-a01c-304c8fc389c8
2 20819255                                 <NA>
3 10284682 95b6de70-dcc8-48cd-a3bd-91bf1fc0e1c7
4 10326081 a776e81e-c00f-4176-ab39-51c508b2a2ac
5 10367988 1c233932-faeb-48a7-96a5-a79871522e40
6 10564777 965f651c-4f51-421b-b402-3a537a9035b7
                             album_name album_track_count
1 Seasons in the Abyss / Reign in Blood                20
2                            Repentless                12
3                      God Hates Us All                26
4                      God Hates Us All                15
5                      God Hates Us All                14
6                      God Hates Us All                15
  album_release_date album_release_type album_rating
1               1998              Album           87
2         2015-09-11              Album           76
3         2001-08-17              Album           74
4               2001              Album           74
5               <NA>              Album           74
6         2001-09-11              Album           74
```

## Next Steps

Currently supports all methods for the musixmatch API (e.g. track.lyrics.get, album.tracks.get, artist.related..get).  Not all methods have a `simplify` option yet, but these options are being actively developed.  Check the [GitHub](https://github.com/rweyant/musixmatch) for updates.


<br>

#### More Resources
- [Source as RMarkdown](https://github.com/rweyant/bertplot/blob/master/R/tutorials/musixmatch-api-post/musixmatch-api-post.Rmd)
- [Package Source on Github](https://github.com/rweyant/musixmatch)
- [Musixmatch API Documentation](https://developer.musixmatch.com/documentation)
