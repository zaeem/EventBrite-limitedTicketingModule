# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'test@slicketticket.com'
    password 'reindeerflotilla1'
    title ''
    first_name 'Darth'
    last_name 'Vader'
    middle_name ''
    phone '5615551212'
    phone_daytime ''
    phone_evening ''
    phone_cell '5615553333'
    subscribe true
    security_question1 'test question'
    security_answer1 'test answer'
    sale_commission 1
    negotiation_commission 1
  end
end
