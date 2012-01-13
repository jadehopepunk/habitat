class Community < ActiveRecord::Base
  has_many :project_communities, :dependent => :destroy
  
  validates_presence_of :name
end
