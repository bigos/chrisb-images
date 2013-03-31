class Tag < ActiveRecord::Base
  attr_accessible :name
  
  has_many :taggings
  has_many :photos, :through => :taggings
  
  validates :name, :presence => true, :uniqueness => true
end