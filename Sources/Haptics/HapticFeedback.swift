import Foundation

protocol Haptic: Sendable {
    @MainActor var performHapticFeedback: @Sendable () async -> Void { get }
}

public struct HapticFeedback: Haptic {
    internal var label: String
    internal var performHapticFeedback: @Sendable () async -> Void
    
    init(_ label: String, performHapticFeedback: @MainActor @escaping @Sendable () -> Void) {
        self.label = label
        self.performHapticFeedback = performHapticFeedback
    }
    
    func perform() {
        Task { @MainActor in
            await self.performHapticFeedback()
        }
    }
}

extension HapticFeedback {
    public enum Flexibility: Int, Sendable {
        case rigid, solid, soft
    }
    
    public enum Weight: Int, Sendable {
        case light, medium, heavy
    }
}

extension HapticFeedback: Equatable {
    public static func == (lhs: HapticFeedback, rhs: HapticFeedback) -> Bool {
        lhs.label == rhs.label
    }
}
