module EditablesHelper
  def editable_content(name)
    editable = Editable.where(:name => name).first
    if current_user     
      edit_link = link_to("Edit", edit_editable_path(editable)) if current_user.login == 'admin'
    end
    "<div id=\"#{editable.name}\">\n#{editable.content}\n</div>#{edit_link}"

  end
end
