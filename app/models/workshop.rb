class Workshop < ActiveRecord::Base
  attr_accessible :content, :teaser, :title, :type
  validates_presence_of  :content, :teaser, :title, :type
  
  TYPE_OPTIONS =  ['weekend', '3 day', '5 day']
  validates :type, :inclusion => { :in =>  TYPE_OPTIONS, :message => "%{value} is not a valid option" }
end
