require 'sinatra'
require "#{settings.root}/initializer"

Dir.glob("#{settings.root}/models/**/*").each { |path| require(path) }

class Application < Sinatra::Base
  get '/' do
    redirect '/shopping_list'
  end

  get '/healthz' do
    'Ok!'
  end

  get '/shopping_list' do
    @list_items = ListItem.all
    erb :shopping_list
  end
end
