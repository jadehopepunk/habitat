Given /^I am on the "([^"]*)" site analysis step$/ do |step_name|
  within('#site_analysis_steps') do
    click_link step_name
  end
end