# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue_section do
    venue_id 1
    raphael_date '01/01/2014'
    color '#cccccc'
    section_text 'Lower Corner'
    section_number '117'
    row_start 1
    row_end 1
    photo 'stadium.png'
  end
end
