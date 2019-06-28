class Van
  def initialize(bikes = [])
    @bikes = bikes
  end
  attr_reader :bikes

  def collect_bikes(dockingstation)
    @bikes = dockingstation.release_broken_bikes

  end

  def release_broken_bikes
    dropoffbikes = []
    for i in 0..@bikes.length-1
      if @bikes[i].broken
        dropoffbikes.push(@bikes[i])
      end
    end

    @bikes.delete_if { |bike| bike.broken }
    return dropoffbikes
  end

end
