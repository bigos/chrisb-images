# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    attachment_file_name "MyString"
    attachment_content_type "MyString"
    attachment_file_size 1
    attachment_updated_at "2013-03-28 13:11:02"
  end
end
