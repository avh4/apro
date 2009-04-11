task :build => 'iphone:build'

namespace :iphone do
  
  task :build do
    sh "xcodebuild"
  end
  
end
