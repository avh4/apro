Feature: VCS ignore files
  In order to not have to deal with common ignored files
  As a VCS user
  I want to have VCS ignore files created for me to include common files

  Scenario: git
    Given a safe folder
    When I execute apro for the project folder
    Then file '.gitignore' should exist
    And file '.gitignore' should match /^.DS_Store$/
  
