require_relative './Bike.rb'
require 'pry'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  attr_reader :bikes
  attr_reader :capacity
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

  # def dock(bike, report = true)
  #   full? ? (raise "Error: capacity full") : (@bikes << bike)
  #
  #   if !report
  #     bike.change_status
  #   end
  # end

  def release_broken_bikes
    broken_bikes = []
    for i in 0..@bikes.length-1
      if @bikes[i].broken
        broken_bikes.push(@bikes[i])
      end
    end

    @bikes.delete_if { |bike| bike.broken }
    return broken_bikes
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
