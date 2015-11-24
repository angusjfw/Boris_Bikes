require 'docking_station'

describe DockingStation do

  it 'responds to release_bike message' do  # working bike check?
    expect(subject.respond_to?(:release_bike)).to eq(true)
  end

  it 'is bike working' do
    bike = Bike.new
    subject.dock(bike)
    released_bike = subject.release_bike
    expect(released_bike.working?).to eq(true)

  end

  it 'can bike be docked' do
    expect(subject.respond_to?(:dock)).to eq(true)
  end

  # describe the release bike method i.e. '#release bike' do
  it  'releases a bike ' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq(bike)
  end


  it 'error raised if you try to release bike' do

    expect { subject.release_bike }.to raise_error

  end
 # end





  it 'raise error if docking station is full and try to dock' do

    subject.capacity.times { subject.dock(Bike.new) }

    expect {subject.dock}.to raise_error
  end

  it 'is default capacity equal to 20' do
    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it 'is docking default capacity variable' do
    station =  DockingStation.new(100)
    99.times { station.dock(Bike.new) }
    expect(station.dock(Bike.new)).to_not raise_error

  end



end
