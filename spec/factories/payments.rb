# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    sale_id 1
    payment_type 'Card'
    amount '9.99'
  end
end
