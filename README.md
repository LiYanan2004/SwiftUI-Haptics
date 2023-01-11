# SwiftUI-Haptics

`Haptics` has a set of super-light modifiers and functions that adds haptic feedbacks to any SwiftUI `View`, for example, when the specific property changes or equals to a specific value, the feedback will be triggered automatically.

```swift
import SwiftUI
import Haptics
⋮
⋮
YourView()
    .haptics(onChangeOf: value, type: .soft)
```
or using the function programmatically
```swift
@Environment(\.hapticGenerator) var generator
⋮
generator.hapticFeedbackOccurred(type: .click)
```

## Feedback Types

 - Notification Feedback
 - Impact Feedback
 - Selection Feedback
 - WKHaptic
 
 ## Platforms

- iOS 14.0+
- watchOS 7.0+
 
## Conditional Haptics

Sometimes, you just want to play haptic feedbacks only at a specific state. At this time, `.haptics(when:equalsTo:type:)` plays a role.

Of course, you can create multiple haptics on a single view:

```swift
YourView()
    .haptics(when: value, equalsTo: .success, type: .success)
    .haptics(when: value, equalsTo: .failure, type: .error)
```

## onAppear Haptics

You can play a one-time haptic feedback when a view appears.

```swift
Text("I love haptics.")
    .triggersHapticFeedbackWhenAppear()
```


## Swift Package Manager

In your `Package.swift` Swift Package Manager manifest, add the following dependency to your `dependencies` argument:

```swift
.package(url: "https://github.com/LiYanan2004/SwiftUI-Haptics.git", .branch("main")),
```

Add the dependency to any targets you've declared in your manifest:

```swift
.target(name: "MyTarget", dependencies: ["Haptics"]),
```
