class Garage
  def initialize(bikes = [])
    @bikes = bikes
  end
  attr_reader :bikes
  def collect_bikes(van)
    @bikes = van.release_broken_bikes
  end
  def release_fixed_bikes
    dropoffbikes = []
    for i in 0..@bikes.length-1
      if !@bikes[i].broken
        dropoffbikes.push(@bikes[i])
      end
    end

    @bikes.delete_if { |bike| !bike.broken }
    return dropoffbikes
  end
  def fix_bikes
    for bike in @bikes
      if bike.broken
        bike.change_status
      end
    end 
  end

end
