require 'factory_girl'

Given(/^following user does exist:$/) do |table|
  data = table.raw[1]
  #p data
  FactoryGirl.factories.clear

  FactoryGirl.define do
    factory :user do
      username data[0]
      password data[1]
      active true
      email "user@example.com"
      password_confirmation data[1]
    end
  end
  user = FactoryGirl.create(:user)  
  p user
end

Then(/^I should see password reset form$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in following:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see message about email activation$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^should get password reset email$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I visit password reset link$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on password reset success page$/) do
  pending # express the regexp above with the code you wish you had
end
