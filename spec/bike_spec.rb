require 'Bike'

describe Bike do
 it {is_expected.to respond_to(:working?)}

 it "Bike can be reported as broken" do
    expect(subject.report).to eq true
 end
  # As a member of the public,
  # So that I reduce the chance of getting a broken bike in future,
  # I'd like to report a bike as broken when I return it.

end
