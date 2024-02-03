import SwiftUI

/// Trigger haptic feedback programmatically.
class HapticGenerator {
    private init() { }
    
    /// Perform provided `feedback` instantly.
    /// - Parameter feedback: Which type of feedback to play.
    static func performFeedback(_ feedback: HapticFeedback) {
        feedback.perform()
    }
}
