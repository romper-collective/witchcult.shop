require 'sinatra'
require 'sequel'
Dir.glob("#{settings.root}/models/**/*").each { |path| require(path) }

class Application < Sinatra::Base
  # DB = Sequel.sqlite

  get '/healthz' do
    'Ok!'
  end

  get '/shopping_list' do
    'cheese sticks'
  end
end
