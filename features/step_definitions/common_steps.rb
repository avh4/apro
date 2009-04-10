Given /^a safe folder/ do
  setup_safe_folder
end

Then /^file '(.*)' (should|should not) exist/ do |file, is|
  in_project_folder do
    File.exists?(file).should(is == 'should' ? be_true : be_false)
  end
end

Then /^rake can display tasks successfully$/ do
  in_project_folder do
    capture_output"rake -T"
    $?.exitstatus.should == 0
  end
end

When /^I execute rake "(.*)"$/ do |task|
  in_project_folder do
    capture_output_should_succeed "rake --trace #{task}"
  end
end


Then /^folder '(.*)' (should|should not) exist/ do |file, is|
  in_project_folder do
    File.exists?(file).should(is == 'should' ? be_true : be_false)
    File.directory?(file).should(is == 'should' ? be_true : be_false)
  end
end

Then /^the output of `(.*)` should contain "(.*)"$/ do |cmd, text|
  in_project_folder do
    capture_output cmd
    output_of(cmd).should include(text)
  end
end

Then /^the output of `(.*)` should contain \/(.*)\/$/ do |cmd, regex|
  in_project_folder do
    capture_output cmd
    output_of(cmd).should match(/#{regex}/)
  end
end
