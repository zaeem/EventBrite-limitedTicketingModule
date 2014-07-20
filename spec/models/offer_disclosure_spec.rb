require 'spec_helper'

describe OfferDisclosure do
  it 'should save when all fields are present' do
    FactoryGirl.build(:offer_disclosure)
  end
end
