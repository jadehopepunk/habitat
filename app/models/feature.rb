class Feature < ActiveRecord::Base
  has_many :feature_goals, :class_name => 'Goals::Feature'
  validates_presence_of :name
end
