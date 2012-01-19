class SoilTest < ActiveRecord::Base
  belongs_to :site
  belongs_to :area
  has_many :soil_test_results, :dependent => :destroy
  
  accepts_nested_attributes_for :soil_test_results, :allow_destroy => true

  validates_presence_of :site, :tested_on
  
end
