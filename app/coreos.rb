require "sinatra/base"
require "sinatra/reloader"

class App < Sinatra::Base
  set :bind, "0.0.0.0"

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    text = 'RELOAD...'
    "<h2>Hello CoreOS World: <strong>#{%x('hostname')}</strong> <small>#{settings.environment}</small></h2>" +
    "<div><p>#{text}</p></div>"
  end
end
