class Bike

  attr_writer :broken
  def initialize(broken = false)
    @broken = broken
  end

  attr_reader :broken

  def working?
    true
  end

  def change_status
    @broken = !@broken
  end

  def report
    @broken = true
  end

end
