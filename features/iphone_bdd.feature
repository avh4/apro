Feature: Create iphone BDD features
  In order to quickly start doing behavior-driven development of an iPhone app
  As an iPhone developer
  I want to generate a template for an iPhone app feature
  
  Scenario: Creating a feature
    Given a safe folder
    When I execute apro for the project folder
    And I execute script/generate "iphone_feature XXWorldHunger"
    Then folder 'Features' should exist
    And file 'Features/XXWorldHunger.m' should exist
    
  Scenario: Creating an iPhone application with example tests
    Given an apro folder
    When I execute script/generate "iphone_app MyCrazyApp"
    Then file 'Tests/ExampleTest.m' should exist
    And the output of `rake test` should contain "Executed 3 tests, with 0 failures (0 unexpected)"
  
