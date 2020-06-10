require './spec/spec_helper'
require 'rack/test'

RSpec.describe 'GET /shopping_list' do
  include Rack::Test::Methods

  let(:app) { Application }

  it 'returns 200' do
    get '/shopping_list'
    expect(last_response.status).to eq 200
  end

  it 'is html' do
    get '/shopping_list'
    expect(last_response.body).to include('<!DOCTYPE html>')
  end

  it 'gives an empty shopping list' do
    get '/shopping_list'
    expect(ListItem.all).to be_empty
  end

  context 'with some list items' do
    let(:list_item_names) { ['cheese sticks', 'bubbles'] }

    it 'gives a list of the items' do
      list_item_names.each { |name| ListItem.create(name: name) }

      get '/shopping_list'
      expect(last_response.body).to include('cheese sticks', 'bubbles')
    end
  end
end
