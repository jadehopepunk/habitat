class Job < ActiveRecord::Base
  has_many :labour_inputs, :class_name => "Goals::LabourInput"
  
  validates_presence_of :name
end
