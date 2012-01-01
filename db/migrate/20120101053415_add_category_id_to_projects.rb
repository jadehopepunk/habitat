class AddCategoryIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_category_id, :integer
  end
end
