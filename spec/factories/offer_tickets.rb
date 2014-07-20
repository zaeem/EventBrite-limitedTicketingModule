# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer_ticket do
    offer_id 1
    venue_row_id 1
    status 'Pending'
    seat_number 1
    barcode '1245632423423423423'
    attendee_name 'John Smith'
  end
end
