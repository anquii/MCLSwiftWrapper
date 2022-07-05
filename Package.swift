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
            checksum: "baf9255bc01ed06a497fc3388eaa1041519a3dc5e93746ca69adad801bca4ba2"
        )
    ]
)
