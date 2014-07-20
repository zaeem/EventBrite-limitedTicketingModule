# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :uploaded_ticket do
    offer_ticket_id 1
    ticket_file 'ASFVDFVSDFIS@@#I@BR#IJ@B#IBR'
  end
end
