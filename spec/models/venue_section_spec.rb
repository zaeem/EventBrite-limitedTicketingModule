require 'spec_helper'

describe VenueSection do
  it 'should save when all fields are present' do
    FactoryGirl.build(:venue_section)
  end
  it 'should not save when venue_id is not present' do
    FactoryGirl.build(:venue_section, venue_id:nil).should_not be_valid
  end
  it 'should not save when raphael_date is not present' do
    FactoryGirl.build(:venue_section, raphael_date:nil).should_not be_valid
  end
  it 'should not save when color is not present' do
    FactoryGirl.build(:venue_section, color:nil).should_not be_valid
  end
  it 'should not save when section_number is not present' do
    FactoryGirl.build(:venue_section, section_number:nil).should_not be_valid
  end
  it 'should not save when row_end is not present' do
    FactoryGirl.build(:venue_section, row_end:nil).should_not be_valid
  end
  it 'should not save when row_start is not present' do
    FactoryGirl.build(:venue_section, row_start:nil).should_not be_valid
  end
end