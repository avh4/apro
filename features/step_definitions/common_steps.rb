Given /^a safe folder/ do
  setup_safe_folder
end

When /^I execute apro for the project folder$/ do
  install_generators("apro_generators")
  in_project_folder do
    capture_output "#{apro_cmd} ."
  end
end

When /^I execute script\/generate "(.*)"$/ do |gen|
  in_project_folder do
    capture_output "ruby -I#{@lib_path} ./script/generate #{gen}"
    $?.exitstatus.should == 0
  end
end

Then /^file '(.*)' (is|is not) created/ do |file, is|
  in_project_folder do
    File.exists?(file).should(is == 'is' ? be_true : be_false)
  end
end

Then /^rake can display tasks successfully$/ do
  in_project_folder do
    capture_output"rake -T"
    $?.exitstatus.should == 0
  end
end

Then /^folder '(.*)' (is|is not) created/ do |file, is|
  in_project_folder do
    File.exists?(file).should(is == 'is' ? be_true : be_false)
    File.directory?(file).should(is == 'is' ? be_true : be_false)
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
