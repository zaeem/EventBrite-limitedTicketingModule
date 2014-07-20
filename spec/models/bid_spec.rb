require 'spec_helper'

describe Bid do
  it 'should save when all fields are present' do
    FactoryGirl.build(:bid)
  end
  it 'should not save when venue_group_id is not present' do
    FactoryGirl.build(:bid, venue_group_id:nil).should_not be_valid
  end
  it 'should not save when event_id is not present' do
    FactoryGirl.build(:bid, event_id:nil).should_not be_valid
  end
  it 'should not save when user_id is not present' do
    FactoryGirl.build(:bid, user_id:nil).should_not be_valid
  end
  it 'should not save when price is not present' do
    FactoryGirl.build(:bid, price:nil).should_not be_valid
  end
  it 'should not save when quantity is not present' do
    FactoryGirl.build(:bid, quantity:nil).should_not be_valid
  end
  it 'should not save when status is not present' do
    FactoryGirl.build(:bid, status:nil).should_not be_valid
  end
  it 'should not save when is_negotiation is not present' do
    FactoryGirl.build(:bid, is_negotiation:nil).should_not be_valid
  end
end