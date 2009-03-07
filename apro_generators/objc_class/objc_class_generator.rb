class ObjcClassGenerator < RubiGen::Base

  default_options :author => nil

  attr_reader :name, :date, :year, :short_name, :ruby_name

  def initialize(runtime_args, runtime_options = {})
    super
    usage if args.empty?
    @name = args.shift
    @ruby_name = @name.gsub(/^[A-Z]?[A-Z]?/, '')
    @ruby_name.gsub!(/([A-Z])/) { '_' + $1.downcase }
    @short_name = @ruby_name.gsub(/([^_])[^_]*/) { $1 }
    @short_name.gsub!(/_/, '')
    @ruby_name.gsub!(/^_/, '')
    @date = Time.now.strftime("%Y-%m-%d")
    @year = Time.now.strftime("%Y")
    extract_options
  end

  def manifest
    record do |m|
      # Ensure appropriate folder(s) exists
      m.directory 'Classes/'
      m.template 'template.m.erb', "Classes/#{name}.m"
      m.template 'template.h.erb', "Classes/#{name}.h"
      m.directory 'spec/'
      m.template 'spec.rb.erb', "spec/#{ruby_name}_spec.rb"

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