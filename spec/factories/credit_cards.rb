# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :credit_card do
    user_id 1
    address_id 1
    first_name 'Test'
    last_name 'Last'
    number '4111111111111111'
    expiration_month 2
    expiration_year 2014
    ccv 123
  end
end
