class Community < ActiveRecord::Base
  has_many :project_communities, :dependent => :destroy
  has_many :projects, :through => :project_communities, :uniq => true
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
