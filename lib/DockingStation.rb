require_relative './Bike.rb'
require 'pry'

class DockingStation
  DEFAULT_CAPACITY = 20

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

  def transfer_bikes(depot, broken = true)
    bikes = []
    for i in 0..@bikes.length-1
      if broken
        broken_transfer(i) ? bikes.push(@bikes[i]) : nil
      else
        working_transfer(i) ? bikes.push(@bikes[i]) : nil
      end
    end

    broken ? @bikes.delete_if { |bike| bike.broken } : @bikes.delete_if { |bike| !bike.broken }

    bikes.each { |bike| depot.bikes.push(bike) }
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

  def broken_transfer(i)
    @bikes[i].broken ? @bikes[i] : false
  end
  def working_transfer(i)
    !@bikes[i].broken ? @bikes[i] : false
  end
end

binding.pry
