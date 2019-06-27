require 'DockingStation'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock) }

  it "when a bike is docked, we can see that a bike has been docked" do
    bike1 = Bike.new
    expect(subject.dock(bike1)).to eq subject.bikes
  end
  
  it "when there are no bikes docked, should raise an error to release bikes" do
    expect {subject.release_bike}.to raise_error("Error: no bikes available")
  end
  
  it "when the bike station is full, should raise an error to say it's full" do
    station = DockingStation.new
    subject.capacity.times { station.dock Bike.new }
    expect { station.dock(Bike.new) }.to raise_error("Error: capacity full")
  end

  it "when no capacity is specified, capacity will equal default capacity (20) " do
    expect(DockingStation.new.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "when a capacity of '7' is specified, capacity will equal '7' " do
    expect(DockingStation.new(7).capacity).to eq 7
  end

  it "it does not let you release a broken bike from the docking station" do
    bike = Bike.new
    bike.report
    subject.dock(bike)
    expect {subject.release_bike}.to raise_error("Error: cannot release broken bike")
  end
    

end
