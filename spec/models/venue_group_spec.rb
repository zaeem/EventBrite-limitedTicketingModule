require 'spec_helper'

describe VenueGroup do
  it 'should save when all fields are present' do
    FactoryGirl.build(:venue_group)
  end
  it 'should not save when name is not present' do
    FactoryGirl.build(:venue_group, name:nil).should_not be_valid
  end
  it 'should not save when venue_id is not present' do
    FactoryGirl.build(:venue_group, venue_id:nil).should_not be_valid
  end
  it 'should not save when rating is not present' do
    FactoryGirl.build(:venue_group, rating:nil).should_not be_valid
  end
end
