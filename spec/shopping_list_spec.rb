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
    let(:list) { List.create(name: 'Shopping List') }
    let(:list_item_names) { ['cheese sticks', 'bubbles'] }

    before do
      list_item_names.each do |name|
        list.list_items << ListItem.create(name: name)
      end
      ListItem.create(name: 'not in shopping list')
    end

    it 'gives a list of the items' do
      get '/shopping_list'
      expect(last_response.body).to include('cheese sticks', 'bubbles')
      expect(last_response.body).not_to include('not in shopping list')
    end
  end
end
