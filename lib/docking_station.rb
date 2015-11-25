require_relative './bike.rb'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    return @bikes.pop unless dock_empty?
    raise "sorry no bikes avaialble"
  end

  def dock(new_bike)
    return @bikes << new_bike unless dock_full?
    raise "sorry bike dock full capacity: #{@capacity}"
  end

  private

  def dock_full?
     @bikes.length >= @capacity
  end

  def dock_empty?
     @bikes.empty?
  end

end
