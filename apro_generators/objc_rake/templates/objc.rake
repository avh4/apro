task :clean => 'objc:clean'

namespace :objc do
  desc "Compiles all Objective-C bundles for testing"
  
  task :clean do
    FileUtils.rm_r Dir["build/bundles"]
    FileUtils.rm_r Dir["build/nibs"]
  end
  
  task :compile => "build/bundles/Application.bundle"
  
  file 'build/bundles/Application.m' do
    FileUtils.mkdir_p "build/bundles"
    puts "Generating Application.m"
    File.open('build/bundles/Application.m', 'w') do |f|
      f.write('void Init_Application() {}')
    end
  end
  
  file "build/bundles/Application.bundle" => 'build/bundles/Application.m' do
    FileUtils.mkdir_p "build/bundles"
    FileUtils.rm Dir["build/bundles/Application.bundle"]
    puts "Building Application.bundle"
    sh "gcc -o build/bundles/Application.bundle -bundle -framework Cocoa -framework IOKit build/bundles/Application.m build/bundles/*.o"
  end
  
  model_file_paths = `find . -name '*.m' -not -path './build/*'`.split("\n")
  model_file_paths.delete "./main.m"
  
  model_file_paths.each do |path|
    path =~ /\.\/(.*)\.m/
    model_name = $1
    safe_model_name = model_name.gsub(/\//, '_')
    
    file "build/bundles/Application.bundle" => "build/bundles/#{safe_model_name}.o"
    
    file "build/bundles/#{safe_model_name}.o" => ["./#{model_name}.m", "./#{model_name}.h"] do |t|
      FileUtils.mkdir_p "build/bundles"
      puts "Building #{safe_model_name}.o from #{model_name}.m"
      sh "gcc -o build/bundles/#{safe_model_name}.o -c ./#{model_name}.m"
    end

  end

  nib_files = ["MainMenu"]
  nib_files.each do |nib_name|
    nib = "build/nibs/#{nib_name}.nib"
    xib = "English.lproj/#{nib_name}.xib"

    task :compile_nib => nib

    file nib => xib do
      FileUtils.mkdir_p "build/nibs"
      puts "Compiling #{xib} to #{nib}"
      sh "ibtool --errors --warnings --notices --output-format human-readable-text --compile #{nib} #{xib}"
    end

  end
  
end
