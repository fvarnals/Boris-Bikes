class Van
  def initialize(bikes = [])
    @bikes = bikes
  end
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

  private
  def broken_transfer(i)
    @bikes[i].broken ? @bikes[i] : false
  end
  def working_transfer(i)
    !@bikes[i].broken ? @bikes[i] : false
  end

end
