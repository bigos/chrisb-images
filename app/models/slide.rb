class Slide < ActiveRecord::Base
  attr_accessible :caption, :position, :visible, :photo
  has_attached_file :photo, :styles => { :thumb => "190x90>" }
end
