Given(/^contact messages count is "(.*?)"$/) do |arg1|
  ContactMessage.count.should eq(arg1.to_i)
end

When(/^I foloow "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^fill in contact form with:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end


Then(/^last contact message should be:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end
