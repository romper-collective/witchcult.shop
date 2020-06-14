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
    @list = List.find_or_create(name: 'Shopping List')
    erb :shopping_list
  end

  post '/shopping_list' do
    List.find_or_create(name: 'Shopping List')
      .add_list_item(ListItem.create(name: params[:name]))
    redirect '/shopping_list'
  end
end
