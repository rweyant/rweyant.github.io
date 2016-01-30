---
title: "spotifyr: a wrapper for Spotify's API for R users"
html_document:
    toc: true
---

I've created an R wrapper for Spotify's API.  It is currently still in testing, development.  It was developed on Ubuntu, but I've had successful tests on Windows 7 too. 

It currently launches [Firefox](https://www.mozilla.org/en-US/firefox/new/) through [RSelenium](https://github.com/ropensci/RSelenium) for the full [authorization code flow](https://developer.spotify.com/web-api/authorization-guide/#authorization_code_flow).  Chrome and IE will eventually be supported, but are not yet.  All data from endpoints is converted to lists.  If you just want access to the public endpoints, this is not necessary.  

Some of the objects (artists, albums, playlists) have helper functions to convert to `data.frame`, but not all yet, and this is the next major development plan.

## Installation

Requires [Firefox](https://www.mozilla.org/en-US/firefox/new/) for initial authentication for any of the endpoints that operate on user data.


{% highlight r %}
devtools::install_github('rweyant/spotifyr')
{% endhighlight %}

## Authentication

For any usage below, you'll need to have proper credentials from Spotify.  Sign up for an account [here](https://developer.spotify.com/) and [create an app](https://developer.spotify.com/my-applications/#!/applications).


{% highlight r %}
# First Step: make client_id and client_secret available to other function
set_credentials(client_id=YOUR_CLIENT_ID,client_secret=YOUR_CLIENT_SECRET)
{% endhighlight %}

### Authenticate with [Client Credentials](https://developer.spotify.com/web-api/authorization-guide/#client_credentials_flow)


{% highlight r %}
client_tokens <- get_tokens()
{% endhighlight %}

### Authenticate with [Authorization Code](https://developer.spotify.com/web-api/authorization-guide/#authorization_code_flow)


{% highlight r %}
# Opens Browser window asking for permission to access data
# Requires Spotify account and for user to login
user_code <- get_user_code()

# Assigns tokens for later use.
# This creates a variable access_token in the Global Environment 
# that all future functions will access.
user_tokens <- get_user_token(user_code)

# If your access_token expires and you need to refresh your tokens 
# With no parameters specified, looks for refresh_token in the Global Environment
refresh_tokens <- refresh_user_token()

# If you want, you can explicitly specify the refresh token
refresh_tokens <- refresh_user_token(user_tokens$refresh_token)
{% endhighlight %}

## Basic Usage

### Search for Data

Get information, identifiers, images, etc. for artists, albums, songs or playlists that match the query text. 
No authentication is required for this function.


{% highlight r %}
# Search for an artist
search('slayer',type='artist')

# Get top search result
search('slayer',type='artist',limit=1)

# Search for an album
search('South Of Heaven',type='album')
{% endhighlight %}

### Get Information About Artist
Search for an artist by Spotify ID and get information about band, genre, images, etc.
No authentication is required for this function.


{% highlight r %}
get_artist('1IQ2e1buppatiN1bxUVkrk')

# Get all albums by Slayer on Spotify
get_artist_albums('1IQ2e1buppatiN1bxUVkrk')

# Get top tracks of Slayer in the US. Country code required.
get_artist_toptracks('1IQ2e1buppatiN1bxUVkrk','US')

# Get related artists according to Spotify in list 
get_artist_relatedartists('1IQ2e1buppatiN1bxUVkrk')

# Get related artists according to Spotify and simplify to a data.frame
simplify_result(get_artist_relatedartists('1IQ2e1buppatiN1bxUVkrk'),type='artists')
{% endhighlight %}

### Access Library information

There are endpoints to access and modify data in user's library

{% highlight r %}
# Get the last 2 tracks saved by the user.
get_saved_tracks(limit=2)
{% endhighlight %}

### Followers

Get information about what artists a user is following, add/remove followers from user, check if a user is following someone


{% highlight r %}
# Get list of all artists a user is following
get_user_followed_artists()

# Check if my account is being followed.
following('rweyant',type='user')

# Follow my account
follow('rweyant',type='user')

# Check if Slayer is being followed.  Use Spotify Artist ID
following('1IQ2e1buppatiN1bxUVkrk',type='artist')

# Follow Slayer
follow('1IQ2e1buppatiN1bxUVkrk',type='artist')
{% endhighlight %}

### User Profile Data

{% highlight r %}
# Specific user's data
get_user_profile('rweyant')

# Get the user who is using the application
get_current_user_profile()
{% endhighlight %}


### More Resources

- [Spotify API Endpoints](https://developer.spotify.com/web-api/endpoint-reference/)
- [Source on GitHub](https://github.com/rweyant/spotifyr)

<img src="/figure/source/2016-01-26-spotify-api/unnamed-chunk-10-1.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" style="display: block; margin: auto;" />
