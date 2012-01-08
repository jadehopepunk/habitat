class Goals::BudgetItemsController < ApplicationController
  include Goals::Shared
  autocomplete :budget_category, :name
end