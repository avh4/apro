Feature: Set up a project to use cucumber
  In order to start a project using Behavior-Driven Development
  As a developer
  I want standard cucumber set up to be generated
  
  Scenario: Set up cucumber
    Given a safe folder
    When I execute apro for the project folder
    And I execute script/generate "cucumber"
    Then folder 'features' is created
    And folder 'features/step_definitions' is created
    And folder 'features/support' is created
    And the output of `rake features` should contain "0 scenarios"
    And the output of `cucumber --format pretty` should contain "0 scenarios"
  
  Scenario: Sample cucumber files
  