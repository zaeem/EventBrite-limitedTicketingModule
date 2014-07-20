require 'spec_helper'

describe CreditCard do
  it 'should save when all fields are present' do
    FactoryGirl.build(:credit_card)
  end         
  it 'should not save when user_id is not present' do
    FactoryGirl.build(:credit_card, user_id:nil).should_not be_valid
  end  
  it 'should not save when address_id is not present' do
    FactoryGirl.build(:credit_card, address_id:nil).should_not be_valid
  end  
  it 'should not save when first_name is not present' do
    FactoryGirl.build(:credit_card, first_name:nil).should_not be_valid
  end  
  it 'should not save when last_name is not present' do
    FactoryGirl.build(:credit_card, last_name:nil).should_not be_valid
  end  
  it 'should not save when number is not present' do
    FactoryGirl.build(:credit_card, number:nil).should_not be_valid
  end  
  it 'should not save when expiration_month is not present' do
    FactoryGirl.build(:credit_card, expiration_month:nil).should_not be_valid
  end  
  it 'should not save when expiration_year is not present' do
    FactoryGirl.build(:credit_card, expiration_year:nil).should_not be_valid
  end  
  it 'should not save when ccv is not present' do
    FactoryGirl.build(:credit_card, ccv:nil).should_not be_valid
  end    
end