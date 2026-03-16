require_relative '../lib/refrigerator'

describe 'A refrigerator' do
    it "initializes with components" do
        chiller = double('chiller')
        freezer = double('freezer')
        dispenser = double('dispenser')
        reservoir = double('reservoir')

        refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)

        expect(refrigerator.chiller).to eq(chiller)
        expect(refrigerator.freezer).to eq(freezer)
        expect(refrigerator.water_dispenser).to eq(dispenser)
        expect(refrigerator.water_reservoir).to eq(reservoir)
    end

    it "chills an item using the chiller" do
        chiller = double('chiller')
        freezer = double('freezer')
        dispenser = double('dispenser')
        reservoir = double('reservoir')
        item = double('item')
        refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)

        expect(chiller).to receive(:add).with(item)
        refrigerator.chill(item)
    end

    it "freezes an item using the freezer" do
        chiller = double('chiller')
        freezer = double('freezer')
        dispenser = double('dispenser')
        reservoir = double('reservoir')
        item = double('item')
        refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)

        expect(freezer).to receive(:add).with(item)
        refrigerator.freeze(item)
    end

    it "calculates total and remaining capacity" do
        chiller = double('chiller', capacity: 100, remaining_capacity: 75)
        freezer = double('freezer', capacity: 80, remaining_capacity: 50)
        dispenser = double('dispenser')
        reservoir = double('reservoir')
        refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)

        expect(refrigerator.total_capacity).to eq(180)
        expect(refrigerator.remaining_capacity).to eq(125)
    end

    it "plugs in and unplugs both cooling components" do
        chiller = double('chiller')
        freezer = double('freezer')
        dispenser = double('dispenser')
        reservoir = double('reservoir', current_water_volume: 5)

        allow(chiller).to receive(:remaining_capacity).and_return(50)
        allow(chiller).to receive(:capacity).and_return(100)
        allow(chiller).to receive(:temperature).and_return(40)
        allow(freezer).to receive(:remaining_capacity).and_return(30)
        allow(freezer).to receive(:capacity).and_return(100)
        allow(freezer).to receive(:temperature).and_return(10)

        refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)

        expect(chiller).to receive(:turn_on)
        expect(freezer).to receive(:turn_on)
        refrigerator.plug_in
        expect(refrigerator.to_s).to include('Power: on')

        expect(chiller).to receive(:turn_off)
        expect(freezer).to receive(:turn_off)
        refrigerator.unplug
        expect(refrigerator.to_s).to include('Power: off')
    end
end
