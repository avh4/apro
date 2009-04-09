Feature: Set up a project to use cucumber
  In order to start a project using Behavior-Driven Development
  As a developer
  I want standard cucumber set up to be generated
  
  Scenario: Set up cucumber
    Given a safe folder
    When I execute apro for the project folder
    And I execute script/generate "cucumber"
    Then folder 'features' should exist
    And folder 'features/step_definitions' should exist
    And folder 'features/support' should exist
    And file 'features/support/env.rb' should exist
    And the output of `rake features` should contain /[0-9]+ scenarios?/
    And the output of `cucumber --format pretty` should contain /[0-9]+ scenarios?/
  
  Scenario: Sample cucumber files
    Given a safe folder
    When I execute apro for the project folder
    And I execute script/generate "cucumber"
    Then file 'features/example.feature' should exist
    And file 'features/step_definitions/example_steps.rb' should exist
    And file 'features/support/example.rb' should exist
    And the output of `rake features` should contain "1 scenario"
    And the output of `rake features` should contain "3 passed steps"
    