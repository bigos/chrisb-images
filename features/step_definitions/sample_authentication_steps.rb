

# This will guess the User class
ll='leonard'
user=User.new(:login => ll, :password => ll, :password_confirmation=>ll)

p user

Given(/^the following user exists:$/) do |table|

  
  # table is a Cucumber::Ast::Table
  data = table.raw
  puts data.inspect
  #p User.all
  pending # express the regexp above with the code you wish you had
end

