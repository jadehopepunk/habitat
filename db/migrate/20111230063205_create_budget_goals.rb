class CreateBudgetGoals < ActiveRecord::Migration
  def change
    create_table :budget_goals do |t|
      t.integer :project_id
      t.integer :budget_category_id
      t.integer :amount_cents
      t.integer :timeframe_amount
      t.string :timeframe_amount_unit
      t.timestamps
    end
  end
end
