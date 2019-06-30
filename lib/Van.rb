class Van
  def initialize(bikes = [])
    @bikes = bikes
  end
  attr_reader :bikes

  def collect_bikes(dockingstation, broken = true)
    @bikes = dockingstation.transfer_bikes(broken)

  end

  def transfer_bikes(broken = true)
    bikes = []
    for i in 0..@bikes.length-1
      if broken
        broken_transfer(i) ? bikes.push(@bikes[i]) : nil
      else
        working_transfer(i) ? bikes.push(@bikes[i]) : nil
      end
    end

    broken ? @bikes.delete_if { |bike| bike.broken } : @bikes.delete_if { |bike| !bike.broken }

    return bikes
  end

  private
  def broken_transfer(i)
    @bikes[i].broken ? @bikes[i] : false
  end
  def working_transfer(i)
    !@bikes[i].broken ? @bikes[i] : false
  end

end
