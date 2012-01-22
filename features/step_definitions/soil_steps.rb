Then /^I should see only (\d+) soils? which [is|are]* called "([^"]*)"$/ do |expected_number, expected_names|
  page.should have_selector("#soils .soil", :count => expected_number)
  expected_names.split(',').each do |expected_name|
    page.should have_selector("#soils .soil .soil_name", :count => 1, :text => expected_name)
  end
end

Then /^I should see the default soil with no name$/ do
  page.should have_selector("#soils .soil", :count => 1)
  page.should_not have_selector("#soils .soil .soil_name")
end

When /^I edit the only soil$/ do
  within('#soils_actions') do
    click_link 'Edit'
  end
end

When /^I populate valid soil data including the name "([^"]*)"$/ do |name|
  fill_in 'Name', :with => name
  fill_in 'Description', :with => "Lorem ipsum dolar sit amet"
end

Then /^I edit the only soil with valid soil data including the name "([^"]*)"$/ do |name|
  step "I edit the only soil"
  step "I populate valid soil data including the name \"#{name}\""
  click_button "Update Soil"
end

Given /^I add another soil with valid soil data including the name "([^"]*)"$/ do |name|
  step "I go to add another soil"
  step "I populate valid soil data including the name \"#{name}\""
  click_button "Create Soil"
end

When /^I go to add another soil$/ do
  within('#soils_actions') do
    click_link 'Add another soil type'
  end
end