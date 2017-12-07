# DEPRECATION WARNING

**Paul Krugman’s blog is now published [on the same page than regular columns](https://www.nytimes.com/column/paul-krugman). In consequence this script doesn’t work anymore. Use an RSS Feed expander service to get access to a full list of articles.**

# Overview

I like reading Paul Krugman's ["The Conscience of a Liberal"](http://krugman.blogs.nytimes.com/) blog — but got tired of the [crappy New York Times feed](http://krugman.blogs.nytimes.com/feed/). So here's one that doesn't suck.

It's a Ruby script that scraps the HTML page and generates an RSS feed with the content of the articles, including charts and videos.


# How to run

## As a standalone script

```
bundle install
./test.rb > feed.rss
```

## As a Rack app

```
bundle install
bundle exec rackup -p 9292 config.ru &
open http://localhost:9292/feed.rss
```

## On Heroku

This Rack app is deployable on Heroku as-this. An instance that serves the feed is available here : http://krugman-nyt-feed.herokuapp.com/feed.rss
