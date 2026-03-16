require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
    it "initalizes with reservoir" do
        reservoir = double('reservoir')
        dispenser = WaterDispenser.new(reservoir)
        expect(dispenser.reservoir).to eq(reservoir)
    end

    it "dispenses water from the reservoir" do
        reservoir = double('reservoir')
        dispenser = WaterDispenser.new(reservoir)
        vessel = double('vessel', volume: 100)
        expect(reservoir).to receive(:drain).with(100)
        dispenser.dispense(vessel)
    end

    it "fills a vessel using the reservoir" do
        reservoir = double('reservoir')
        dispenser = WaterDispenser.new(reservoir)
        vessel = double('vessel')
        expect(reservoir).to receive(:fill)
        dispenser.fill(vessel)
    end
end
