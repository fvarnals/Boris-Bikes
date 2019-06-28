require 'Garage'
describe Garage do
  it { is_expected.to respond_to(:bike_count) }
  it { is_expected.to respond_to(:fix_bikes) }
end
