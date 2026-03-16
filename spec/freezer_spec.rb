require_relative '../lib/freezer'

describe 'A freezer' do
    it 'has a default capacity of 100' do
        expect(Freezer.new.capacity).to eq(100)

    end

    it 'has a default temperature of 70' do
        expect(Freezer.new.temperature).to eq(70)
    end

    it 'initializes properly' do
        freezer = Freezer.new(200)
        expect(freezer.capacity).to eq(200)
        expect(freezer.temperature).to eq(70)
    end

    it 'turns on' do
        freezer = Freezer.new
        freezer.turn_on
        expect(freezer.instance_variable_get(:@power)).to eq(:on)
    end

    it 'turns off' do
        freezer = Freezer.new
        freezer.turn_on
        freezer.turn_off
        expect(freezer.instance_variable_get(:@power)).to eq(:off)
    end

    it "adds items" do
        freezer = Freezer.new
        item = double("item", volume: 10)
        freezer.add(item)
        expect(freezer.instance_variable_get(:@contents)).to include(item)
    end

    it "sets temperature level" do
        freezer = Freezer.new
        freezer.set_level(3)
        expect(freezer.temperature).to eq(40)
    end

    it "remains capacity" do
        freezer = Freezer.new
        item1 = double("item1", volume: 10)
        item2 = double("item2", volume: 20)
        freezer.add(item1)
        freezer.add(item2)
        expect(freezer.remaining_capacity).to eq(70)
    end
end
