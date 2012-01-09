Given /^I own a new project$/ do
  step "I have just signed up"
  step "I submit valid new project details"  
end

Given /^I am on the goals project step$/ do
  click_link "Goals"
end

Then /^I should see the empty yields table$/ do
  page.should have_selector('#yields table tbody')
  page.should have_no_selector('#yields table tbody tr')
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