Pod::Spec.new do |s|
  s.name = 'SNSConnectWeiboRebuild'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'SNSConnect+Weibo+Rebuild'
  s.homepage = 'https://github.com/anotheren/SNSConnectWeiboRebuild'
  s.authors = { 'anotheren' => 'liudong.edward@gmail.com' }
  s.source = {
    :http => 'https://github.com/anotheren/SNSConnectWeiboRebuild/releases/download/1.0.0/SNSConnectWeiboRebuild.xcframework.zip',
    :type => 'zip',
    :sha256 => 'e5cb29b7bed88550ea959ccefbf59c98f59ac2c0d8938a8628ba553e2b06e05f'
  }
  s.ios.deployment_target = '13.0'
  s.ios.vendored_frameworks = 'Build/SNSConnectWeiboRebuild.xcframework'
  s.swift_versions = ['5.5', '5.6']
  s.frameworks = ['UIKit', 'WebKit', 'ImageIO', 'Security', 'CoreText', 'QuartzCore', 'CoreGraphics', 'CoreTelephony', 'SystemConfiguration']
  s.libraries = ['z', 'sqlite3']
end
