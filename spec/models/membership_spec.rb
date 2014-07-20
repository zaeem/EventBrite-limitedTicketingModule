require 'spec_helper'

describe Membership do
  it 'should save when all fields are present' do
    FactoryGirl.build(:membership)
  end
  it 'should not save when user_id is not present' do
    FactoryGirl.build(:membership, user_id:nil).should_not be_valid
  end
  it 'should not save when user_group_id is not present' do
    FactoryGirl.build(:membership, user_group_id:nil).should_not be_valid
  end
end
