Then /^'(.*)' should be valid XHTML$/ do |file|
  in_project_folder do
    html = File.read(file)
    html.should include("<!DOCTYPE html")
    html.should include("http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd")
    html.should include("<html xmlns=\"http://www.w3.org/1999/xhtml\"")
    html.should include("<head>")
    html.should include("<body>")
  end
end