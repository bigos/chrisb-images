require 'factory_girl'


Given(/^a user exists with email: "(.*?)", password: "(.*?)"$/) do |arg1, arg2|
  FactoryGirl.factories.clear

  FactoryGirl.define do
    factory :user do
      username 'test_user'
      email arg1
      password arg2
      password_confirmation arg2
      active true
    end
  end
  user = FactoryGirl.create(:user) 
  p user
  true
end

Then(/^I should see text "(.*?)"$/) do |arg1|
  #!!! this works for case of multiple occurences of text!!!
  find('body').has_content? arg1
end

