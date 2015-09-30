Pod::Spec.new do |s|
  s.name = 'Google-Material-Design-Icons-Swift'
  s.version = '1.0.1'
  s.license = 'MIT'
  s.summary = 'Google Material Design Icons Library for iOS'
  s.homepage = 'https://github.com/Vaberer/Google-Material-Design-Icons-Swift'
  s.screenshots = "https://raw.githubusercontent.com/Vaberer/Google-Material-Design-Icons-Swift/master/resources/image1.png"
  s.social_media_url = 'http://twitter.com/vaberer'
  s.authors = { "Patrik Vaberer" => "patrik.vaberer@gmail.com" }
  s.source = { :git => 'https://github.com/Vaberer/Google-Material-Design-Icons-Swift.git', :tag => s.version }
  
  s.ios.deployment_target = '8.0'
  s.source_files   = 'Source/GMDIcon.swift'
  s.resource_bundle = { 'Google-Material-Design-Icons-Swift' => 'Source/GMDIcons.ttf' }
  s.frameworks = 'UIKit', 'CoreText'
  s.requires_arc = true
end