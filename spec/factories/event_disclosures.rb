# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_disclosure do
    event_id 1
    disclosure_id 1
    venue_section_id 'Ticket for day of event only'
  end
end
