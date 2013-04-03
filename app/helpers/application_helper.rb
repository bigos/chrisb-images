module ApplicationHelper

  def tagged_count(tag)
    Photo.includes(:tags).where(:tags => {:name => tag.name}).count
  end

  def recursive_tag_links(tag_name, level, max_level)
    tag = Tag.where(:name=> tag_name).first
    str = ''
    if tag.children
      if level <= max_level        
        str << "<ul>"
        tag.children.each do |tc|
          str << "\n<!- level: #{level} #{max_level}-->\n"
          str << "<li>#{link_to tc.name, tc} #{tagged_count tc}"
          str << " #{recursive_tag_links(tc.name, level+1, max_level)}</li>\n"
        end
        str << '</ul>'
      end
    end
  end

  def tag_links(level=1, max_level = 1000)
    top_tags = Tag.where(:parent_id => nil).all
    str = ''    
    str << "<ul>"
    top_tags.each do |tc|
      str << "<li>#{link_to tc.name, tc} #{tagged_count tc}"
      str << "  #{recursive_tag_links(tc.name, level, max_level)}</li>\n"
    end
    str << "</ul>"
    
    str
  end
end
