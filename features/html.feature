Feature: HTML templates
  In order to quickly create web page demos and prototypes
  As a web developer
  I want to create HTML file templates from a template
  
  Scenario: blank HTML page
    Given an apro folder
    When I execute script/generate "html index.html"
    Then file 'index.html' should exist
    And 'index.html' should be valid XHTML
  
