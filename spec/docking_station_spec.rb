require 'DockingStation'
require 'support/shared_examples_for_bike_container'

describe DockingStation do
  it_behaves_like BikeContainer


  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock) }

  it "When a bike is docked, we can see that a bike has been docked" do
    bike1 = double(:bike)
    expect(subject.dock(bike1)).to eq subject.bikes
  end

  it "When there are no bikes docked, should raise an error to release bikes" do
    expect {subject.release_bike}.to raise_error("Error: no bikes available")
  end

  it "When the bike station is full, should raise an error to say it's full" do
    station = DockingStation.new
    subject.capacity.times { station.dock double(:bike) }
    expect { station.dock(double(:bike)) }.to raise_error("Error: capacity full")
  end

  it "When no capacity is specified, capacity will equal default capacity (20) " do
    expect(DockingStation.new.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "When a capacity of '7' is specified, capacity will equal '7' " do
    expect(DockingStation.new(nil ,7).capacity).to eq 7
  end
  let(:bike) {double :bike}
  it "It does not let you release a broken bike from the docking station" do
    #allow(bike).to receive(:broken).and_return(true)
    bike = double("bike", :broken => true)
    subject.dock(bike)
    expect {subject.release_bike}.to raise_error("Error: cannot release broken bike")
  end
end
  # it "Should transfer broken bikes to Van" do
  #   broken_bike = Bike.new
  #   broken_bike.report
  #   broken_bike2 = Bike.new
  #   broken_bike2.report
  #   subject.dock(broken_bike)
  #   subject.dock(broken_bike2)
  #   van = Van.new
  #   expect(subject.transfer_bikes(van)).to eq [broken_bike, broken_bike2]
  # end
