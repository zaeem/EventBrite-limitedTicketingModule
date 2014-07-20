# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer do
    event_id 1
    user_id 1
    venue_group_id 1
    ticket_type_id 1
    price '9.99'
    quantity 1
    proxy '9.99'
    multiple 1
    cancel_others false
    status 'Available'
    in_hand_date '2014-10-26'
    expected_ship_date '2014-10-26'
    is_negotiation false
    expires_at '2014-10-26 17:35:15'
    confirm_transaction true
    piggy_backed false
    notes 'This is my final offer'
  end
end
