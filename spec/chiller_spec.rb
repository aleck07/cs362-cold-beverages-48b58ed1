require_relative '../lib/chiller'

describe 'A chiller' do
    it 'has a default capacity of 100' do
        expect(Chiller.new.capacity).to eq(100)
    end

    it 'has a default temperature of 70' do
        expect(Chiller.new.temperature).to eq(70)
    end

    it 'initializes properly' do
        chiller = Chiller.new(200)
        expect(chiller.capacity).to eq(200)
        expect(chiller.temperature).to eq(70)
    end

    it 'turns on' do
        chiller = Chiller.new
        chiller.turn_on
        expect(chiller.instance_variable_get(:@power)).to eq(:on)
    end

    it 'turns off' do
        chiller = Chiller.new
        chiller.turn_on
        chiller.turn_off
        expect(chiller.instance_variable_get(:@power)).to eq(:off)
    end

    it "adds items" do
        chiller = Chiller.new
        item = double("item", volume: 10)
        chiller.add(item)
        expect(chiller.instance_variable_get(:@contents)).to include(item)
    end
end
