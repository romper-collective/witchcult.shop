require 'sinatra'

class Application < Sinatra::Base
  get '/healthz' do
    'Ok!'
  end

  get '/shopping_list' do
    'cheese sticks'
  end
end
