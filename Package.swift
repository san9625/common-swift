// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "common-swift",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "common-swift",
            targets: ["DesignUtils", "DeviceUtils", "ImageUtils", "AppLifeTimeUtils", "NetworkUtils", "TimeUtils"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        //.target(
        //    name: "common-swift"),
        .target(
            name: "DesignUtils"),
        .target(
            name: "DeviceUtils"),
        .target(
            name: "ImageUtils"),
        .target(
            name: "AppLifeTimeUtils"),
        .target(
            name: "NetworkUtils"),
        .target(
            name: "TimeUtils"),
        .testTarget(
            name: "common-swiftTests",
            dependencies: ["DesignUtils", "DeviceUtils", "ImageUtils", "AppLifeTimeUtils", "NetworkUtils", "TimeUtils"]),
    ]
)
