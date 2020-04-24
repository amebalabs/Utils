public extension Sequence {
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
