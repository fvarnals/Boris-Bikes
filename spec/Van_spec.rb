require 'Van'
describe Van do
    it { is_expected.to respond_to(:collect_bikes) }
    it { is_expected.to respond_to(:drop_off_bikes) }
end
