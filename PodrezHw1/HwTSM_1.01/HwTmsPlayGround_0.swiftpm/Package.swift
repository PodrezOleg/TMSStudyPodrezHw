// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "HwTmsPlayGround_0.1",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "HwTmsPlayGround_0.1",
            targets: ["AppModule"],
            bundleIdentifier: "Podrez.HwTmsPlayGround-0-1",
            teamIdentifier: "MLNT49BZ43",
            displayVersion: "0.1",
            bundleVersion: "1",
            appIcon: .asset("AppIcon"),
            accentColor: .presetColor(.orange),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            appCategory: .entertainment
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)