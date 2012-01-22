Feature: Project has budget goals
  In order to specify how much money I have to spend on the garden
  As a project owner
  I want to be able to manage my budget goals
  
  Scenario: Create budget goal
    Given I own a new project
      And I am on the "Goals" project step
    Then  I should see the empty "budget items" table
    When  I create a new valid budget item
    Then  I should see the budget items table with one record
