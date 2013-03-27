class Workshop < ActiveRecord::Base
  attr_accessible :content, :teaser, :title, :duration, :start_date
  validates_presence_of  :content, :teaser, :title, :duration
  
  DURATION_OPTIONS = {'weekend' => 2, '3 day' => 3, '5 day'=> 5}
  validates :duration, :inclusion => { :in => DURATION_OPTIONS.values, :message => "%{value} is not a valid workshop duration" }
  
end
