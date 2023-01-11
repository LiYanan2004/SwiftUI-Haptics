import SwiftUI

public class HapticGenerator {
    static public var `default` =  HapticGenerator()
    
    #if os(watchOS)
    internal let device = WKInterfaceDevice.current()
    #endif
}
    
#if os(iOS)
public extension HapticGenerator {
    /// Triggers a selection feedback programmatically.
    ///
    /// You can also use ``.haptics(onChangeOf:)`` on your `View`.
    func hapticFeedbackOccurred() {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }
    
    /// Triggers a notification feedback programmatically.
    ///
    /// You can also use ``.haptics(onChangeOf:type:)`` on your `View`.
    func hapticFeedbackOccurred(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }
    
    /// Triggers an impact feedback programmatically.
    ///
    /// You can also use ``.haptics(onChangeOf:type:)`` on your `View`.
    func hapticFeedbackOccurred(type: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: type)
        generator.prepare()
        generator.impactOccurred()
    }
}
#elseif os(watchOS)
public extension HapticGenerator {
    /// Triggers a haptic feedback programmatically.
    ///
    /// If you want to perform different kinds of feedbacks accordingly, this function might be useful.
    ///
    /// You can also use ``.haptics(onChangeOf:type:)`` on your `View`.
    func hapticFeedbackOccurred(type: WKHapticType) {
        device.play(type)
    }
}
#endif

let generator = HapticGenerator.default
