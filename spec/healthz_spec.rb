require './spec_helper'
require 'rack/test'
require '../lib/application'

RSpec.describe '/healthz' do
  include Rack::Test::Methods

  let(:app) { Application }

  it 'returns ok' do
    get '/healthz'
    expect(last_response.status).to eq 200
  end
end
