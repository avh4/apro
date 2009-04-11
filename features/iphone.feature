Feature: iPhone application
  In order to quickly start a new iPhone application project
  As an iPhone developer
  I want to create a new iPhone application from a template

  Scenario: iPhone application
    Given an apro folder
    When I execute script/generate "iphone_app MyCrazyProject"
    And I execute rake "build"
    Then file 'build/Release-iphoneos/MyCrazyProject.app/PkgInfo' should exist
  
