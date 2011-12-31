class ImageInput < SimpleForm::Inputs::Base
  def input
    has_existing = object.send("#{attribute_name}_uid")
    parts = []
    if has_existing
      parts << "<div class=\"existing_image\"><img src=\"#{object.send(attribute_name).thumb('100x100').url}\" /></div>"
    end
    parts << @builder.file_field(attribute_name)
    parts << @builder.hidden_field("retained_#{attribute_name}")
    parts.join(' ')
  end
end