module ApplicationHelper

  def tagged_count(tag)
    Photo.includes(:tags).where(:tags => {:name => tag.name}).count
  end

  def tag_li(tc, increase,level, max_level, type)
    str =  "<li>"
    if type == :tags
      str << link_to( tc.name, tc)
    else
      str << link_to(tc.name, photos_path(:tag => tc.name))
    end
    str << tagged_count( tc)
    str << recursive_tag_links(tc.name, level+increase, max_level, type).to_s
    str << "</li>\n"
  end

  def recursive_tag_links(tag_name, level, max_level,type)
    tag = Tag.where(:name=> tag_name).first
    str = ''
    if tag.children
      if level <= max_level        
        str << "<ul>"
        tag.children.each do |tc|
          str << tag_li(tc, 1, level, max_level,type)
        end
        str << '</ul>'
      end
    end
  end

  def tag_links( max_level = 1000, type = :tags)
    top_tags = Tag.where(:parent_id => nil).all
    level = 1
    str = ''    
    str << "<ul>"
    top_tags.each do |tc|
      str << tag_li(tc, 0, level, max_level, type)
    end
    str << "</ul>"
  end
end
