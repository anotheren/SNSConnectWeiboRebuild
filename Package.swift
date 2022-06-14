// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SNSConnectWeiboRebuild",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "SNSConnectWeiboRebuild", targets: ["SNSConnectWeiboRebuildLink"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SNSConnectWeiboRebuildLink",
            dependencies: ["SNSConnectWeiboRebuild"],
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedFramework("WebKit"),
                .linkedFramework("ImageIO"),
                .linkedFramework("Security"),
                .linkedFramework("CoreText"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("SystemConfiguration"),
                .linkedLibrary("z"),
                .linkedLibrary("sqlite3"),
            ]),
        .binaryTarget(name: "SNSConnectWeiboRebuild",
                      url: "https://github.com/anotheren/SNSConnectWeiboRebuild/releases/download/1.0.0/SNSConnectWeiboRebuild.xcframework.zip",
                      checksum: "e5cb29b7bed88550ea959ccefbf59c98f59ac2c0d8938a8628ba553e2b06e05f")
    ]
)
