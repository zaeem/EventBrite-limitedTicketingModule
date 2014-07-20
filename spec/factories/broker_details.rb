# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :broker_detail do
    user_id 1
    kickback_percentage 1
    kickback_flat_fee '9.99'
    kickback_type 'Payment'
    reduction_percentage 1
    reduction_flat_fee '9.99'
    reduction_type 'Affiliate'
    payment_threshold '9.99'
    locked false
    payment_method 'Card'
    payments_active true
  end
end
