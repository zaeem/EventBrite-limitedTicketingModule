require 'spec_helper'

describe Disclosure do
  it 'should save when all fields are present' do
    FactoryGirl.build(:disclosure)
  end
  it 'should not save when name is not present' do
    FactoryGirl.build(:disclosure, name:nil).should_not be_valid
  end
end
