# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workshop do
    type "5 day"
    title "Isle of Skye 8th - 12th April 2013"
    teaser "A 5 day workshop on the magnificently photogenic Isle of Sky, Scotland."
    content "MyText"
  end
end
