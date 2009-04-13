task :build => 'iphone:build'
task :test => 'iphone:test'

namespace :iphone do
  
  task :build do
    sh "xcodebuild"
  end
  
  task :test do
    # run `xcodebuild -showsdks` to see a list of available SDKs
    sh "xcodebuild -sdk iphonesimulator2.2.1 -configuration Debug -target 'Unit Tests' build"
  end
  
end
