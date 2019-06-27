require_relative './Bike.rb'
require 'pry'

class DockingStation
  
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  attr_reader :bike
  attr_reader :bikes
  attr_reader :capacity
  # Equivalent to:
  # def bike
  # @bike
  # end

  def release_bike
    empty? ? (raise "Error: no bikes available") : check
  end

  def dock(bike)
    full? ? (raise "Error: capacity full") : (@bikes << bike)
    #@bike = bike
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  def check
    @bikes[0].broken ? (raise "Error: cannot release broken bike") : (@bikes.delete_at(0))
  end
  
end

binding.pry
