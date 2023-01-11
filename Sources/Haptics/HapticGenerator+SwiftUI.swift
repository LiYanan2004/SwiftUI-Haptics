import SwiftUI

struct HapticGeneratorEnvironment: EnvironmentKey {
    static var defaultValue: HapticGenerator = generator
}

public extension EnvironmentValues {
    /// Get the default ``HapticGenerator`` Instance.
    ///
    /// In views, You should use `@Environment` to
    /// get the instance of ``HapticGenerator``.
    ///
    /// In somewhere that `@Environment` isn't supported, you can use
    /// `HapticGenerator.default` to get the instance.
    var hapticGenerator: HapticGenerator {
        get { self[HapticGeneratorEnvironment.self] }
    }
}
