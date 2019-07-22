public protocol Reusable {
    static var reusableIdentifier: String { get }
}

extension Reusable {
    public static var reusableIdentifier: String {
        return String(describing: self)
    }
}
