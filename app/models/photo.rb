class Photo < ActiveRecord::Base
  attr_accessible :attachment_content_type, :attachment_file_name, :attachment_file_size, :attachment_updated_at, :attachment

  has_many :taggings
  has_many :tags, :through => :taggings

  has_attached_file :attachment, :styles => {
      :thumb => "100x150"}

  include Rails.application.routes.url_helpers

  def tag_with(tag_name)
    tag = Tag.where(name: tag_name).first
    unless tag
      tag = Tag.new(name: tag_name) 
      tag.save
    end
    tagging=Tagging.new(photo_id: self.id, tag_id: tag.id)
    tagging.save
  end
  def tag_list
    self.tags.collect{|t| t.name}
  end
  
  def to_jq_upload
    {
      "name" => read_attribute(:attachment_file_name),
      "size" => read_attribute(:attachment_file_size),
      "url" => attachment.url(:original),
      "thumbnail_url" => attachment.url(:thumb),
      "delete_url" => "/photos/#{self.id}",
      "delete_type" => "DELETE" 
    }
  end
end
