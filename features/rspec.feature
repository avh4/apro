Feature: Spec-Driven Development
  In order to produce well-designed and robust code
  As a software developer
  I want to do spec-driven development

  Scenario: rspec
    Given an apro folder
    When I execute script/generate "install_rspec"
    Then the output of `rake spec` should contain /1 example, 0 failures/
  
