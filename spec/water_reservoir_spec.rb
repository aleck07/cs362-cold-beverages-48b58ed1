require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

  it 'has a default capacity of 10' do
    reservoir = WaterReservoir.new
    expect(reservoir.capacity).to eq(10)
  end

  it 'is initially empty' do
    reservoir = WaterReservoir.new
    expect(reservoir.empty?).to eq(true)
  end

  it 'is no longer empty after filling' do
    reservoir = WaterReservoir.new
    reservoir.fill
    expect(reservoir.empty?).to eq(true)
  end

  it 'can be drained' do
    reservoir = WaterReservoir.new(10, 10)
    reservoir.drain(5)
    expect(reservoir.current_water_volume).to eq(5)
  end

end
