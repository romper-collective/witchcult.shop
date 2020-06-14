require './spec/spec_helper'

RSpec.describe List do
  subject(:list) { described_class.create }

  describe '#name' do
    let(:name) { 'my list' }

    it 'can assign a name' do
      expect { list.name = name }
        .to change { list.name }
        .from(nil)
        .to name
    end

    context 'when the name is defined on initialization' do
      subject(:list) { described_class.create(name: name) }

      it { is_expected.to have_attributes name: name }
    end
  end

  describe '#list_items' do
    let(:items) do
      [ListItem.create(name: 'cheese sticks'),
       ListItem.create(name: 'bubbles')]
    end

    it 'can assign multiple list items' do
      expect { items.each { |i| list.add_list_item(i) } }
        .to change { list.list_items }
        .from(be_empty)
        .to contain_exactly(*items)
    end
  end
end
