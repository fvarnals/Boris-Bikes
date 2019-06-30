class Garage
  def initialize(bikes = [])
    @bikes = bikes
  end
  attr_reader :bikes

  def collect_bikes(van)
    @bikes = van.transfer_bikes
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
