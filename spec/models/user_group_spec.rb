require 'spec_helper'

describe UserGroup do
  it 'should save when all fields are present' do
    FactoryGirl.build(:user_group)
  end
  it 'should not save when name is not present' do
    FactoryGirl.build(:user_group, name:nil).should_not be_valid
  end
  it 'should not save when admin is not present' do
    FactoryGirl.build(:user_group, admin:nil).should_not be_valid
  end
end
