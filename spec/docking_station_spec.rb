require 'DockingStation'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock) }


=begin
  it "when a bike is released, we expect the bike to be working" do
    bike = subject.release_bike
    expect(bike.working?).to eq true
  end
=end


  it "when a bike is docked, we can see that a bike has been docked" do
    bike1 = Bike.new
    expect(subject.dock(bike1)).to eq subject.bikes
  end
  it "when there are no bikes docked, should raise an error to release bikes" do
    expect {subject.release_bike}.to raise_error("Error: no bikes available")
  end
  it "when the bike station is full, should raise an error to say it's full" do
    station = DockingStation.new
    20.times { station.dock Bike.new }
    bike = Bike.new
    expect { station.dock(bike) }.to raise_error("Error: capacity full")
  end
end
