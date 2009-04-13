require File.join(File.dirname(__FILE__), "test_generator_helper.rb")


class TestIphoneAppGenerator < Test::Unit::TestCase
  include RubiGen::GeneratorTestHelper

  def setup
    bare_setup
  end

  def teardown
    bare_teardown
  end

  # Some generator-related assertions:
  #   assert_generated_file(name, &block) # block passed the file contents
  #   assert_directory_exists(name)
  #   assert_generated_class(name, &block)
  #   assert_generated_module(name, &block)
  #   assert_generated_test_for(name, &block)
  # The assert_generated_(class|module|test_for) &block is passed the body of the class/module within the file
  #   assert_has_method(body, *methods) # check that the body has a list of methods (methods with parentheses not supported yet)
  #
  # Other helper methods are:
  #   app_root_files - put this in teardown to show files generated by the test method (e.g. p app_root_files)
  #   bare_setup - place this in setup method to create the APP_ROOT folder for each test
  #   bare_teardown - place this in teardown method to destroy the TMP_ROOT or APP_ROOT folder after each test

  def test_generator_without_options
    name = "MyProject"
    run_generator('iphone_app', [name], sources)
    assert_generated_file "tasks/iphone.rake"
    assert_generated_file "MyProject.xcodeproj/project.pbxproj"
    assert_generated_file "Info.plist"
    assert_generated_file "Resources/MainWindow.xib"
    assert_generated_file "Resources/RootViewController.xib"
    assert_generated_file "MyProject_Prefix.pch"
    assert_generated_file "Classes/RootViewController.m"
    assert_generated_file "Classes/RootViewController.h"
    assert_generated_file "Classes/AppDelegate.m"
    assert_generated_file "Classes/AppDelegate.h"
    assert_generated_file "main.m"
    assert_generated_file ".gitignore"
  end
  
  def test_generator_without_options_testing_files
    name = "MyProject"
    run_generator('iphone_app', [name], sources)
    assert_generated_file "Tests/ExampleTest.m"
    assert_generated_file "Unit Tests-Info.plist"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/RunIPhoneUnitTest.sh"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/GTMDefines.h"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/Foundation/GTMGarbageCollection.h"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/Foundation/GTMSystemVersion.h"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/Foundation/GTMSystemVersion.m"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMCALayer+UnitTesting.h"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMCALayer+UnitTesting.m"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMIPhoneUnitTestDelegate.h"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMIPhoneUnitTestDelegate.m"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMIPhoneUnitTestMain.m"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMNSObject+UnitTesting.h"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMNSObject+UnitTesting.m"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMSenTestCase.h"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMSenTestCase.m"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMUIKit+UnitTesting.h"
    assert_generated_file "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMUIKit+UnitTesting.m"
    assert_generated_file "lib/objc/OCMock.framework/Headers/OCMock.h"
    assert_generated_file "lib/objc/OCMock.framework/Headers/OCMockObject.h"
    assert_generated_file "lib/objc/OCMock.framework/Headers/OCMockRecorder.h"
    assert_generated_file "lib/objc/OCMock.framework/Headers/OCMConstraint.h"
    assert_generated_file "lib/objc/OCMock.framework/OCMock"
    assert_generated_file "lib/objc/OCMock.framework/Resources/Info.plist"
    assert_generated_file "lib/objc/OCMock.framework/Resources/License.txt"
    assert_generated_file "lib/objc/OCMock.framework/Resources/English.lproj/InfoPlist.strings"
  end

  private
  def sources
    [RubiGen::PathSource.new(:test, File.join(File.dirname(__FILE__),"..", generator_path))
    ]
  end

  def generator_path
    "apro_generators"
  end
end
