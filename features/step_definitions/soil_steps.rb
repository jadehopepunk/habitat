Then /^I should see only (\d+) soil which is called "([^"]*)"$/ do |expected_number, expected_name|
  page.should have_selector("#soils .soil", :count => expected_number)
  page.should have_selector("#soils .soil .soil_name", :count => expected_number, :text => expected_name)
end

When /^I edit the soil$/ do
  within('#soils_actions') do
    click_link 'Edit'
  end
end

When /^I submit valid soil data including the name "([^"]*)"$/ do |name|
  fill_in 'Name', :with => name
  fill_in 'Description', :with => "Lorem ipsum dolar sit amet"
  click_button "Update Soil"
end