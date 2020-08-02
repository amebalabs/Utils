import SwiftUI

public extension View {
    func expandableLabel() -> some View {
        self.modifier(ExpandableLable())
    }
}
