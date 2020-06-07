require './spec_helper'
require 'rack/test'

RSpec.describe 'GET /' do
  include Rack::Test::Methods

  let(:app) { Application }

  it 'redirects to the shopping list'
end
