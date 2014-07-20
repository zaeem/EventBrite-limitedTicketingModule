require 'spec_helper'

describe EventDisclosure do
  it 'should save when all fields are present' do
    FactoryGirl.build(:event_disclosure)
  end
  it 'should not save when event_id is not present' do
    FactoryGirl.build(:event_disclosure, event_id:nil).should_not be_valid
  end
  it 'should not save when disclosure_id is not present' do
    FactoryGirl.build(:event_disclosure, disclosure_id:nil).should_not be_valid
  end
  it 'should not save when venue_section_id is not present' do
    FactoryGirl.build(:event_disclosure, venue_section_id:nil).should_not be_valid
  end
end
