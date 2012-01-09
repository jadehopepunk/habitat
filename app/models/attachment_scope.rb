class AttachmentScope
  class Name < String
    def route_key
      self.underscore
    end
  end
  
  def initialize(name)
    @name = name
  end
  
  def self.find(name)
    AttachmentScope.new(name)
  end
  
  def self.model_name
    Name.new('Scope')
  end
  
  def to_param
    to_s
  end
  
  def to_s
    @name
  end
end