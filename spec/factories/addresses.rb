# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    user_id 1
    address_type 'Home'
    name 'My Home'
    address1 '123 Test Street'
    address2 ''
    city 'Fakeville'
    state 'FL'
    zip 12312
    phone '1231231234'
  end
end
