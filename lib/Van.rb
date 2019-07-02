require 'bike_container'

class Van
  include BikeContainer
  DEFAULT_CAPACITY = 20
  def initialize(bikes = [], capacity = DEFAULT_CAPACITY)
    @bikes = bikes
    @capacity = capacity
  end
  attr_reader :capacity
  attr_reader :bikes
  attr_writer :bikes

end
