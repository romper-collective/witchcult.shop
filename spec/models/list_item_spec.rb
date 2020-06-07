require './spec/spec_helper'

RSpec.describe ListItem do
  subject(:list_item) { described_class.new }

  describe '.create' do
    it 'creates a list item' do
      pending 'need to connec to database'
      expect { described_class.create(name: 'cheese sticks') }
        .to change { described_class.count }
        .from(0)
        .to(1)
    end
  end
end
