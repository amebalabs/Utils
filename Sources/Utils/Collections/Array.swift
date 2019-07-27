extension Array {
    mutating func rearrange(fromIndex: Int, toIndex: Int) {
        let element = self.remove(at: fromIndex)
        self.insert(element, at: toIndex)
    }

    subscript (safe index: Int) -> Element? {
        guard index < count, index >= 0 else {return nil}
        return self[index]
    }
}
