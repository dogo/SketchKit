#
# Be sure to run `pod lib lint SketchKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SketchKit'
  s.version          = '1.3.1'
  s.summary          = 'A lightweight autolayout DSL library for iOS.'
  s.homepage         = 'https://github.com/dogo/SketchKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Diogo Autilio' => 'diautilio@gmail.com' }
  s.social_media_url = 'http://twitter.com/di_autilio'
  s.requires_arc     = true
  s.frameworks       = 'UIKit'

  s.swift_versions   = ['3.2', '4.0', '4.2', '5.0', '5.1']
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'

  s.source           = { :git => 'https://github.com/dogo/SketchKit.git', :tag => s.version.to_s }
  s.source_files     = 'Sources/SketchKit/**/*'
end
