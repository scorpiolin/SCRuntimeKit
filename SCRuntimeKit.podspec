Pod::Spec.new do |s|
  s.name        = "SCRuntimeKit"
  s.version     = "0.1.0"
  s.summary     = "runtime utils"

  s.description = <<-DESC
                  Provide some useful utils for runtime.
                  DESC

  s.homepage    = "https://github.com/scorpiolin/SCRuntimeKit"
  s.license     = { :type => "BSD", :file => "LICENSE" }
  s.author      = { "hjy_x" => "linqin@didichuxing.com"}

  s.platform    = :ios
  s.ios.deployment_target = '7.0'
  s.source      = { :git => "git@github.com:scorpiolin/SCRuntimeKit.git",
                    :tag => s.version }

  s.frameworks  = "Foundation", "UIKit"
  s.requires_arc = true

  s.ios.source_files = "SCRuntimeKit/Classes/**/*.*", "SCRuntimeKit/SCRuntimeKit.h"
  s.pod_target_xcconfig = {
    "OTHER_LDFLAGS" => "-lObjC"
  }
end
