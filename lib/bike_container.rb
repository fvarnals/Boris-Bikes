module BikeContainer

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
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

  # def transfer_bikes(depot, broken = true)
  #   bikes = []
  #   for i in 0..@bikes.length-1
  #     if broken
  #       broken_transfer(i) ? bikes.push(@bikes[i]) : nil
  #     else
  #       working_transfer(i) ? bikes.push(@bikes[i]) : nil
  #     end
  #   end
  #
  #   broken ? @bikes.delete_if { |bike| bike.broken } : @bikes.delete_if { |bike| !bike.broken }
  #
  #   bikes.each { |bike| depot.bikes.push(bike) }
  # end
  #
  # def broken_transfer(i)
  #   @bikes[i].broken ? @bikes[i] : false
  # end
  #
  # def working_transfer(i)
  #   !@bikes[i].broken ? @bikes[i] : false
  # end
