import SwiftUI

public struct ExpandableLable: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.system(size: 1000, weight: Font.Weight.medium, design: .monospaced))
            .minimumScaleFactor(0.01)
    }
}
