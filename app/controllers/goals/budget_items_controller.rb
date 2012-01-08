class Goals::BudgetItemsController < Goals::Base
  autocomplete :budget_category, :name
end