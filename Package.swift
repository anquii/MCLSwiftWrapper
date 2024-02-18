// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "MCLSwiftWrapper",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "MCLSwiftWrapper",
            targets: ["MCLSwiftWrapper"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "MCLSwiftWrapper",
            url: "https://github.com/anquii/MCLSwiftWrapper/releases/download/v1.61.1/MCLSwiftWrapper.zip",
            checksum: "2b1383c3c716c2c4fef9f89ee3b02784d03be4cd600111b01eeafcce76cba2e1"
        )
    ]
)
