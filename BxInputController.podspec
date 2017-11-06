#
# Be sure to run `pod lib lint RtdBluetoothPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BxInputController'
  s.version          = '2.6.2'
  s.summary          = 'Text field to try and get BxInputController working in Swift 4'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Swift 4 friendly version of BxTextField with podspec'

  s.homepage         = 'https://github.com/TheMadBug/BxTextField'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'James Andrews' => 'jimmy.andrews@gmail.com' }
  s.source           = { :git => 'git@github.com:TheMadBug/BxTextField.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  # s.ios.deployment_target = '10.0'

  s.source_files = 'BxInputController/Sources/**/*.{swift,xib}'
  
  #s.resources = 'BxInputController/Sources/Assets.xcassets/**/*'
  s.resource_bundles = {
     'Assets' => ['BxInputController/Sources/Assets.xcassets/**/*']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'  (make sure to update below dependencies below to a specific version)

  s.dependency 'BxObjC/Common'
  s.dependency 'BxObjC/Control/Rate'
  s.dependency 'BxObjC/Control/TextView'
  s.dependency 'BxObjC/Control/ShakeAnimation'
  s.dependency 'BxObjC/Control/Navigation'
  s.dependency 'BxTextField'
  # actually requires this one
  # :git => 'https://github.com/TheMadBug/BxTextField.git', :branch => 'feature/swift4' but can't specify that in podspec

end