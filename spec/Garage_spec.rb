require 'Garage'
describe Garage do

  it { is_expected.to respond_to(:fix_bikes) }
  it "can initialize garage with bikes" do
    bike1 = Bike.new
    expect(Garage.new([bike1]).bikes).to eq [bike1]
  end

  it "when collect_bikes is called garage picks up the broken bikes from the van" do

    bike1 = Bike.new
    bike1.report
    van = Van.new([bike1])
    expect(subject.collect_bikes(van)).to eq [bike1]

  end
  it "when transfer_bikes is called garage returns its bikes and empties its bikes array" do
    bike1 = Bike.new
    garage1 = Garage.new([bike1])
    expect(garage1.transfer_bikes).to eq [bike1]
  end
  it "fixes the garages bikes" do
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
