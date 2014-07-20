require 'spec_helper'

describe TicketType do
  it 'should save when all fields are present' do
    FactoryGirl.build(:ticket_type)
  end
  it 'should not save when id is not present' do
    FactoryGirl.build(:ticket_type, id:nil).should_not be_valid
  end
  it 'should not save when name is not present' do
    FactoryGirl.build(:ticket_type, name:nil).should_not be_valid
  end
end
