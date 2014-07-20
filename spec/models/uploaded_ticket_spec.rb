require 'spec_helper'

describe UploadedTicket do
  it 'should save when all fields are present' do
    FactoryGirl.build(:uploaded_ticket)
  end
  it 'should not save when offer_ticket_id is not present' do
    FactoryGirl.build(:uploaded_ticket, offer_ticket_id:nil).should_not be_valid
  end
  it 'should not save when ticket_file is not present' do
    FactoryGirl.build(:uploaded_ticket, ticket_file:nil).should_not be_valid
  end
end
