# MCLSwiftWrapper

[![Platform](https://img.shields.io/badge/Platforms-macOS%20%7C%20iOS-blue)](#platforms)
[![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-orange)](#swift-package-manager)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/anquii/MCLSwiftWrapper/blob/main/LICENSE)

A Swift package wrapper of [herumi/mcl](https://github.com/herumi/mcl) in binary form (via an `XCFramework` bundle). The wrapper is necessary for multiple targets to depend on the binary through [Swift Package Manager](https://www.swift.org/package-manager), as only one binary target can be defined for it within a dependency graph. The release versions of this package mirrors the ones of [herumi/mcl](https://github.com/herumi/mcl) starting from [v1.61](https://github.com/herumi/mcl/releases/tag/v1.61).

## Platforms
- macOS 10.15+
- iOS 13+

## Installation

### Swift Package Manager

Add the following line to your `Package.swift` file:
```swift
.package(url: "https://github.com/anquii/MCLSwiftWrapper.git", from: "1.61.0")
```
...or integrate with Xcode via `File -> Swift Packages -> Add Package Dependency...` using the URL of the repository.

## License

`MCLSwiftWrapper` is licensed under the terms of the MIT license. See the [LICENSE](LICENSE) file for more information.

## Acknowledgments

In developing `MCLSwiftWrapper`, [MyEtherWallet](https://github.com/MyEtherWallet)'s [bls-eth-swift](https://github.com/MyEtherWallet/bls-eth-swift) has been used as a reference implementation.
