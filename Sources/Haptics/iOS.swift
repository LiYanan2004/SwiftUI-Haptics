import SwiftUI

#if os(iOS)
@available(iOS 14.0, *)
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
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(type)
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
                let generator = UINotificationFeedbackGenerator()
                generator.prepare()
                generator.notificationOccurred(type)
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
            let generator = UIImpactFeedbackGenerator(style: type)
            generator.prepare()
            generator.impactOccurred()
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
                let generator = UIImpactFeedbackGenerator(style: type)
                generator.prepare()
                generator.impactOccurred()
            }
        }
    }
    
    /// Adds selection feedbacks to your views when the `value` changes.
    /// - Parameters:
    ///   - value: The value to check against when determining whether to play haptic feedbacks.
    /// - Returns: A view that plays haptic feedbacks when the specified value changes.
    func haptics<V: Equatable>(onChangeOf value: V) -> some View {
        onChange(of: value) { _ in
            let generator = UISelectionFeedbackGenerator()
            generator.prepare()
            generator.selectionChanged()
        }
    }
    
    /// Triggers a haptic feedback when the view appears.
    /// - Returns: A view that plays haptic feedbacks when appears.
    func triggersHapticFeedbackWhenAppear() -> some View {
        onAppear {
            let generator = UISelectionFeedbackGenerator()
            generator.prepare()
            generator.selectionChanged()
        }
    }
}

/// Triggers a selection feedback programmatically.
/// You can also use ``.haptics(onChangeOf:)`` on your `View`.
public func hapticFeedback() {
    let generator = UISelectionFeedbackGenerator()
    generator.prepare()
    generator.selectionChanged()
}

/// Triggers a notification feedback programmatically.
/// You can also use ``.haptics(onChangeOf:type:)`` on your `View`.
public func hapticFeedback(type: UINotificationFeedbackGenerator.FeedbackType) {
    let generator = UINotificationFeedbackGenerator()
    generator.prepare()
    generator.notificationOccurred(type)
}

/// Triggers an impact feedback programmatically.
/// You can also use ``.haptics(onChangeOf:type:)`` on your `View`.
public func hapticFeedback(type: UIImpactFeedbackGenerator.FeedbackStyle) {
    let generator = UIImpactFeedbackGenerator(style: type)
    generator.prepare()
    generator.impactOccurred()
}
#endif
