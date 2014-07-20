# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :affiliate_payment do
    user_id 1
    amount '9.99'
    affiliate_type 'Online'
    status 'Active'
  end
end
