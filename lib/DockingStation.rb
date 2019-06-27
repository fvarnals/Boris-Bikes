require_relative './Bike.rb'
require 'pry'

class DockingStation

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
    @bikes.empty? ? (raise "Error: no bikes available") : (@bikes.delete_at(0))
  end

  def dock(bike)
    @bikes.length >= 20 ? (raise "Error: capacity full") : (@bikes << bike)
    #@bike = bike
  end


end

#binding.pry
