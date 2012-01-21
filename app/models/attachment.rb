class Attachment < ActiveRecord::Base
  belongs_to :project
  belongs_to :target, :polymorphic => true

  file_accessor :file
  validates_presence_of :file, :project
  
  def name
    title.blank? ? filename : title
  end
  
  def filename
    file.name if file
  end
end
