require './spec/spec_helper'
require 'rack/test'

RSpec.describe 'GET /shopping_list' do
  include Rack::Test::Methods

  let(:app) { Application }

  it 'returns 200'
  it 'gives an empty shopping list'

  context 'with some list items' do
    let(:list_item_names) { ['cheese sticks', 'bubbles'] }

    it 'gives a list of the items' do
      list_item_names.each { |name| ListItem.create(name: name) }

      get '/shopping_list'
      expect(last_response.body).to include('cheese sticks', 'bubbles')
    end
  end
end
