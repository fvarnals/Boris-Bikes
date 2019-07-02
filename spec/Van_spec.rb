require 'Van'
require 'Bike'
require 'support/shared_examples_for_bike_container'
describe Van do
    it_behaves_like BikeContainer
    it "Can initialize van with bikes" do
      bike1 = Bike.new
      expect(Van.new([bike1]).bikes).to eq [bike1]
    end
end
