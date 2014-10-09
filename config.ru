require 'rack'
require './feed'

app = Rack::URLMap.new(
  '/feed.rss' => lambda { |env|
    [200, {'Content-Type'=>'application/rss+xml'}, [Feed.new.rss]]
  }
)
run app
