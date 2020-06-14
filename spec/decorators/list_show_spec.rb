# frozen_string_literal: true

require './spec/spec_helper'

RSpec.describe ListShow do
  subject(:decorator) { described_class.new(model) }
  let(:model) { List.new }

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
