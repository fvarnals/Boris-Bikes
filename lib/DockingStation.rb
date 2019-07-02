require_relative './Bike.rb'
require 'pry'
require 'bike_container'

class DockingStation
  DEFAULT_CAPACITY = 20
  include BikeContainer

  def initialize(bikes = [], capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = bikes
  end

  attr_reader :bikes
  attr_reader :capacity
  attr_writer :bikes
  # Equivalent to:
  # def capacity
  # @capacity
  # end

  def release_bike
    empty? ? (raise "Error: no bikes available") : check
  end

  def dock(bike)
    full? ? (raise "Error: capacity full") : (@bikes << bike)
    #@bike = bike
  end

  private
  def check
    @bikes[0].broken ? (raise "Error: cannot release broken bike") : (@bikes.delete_at(0))
  end
end

binding.pry
