require 'spec_helper'

describe User do
  it 'should save when all fields are present' do
    FactoryGirl.build(:user)
  end
  it 'should not save when first_name is not present' do
    FactoryGirl.build(:user, first_name:nil).should_not be_valid
  end
  it 'should not save when last_name is not present' do
    FactoryGirl.build(:user, last_name:nil).should_not be_valid
  end
  it 'should not save when email is not present' do
    FactoryGirl.build(:user, email:nil).should_not be_valid
  end
  it 'should not save when password is not present' do
    FactoryGirl.build(:user, password:nil).should_not be_valid
  end
  it 'should not save when phone is not present' do
    FactoryGirl.build(:user, phone:nil).should_not be_valid
  end
  it 'should not save when security_question1 is not present' do
    FactoryGirl.build(:user, security_question1:nil).should_not be_valid
  end
  it 'should not save when sale_commission is not present' do
    FactoryGirl.build(:user, sale_commission:nil).should_not be_valid
  end
  it 'should not save when negotiation_commission is not present' do
    FactoryGirl.build(:user, negotiation_commission:nil).should_not be_valid
  end
end