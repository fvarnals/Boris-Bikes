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

end
