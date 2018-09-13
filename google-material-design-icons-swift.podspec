Pod::Spec.new do |s|
  s.name = 'HS-Google-Material-Design-Icons'
  s.version = '2.0.0'
  s.swift_version = '4.2'
  s.license = 'MIT'
  s.summary = 'Google Material Design Icons Library for iOS'
  s.homepage = 'https://github.com/ConfusedVorlon/Google-Material-Design-Icons-Swift'
  s.screenshots = "https://raw.githubusercontent.com/ConfusedVorlon/Google-Material-Design-Icons-Swift/master/resources/image1.png"
  s.authors = "Rob Jonson" , "Patrik Vaberer"
  s.source = { :git => 'https://github.com/ConfusedVorlon/Google-Material-Design-Icons-Swift.git', :tag => s.version }

  s.ios.deployment_target = '9.0'
  s.source_files   = ['Source/GMDIcon.swift']
  s.resource_bundle = { 'Google-Material-Design-Icons-Swift' => 'Source/GMDIcons.ttf' }
  s.frameworks = 'UIKit', 'CoreText'
  s.requires_arc = true
end
