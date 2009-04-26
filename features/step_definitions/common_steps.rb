Given /^a safe folder/ do
  setup_safe_folder
end

Then /^file '(.*)' (should|should not) exist/ do |file, is|
  in_project_folder do
    File.exists?(file).should(is == 'should' ? be_true : be_false)
  end
end

Then /^file '(.*)' should contain \/(.*)\// do |file, regex|
  in_project_folder do
    File.read(file).should match(/#{regex}/)
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

When /^I create a non\-empty folder "([^\"]*)"$/ do |folder|
  in_project_folder do
    FileUtils.mkdir_p folder
    FileUtils.touch File.join(folder, "a")
  end
end


Then /^folder '(.*)' (should|should not) exist/ do |file, is|
  in_project_folder do
    File.exists?(file).should(is == 'should' ? be_true : be_false)
    File.directory?(file).should(is == 'should' ? be_true : be_false)
  end
end

Then /^the output of `(.*)` (should|should not) contain "(.*)"$/ do |cmd, is, text|
  in_project_folder do
    capture_output cmd
    if is == 'should'
      output_of(cmd).should include(text)
    else
      output_of(cmd).should_not include(text)
    end
  end
end

Then /^the output of `(.*)` should contain \/(.*)\/$/ do |cmd, regex|
  in_project_folder do
    capture_output cmd
    output_of(cmd).should match(/#{regex}/)
  end
end
