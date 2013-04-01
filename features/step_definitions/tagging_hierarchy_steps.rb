When(/^I put tag "(.*?)" as a child of "(.*?)"$/) do |arg1, arg2|
  parent = Tag.where(:name => arg2).first
  child = Tag.where(:name => arg1).first
  child.parent_id = parent.id
  child.save
  child.parent_id.should eq(parent.id)
end

Then(/^Tag "(.*?)" should have "(.*?)" as the parent$/) do |arg1, arg2|
  child = Tag.where(name: arg1).first
  child.parent.name.should eq(arg2)
end

Then(/^Tag "(.*?)" should have "(.*?)" as one of it's children$/) do |arg1, arg2|
  parent = Tag.where(name: arg1).first
  parent.children.collect{|c| c.name}.should include(arg2)
end
