# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :negotiation_log do
    bid_id 1
    offer_id 1
    price '9.99'
    quantity 1
    negotiation_type 'Offer'
  end
end
