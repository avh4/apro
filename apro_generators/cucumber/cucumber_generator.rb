class CucumberGenerator < RubiGen::Base

  default_options :author => nil

  def initialize(runtime_args, runtime_options = {})
    super
    extract_options
  end

  def manifest
    record do |m|

      m.directory 'features'
      m.directory 'features/step_definitions'
      m.directory 'features/support'
      m.directory 'tasks'
      m.file 'cucumber.rake', 'tasks/cucumber.rake'
      m.file 'example.feature', 'features/example.feature'
      m.file 'example_steps.rb', 'features/step_definitions/example_steps.rb'
      m.file 'env.rb', 'features/support/env.rb'
      m.file 'example_support.rb', 'features/support/example.rb'

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