module CommonHelpers
  def setup_safe_folder
    FileUtils.rm_rf   @tmp_root = File.expand_path(File.dirname(__FILE__) + "/../../tmp")
    FileUtils.mkdir_p @tmp_root
    FileUtils.mkdir_p @home_path = File.expand_path(File.join(@tmp_root, "home"))
    FileUtils.mkdir_p File.join(@home_path, "Library")
    FileUtils.ln_s File.expand_path("~/Library/Keychains"), File.join(@home_path, "Library/Keychains")
    ENV['HOME'] = @home_path
    FileUtils.mkdir_p @project_path = File.expand_path(File.join(@tmp_root, "project"))
    @lib_path = File.expand_path(File.dirname(__FILE__) + '/../../lib')
  end

  def in_tmp_folder(&block)
    FileUtils.chdir(@tmp_root, &block)
  end
  
  def project_file(file)
    File.expand_path(File.join(@project_path, file))
  end

  def in_project_folder(&block)
    FileUtils.chdir(@project_path, &block)
  end

  def in_home_folder(&block)
    FileUtils.chdir(@home_path, &block)
  end

  def output_file_for(cmd)
    File.expand_path(File.join(@tmp_root, cmd.gsub(/[^A-Za-z0-9]/, '_') << ".out"))
  end
  
  def capture_output(cmd)
    output = `#{cmd} 2>&1`
    File.open(output_file_for(cmd), 'w') {|f| f.write output }
  end
  
  def capture_output_should_succeed(cmd)
    capture_output cmd
    if $?.exitstatus != 0
      fail output_of(cmd)
    end
  end
  
  def output_of(cmd)
    output_file = output_file_for(cmd)
    File.read(output_file)
  end

end

World { |world| world.extend CommonHelpers }
