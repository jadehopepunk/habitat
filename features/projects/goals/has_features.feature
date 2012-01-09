Feature: Project has feature goals
  In order to specify goals which are non quantifiable features of the system
  As a project owner
  I want to be able to manage my feature goals
  
  Scenario: Create feature goal
    Given I own a new project
      And I am on the goals project step
    Then  I should see the empty "features" table
    When  I create a new valid feature goal
    Then  I should see the features table with one record
