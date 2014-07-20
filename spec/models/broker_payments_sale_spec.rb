require 'spec_helper'

describe BrokerPaymentsSale do
  it 'should save when all fields are present' do
    FactoryGirl.build(:broker_payments_sale)
  end
  it 'should not save when broker_payment_id is not present' do
    FactoryGirl.build(:broker_payments_sale, broker_payment_id:nil).should_not be_valid
  end
  it 'should not save when sale_id is not present' do
    FactoryGirl.build(:broker_payments_sale, sale_id:nil).should_not be_valid
  end
end
