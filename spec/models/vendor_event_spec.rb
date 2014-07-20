require 'spec_helper'

describe VendorEvent do
  it 'should save when all fields are present' do
    FactoryGirl.build(:vendor_event)
  end
  it 'should not save when event_id is not present' do
    FactoryGirl.build(:vendor_event, event_id:nil).should_not be_valid
  end
  it 'should not save when vendor_id is not present' do
    FactoryGirl.build(:vendor_event, vendor_id:nil).should_not be_valid
  end
end
