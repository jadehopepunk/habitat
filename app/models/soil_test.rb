class SoilTest < ActiveRecord::Base
  belongs_to :site
  belongs_to :area
  has_many :soil_test_results, :dependent => :destroy
  
  accepts_nested_attributes_for :soil_test_results, :allow_destroy => true

  validates_presence_of :site, :tested_on
  validates_inclusion_of :depth_unit, :in => Unit::COMMON_SMALL_LENGTH_UNITS, :allow_blank => true
  validates :number_of_samples, :numericality => true, :allow_blank => true
  
  has_amount_with_unit :name => :depth
end
