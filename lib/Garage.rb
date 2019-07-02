class Garage
  DEFAULT_CAPACITY = 20
  def initialize(bikes = [], capacity = DEFAULT_CAPACITY)
    @bikes = bikes
    @capacity = capacity
  end
  attr_reader :capacity
  attr_reader :bikes
  attr_writer :bikes

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
