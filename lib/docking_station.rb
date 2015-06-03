require_relative 'bike'

class DockingStation
  Capacity = 20

  attr_accessor :capacity

  def initialize
    @bikes = []
    @capacity = Capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock bike
    fail 'Station full' if full?
    @bikes << bike
  end

  private



  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= @capacity
  end


end
