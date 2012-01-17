class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input
    add_autocomplete!
    add_class('span4')
    @builder.text_field(attribute_name, input_html_options.merge(datetime_options(object.send(attribute_name))))
  end

  def label_target
    attribute_name
  end

  private

    def datetime_options(value = nil)
      return {} if value.nil?
      { :value => value.to_s(:db) }
    end

    def has_required?
      options[:required]
    end

    def add_autocomplete!
      input_html_options[:autocomplete] ||= 'off'
    end
    
    def add_class(new_class)
      input_html_options[:class] = [input_html_options[:class], new_class].reject(&:blank?).join(' ')
    end
    
end
