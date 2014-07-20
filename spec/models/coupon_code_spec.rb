require 'spec_helper'

describe CouponCode do
  it 'should save when all fields are present' do
    FactoryGirl.build(:coupon_code)
  end
  it 'should not save when code is not present' do
    FactoryGirl.build(:coupon_code, code:nil).should_not be_valid
  end  
  it 'should not save when discount_type is not present' do
    FactoryGirl.build(:coupon_code, discount_type:nil).should_not be_valid
  end  
  it 'should not save when amount is not present' do
    FactoryGirl.build(:coupon_code, amount:nil).should_not be_valid
  end  
  it 'should not save when quantity is not present' do
    FactoryGirl.build(:coupon_code, quantity:nil).should_not be_valid
  end  
  it 'should not save when starts_at is not present' do
    FactoryGirl.build(:coupon_code, starts_at:nil).should_not be_valid
  end  
  it 'should not save when expires_at is not present' do
    FactoryGirl.build(:coupon_code, expires_at:nil).should_not be_valid
  end  
end
