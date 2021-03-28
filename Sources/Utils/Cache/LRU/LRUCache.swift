///From https://www.apoorvashettigar.com/index.php/lru-cache-least-recently-used-cache-in-swift/

import Foundation

public class LRUCache<Key: Hashable, Value>   {
    var data: [Key: ListNode<Key, Value>] = [:]
    let list: QueuedLinkedList<Key, Value> = QueuedLinkedList()
    var maximumSize: Int
    public init(maximumSize: Int) {
        guard maximumSize > 0 else { fatalError() }
        self.maximumSize = maximumSize
    }

    public func add(key: Key, value: Value) {
        if let node = data[key] {
            list.moveNodeTowardsHead(node: node)
        } else {
            guard let node = list.add(key, value) else { fatalError() }
            data[key] =  node
        }

        if list.count > maximumSize {
            guard let node = list.removeLast() else { return }
            data[node.key] = nil
        }
    }

    public func get(key: Key) -> Value? {
        guard let node = data[key] else { return nil }
        list.moveNodeTowardsHead(node: node)
        return node.value
    }
    
    public func remove(key: Key) {
        data.removeValue(forKey: key)
    }

    public func isValid(key: Key) -> Bool {
        return data[key] != nil
    }

    public func flush() {
        data.removeAll()
        while list.count > 0 {
            list.removeLast()
        }
    }
}

class QueuedLinkedList<Key, Value> {
    var head: ListNode<Key, Value>?
    var tail: ListNode<Key, Value>?
    var count: Int = 0

    init() { }

    func add(_ key: Key, _ value: Value) -> ListNode<Key, Value>? {
        let node = ListNode(value: value, key: key)
        count += 1
        guard let temphead = head, let _ = tail else {
            head = node; tail = head; return node
        }

        temphead.previous = node
        node.next = temphead
        head = node
        return node
    }

    @discardableResult func removeLast() -> ListNode<Key, Value>? {
        guard let temptail = tail else { return nil }
        let previous = temptail.previous
        previous?.next = nil
        defer {
            count -= 1
            tail = previous
        }
        return tail
    }

    func moveNodeTowardsHead(node: ListNode<Key, Value>) {
        guard head !== node else { return }
        if tail === node { tail = node.previous }
        node.previous?.next = node.next
        node.next?.previous = node.previous

        node.next = head
        node.previous = nil

        head?.previous = node
        head = node
    }
}


class ListNode<Key, Value> {
    var value: Value
    var key: Key
    var next: ListNode?
    var previous: ListNode?

    init(value: Value, key: Key, next: ListNode? = nil, previous: ListNode? = nil) {
        self.value = value
        self.key = key
        self.next = next
        self.previous = previous
    }
}
