class Community < ActiveRecord::Base
  has_many :project_communities, :dependent => :destroy
  has_many :projects, :through => :project_communities, :uniq => true
  
  image_accessor :photo
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def common_models_for_project(klass)
    klass.common_for_projects(projects)
  end
end
