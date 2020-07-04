require 'sinatra'
require "#{settings.root}/initializer"

Dir.glob("#{settings.root}/decorators/**/*").each { |path| require(path) }
Dir.glob("#{settings.root}/models/**/*").each { |path| require(path) }

class Application < Sinatra::Base
  configure :production, :development do
    enable :logging
  end

  get '/' do
    redirect '/shopping_list'
  end

  get '/healthz' do
    'Ok!'
  end

  get '/shopping_list' do
    @list = ListShow.new(List.find_or_create(name: 'Shopping List'))
    erb :shopping_list
  end

  post '/shopping_list' do
    logger.info params
    list = List.find_or_create(name: 'Shopping List')
    if params.key? :name
      item = ListItem.create(name: params[:name])
      list.add_list_item(item)
    else
      item = ListItem.find(name: params.keys.first)
      list.check_off_list_item(item)
    end
    redirect '/shopping_list'
  end
end
