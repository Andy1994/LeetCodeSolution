/*
 146. LRU Cache
 
 Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

 Implement the LRUCache class:

 LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
 int get(int key) Return the value of the key if the key exists, otherwise return -1.
 void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
 Follow up:
 Could you do get and put in O(1) time complexity?
 
 */

class LRUCache {

    class Node {
        var key, value: Int!
        var next, prev: Node?
        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }
    
    class DoubleList {
        var head, tail: Node!
        var size: Int = 0
        init() {
            head = Node(key: 0, value: 0)
            tail = Node(key: 0, value: 0)
            head.next = tail
            tail.prev = head
        }
        func addLast(_ x: Node) {
            x.prev = tail.prev
            x.next = tail
            tail.prev?.next = x
            tail.prev = x
            size += 1
        }
        func remove(x: Node) {
            x.prev?.next = x.next
            x.next?.prev = x.prev
            size -= 1
        }
        func removeFirst() -> Node? {
            guard size > 0 else {
                return nil
            }
            let first = head.next!
            remove(x: first)
            return first
        }
    }
    
    var capacity: Int!
    var map = [Int: Node]()
    var cache = DoubleList()
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        let contains = map.contains { (obj) -> Bool in
            return obj.key == key
        }
        if !contains {
            return -1
        }
        makeRecently(key: key)
        return map[key]!.value
    }
    
    func put(_ key: Int, _ value: Int) {
        let contains = map.contains { (obj) -> Bool in
            return obj.key == key
        }
        if contains {
            deleteKey(key: key)
            addRecently(key: key, value: value)
            return
        }
        if cache.size == capacity {
            removeLeastRecently()
        }
        addRecently(key: key, value: value)
    }
    
    func makeRecently(key: Int) {
        guard let x = map[key] else {
            return
        }
        cache.remove(x: x)
        cache.addLast(x)
    }
    
    func addRecently(key: Int, value: Int) {
        let x = Node(key: key, value: value)
        cache.addLast(x)
        map[key] = x
    }
    
    func deleteKey(key: Int) {
        guard let x = map[key] else {
            return
        }
        cache.remove(x: x)
        map.removeValue(forKey: key)
    }
    
    func removeLeastRecently() {
        guard let deleteNode = cache.removeFirst() else {
            return
        }
        map.removeValue(forKey: deleteNode.key)
    }
}
