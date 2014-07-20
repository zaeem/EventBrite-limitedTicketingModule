require 'spec_helper'

describe Event do
  it 'should save when all fields are present' do
    FactoryGirl.build(:event)
  end
  it 'should not save when venue_id is not present' do
    FactoryGirl.build(:event, venue_id:nil).should_not be_valid
  end
  it 'should not save when event_date is not present' do
    FactoryGirl.build(:event, event_date:nil).should_not be_valid
  end
  it 'should not save when name is not present' do
    FactoryGirl.build(:event, name:nil).should_not be_valid
  end
end
