require 'bike_container'

class Garage
  include BikeContainer
  DEFAULT_CAPACITY = 20
  def initialize(bikes = [], capacity = DEFAULT_CAPACITY)
    @bikes = bikes
    @capacity = capacity
  end
  attr_reader :capacity
  attr_reader :bikes
  attr_writer :bikes

  def fix_bikes
    for bike in @bikes
      bike.broken ? bike.change_status : nil
    end
  end

  private
  def broken_transfer(i)
    @bikes[i].broken ? @bikes[i] : false
  end
  def working_transfer(i)
    !@bikes[i].broken ? @bikes[i] : false
  end
end
