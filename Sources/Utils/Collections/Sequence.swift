public extension Sequence {
    func sorted<T:Comparable>(by attribute: KeyPath<Element, T>) -> [Element] {
        return sorted(by: { $0[keyPath: attribute] < $1[keyPath: attribute]})
    }
    
    func sortedDesc<T:Comparable>(by attribute: KeyPath<Element, T>) -> [Element] {
        return sorted(by: { $0[keyPath: attribute] > $1[keyPath: attribute]})
    }

    func sorted<T:Comparable>(by attribute: KeyPath<Element, T?>) -> [Element] {
        return sorted(by: { (lhs, rhs) in
            if let lhs = lhs[keyPath: attribute], let rhs = rhs[keyPath: attribute] {
                return lhs < rhs
            }

            if lhs[keyPath: attribute] == nil && rhs[keyPath: attribute] == nil {
                return true
            }

            if lhs[keyPath: attribute] == nil {
                return true
            }

            if rhs[keyPath: attribute] == nil {
                return false
            }
            return false
        })
    }

    func sortedDesc<T:Comparable>(by attribute: KeyPath<Element, T?>) -> [Element] {
        return sorted(by: { (lhs, rhs) in
            if let lhs = lhs[keyPath: attribute], let rhs = rhs[keyPath: attribute] {
                return lhs > rhs
            }

            if lhs[keyPath: attribute] == nil && rhs[keyPath: attribute] == nil {
                return true
            }

            if lhs[keyPath: attribute] == nil {
                return false
            }

            if rhs[keyPath: attribute] == nil {
                return true
            }
            return false
        })
    }
}

public extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
