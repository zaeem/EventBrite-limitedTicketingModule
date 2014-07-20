require 'spec_helper'

describe AffiliatePayment do
  it 'should save when all fields are present' do
    FactoryGirl.build(:affiliate_payment)
  end
  it 'should not save when user_id is not present' do
    FactoryGirl.build(:affiliate_payment, user_id:nil).should_not be_valid
  end
  it 'should not save when amount is not present' do
    FactoryGirl.build(:affiliate_payment, amount:nil).should_not be_valid
  end
  it 'should not save when affiliate_type is not present' do
    FactoryGirl.build(:affiliate_payment, affiliate_type:nil).should_not be_valid
  end
  it 'should not save when status is not present' do
    FactoryGirl.build(:affiliate_payment, status:nil).should_not be_valid
  end
end