Feature: PHP test server
  In order to detect bugs early
  As a web developer
  I want to run a test web server on my local machine

  Scenario: PHP test server
    Given an apro folder
    And lighttpd is installed
    And php5 +fastcgi is installed
    When I execute script/generate "install_php"
    And I execute rake "start"
    Then fetching "http://localhost:3000/" should return an HTML document
  
