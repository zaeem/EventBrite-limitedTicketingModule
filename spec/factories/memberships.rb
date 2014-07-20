# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership do
    user_id 1
    user_group_id 1
    created_by 1
  end
end
