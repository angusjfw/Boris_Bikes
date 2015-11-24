require '~/boris_bikes/lib/docking_station'
station = DockingStation.new
puts station.bikes.length
20.times { station.dock(Bike.new)  }
puts "adding bikes"
puts station.bikes.length
bike = station.release_bike
puts "releasing one bike" 
puts station.bikes.length
puts bike.working?
puts "end of script" 
