require 'spec_helper'

describe Address do
  it 'should save when all fields are present' do
    FactoryGirl.build(:address)
  end
  it 'should not save when user_id is not present' do
    FactoryGirl.build(:address, user_id:nil).should_not be_valid
  end
  it 'should not save when address_type is not present' do
    FactoryGirl.build(:address, address_type:nil).should_not be_valid
  end
  it 'should not save when name is not present' do
    FactoryGirl.build(:address, name:nil).should_not be_valid
  end
  it 'should not save when address1 is not present' do
    FactoryGirl.build(:address, address1:nil).should_not be_valid
  end
  it 'should not save when city is not present' do
    FactoryGirl.build(:address, city:nil).should_not be_valid
  end
  it 'should not save when state is not present' do
    FactoryGirl.build(:address, state:nil).should_not be_valid
  end
  it 'should not save when zip is not present' do
    FactoryGirl.build(:address, zip:nil).should_not be_valid
  end
  it 'should not save when phone is not present' do
    FactoryGirl.build(:address, phone:nil).should_not be_valid
  end
end