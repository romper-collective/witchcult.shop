# frozen_string_literal: true

require './spec/spec_helper'

RSpec.describe ListShow do
  subject(:decorator) { described_class.new(model) }
  let(:model) { List.new }

  describe '#list_items' do
    it { is_expected.to have_attributes(list_items: be_empty) }

    context 'with some list items' do
      let(:model) { List.create }

      before do
        3.times { |i| model.add_list_item(name: "item #{i}") }
      end

      it 'decorates list items' do
        expect(decorator.list_items)
          .to contain_exactly(have_attributes(slug: 'item_0'),
                              have_attributes(slug: 'item_1'),
                              have_attributes(slug: 'item_2'))
      end
    end
  end

  describe '#name' do
    it 'returns a default name' do
      expect(decorator.name).to be_a String
    end

    context 'when the model has a name' do
      let(:model) { List.new(name: 'My List') }

      it { is_expected.to have_attributes(name: 'My List') }
    end
  end

  describe '#slug' do
    it 'gives a default url friendly slug' do
      expect(decorator.slug).to eq 'unnamed_list'
    end

    context 'when the model has a name' do
      let(:model) { List.new(name: 'My List') }

      it 'downcases and snakeizes' do
        expect(decorator.slug).to eq 'my_list'
      end
    end
  end
end
