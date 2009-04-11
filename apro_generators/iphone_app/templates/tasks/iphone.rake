task :build => 'iphone:build'

namespace :iphone do
  
  task :build do
    sh "env"
    sh "xcodebuild"
  end
  
end
