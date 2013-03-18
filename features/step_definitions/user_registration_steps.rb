

Given(/^following user does not exist:$/) do |table|
  login = table.raw[0][1]
  User.where(:login => login).first.should be(nil)
end

Then(/^I should get email sent to my address$/) do
  # !!!!! we are not testing emails !!!!!!!!!!!!
  user = User.last
  puts "in real life user #{user.login} will get an email sent to #{user.email}"
  activation_link = "http://localhost:3000/activate/#{user.perishable_token}"
  puts "user will have to follow this link #{activation_link} to activate the account"
  #pending # express the regexp above with the code you wish you had
end

Then(/^I should see activation link in the email$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I visit activation link$/) do
  p activation_link
  visit activation_link
  pending # express the regexp above with the code you wish you had
end

Then(/^My account should get activated$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see page with my user profile$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in the following registration details:$/) do |table|
  #p table.raw
  #p table.raw[0][1]
  #p table.raw[1][1]
  #p table.raw[2][1]
  #p table.raw[3][1]

  fill_in('Login', :with => table.raw[0][1])
  fill_in('Email', :with => table.raw[1][1])
  
  #fill_in('Password', :with => table.raw[2][1])
  #this gets rid of the field name ambuguity problem
  find('#user_password').set(table.raw[2][1])

  fill_in('Password confirmation', :with => table.raw[2][1])
  
end
