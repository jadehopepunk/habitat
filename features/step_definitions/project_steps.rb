Then /^I should be on the new project page$/ do
  current_path.should == new_project_path
end

When /^I submit valid new project details$/ do
  fill_in "Name", :with => "Backyard"
  select "Suburban Yard", :from => "Category"
  fill_in "Address", :with => "New York, New York"
  fill_in "Site area", :with => "2"
  select "acres", :form => "#project_site_area_unit"
end