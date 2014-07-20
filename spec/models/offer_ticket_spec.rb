require 'spec_helper'

describe OfferTicket do
  it 'should save when all fields are present' do
    FactoryGirl.build(:offer_ticket)
  end
  it 'should not save when offer_id is not present' do
    FactoryGirl.build(:offer_ticket, offer_id:nil).should_not be_valid
  end
  it 'should not save when venue_row_id is not present' do
    FactoryGirl.build(:offer_ticket, venue_row_id:nil).should_not be_valid
  end
  it 'should not save when status is not present' do
    FactoryGirl.build(:offer_ticket, status:nil).should_not be_valid
  end
  it 'should not save when seat_number is not present' do
    FactoryGirl.build(:offer_ticket, seat_number:nil).should_not be_valid
  end
end
