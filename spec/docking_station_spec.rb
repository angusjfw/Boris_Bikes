require 'docking_station'

describe DockingStation do

  it 'responds to release_bike message' do
    expect(subject.respond_to?(:release_bike)).to eq(true)
  end

  it  'releases a bike when there is one' do
    subject.dock("i am a double")
    expect(subject.release_bike).to eq("i am a double")
  end

  it 'error raised if you try to release bike when there are none' do
    expect { subject.release_bike }.to raise_error('no bikes available')
  end

  let(:bike) { double :bike }
  it 'checks if bike working' do
    subject.bikes.length.times { subject.release_bike }
    allow(bike).to receive(:working).and_return(true)
    subject.dock(double(:bike))
    released_bike = subject.release_bike
    expect(released_bike.working).to eq(true)
  end

  let(:bike) { double :bike }
  it 'releases working bikes' do
    subject.bikes.length.times { subject.release_bike }
    allow(bike).to receive(:working).and_return(true)
    subject.dock double(:bike)
    released_bike = subject.release_bike
    expect(released_bike).to be_working
  end

  it 'responds to dock message' do
    expect(subject.respond_to?(:dock)).to eq(true)
  end

  it 'is default capacity equal to 20' do
    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it 'capacity is settable' do
    station =  DockingStation.new(100)
    99.times { station.dock(double(:bike)) }
    expect {station.dock(double(:bike))}.to_not raise_error
  end

  it 'raise error if docking station is full and try to dock' do
    subject.capacity.times { subject.dock(double(:bike)) }
    expect { subject.dock(double(:bike)) }.to raise_error("bike dock full")
  end

  it 'user can report broken bikes when docking' do
    subject.bikes.length.times { subject.release_bike }
    expect((subject.dock(double(:bike), false)).last[1]).to eq(false)
  end

  it 'does not release broken bikes' do     
    subject.bikes.length.times { subject.release_bike }
    subject.dock(double(:bike), false)
    expect {subject.release_bike}.to raise_error("no working bikes available")
  end

end
