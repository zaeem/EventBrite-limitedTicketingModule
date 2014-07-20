require 'spec_helper'

describe NegotiationLog do
  it 'should save when all fields are present' do
    FactoryGirl.build(:negotiation_log)
  end
  it 'should not save when bid_id is not present' do
    FactoryGirl.build(:negotiation_log, bid_id:nil).should_not be_valid
  end  
  it 'should not save when offer_id is not present' do
    FactoryGirl.build(:negotiation_log, offer_id:nil).should_not be_valid
  end  
  it 'should not save when price is not present' do
    FactoryGirl.build(:negotiation_log, price:nil).should_not be_valid
  end  
  it 'should not save when quantity is not present' do
    FactoryGirl.build(:negotiation_log, quantity:nil).should_not be_valid
  end  
  it 'should not save when negotiation_type is not present' do
    FactoryGirl.build(:negotiation_log, negotiation_type:nil).should_not be_valid
  end  
  it 'should not save when created_at is not present' do
    FactoryGirl.build(:negotiation_log, created_at:nil).should_not be_valid
  end

  #	Buyer Negotiating With a Seller
  it 'should succeed a Buyer Negotiating With a Seller'

  #	Buyer Counter-Counter-Negotiating with a Seller
  it 'should succeed a Buyer Counter-Counter-Negotiating with a Seller'

  #	Seller Negotiating With a Buyer
  it 'should succeed a Seller Negotiating With a Buyer'

  # Buyer Counter-Negotiating with a Seller
  it 'should succeed a Buyer Counter-Negotiating with a Seller'

  # Seller Counter-Counter-Negotiating with a Buyer
  it 'should succeed a Seller Counter-Counter-Negotiating with a Buyer'

  # Priority of Bids – Which “Sell Now’s” will execute first
  it 'should succeed a Priority of Bids Which Sell Now will execute first'

  # Priority of Offers – Which “Buy Now’s” will execute first
  it 'Priority of Offers Which "Buy Now''s" will execute first'

  # Ask Not to have any Negotiations for a Ticket Listing or Bid
  it 'should succeed a Ask Not to have any Negotiations for a Ticket Listing or Bid'

  # Automatically Decline Negotiations or if not within $ or % of Bid or Offer
  it 'Automatically Decline Negotiations or if not within $ or % of Bid or Offer'
end
