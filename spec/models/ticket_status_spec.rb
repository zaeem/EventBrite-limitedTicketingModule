require 'spec_helper'

describe TicketStatus do
  it 'should save when all fields are present' do
    FactoryGirl.build(:ticket_status)
  end
  it 'should not save when name is not present' do
    FactoryGirl.build(:ticket_status, name:nil).should_not be_valid
  end
end
