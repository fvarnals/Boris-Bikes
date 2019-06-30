require 'Van'
require 'Bike'
describe Van do
    it { is_expected.to respond_to(:transfer_bikes) }
    it "Can initialize van with bikes" do
      bike1 = Bike.new
      expect(Van.new([bike1]).bikes).to eq [bike1]
    end

    it "Can transfer fixed bikes to docking station" do
      station = DockingStation.new
      bike1 = Bike.new
      van = Van.new([bike1])
      expect(van.transfer_bikes(station,false)).to eq [bike1]
    end

    it "Can transfer broken bikes to garage" do
      garage = Garage.new
      bike1 = Bike.new(true) #broken bike
      van = Van.new([bike1])
      expect(van.transfer_bikes(garage)).to eq [bike1]
    end
    
end
