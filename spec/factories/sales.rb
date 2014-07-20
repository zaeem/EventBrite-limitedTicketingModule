# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sale do
    bid_id 1
    offer_id 1
    ticket_status_id 1
    quantity 1
    price '9.99'
    affiliate_id 1
    payment_status 'Pending'
    coupon_code_id 1
  end
end
