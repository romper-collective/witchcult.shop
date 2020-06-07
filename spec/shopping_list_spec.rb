require './spec_helper'
require 'rack/test'

RSpec.describe 'GET /shopping_list' do
  include Rack::Test::Methods

  let(:app) { Application }

  it 'returns 200'
  it 'gives a list of the items' do
    get '/shopping_list'
    expect(last_response.body).to include 'cheese sticks'
  end

end
