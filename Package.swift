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
            url: "https://github.com/anquii/MCLSwiftWrapper/releases/download/v1.61.0/MCLSwiftWrapper.zip",
            checksum: "65a4a804fbe28058d026168068e2b156c35989ef2a61849c7ecf038e3871e151"
        )
    ]
)
