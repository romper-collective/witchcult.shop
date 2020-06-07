require './spec/spec_helper'
require 'rack/test'

RSpec.describe 'GET /healthz' do
  include Rack::Test::Methods

  let(:app) { Application }

  it 'returns ok' do
    get '/healthz'
    expect(last_response.status).to eq 200
  end
end
