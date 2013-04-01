class Tag < ActiveRecord::Base
  attr_accessible :name, :parent_id
  
  has_many :taggings
  has_many :photos, :through => :taggings

  has_many :children, :class_name => "Tag", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Tag"
  
  validates :name, :presence => true, :uniqueness => true
  validate :parent_can_not_be_self

  def parent_can_not_be_self
    if self.parent_id and self.parent_id == self.id
      errors.add(:parent_id, "can't be parent of itself")
    end
  end

  def set_parent!(tag)
    self.parent_id = tag.id
    self.save
  end
end
