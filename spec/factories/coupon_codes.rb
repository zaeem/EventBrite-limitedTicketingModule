# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :coupon_code do
    code 'BOGO'
    discount_type 'Percent'
    amount '10.0'
    quantity 1
    starts_at '2014-10-26 17:28:05'
    expires_at '2014-10-26 17:28:15'
  end
end
