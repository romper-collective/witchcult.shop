require 'sinatra'

class Application < Sinatra::Base
  get '/healthz' do
    'Ok!'
  end
end
