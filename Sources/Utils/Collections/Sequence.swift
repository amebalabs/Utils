public extension Sequence {
    /// Usage: ["AAA","BBB", "CCC"].sorted(by: \.count)
    func sorted<T:Comparable>(by attribute: KeyPath<Element, T>) -> [Element] {
        return sorted(by: { $0[keyPath: attribute] < $1[keyPath: attribute]})
    }
    /// Usage: ["AAA","BBB", "CCC"].sorted(by: \.count)
    func sortedDesc<T:Comparable>(by attribute: KeyPath<Element, T>) -> [Element] {
        return sorted(by: { $0[keyPath: attribute] > $1[keyPath: attribute]})
    }
}
