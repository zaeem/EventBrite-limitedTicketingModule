# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :affiliate_detail do
    user_id 1
    percentage 10
    flat_fee '9.99'
    commissionable_type 'Broker'
    payment_threshold '9.99'
    locked false
    payment_method 'Card'
    affiliate_token 'ABC123'
    token_active true
    payments_active true
  end
end
