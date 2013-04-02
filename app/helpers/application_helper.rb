module ApplicationHelper

  def recursive_tag_links(tag_name)
    tag = Tag.where(:name=> tag_name).first
    str = ''
    if tag.children
      str << '<ul>'
      tag.children.each do |tc|
        str << "<li>#{tc.name}  #{recursive_tag_links(tc.name)}</li>\n"
      end
      str << '</ul>'
    end
  end

  def tag_links
    top_tags = Tag.where(:parent_id => nil).all
    str= "<ul>"
    top_tags.each do |tt|
      str << "<li>#{tt.name}  #{recursive_tag_links(tt.name)}</li>\n"
    end
    str << "</ul>"
    str
  end
end
