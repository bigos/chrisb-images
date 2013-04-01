class Tag < ActiveRecord::Base
  attr_accessible :name, :parent_id
  
  has_many :taggings
  has_many :photos, :through => :taggings

  has_many :children, :class_name => "Tag", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Tag"
  
  validates :name, :presence => true, :uniqueness => true
end
