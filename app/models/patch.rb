class Patch < ActiveRecord::Base
  belongs_to :site
  has_many :soil_tests
  
  def to_s
    name
  end
end
