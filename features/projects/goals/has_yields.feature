Feature: Project has yield goals
  In order to specify goals which are a quantifiable yield
  As a project owner
  I want to be able to manage my yield goals
  
  Scenario: Create yield goal
    Given I own a new project
      And I am on the goals project step
    Then  I should see the empty "yields" table
    When  I create a new valid yield
    Then  I should see the yields table with one record
