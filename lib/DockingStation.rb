require_relative './Bike.rb'
require 'pry'

class DockingStation
  
  DEFAULT_CAPACITY = 20
  
  def initialize
    @bikes = []
  end

  attr_reader :bike
  attr_reader :bikes
  # Equivalent to:
  # def bike
  # @bike
  # end

  def release_bike
    empty? ? (raise "Error: no bikes available") : (@bikes.delete_at(0))
  end

  def dock(bike)
    full? ? (raise "Error: capacity full") : (@bikes << bike)
    #@bike = bike
  end

  private

  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
  
end

#binding.pry
