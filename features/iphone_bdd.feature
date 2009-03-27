Feature: Create iphone BDD features
  In order to quickly start doing behavior-driven development of an iPhone app
  As an iPhone developer
  I want to generate a template for an iPhone app feature
  
  Scenario: Creating a GTM test template
    Given a safe folder
    When I execute apro for the project folder
    And I execute script/generate "iphone_feature XXWorldHunger"
    Then folder 'Features' is created
    And file 'Features/XXWorldHunger.m' is created
    ## TODO And the output of "rake features" contains "Executed 3 tests, with 0 failures (0 unexpected) in 0.504 (0.504) seconds" 
  
