require 'bike'

describe Bike do
  it 'responds to method working?' do 
    expect(subject.responds_to?(:working?)).to eq(true)
  end
end
