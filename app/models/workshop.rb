class Workshop < ActiveRecord::Base
  attr_accessible :content, :teaser, :title, :type
end
