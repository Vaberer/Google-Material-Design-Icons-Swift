Pod::Spec.new do |s|
  s.name = 'HS-Google-Material-Design-Icons'
  s.version = '1.2.1'
  s.swift_version = '4.2'
  s.license = 'MIT'
  s.summary = 'Google Material Design Icons Library for iOS'
  s.description = <<-DESC
                     Forked from Google-Material-Design-Icons-Swift
                     Updated with new Material Icons (up to Sept 2018)
                     Updated to make identifying and adding new icons easier
                     Easily use Google Material icons throughout your project with scale independant vector sources.
                   DESC
  s.homepage = 'https://github.com/ConfusedVorlon/HS-Google-Material-Design-Icons'
  s.screenshots = "https://raw.githubusercontent.com/ConfusedVorlon/HS-Google-Material-Design-Icons/master/resources/image1.png"
  s.authors = "Rob Jonson" , "Patrik Vaberer"
  s.source = { :git => 'https://github.com/ConfusedVorlon/HS-Google-Material-Design-Icons.git', :tag => s.version }

  s.ios.deployment_target = '9.0'
  s.source_files   = ['Source/GMDIcon.swift']
  s.resource_bundle = { 'HS-Google-Material-Design-Icons' => 'Source/GMDIcons.ttf' }
  s.frameworks = 'UIKit', 'CoreText'
  s.requires_arc = true

  s.deprecated = true
  s.deprecated_in_favor_of = 'HS-Font-Icons'
end
