class Goals::Feature < ActiveRecord::Base
  belongs_to :brief
  belongs_to :feature, :class_name => '::Feature'

  validates_presence_of :brief, :feature, :feature_name

  can_assign_by_name :feature
  
  def name
    feature_name
  end
  
end
