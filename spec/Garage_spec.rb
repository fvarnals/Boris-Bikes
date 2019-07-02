require 'Garage'
describe Garage do
  #it { is_expected.to respond_to(:collect_bikes) }
  it { is_expected.to respond_to(:transfer_bikes) }
  it "Can initialize with bikes" do
    bike1 = Bike.new
    expect(Garage.new([bike1]).bikes).to eq [bike1]
  end

  # it "Can collect broken bikes from van" do
  #
  #   bike1 = Bike.new
  #   bike1.report
  #   van = Van.new([bike1])
  #   expect(subject.collect_bikes(van)).to eq [bike1]
  #
  # end
  # it "can transfer bikes to van" do
  #   bike1 = Bike.new
  #   garage1 = Garage.new([bike1])
  #   van = Van.new
  #   expect(garage1.transfer_bikes(van,false)).to eq [bike1]
  # end
  it "Fixes any broken bikes in the garage" do
    bike1 = Bike.new
    bike1.report
    bike2 = Bike.new
    bike2.report
    bike3 = Bike.new
    garage1 = Garage.new([bike1,bike2,bike3])
    garage1.fix_bikes
    expect(garage1.bikes[0].broken == false && garage1.bikes[1].broken == false && garage1.bikes[2].broken == false  ).to eq true
  end
end
