Pod::Spec.new do |spec|
    spec.name         = "TerraRTiOS"
    spec.version      = "0.2.9"
    spec.summary      = "Realtime iOS SDKs support for Terra"
    spec.description  = <<-DESC
                SDKs support for iOS to connect with Terra's Websocket API for BLE devices and more
                        DESC
    spec.homepage     = "https://docs.tryterra.co/reference/terrartios"
    spec.license      = { :type => "MIT", :file => "LICENSE" }
    spec.author             = { "ElliottYu" => "dev@tryterra.co" }
    spec.platform     = :ios
    spec.ios.deployment_target = "13.0"
    spec.source       = { :git => "https://github.com/tryterra/TerraRTiOS.git", :tag => "#{spec.version}"}
    spec.swift_version = "4.2"
    spec.vendored_frameworks = "TerraRTiOS.xcframework"  
end
