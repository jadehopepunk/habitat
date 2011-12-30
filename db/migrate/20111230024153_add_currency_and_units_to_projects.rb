class AddCurrencyAndUnitsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :preferred_currency, :string, :length => 3
    add_column :projects, :preferred_measures, :string, :length => 10
  end
end
