require "sinatra/base"
require "sinatra/reloader"

class App < Sinatra::Base
  set :bind, "0.0.0.0"

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    "<h4>Hello CoreOS World: <small>#{settings.environment}</small></h4>" +
    "<div><i>Helloing you from #{%x('hostname')}</i></div>"
  end
end
