import CoreGraphics

public extension CGRect {
    var center: CGPoint {
        get {
            return CGPoint(x: midX, y: midY)
        }
        set {
            let x = newValue.x - width / 2.0
            let y = newValue.y - height / 2.0
            let newOrigin = CGPoint(x: x, y: y)
            self.origin = newOrigin
        }
    }
}
