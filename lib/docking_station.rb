require '~/boris_bikes/lib/bike.rb'

class DockingStation

  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []


  end

  def release_bike

    unless dock_empty?
      current_bike = @bikes.last
      @bikes.pop
      return current_bike

    else
      raise "sorry no bikes avaialble"
    end
  end

  def dock(new_bike)
   unless dock_full?
      @bikes << new_bike
   else
      raise "sorry bike dock full capacity: #{DEFAULT_CAPACITY}"
   end
  end

  private  # everything from here is local to class

  def dock_full?
     @bikes.length < DEFAULT_CAPACITY
  end

  def dock_empty?
     @bikes.empty?
  end

end
