class ProjectCategory < ActiveRecord::Base
  has_many :projects
  
  validates_presence_of :name
  
  def to_s
    name
  end
end
