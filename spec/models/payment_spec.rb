require 'spec_helper'

describe Payment do
  it 'should save when all fields are present' do
    FactoryGirl.build(:payment)
  end  
  it 'should not save when sale_id is not present' do
    FactoryGirl.build(:payment, sale_id:nil).should_not be_valid
  end
  it 'should not save when payment_type is not present' do
    FactoryGirl.build(:payment, payment_type:nil).should_not be_valid
  end
  it 'should not save when amount is not present' do
    FactoryGirl.build(:payment, amount:nil).should_not be_valid
  end
  it 'should not save when created_at is not present' do
    FactoryGirl.build(:payment, created_at:nil).should_not be_valid
  end
  it 'should not save when updated_at is not present' do
    FactoryGirl.build(:payment, updated_at:nil).should_not be_valid
  end
end