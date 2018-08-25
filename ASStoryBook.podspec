Pod::Spec.new do |s|
  s.name             = 'ASStoryBook'
  s.version          = '0.1.0'
  s.summary          = 'Texture Interactive UI component dev & test'

  s.description      = 'Interactive UI component dev & test built on Texture'

  s.homepage         = 'https://github.com/Geektree0101/ASStoryBook'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Geektree0101' => 'h2s1880@gmail.com' }
  s.source           = { :git => 'https://github.com/Geektree0101/ASStoryBook.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.3'

  s.source_files = 'ASStoryBook/Classes/**/*'
  s.dependency 'Texture', '2.7'
  
end
