require 'factory_girl'

Given(/^the following user exists:$/) do |table|
  data = table.raw[1]
  #p data
  # This will guess the User class
  FactoryGirl.define do
    factory :user do
      login data[0]
      password data[1]
      password_confirmation data[1]
    end
  end
  user = FactoryGirl.create(:user)  
  #p user
end

Given(/^I am not logged in$/) do
  UserSession.find.try(:destroy)
end

Given(/^I am on the homepage$/) do
  visit root_path
end

When(/^I follow "(.*?)"$/) do |arg1|
  click_link arg1
end

When(/^I fill in the following:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

When(/^I press "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the user page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should not see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^I am logged in as "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^I am on the user page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the homepage$/) do
  pending # express the regexp above with the code you wish you had
end
