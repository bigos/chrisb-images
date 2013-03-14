class Post < ActiveRecord::Base
  attr_accessible :content, :title, :teaser
  has_many :comments
end
