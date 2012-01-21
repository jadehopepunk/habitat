class Site < ActiveRecord::Base
  belongs_to :project
  has_many :areas, :dependent => :destroy
  has_many :soil_tests, :dependent => :destroy
  has_many :attachments, :as => :target
  
  def name
    "#{project.name} Site" if project
  end
end