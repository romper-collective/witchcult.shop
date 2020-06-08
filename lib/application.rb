require 'sinatra'
require "#{settings.root}/initializer"

Dir.glob("#{settings.root}/models/**/*").each { |path| require(path) }

class Application < Sinatra::Base
  get '/healthz' do
    'Ok!'
  end

  get '/shopping_list' do
    'cheese sticks'
  end
end
