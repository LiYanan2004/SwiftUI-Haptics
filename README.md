# SwiftUI-Haptics

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FLiYanan2004%2FSwiftUI-Haptics%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/LiYanan2004/SwiftUI-Haptics)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FLiYanan2004%2FSwiftUI-Haptics%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/LiYanan2004/SwiftUI-Haptics)

`Haptics` has a set of super-light modifiers and functions that adds haptic feedbacks to any SwiftUI `View`, for example, when the specific property changes or equals to a specific value, the feedback will be triggered automatically.

```swift
import SwiftUI
import Haptics
⋮
⋮
YourView()
    .hapticFeedback(.selection, trigger: isSelected)
```
or using the function programmatically
```swift
HapticGenerator.performFeedback(.selection)
```

## Platforms

- iOS 14.0+
- watchOS 7.0+
- macOS 11.0+

## Haptic Feedbacks

 - `start`: Indicates that an activity started. **(watchOS only)**
 - `stop`: Indicates that an activity stopped. **(watchOS only)**
 - `alignment`: Indicates the alignment of a dragged item. **(macOS only)**
 - `decrease`: Indicates that an important value decreased below a significant threshold. **(watchOS only)**
 - `increase`: Indicates that an important value increased above a significant threshold. **(watchOS only)**
 - `levelChange`: Indicates movement between discrete levels of pressure. **(macOS only)**
 - `selection`: Indicates that a UI element’s values are changing. **(iOS & watchOS)**
 - `success`: Indicates that a task or action has completed. **(iOS & watchOS)**
 - `warning`: Indicates that a task or action has produced a warning of some kind. **(iOS & watchOS)**
 - `error`: Indicates that an error has occurred. **(iOS & watchOS)**
 - `impact`: Provides a physical metaphor you can use to complement a visual experience. **(iOS & watchOS)**

## Value-based Haptic Feedbacks

Play haptic feedbacks when the value changes.

```swift
YourView()
    .hapicFeedback(.selection, trigger: isSelected)
```
 
## Dynamic Haptic Feedbacks

If the value being monitored changes, returns a `HapticFeedback` to be performed. 

Return `nil` means **DO NOT** perform any haptics.

You can provide different haptic feedbacks based on your trigger value.

```swift
YourView()
    .hapicFeedback(trigger: workStatus) { _, newValue in
        return switch {
        case .success: .success
        case .failure: .error
        default: nil
        }
    }
    .hapicFeedback(.impact, trigger: cameraSession.capturedPhoto) { _, newValue in
        return newValue == true // Only plays feedback when photo has been taken
    }
```

## Looks familiar?

Yeah. 

If you want to use `.sensoryFeedback` API but need to support older platform, `SwiftUI-Haptics` is a better solution.

Replace `sensoryFeedback` to `hapticFeedback`. 

Everything just works.

## Swift Package Manager

In your `Package.swift` Swift Package Manager manifest, add the following dependency to your `dependencies` argument:

```swift
.package(url: "https://github.com/LiYanan2004/SwiftUI-Haptics.git", .branch("main")),
```

Add the dependency to any targets you've declared in your manifest:

```swift
.target(name: "MyTarget", dependencies: ["Haptics"]),
```
