import SwiftUI

/// Makes `Haptics` view modifier available to Xcode's library,
/// allowing for improved auto-complete and discoverability.
public struct HapticsLibrary: LibraryContentProvider {
    @State var status: Status = .unknown
    
    #if os(iOS)
    let generalHapticType = UIImpactFeedbackGenerator.FeedbackStyle.light
    #elseif os(watchOS)
    let generalHapticType = WKHapticType.click
    #endif
    
    @LibraryContentBuilder
    public func modifiers(base: any View) -> [LibraryItem] {
        LibraryItem(base.haptics(onChangeOf: status, type: generalHapticType), title: "General Haptic")
        LibraryItem(base.haptics(when: status, equalsTo: .success, type: .success), title: "Conditional Haptics")
    }
    
    enum Status: Int {
        case unknown = 0
        case success = 1
        case failure = 2
    }
}

