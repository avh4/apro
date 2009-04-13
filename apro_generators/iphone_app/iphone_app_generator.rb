# We are copying symlinks in this generator,
# which only works in rubigen 1.5.2.1 < http://github.com/avh4/rubigen >
gem "rubigen", ">=1.5.2.1"

class IphoneAppGenerator < RubiGen::Base

  default_options :author => nil

  attr_reader :name

  def initialize(runtime_args, runtime_options = {})
    super
    usage if args.empty?
    @name = args.shift
    extract_options
  end

  def manifest
    record do |m|
      # Ensure appropriate folder(s) exists
      m.directory 'tasks'
      m.file_copy_each ['tasks/iphone.rake']
      m.directory "#{name}.xcodeproj"
      m.directory "Classes"
      m.directory "Resources"
      m.directory "Tests"
      m.template 'project.pbxproj.erb', "#{name}.xcodeproj/project.pbxproj"
      m.file_copy_each ['Info.plist', "main.m",
        'Resources/MainWindow.xib', 'Resources/RootViewController.xib',
        "Classes/RootViewController.m", "Classes/RootViewController.h",
        "Classes/AppDelegate.m", "Classes/AppDelegate.h",
        "Unit Tests-Info.plist",
        "Tests/ExampleTest.m", "Tests/ExampleTest.testButton.iPhone.10.5.6.png"]
      m.directory "lib/objc/google-toolbox-for-mac-1.5.1"
      m.directory "lib/objc/google-toolbox-for-mac-1.5.1/Foundation"
      m.directory "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting"
      m.file_copy_each [
        "lib/objc/google-toolbox-for-mac-1.5.1/GTMDefines.h",
        "lib/objc/google-toolbox-for-mac-1.5.1/Foundation/GTMGarbageCollection.h",
        "lib/objc/google-toolbox-for-mac-1.5.1/Foundation/GTMSystemVersion.h",
        "lib/objc/google-toolbox-for-mac-1.5.1/Foundation/GTMSystemVersion.m",
        "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMCALayer+UnitTesting.h",
        "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMCALayer+UnitTesting.m",
        "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMIPhoneUnitTestDelegate.h",
        "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMIPhoneUnitTestDelegate.m",
        "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMIPhoneUnitTestMain.m",
        "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMNSObject+UnitTesting.h",
        "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMNSObject+UnitTesting.m",
        "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMSenTestCase.h",
        "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMSenTestCase.m",
        "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMUIKit+UnitTesting.h",
        "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/GTMUIKit+UnitTesting.m",
        ]
      m.file "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/RunIPhoneUnitTest.sh",
        "lib/objc/google-toolbox-for-mac-1.5.1/UnitTesting/RunIPhoneUnitTest.sh",
        {:chmod => 0755}
      m.directory "lib/objc/OCMock.framework"
      m.directory "lib/objc/OCMock.framework/Versions/A/Headers"
      m.directory "lib/objc/OCMock.framework/Versions/A/Resources"
      m.directory "lib/objc/OCMock.framework/Versions/A/Resources/English.lproj"
      m.symlink "Versions/Current/Headers", "lib/objc/OCMock.framework/Headers"
      m.symlink "Versions/Current/OCMock", "lib/objc/OCMock.framework/OCMock"
      m.symlink "Versions/Current/Resources", "lib/objc/OCMock.framework/Resources"
      m.symlink "A", "lib/objc/OCMock.framework/Versions/Current"
      ["Headers/OCMock.h", "Headers/OCMockObject.h",
        "Headers/OCMockRecorder.h", "Headers/OCMConstraint.h",
        "Resources/Info.plist", "Resources/License.txt",
        "Resources/English.lproj/InfoPlist.strings"].each do |f|
        m.file_copy_each ["lib/objc/OCMock.framework/Versions/A/#{f}"]
      end
      m.file "lib/objc/OCMock.framework/Versions/A/OCMock", "lib/objc/OCMock.framework/Versions/A/OCMock", {:chmod => 0755}
      m.file 'Project_Prefix.pch', "#{name}_Prefix.pch"
      m.file '_gitignore', '.gitignore'

      # Create stubs
      # m.template           "template.rb.erb", "some_file_after_erb.rb"
      # m.template_copy_each ["template.rb", "template2.rb"]
      # m.template_copy_each ["template.rb", "template2.rb"], "some/path"
      # m.file           "file", "some_file_copied"
      # m.file_copy_each ["path/to/file", "path/to/file2"]
      # m.file_copy_each ["path/to/file", "path/to/file2"], "some/path"
    end
  end

  protected
    def banner
      <<-EOS
Creates a ...

USAGE: #{$0} #{spec.name} name
EOS
    end

    def add_options!(opts)
      # opts.separator ''
      # opts.separator 'Options:'
      # For each option below, place the default
      # at the top of the file next to "default_options"
      # opts.on("-a", "--author=\"Your Name\"", String,
      #         "Some comment about this option",
      #         "Default: none") { |o| options[:author] = o }
      # opts.on("-v", "--version", "Show the #{File.basename($0)} version number and quit.")
    end

    def extract_options
      # for each option, extract it into a local variable (and create an "attr_reader :author" at the top)
      # Templates can access these value via the attr_reader-generated methods, but not the
      # raw instance variable value.
      # @author = options[:author]
    end
end