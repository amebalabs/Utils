public extension Array {
    mutating func rearrange(fromIndex: Int, toIndex: Int) {
        let element = self.remove(at: fromIndex)
        self.insert(element, at: toIndex)
    }

    subscript (safe index: Int) -> Element? {
        guard index < count, index >= 0 else {return nil}
        return self[index]
    }
}

public extension Array where Element: Equatable {
    func reorder(by preferredOrder: [Element]) -> [Element] {
        return self.sorted { (a, b) -> Bool in
            guard let first = preferredOrder.firstIndex(of: a) else {return false}
            guard let second = preferredOrder.firstIndex(of: b) else {return true}
            return first < second
        }
    }
}
