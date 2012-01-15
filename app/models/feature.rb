class Feature < ActiveRecord::Base
  has_many :feature_goals, :class_name => 'Goals::Feature'
  validates_presence_of :name

  scope :common_for_projects, lambda() {|projects|
    brief_ids = projects.map(&:brief_id)
    joins(:feature_goals).
      where(["goals_features.brief_id IN (?)", brief_ids]).
      group(:name).
      order("COUNT(name) DESC, name")
  }

end
