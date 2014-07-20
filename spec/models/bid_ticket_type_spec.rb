require 'spec_helper'

describe BidTicketType do
  it 'should save when all fields are present' do
    FactoryGirl.build(:bid_ticket_type)
  end
  it 'should not save when bid_id is not present' do
    FactoryGirl.build(:bid_ticket_type, bid_id:nil).should_not be_valid
  end
  it 'should not save when ticket_type_id is not present' do
    FactoryGirl.build(:bid_ticket_type, ticket_type_id:nil).should_not be_valid
  end
end
