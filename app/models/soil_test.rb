class SoilTest < ActiveRecord::Base
  belongs_to :project
  belongs_to :area
  has_many :soil_test_results
  
  validates_presence_of :project, :tested_on
end
