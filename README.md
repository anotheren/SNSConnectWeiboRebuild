# SNSConnectWeiboRebuild

## What's it?

* It's part of [SNSConnect](https://github.com/anotheren/SNSConnect) Project.
* Rebuild `libWechat.a` to `SNSConnectWeiboRebuild.xcframework`.
* Modules support and easy for Swift Package Manager to use.
* Support for ios-arm64/ios-arm64_x86_64-simulator.
* Require iOS 13+

## Change Log
| SNSConnectWeiboRebuild | WeiboSDK | Xcode |
| ----- | ----  | ---- |
| 1.0.0 | 3.3.3  | 13.4.1 (13F100) |

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/anotheren/SNSConnectWeiboRebuild.git", from: "1.0.0")
]
```

### CocoaPods

```ruby
pod 'SNSConnectWeiboRebuild'
```

## Manually Build

* Download the latest WeiboSDK from **[github.com/sinaweibosdk](https://github.com/sinaweibosdk/weibo_ios_sdk)**
* unzip and move files to `Library/`
* run `create-xcframework.sh`

## Reference

* [xcframeworks](https://github.com/bielikb/xcframeworks)
* [arm64-to-sim](https://github.com/luosheng/arm64-to-sim)
