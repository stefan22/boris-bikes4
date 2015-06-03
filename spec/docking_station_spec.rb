require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'releases working bikes' do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'raises an error when no bikes are available' do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it 'raises an error when docking station full' do
    20.times { subject.dock Bike.new }
    expect { subject.dock Bike.new }.to raise_error "Station full"
  end

end
