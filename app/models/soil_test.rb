class SoilTest < ActiveRecord::Base
  belongs_to :project
  belongs_to :area
  
  validates_presence_of :project, :tested_on
end
