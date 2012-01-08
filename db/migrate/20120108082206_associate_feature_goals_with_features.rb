class AssociateFeatureGoalsWithFeatures < ActiveRecord::Migration
  def up
    # add_column :goals_features, :feature_id, :integer
    remove_column :goals_features, :name
  end

  def down
    remove_column :goals_features, :feature_id
    add_column :goals_features, :name, :string
  end
end
