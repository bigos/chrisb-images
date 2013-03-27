class Workshop < ActiveRecord::Base
  attr_accessible :content, :teaser, :title, :duration
  validates_presence_of  :content, :teaser, :title, :duration
  
  DURATION_OPTIONS =  ['weekend', '3 day', '5 day']
  validates :duration, :inclusion => { :in =>  DURATION_OPTIONS, :message => "%{value} is not a valid option" }

  def days
    if self.duration == 'weekend'
      2
    elsif self.duration == '3 day'
      3
    elsif self.duration == '5 day'
      5
    else
      raise 'unknown duration'
    end
  end
end
