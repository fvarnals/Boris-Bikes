class Bike
  
  def initialize(broken = false)
    @broken = broken
  end

  attr_reader :broken

  def working?
    true
  end

  def report
    @broken = true
  end

end
