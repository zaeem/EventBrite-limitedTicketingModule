# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    venue_id 1
    name 'Football'
    event_date '2014-10-26 17:30:43'
    description 'NFL Super Bowl'
    primary true
    primary_pdf 'ASFSDFSDF'
    seatgeek_id '123'
  end
end
