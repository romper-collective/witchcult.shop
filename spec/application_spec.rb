require './spec/spec_helper'
require 'rack/test'

RSpec.describe 'GET /' do
  include Rack::Test::Methods

  let(:app) { Application }

  it 'redirects to the shopping list' do
    get '/'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_request.path).to eq '/shopping_list'
  end
end
