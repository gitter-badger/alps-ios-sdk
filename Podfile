# coding: utf-8
platform :ios, '9.0'
use_frameworks!

target 'AlpsSDK' do
    # Socket
    pod 'Starscream', '~> 3.0'
    # Network
    pod 'Alamofire', '~> 4.6'
end

target 'AlpsExample' do
    # Socket
    pod 'Starscream', '~> 3.0'
    # Network
    pod 'Alamofire', '~> 4.6'
end

target 'AlpsSDKTests' do
    # Testing description and matching
    pod 'Nimble', '~> 7.0'
    pod 'Quick', '~> 1.2'
end

# Overrides default target setup in order to improve build time
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            if config.name == 'Debug'
                config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
                config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
            end
        end
    end
end
