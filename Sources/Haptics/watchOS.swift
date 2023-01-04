import SwiftUI

#if os(watchOS)
let device = WKInterfaceDevice.current()

@available(watchOS 7.0, *)
public extension View {
    /// Adds haptic feedbacks to your views when the `value` changes.
    /// - Parameters:
    ///   - value: The value to check against when determining whether to play haptic feedbacks.
    ///   - type: The style of feedbacks.
    /// - Returns: A view that plays the haptic when the specified value changes.
    func haptics<V: Equatable>(
        onChangeOf value: V,
        type: WKHapticType
    ) -> some View {
        onChange(of: value) { _ in
            device.play(type)
        }
    }
    
    /// Adds haptic feedbacks to your views when the `property` equals to a specific value.
    /// - Parameters:
    ///   - property: The property to check against when determining whether to play haptic feedbacks.
    ///   - value: The value that triggers the feedback.
    ///   - type: The style of feedbacks.
    /// - Returns: A view that plays the haptic when the `property` equals to a specific value.
    func haptics<V: Equatable>(
        when property: V,
        equalsTo value: V,
        type: WKHapticType
    ) -> some View {
        onChange(of: property) { newValue in
            if newValue == value {
                device.play(type)
            }
        }
    }
    
    /// Triggers a haptic feedback when the view appears.
    /// - Returns: A view that plays the haptic when appears.
    func triggersHapticFeedbackWhenAppear() -> some View {
        onAppear {
            device.play(.click)
        }
    }
}

/// Triggers a haptic feedback programmatically.
/// If you want to perform different kinds of feedbacks accordingly, this function might be useful.
/// You can also use ``.haptics(onChangeOf:type:)`` on your `View`.
public func hapticFeedback(type: WKHapticType) {
    device.play(type)
}
#endif
