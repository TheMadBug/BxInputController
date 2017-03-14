#
#  Be sure to run `pod spec lint BxObjC.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "BxInputController"
  s.version      = "VERSION_NUMBER"
  s.summary      = "Swift library for all"
  s.description  = "This framework will help iOS developers for simplify development general inputing controllers"
  s.homepage     = "https://github.com/ByteriX/BxInputController.git"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "Sergey Balalaev" => "sof.bix@mail.ru" }
  # Or just: s.author    = "ByteriX"
  # s.authors            = { "ByteriX" => "email@address.com" }
  # s.social_media_url   = "http://twitter.com/ByteriX"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

    s.platform     = :ios, "8.0"

#s.ios.deployment_target = "5.0"
#s.osx.deployment_target = "10.7"
# s.watchos.deployment_target = "2.0"
# s.tvos.deployment_target = "9.0"

    s.source       = { :git => "https://github.com/ByteriX/BxInputController.git", :tag => s.version }
    s.frameworks = ["Foundation", "UIKit"]
    s.resources = "BxInputController/Sources/Assets.xcassets", "BxInputController/Sources/**/*.xib"
#s.public_header_files = "**/iBXCommon/Frameworks/**/*.h", "**/iBXCommon/Sources/**/*.h"

    s.source_files  = "BxInputController/Sources/**/*.{swift}"

    s.dependency 'BxObjC/Vcl'
    s.dependency 'BxTextField'


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #



end
