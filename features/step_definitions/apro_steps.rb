def helper_execute_apro
  install_generators("apro_generators")
  in_project_folder do
    capture_output "#{apro_cmd} ."
  end
end

Given /^an apro folder/ do
  setup_safe_folder
  helper_execute_apro
end

When /^I execute apro for the project folder$/ do
  helper_execute_apro
end

When /^I execute script\/generate "(.*)"$/ do |gen|
  in_project_folder do
    capture_output "ruby -I#{@lib_path} ./script/generate #{gen}"
    $?.exitstatus.should == 0
  end
end

Given /^lighttpd is installed$/ do
  File.exist?("/opt/local/sbin/lighttpd").should be_true
end

Given /^php5 \+fastcgi is installed$/ do
  File.exist?("/opt/local/bin/php-cgi").should be_true
end