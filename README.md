# CallsUI

![Swift Package](https://img.shields.io/badge/Swift_Package-fa7343?style=for-the-badge&logo=swift&logoColor=white)
![Swift 5.3](https://img.shields.io/badge/Swift-5.3+-fa7343?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI 2](https://img.shields.io/badge/SwiftUI-2+-blue?style=for-the-badge&logo=swift&logoColor=white)
![Xcode 12](https://img.shields.io/badge/Xcode-12+-1575F9?style=for-the-badge&logo=xcode&logoColor=white)
![iOS 14](https://img.shields.io/badge/iOS-14+-999999?style=for-the-badge&logo=apple&logoColor=white)

A Swift package providing some view for call in SwiftUI.

- Copyright: ©[Jaesung Lee.](https://github.com/jaesung-wwdc)

## Requirements

- Xcode 12+
- iOS14+

## Features
### View
#### DialView
```swift
DialView(onRequestVoiceCall:onRequestVideoCall:)
```

#### CallView
```swift
CallView(design:username:onSpeaker:onMuted:onEnded:)
```

## How to use
### Xcode project
Xcode > File > Swift Packages > Add Package Dependency > Enter repository URL: https://github.com/jaesung-wwdc/CallsUI

### Other Swift Package
Your Swift Package > `Package.swift` > Add new package to `dependencies` > Add `"CallsUI"` to the target > Then, now you can import `CallsUI` in your source file.

- Example
```swift
import PackageDescription

let package = Package(
    name: "SomePackage",
    products: [ 
        ... 
    ],
    dependencies: [
        .package(url: "https://github.com/jaesung-wwdc/CallsUI", from: "0.1.0") // 1. Add dependency to your swift package
    ],
    targets: [
        .target(
            name: "SomePackage",
            dependencies: ["CallsUI"]),   // 2. Add CallsUI to the target as dependency
        .testTarget(...),
    ]
)
```
