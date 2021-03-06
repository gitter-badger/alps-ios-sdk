Pod::Spec.new do |s|
  s.name = 'AlpsSDK'
  s.ios.deployment_target = '9.0'
  s.version = '0.6.0'
  s.authors = 'Matchmore Alps SDK Team'
  s.homepage = 'http://matchmore.io'
  s.summary = 'Alps iOS SDK in Swift'
  s.source = { :git => 'https://github.com/MatchMore/alps-ios-sdk.git', :tag => '0.6.0' }
  s.license = 'MIT license'
  s.source_files = 'AlpsSDK/**/*.swift'
  s.dependency 'Starscream', '~> 3.0'
  s.dependency 'Alamofire', '~> 4.0'
end