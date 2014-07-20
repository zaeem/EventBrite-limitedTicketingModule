# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :broker_payment do
    amount '9.99'
    payment_type 'Card'
    status 'Paid'
  end
end
