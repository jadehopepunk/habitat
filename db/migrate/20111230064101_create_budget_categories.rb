class CreateBudgetCategories < ActiveRecord::Migration
  def change
    create_table :budget_categories do |t|
      t.string :name
      t.datetime :created_at
    end
  end
end
