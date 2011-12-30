class ActiveRecord::Base
  def self.can_assign_by_name(association_name, name_method = :name)
    association_class = association_name.to_s.camelize.constantize

    define_method("#{association_name}_#{name_method}") do
      record = send(association_name)
      record.send(name_method) if record
    end
    
    define_method("#{association_name}_#{name_method}=") do |value|
      record = (value.blank? ? nil : association_class.send("find_or_initialize_by_#{name_method}", value))
      self.send("#{association_name}=", record)
    end
  end
end