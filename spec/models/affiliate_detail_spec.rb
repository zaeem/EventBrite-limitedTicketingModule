require 'spec_helper'

describe AffiliateDetail do
  it 'should save when all fields are present' do
    FactoryGirl.build(:affiliate_detail)
  end
  it 'should not save when user_id is not present' do
    FactoryGirl.build(:affiliate_detail, user_id:nil).should_not be_valid
  end
  it 'should not save when percentage is not present' do
    FactoryGirl.build(:affiliate_detail, percentage:nil).should_not be_valid
  end
  it 'should not save when flat_fee is not present' do
    FactoryGirl.build(:affiliate_detail, flat_fee:nil).should_not be_valid
  end
  it 'should not save when commissionable_type is not present' do
    FactoryGirl.build(:affiliate_detail, commissionable_type:nil).should_not be_valid
  end
  it 'should not save when payment_threshold is not present' do
    FactoryGirl.build(:affiliate_detail, payment_threshold:nil).should_not be_valid
  end
  it 'should not save when locked is not present' do
    FactoryGirl.build(:affiliate_detail, locked:nil).should_not be_valid
  end
  it 'should not save when payment_method is not present' do
    FactoryGirl.build(:affiliate_detail, payment_method:nil).should_not be_valid
  end
  it 'should not save when affiliate_token is not present' do
    FactoryGirl.build(:affiliate_detail, affiliate_token:nil).should_not be_valid
  end
  it 'should not save when token_active is not present' do
    FactoryGirl.build(:affiliate_detail, token_active:nil).should_not be_valid
  end
  it 'should not save when payments_active is not present' do
    FactoryGirl.build(:affiliate_detail, payments_active:nil).should_not be_valid
  end
end