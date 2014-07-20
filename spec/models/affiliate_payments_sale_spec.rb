require 'spec_helper'

describe AffiliatePaymentsSale do
  it 'should save when all fields are present' do
    FactoryGirl.build(:affiliate_payments_sale)
  end
  it 'should not save when affiliate_payment_id is not present' do
    FactoryGirl.build(:affiliate_payments_sale, affiliate_payment_id:nil).should_not be_valid
  end
  it 'should not save when sale_id is not present' do
    FactoryGirl.build(:affiliate_payments_sale, sale_id:nil).should_not be_valid
  end
end
