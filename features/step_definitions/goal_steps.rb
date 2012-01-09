Given /^I own a new project$/ do
  step "I have just signed up"
  step "I submit valid new project details"  
end

Given /^I am on the goals project step$/ do
  click_link "Goals"
end

Then /^I should see the empty "([^"]*)" table$/ do |section_name|
  section_id = "##{section_name.gsub(' ', '_')}"
  page.should have_selector("#{section_id} table tbody")
  page.should have_no_selector("#{section_id} table tbody tr")
end

When /^I create a new valid yield$/ do
  within('#yields') do
    click_link 'Add Another'
  end

  fill_in 'Product', :with => 'Fruit'
  fill_in 'goals_yield_amount', :with => '5'
  select 'kg', :from => 'goals_yield_amount_unit'
  select 'year', :from => 'goals_yield_amount_period'
  fill_in 'Lead time', :with => '6'
  fill_in 'Details', :with => 'Stone and pip fruit'
  click_button "Create Yield"
end

Then /^I should see the yields table with one record$/ do
  page.should have_table('goals/yields', :rows => [
    ['Fruit', '5 kg per year', '6 years', 'Stone and pip fruit', 'Edit', 'Remove']
  ])
end

When /^I create a new valid feature goal$/ do
  within('#features') do
    click_link 'Add Another'
  end
  
  fill_in 'Name', :with => 'Running Water'
  fill_in 'Description', :with => 'A pond, lake or stream'
  click_button "Create Feature"
end

Then /^I should see the features table with one record$/ do
  page.should have_table('goals/features', :rows => [
    ['Running Water', 'A pond, lake or stream', 'Edit', 'Remove']
  ])
end

When /^I create a new valid labour input goal$/ do
  within('#labour_inputs') do
    click_link 'Add Another'
  end

  fill_in 'Job', :with => 'Weeding'
  fill_in 'Implementation Time', :with => '5'
  select 'hour', :from => 'goals_labour_input_implementation_amount_unit'
  select 'month', :from => 'goals_labour_input_implementation_amount_period'
  fill_in 'Maintenance Time', :with => '2'
  select 'hour', :from => 'goals_labour_input_maintenance_amount_unit'
  select 'month', :from => 'goals_labour_input_maintenance_amount_period'
  click_button "Create Labour input"
end

Then /^I should see the labour input table with one record$/ do
  page.should have_table('goals/labour_inputs', :rows => [
    ['Weeding', '5 hours per month', '2 hours per month', 'Edit', 'Remove']
  ])
end

When /^I create a new valid budget item$/ do
  within('#budget_items') do
    click_link 'Add Another'
  end

  fill_in 'Stage', :with => 'Design'
  fill_in 'Amount', :with => '1500'
  fill_in 'Timeframe', :with => '6'
  select 'months', :from => 'goals_budget_item_timeframe_amount_unit'
  click_button "Create Budget item"
end

Then /^I should see the budget items table with one record$/ do
  page.should have_table('goals/budget_items', :rows => [
    ['Design', '$1,500', '6 months', 'Edit', 'Remove']
  ])
end