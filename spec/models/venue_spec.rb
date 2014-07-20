require 'spec_helper'

describe Venue do
  it 'should save when all fields are present' do
    FactoryGirl.build(:venue)
  end
  it 'should not save when category is not present' do
    FactoryGirl.build(:venue, category:nil).should_not be_valid
  end
  it 'should not save when street_address is not present' do
    FactoryGirl.build(:venue, street_address:nil).should_not be_valid
  end
  it 'should not save when city is not present' do
    FactoryGirl.build(:venue, city:nil).should_not be_valid
  end
  it 'should not save when state is not present' do
    FactoryGirl.build(:venue, state:nil).should_not be_valid
  end
  it 'should not save when zip is not present' do
    FactoryGirl.build(:venue, zip:nil).should_not be_valid
  end
  it 'should not save when subcategory is not present' do
    FactoryGirl.build(:venue, subcategory:nil).should_not be_valid
  end
end
