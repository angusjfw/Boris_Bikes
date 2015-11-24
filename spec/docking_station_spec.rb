require 'docking_station'

describe DockingStation do

  it 'responds to release_bike message' do
    expect(subject.respond_to?(:release_bike)).to eq(true)
  end

  it 'can bike be docked' do
    expect(subject.respond_to?(:dock)).to eq(true)
  end

end
