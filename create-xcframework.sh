#!/bin/bash

FRAMEWORK_NAME="SNSConnectWeiboRebuild"

echo "[1/6] Remove last build"
if [ -d "Build/" ]; then
    rm -rf "Build/"
fi
if [ -f "${FRAMEWORK_NAME}.xcframework.zip" ]; then
    rm -rf "${FRAMEWORK_NAME}.xcframework.zip"
fi

echo "[2/6] Xcode Build Archive for generic/platform=iOS"
xcodebuild archive \
-project ${FRAMEWORK_NAME}.xcodeproj \
-scheme ${FRAMEWORK_NAME} \
-destination "generic/platform=iOS" \
-archivePath "Build/iphoneos" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "[3/6] Patch to support ios-arm64-simulator"
./arm64-to-sim patch "Library/libWeiboSDK.a"

echo "[4/6] Xcode Build Archive for generic/platform=iOS Simulator"
xcodebuild archive \
-project ${FRAMEWORK_NAME}.xcodeproj \
-scheme ${FRAMEWORK_NAME} \
-destination "generic/platform=iOS Simulator" \
-archivePath "Build/iphonesimulator" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "[5/6] Create xcframework"
xcodebuild -create-xcframework \
-framework "Build/iphoneos.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
-framework "Build/iphonesimulator.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
-output "Build/${FRAMEWORK_NAME}.xcframework"

echo "[6/6] Create Zip & Compute Checksum"
zip -r ${FRAMEWORK_NAME}.xcframework.zip Build/${FRAMEWORK_NAME}.xcframework
swift package compute-checksum ${FRAMEWORK_NAME}.xcframework.zip
./arm64-to-sim restore "Library/libWeiboSDK.a"
