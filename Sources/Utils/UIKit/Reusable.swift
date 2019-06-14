protocol Reusable {
    static var reusableIdentifier: String { get }
}

extension Reusable {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
