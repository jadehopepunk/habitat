class Attachment < ActiveRecord::Base
  belongs_to :project

  file_accessor :file
  validates_presence_of :name, :file, :project, :scope  
end
