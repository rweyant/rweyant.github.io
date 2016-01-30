---
layout: post
title: Connecting to Databases in R
categories: [R,Databases]
tags: [R, SQL, Oracle, Teradata ]
excerpt: #
modified: 2013-05-31
comments: true
image:
  feature: current-feature.jpg
---


{% highlight text %}
## Error in file(filename, "r", encoding = encoding): cannot open the connection
{% endhighlight %}

There are many ways to connect to a database in R, the one I prefer is to use the [RJDBC](https://github.com/s-u/RJDBC) package, because it's fairly straight forward and simple to use RJDBC.  You need to get your driver, and then define the DSN.  Then you create a connection object and are good to go.


{% highlight r %}
library(RJDBC)
drv <- JDBC('oracle.jdbc.OracleDriver','/path/to/driver/ojdbc6.jar')
connectionString <- "jdbc:oracle:thin:@//YOUR_DSN/"
connection <- dbConnect(drv,connectionString,YOUR_USER_NAME,YOUR_PWD)
{% endhighlight %}

Now you can use all sorts of functions to send requests to the database.


{% highlight r %}
dbGetQuery(connection, 'select * from table')
{% endhighlight %}

When you're done, you can and *should* disconnect with `dbDisconnect` function.


{% highlight r %}
dbDisconnect(connection)
{% endhighlight %}

<a href="#top">Back to top</a>

# Connecting to Teradata Database

This process is almost identical.  First, you need to change the driver. Then the connectionString format is slightly different.


{% highlight r %}
drv <- JDBC('com.teradata.jdbc.TeraDriver')
connectionString <- "jdbc:teradata::@//YOUR_DSN/database=YOUR_DATABASE"
connection <- dbConnect(drv,connectionString,YOUR_USER_NAME,YOUR_PWD)
{% endhighlight %}

Now you're ready to send requests to a Teradata machine.

<img src="/figure/source/2016-01-26-connecting-to-dbs/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />

<a href="#top">Back to top</a>

# More Resources
- [Source as RMarkdown](https://github.com/rweyant/bertplot/)
- [RJDBC on CRAN](https://cran.r-project.org/web/packages/RJDBC/index.html)
- [Bommarito Blog post](http://bommaritollc.com/2012/11/connecting-r-to-an-oracle-database-with-rjdbc/?utm_source=rss&utm_medium=rss&utm_campaign=connecting-r-to-an-oracle-database-with-rjdbc)
