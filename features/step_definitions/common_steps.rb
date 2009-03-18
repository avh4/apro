Given /^a safe folder/ do
  setup_safe_folder
end

When /^I execute apro for the project folder$/ do
  in_project_folder do
    capture_stdout "#{apro_cmd} .", "apro.out"
  end
end

When /^I execute script\/generate "rake"$/ do
  in_project_folder do
    capture_stdout "./script/generate rake", "generate_rake.out"
  end
end

Then /^file '(.*)' (is|is not) created/ do |file, is|
  in_project_folder do
    File.exists?(file).should(is == 'is' ? be_true : be_false)
  end
end

Then /^rake can display tasks successfully$/ do
  in_project_folder do
    capture_stdout_stderr "rake -T", "rake.out"
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
