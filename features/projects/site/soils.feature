Feature: Project site has soils
  In order to track soils on a project
  As an owner
  I want to be able to manage my soils
  
  Background:
    Given I own a new project
      And I am on the "Site Analysis" project step
  
  Scenario: New project has one soil which you can edit
    Given I am on the "Soil" site analysis step
    Then I should see only 1 soil which is called "Site Soil"
    And I edit the only soil with valid soil data including the name "Sandy Loam"
    Then I should see only 1 soil which is called "Sandy Loam"
  
  Scenario: New project allows you to add a second soil
    Given I am on the "Soil" site analysis step
    And I add another soil with valid soil data including the name "Sandy Loam"
    Then I should see only 2 soils which are called "Site Soil,Sandy Loam"

