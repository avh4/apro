Feature: Set up a project to use rake
  In order to have an easy-to-use build system
  As a developer
  I want a standard Rakefile to be created
  
  Scenario: Generate Rakefile
    Given a safe folder
    When I execute apro for the project folder
    Then file 'Rakefile' is created
    And rake can display tasks successfully
    And folder 'tasks' is created
  
  Scenario: Sample .rake file
    Given a safe folder
    When I execute apro for the project folder
    Then file 'tasks/example.rake' is created
    And the output of `rake` should contain "Edit tasks/example.rake to create your tasks."
  
