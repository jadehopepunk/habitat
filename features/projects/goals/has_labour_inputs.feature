Feature: Project has labour input goals
  In order to specify what labour I expect to provide to my garden
  As a project owner
  I want to be able to manage my labour input goals
  
  Scenario: Create labour input goal
    Given I own a new project
      And I am on the "Goals" project step
    Then  I should see the empty "labour inputs" table
    When  I create a new valid labour input goal
    Then  I should see the labour input table with one record
