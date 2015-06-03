feature 'public returns a bike' do
  scenario 'bike cannot be docked when station is full' do
    station = DockingStation.new
    station.capacity.times { station.dock Bike.new }
    expect { station.dock Bike.new }.to raise_error 'Station full'
  end

  scenario 'adjust capacity at will' do
    station = DockingStation.new
    station.capacity = 50
    expect(station.capacity).to eq 50
  end

  scenario 'bike can be reported broken when returned' do
    station = DockingStation.new
    bike = Bike.new
    bike.report_broken
    expect(bike).to be_broken
    expect { station.dock bike }.not_to raise_error
  end

end
