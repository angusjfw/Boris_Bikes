require_relative './bike.rb'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    unless dock_empty?
       return get_working_bike if working_bikes?
       fail "no working bikes available"
    else
      raise "no bikes available"
    end
  end

  def dock(new_bike, working=true)
    return @bikes << [new_bike, working] unless dock_full?
    raise "bike dock full"
  end

  private

  def dock_full?
     @bikes.length >= @capacity
  end

  def dock_empty?
     @bikes.empty?
  end

  def get_working_bike
    @bikes.reverse.each { |bike|
      if bike[1] == true
        @bikes -= bike
        return bike[0]
      end
    }
  end

  def working_bikes?
    @bikes.each { |bike|
      return true if bike[1] == true
    }
    return false
  end

end
