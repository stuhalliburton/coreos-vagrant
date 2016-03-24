require "sinatra/base"
require "sinatra/reloader"
require "redis"

class App < Sinatra::Base
  set :bind, "0.0.0.0"

  configure :development do
    $redis = Redis.new(:host => "172.17.8.101", :port => 6379, :db => 15)
    $redis.set(:count, 0)
    register Sinatra::Reloader
  end

  get "/" do
    $redis.incr(:count)

    text = 'Count: '
    "<h2>Hello CoreOS World: <strong>#{%x('hostname')}</strong> <small>#{settings.environment}</small></h2>" +
    "<div><p>#{text}#{$redis.get(:count)}</p></div>"
  end
end
