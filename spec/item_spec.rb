require_relative '../lib/item'

describe 'An item of food or a beverage' do
    let(:item) { Item.new('Coke', 3) }
    
    it 'has a name' do
        expect(item.name).to eq('Coke')
    end
    
    it 'has volume' do
        expect(item.volume).to eq(3)
    end
end
