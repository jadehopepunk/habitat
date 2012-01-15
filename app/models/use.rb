class Use < ActiveRecord::Base
  has_many :yield_goals, :class_name => 'Goals::Yield'
  
  validates_presence_of :name

  scope :common_for_projects, lambda() {|projects|
    brief_ids = projects.map(&:brief_id)
    joins(:yield_goals).
      where(["goals_yields.brief_id IN (?)", brief_ids]).
      group(:name).
      order("COUNT(name) DESC, name")
  }

end
