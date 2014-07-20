require 'spec_helper'

describe Sale do
  it 'should save when all fields are present' do
    FactoryGirl.build(:sale)
  end
  it 'should not save when offer_id is not present' do
    FactoryGirl.build(:sale, offer_id:nil).should_not be_valid
  end
  it 'should not save when ticket_status_id is not present' do
    FactoryGirl.build(:sale, ticket_status_id:nil).should_not be_valid
  end
  #	The user must have already input their quantity
  it 'should not save when quantity is not present' do
    FactoryGirl.build(:sale, quantity:nil).should_not be_valid
  end
  it 'should not save when price is not present' do
    FactoryGirl.build(:sale, price:nil).should_not be_valid
  end
  it 'should not save when payment_status is not present' do
    FactoryGirl.build(:sale, payment_status:nil).should_not be_valid
  end

  #	Process sale for a Buy Now
  it 'should succeed a buy now' do
    @bid = FactoryGirl.build(:bid)
    @offer = FactoryGirl.build(:offer)
    @sale = FactoryGirl.build(:sale, bid: @bid, offer: @offer)
  end

  #	Process sale for a Buy Now for Bid A Price 100 Proxy 125 Quantity 4
  it 'should succeed a buy now for Bid A Price 100 Proxy 125 Quantity 4'

  #	Process sale for a Buy Now for Bid B Price 100 Proxy 110 Quantity 1
  it 'should succeed a buy now for Bid B Price 100 Proxy 110 Quantity 1'

  #	Process sale for a Buy Now for Bid C Price 95 Proxy 125 Quantity 2
  it 'should succeed a buy now for Bid C Price 95 Proxy 125 Quantity 2'

  #	Process sale for a Buy Now for Bid D Price 90 Proxy 135 Quantity 3
  it 'should succeed a buy now for Bid D Price 90 Proxy 135 Quantity 3'

  #	Process sale for a Buy Now for Bid Z Price 150 Proxy 125 Quantity 2
  it 'should succeed a buy now for Bid Z Price 150 Proxy 125 Quantity 2'

  #	Process sale for a Buy Now for Bid Y Price 165 Proxy 120 Quantity 4
  it 'should succeed a buy now for Bid Y Price 165 Proxy 120 Quantity 4'

  #	Process sale for a Buy Now for Bid X Price 170 Proxy 125 Quantity 1
  it 'should succeed a buy now for Bid X Price 170 Proxy 125 Quantity 1'

  #	Process sale for a Buy Now for Bid W Price 170 Proxy 0 Quantity 2,3,5
  it 'should succeed a buy now for Bid W Price 170 Proxy 0 Quantity 2,3,5'
end
