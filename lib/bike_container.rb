module BikeContainer

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(bikes = [], capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = bikes
  end

  def add_bike(bike)
    raise "#{self.class.name} full" if full?
    bikes << bike
  end

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end

  def remove_bike
    raise "#{self.class.name} empty" if empty?
    bikes.pop
  end

  private

  attr_reader :bikes
end
