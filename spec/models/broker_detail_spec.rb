require 'spec_helper'

describe BrokerDetail do
  it 'should save when all fields are present' do
    FactoryGirl.build(:broker_detail)
  end
  it 'should not save when user_id is not present' do
    FactoryGirl.build(:broker_detail, user_id:nil).should_not be_valid
  end
  it 'should not save when reduction_percentage is not present' do
    FactoryGirl.build(:broker_detail, reduction_percentage:nil).should_not be_valid
  end
  it 'should not save when reduction_flat_fee is not present' do
    FactoryGirl.build(:broker_detail, reduction_flat_fee:nil).should_not be_valid
  end
  it 'should not save when reduction_type is not present' do
    FactoryGirl.build(:broker_detail, reduction_type:nil).should_not be_valid
  end
  it 'should not save when payment_threshold is not present' do
    FactoryGirl.build(:broker_detail, payment_threshold:nil).should_not be_valid
  end
  it 'should not save when locked is not present' do
    FactoryGirl.build(:broker_detail, locked:nil).should_not be_valid
  end
  it 'should not save when payment_method is not present' do
    FactoryGirl.build(:broker_detail, payment_method:nil).should_not be_valid
  end
  it 'should not save when payments_active is not present' do
    FactoryGirl.build(:broker_detail, payments_active:nil).should_not be_valid
  end
end