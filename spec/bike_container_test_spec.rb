require 'support/shared_examples_for_bike_container'
#they all contain bikes
#they all transfer bikes to another depot

# The purpose of this class is to give us an instance of
# something that includes `BikeContainer`, to initially run tests against
class BikeContainerTest
  include BikeContainer
end

# `it_behaves_like BikeContainer` imports all the tests in the shared example
describe BikeContainerTest do
  it_behaves_like BikeContainer
end

# require 'DockingStation'
# require 'Van'
# require 'Garage'
# describe BikeContainer do
# it "Can transfer fixed bikes to docking station" do
#   station = DockingStation.new
#   bike1 = Bike.new
#   expect(Van.new([bike1]).transfer_bikes(station,false)).to eq [bike1]
# end
#
# it "Can transfer broken bikes to garage" do
#   garage = Garage.new
#   bike1 = Bike.new(true) #broken bike
#   expect(Van.new([bike1]).transfer_bikes(garage)).to eq [bike1]
# end
#
# it "Should transfer broken bikes to Van" do
#   broken_bike = Bike.new
#   broken_bike.report
#   broken_bike2 = Bike.new
#   broken_bike2.report
#   station = DockingStation.new([broken_bike1,broken_bike2])
#   van = Van.new
#   expect(station.transfer_bikes(van)).to eq [broken_bike, broken_bike2]
# end
#
# it "can transfer bikes to van" do
#   bike1 = Bike.new
#   van = Van.new
#   expect(Garage.new([bike1]).transfer_bikes(van,false)).to eq [bike1]
# end
