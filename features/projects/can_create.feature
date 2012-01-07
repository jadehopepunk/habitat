Feature: Can create projects
  In order to create a project
  As a project owner
  I want to be able to create a new project after signing up

  Scenario: Sign up and create project
    Given I have just signed up
    Then I should be on the new project page
    When I submit valid new project details
    Then I should be on my project page
  
  
  
