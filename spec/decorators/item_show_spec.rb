# frozen_string_literal: true

require './spec/spec_helper'

RSpec.describe ItemShow do
  subject(:decorator) { described_class.new(model) }
  let(:model) { ListItem.new }

  describe '#name' do
    it 'returns a default name' do
      expect(decorator.name).to be_a String
    end

    context 'when the model has a name' do
      let(:model) { ListItem.new(name: 'bubbles') }

      it { is_expected.to have_attributes(name: 'bubbles') }
    end
  end

  describe '#slug' do
    it 'gives a default url friendly slug' do
      expect(decorator.slug).to eq 'unknown_item'
    end

    context 'when the model has a name' do
      let(:model) { ListItem.new(name: 'Cheese Sticks') }

      it 'downcases and snakeizes' do
        expect(decorator.slug).to eq 'cheese_sticks'
      end
    end
  end
end
