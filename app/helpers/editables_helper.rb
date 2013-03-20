module EditablesHelper
  def editable_content(name)
    editable = Editable.where(:name => name).first
    "<div id=\"#{editable.name}\">\n#{editable.content}\n</div>"
  end
end
