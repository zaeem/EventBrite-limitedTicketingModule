require 'spec_helper'

describe Setting do
  it 'should save when all fields are present' do
    FactoryGirl.build(:setting)
  end
  it 'should not save when name is not present' do
    FactoryGirl.build(:setting, name:nil).should_not be_valid
  end
  it 'should not save when value is not present' do
    FactoryGirl.build(:setting, value:nil).should_not be_valid
  end
end
