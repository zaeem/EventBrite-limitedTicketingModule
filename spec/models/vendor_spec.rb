require 'spec_helper'

describe Vendor do
  it 'should save when all fields are present' do
    FactoryGirl.build(:vendor)
  end
  it 'should not save when name is not present' do
    FactoryGirl.build(:vendor, name:nil).should_not be_valid
  end
end
