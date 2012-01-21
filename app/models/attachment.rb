class Attachment < ActiveRecord::Base
  belongs_to :project
  belongs_to :target, :polymorphic => true

  file_accessor :file
  validates_presence_of :name, :file, :project
end
