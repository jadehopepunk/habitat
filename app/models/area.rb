class Area < ActiveRecord::Base
  belongs_to :project
  has_many :soil_tests
  
  def to_s
    name
  end
end
