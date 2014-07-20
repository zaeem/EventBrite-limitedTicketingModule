# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do
    category 'Sports'
    subcategory 'NFL'
    name 'Sun Life Stadium'
    team 'Dolphins'
    street_address 'Dolphin Way'
    city 'Miami'
    state 'FL'
    zip '33067'
    phone '1231231234'
    description 'Football Stadium'
    school 'University of Miami'
    team_name 'Hurricanes'
    mascot 'Hurricane'
    seatgeek_id '123'
    photo 'sunlifestadium.png'
  end
end
