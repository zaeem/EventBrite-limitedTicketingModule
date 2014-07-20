require 'spec_helper'

describe Offer do
  it 'should save when all fields are present' do
    FactoryGirl.build(:offer)
  end
  it 'should not save when venue_group_id is not present' do
    FactoryGirl.build(:offer, venue_group_id:nil).should_not be_valid
  end    
  it 'should not save when event_id is not present' do
    FactoryGirl.build(:offer, event_id:nil).should_not be_valid
  end    
  it 'should not save when user_id is not present' do
    FactoryGirl.build(:offer, user_id:nil).should_not be_valid
  end    
  it 'should not save when price is not present' do
    FactoryGirl.build(:offer, price:nil).should_not be_valid
  end    
  it 'should not save when quantity is not present' do
    FactoryGirl.build(:offer, quantity:nil).should_not be_valid
  end    
  it 'should not save when price is not present' do
    FactoryGirl.build(:offer, price:nil).should_not be_valid
  end    
  it 'should not save when multiple is not present' do
    FactoryGirl.build(:offer, multiple:nil).should_not be_valid
  end    
  it 'should not save when status is not present' do
    FactoryGirl.build(:offer, status:nil).should_not be_valid
  end    
  it 'should not save when expected_ship_date is not present' do
    FactoryGirl.build(:offer, expected_ship_date:nil).should_not be_valid
  end    
  it 'should not save when is_negotiation is not present' do
    FactoryGirl.build(:offer, is_negotiation:nil).should_not be_valid
  end
  it 'should not save when confirm_transaction is not present' do
    FactoryGirl.build(:offer, confirm_transaction:nil).should_not be_valid
  end
  it 'should not save when piggy_backed is not present' do
    FactoryGirl.build(:offer, piggy_backed:nil).should_not be_valid
  end

  # Seller will confirm the sale.
  it 'should succeed a sellers confirmation' do
    @offer = FactoryGirl.build(:offer)
    @offer['status'] = 'Approved'
    @offer.save
  end
end