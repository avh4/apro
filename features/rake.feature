Feature: Set up a project to use rake
  In order have an easy-to-use build system
  As a developer
  I want a standard Rakefile to be created
  
  Scenario: Generate Rakefile
    Given a safe folder
    When I execute apro for the project folder
    Then file 'Rakefile' is created
    And rake can display tasks successfully
    And folder 'tasks' is created
