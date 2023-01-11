import SwiftUI

#if os(iOS)
// MARK: - iOS implementation
public extension View {
    /// Adds notification feedbacks to your views when the `value` changes.
    /// - Parameters:
    ///   - value: The value to check against when determining whether to play haptic feedbacks.
    ///   - type: The style of feedbacks.
    /// - Returns: A view that plays haptic feedbacks when the specified value changes.
    func haptics<V: Equatable>(
        onChangeOf value: V,
        type: UINotificationFeedbackGenerator.FeedbackType
    ) -> some View {
        onChange(of: value) { _ in
            generator.hapticFeedbackOccurred(type: type)
        }
    }
    
    /// Adds notification feedbacks to your views when the `property` equals to a specific value.
    /// - Parameters:
    ///   - property: The property to check against when determining whether to play haptic feedbacks.
    ///   - value: The value that triggers the feedback.
    ///   - type: The style of feedbacks.
    /// - Returns: A view that plays haptic feedbacks when the `property` equals to a specific value.
    func haptics<V: Equatable>(
        when property: V,
        equalsTo value: V,
        type: UINotificationFeedbackGenerator.FeedbackType
    ) -> some View {
        onChange(of: property) { newValue in
            if newValue == value {
                generator.hapticFeedbackOccurred(type: type)
            }
        }
    }
    
    /// Adds impact feedbacks to your views when the `value` changes.
    /// - Parameters:
    ///   - value: The value to check against when determining whether to play haptic feedbacks.
    ///   - type: The style of feedbacks.
    /// - Returns: A view that plays haptic feedbacks when the specified value changes.
    func haptics<V: Equatable>(
        onChangeOf value: V,
        type: UIImpactFeedbackGenerator.FeedbackStyle
    ) -> some View {
        onChange(of: value) { _ in
            generator.hapticFeedbackOccurred(type: type)
        }
    }
    
    /// Adds impact feedbacks to your views when the `property` equals to a specific value.
    /// - Parameters:
    ///   - property: The property to check against when determining whether to play haptic feedbacks.
    ///   - value: The value that triggers the feedback.
    ///   - type: The style of feedbacks.
    /// - Returns: A view that plays haptic feedbacks when the `property` equals to a specific value.
    func haptics<V: Equatable>(
        when property: V,
        equalsTo value: V,
        type: UIImpactFeedbackGenerator.FeedbackStyle
    ) -> some View {
        onChange(of: property) { newValue in
            if newValue == value {
                generator.hapticFeedbackOccurred(type: type)
            }
        }
    }
    
    /// Adds selection feedbacks to your views when the `value` changes.
    /// - Parameters:
    ///   - value: The value to check against when determining whether to play haptic feedbacks.
    /// - Returns: A view that plays haptic feedbacks when the specified value changes.
    func haptics<V: Equatable>(onChangeOf value: V) -> some View {
        onChange(of: value) { _ in
            generator.hapticFeedbackOccurred()
        }
    }
    
    /// Triggers a haptic feedback when the view appears.
    /// - Returns: A view that plays haptic feedbacks when appears.
    func triggersHapticFeedbackWhenAppear() -> some View {
        onAppear {
            generator.hapticFeedbackOccurred()
        }
    }
}

// MARK: Deprecated functions
/// Triggers a selection feedback programmatically.
///
/// You can also use ``.haptics(onChangeOf:)`` on your `View`.
@available(iOS, deprecated, message: "Use HapticGenerator via `@Environment(\\.hapticGenerator)` to occur haptics programmatically.")
public func hapticFeedbackOccurred() {
    let generator = UISelectionFeedbackGenerator()
    generator.prepare()
    generator.selectionChanged()
}

/// Triggers a notification feedback programmatically.
///
/// You can also use ``.haptics(onChangeOf:type:)`` on your `View`.
@available(iOS, deprecated, message: "Use HapticGenerator via `@Environment(\\.hapticGenerator)` to occur haptics programmatically.")
public func hapticFeedbackOccurred(type: UINotificationFeedbackGenerator.FeedbackType) {
    let generator = UINotificationFeedbackGenerator()
    generator.prepare()
    generator.notificationOccurred(type)
}

/// Triggers an impact feedback programmatically.
///
/// You can also use ``.haptics(onChangeOf:type:)`` on your `View`.
@available(iOS, deprecated, message: "Use HapticGenerator via `@Environment(\\.hapticGenerator)` to occur haptics programmatically.")
public func hapticFeedbackOccurred(type: UIImpactFeedbackGenerator.FeedbackStyle) {
    let generator = UIImpactFeedbackGenerator(style: type)
    generator.prepare()
    generator.impactOccurred()
}
#elseif os(watchOS)
// MARK: - watchOS implementation
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
            generator.hapticFeedbackOccurred(type: type)
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
                generator.hapticFeedbackOccurred(type: type)
            }
        }
    }
    
    /// Triggers a haptic feedback when the view appears.
    /// - Returns: A view that plays the haptic when appears.
    func triggersHapticFeedbackWhenAppear() -> some View {
        onAppear {
            generator.hapticFeedbackOccurred(type: .click)
        }
    }
}

// MARK: Deprecated functions
/// Triggers a haptic feedback programmatically.
///
/// If you want to perform different kinds of feedbacks accordingly, this function might be useful.
///
/// You can also use ``.haptics(onChangeOf:type:)`` on your `View`.
@available(watchOS, deprecated, message: "Use HapticGenerator via `@Environment(\\.hapticGenerator)` to occur haptics programmatically.")
public func hapticFeedbackOccurred(type: WKHapticType) {
    let device = WKInterfaceDevice.current()
    device.play(type)
}
#endif
