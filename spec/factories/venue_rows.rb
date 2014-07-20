# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue_row do
    venue_section_id 1
    venue_group_id 1
    name 'Lower Corner bottom'
    seats 1
  end
end
