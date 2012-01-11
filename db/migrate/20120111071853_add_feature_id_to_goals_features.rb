class AddFeatureIdToGoalsFeatures < ActiveRecord::Migration
  def change
    add_column :goals_features, :feature_id, :integer
  end
end
