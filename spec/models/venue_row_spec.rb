require 'spec_helper'

describe VenueRow do
  it 'should save when all fields are present' do
    FactoryGirl.build(:venue_row)
  end
  it 'should not save when venue_section_id is not present' do
    FactoryGirl.build(:venue_row, venue_section_id:nil).should_not be_valid
  end
  it 'should not save when venue_group_id is not present' do
    FactoryGirl.build(:venue_row, venue_group_id:nil).should_not be_valid
  end
  it 'should not save when name is not present' do
    FactoryGirl.build(:venue_row, name:nil).should_not be_valid
  end
  it 'should not save when seats is not present' do
    FactoryGirl.build(:venue_row, seats:nil).should_not be_valid
  end
end
