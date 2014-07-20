require 'spec_helper'

describe BrokerPayment do
  it 'should save when all fields are present' do
    FactoryGirl.build(:broker_payment)
  end
  it 'should not save when amount is not present' do
    FactoryGirl.build(:broker_payment, amount:nil).should_not be_valid
  end
  it 'should not save when payment_type is not present' do
    FactoryGirl.build(:broker_payment, payment_type:nil).should_not be_valid
  end
  it 'should not save when status is not present' do
    FactoryGirl.build(:broker_payment, status:nil).should_not be_valid
  end
end
