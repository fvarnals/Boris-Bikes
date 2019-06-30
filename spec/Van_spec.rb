require 'Van'
require 'Bike'
describe Van do
    it { is_expected.to respond_to(:collect_bikes) }
    it { is_expected.to respond_to(:transfer_bikes) }
    it "can initialize van with bikes" do
      bike1 = Bike.new
      expect(Van.new([bike1]).bikes).to eq [bike1]
    end
    it "when collect_bikes is called van picks up the broken bikes from the docking station" do
      station = DockingStation.new
      bike1 = Bike.new
      bike1.report
      station.dock(bike1)
      expect(subject.collect_bikes(station)).to eq [bike1]

    end
    it "when transfer_bikes is called van returns its bikes and empties its bikes array" do
      station = DockingStation.new
      bike1 = Bike.new
      bike1.report
      station.dock(bike1)
      subject.collect_bikes(station)
      expect(subject.transfer_bikes).to eq [bike1]
    end

    it "can collect fixed bikes from garage" do
      bike1 = Bike.new
      garage1 = Garage.new([bike1])
      subject.collect_bikes(garage1, false)
      expect(subject.bikes).to eq [bike1]
    end
end
