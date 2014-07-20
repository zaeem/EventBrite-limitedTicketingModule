# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bid do
    event_id 1
    user_id 1
    venue_group_id 1
    price '9.99'
    quantity 1
    proxy '9.99'
    expires_at '2014-10-26 17:23:22'
    cancel_others false
    status 'Pending'
    in_hand_date '2014-10-26'
    is_negotiation false
    expected_ship_date '2014-02-02'
  end
end
