/*
 460. LFU Cache
 
 Design and implement a data structure for Least Frequently Used (LFU) cache.

 Implement the LFUCache class:

 LFUCache(int capacity) Initializes the object with the capacity of the data structure.
 int get(int key) Gets the value of the key if the key exists in the cache. Otherwise, returns -1.
 void put(int key, int value) Sets or inserts the value if the key is not already present. When the cache reaches its capacity, it should invalidate the least frequently used item before inserting a new item. For this problem, when there is a tie (i.e., two or more keys with the same frequency), the least recently used key would be evicted.
 Notice that the number of times an item is used is the number of calls to the get and put functions for that item since it was inserted. This number is set to zero when the item is removed.
 
 */

class LFUCache {

    var keyToVal = [Int:Int]()
    var keyToFreq = [Int:Int]()
    var freqToKeys = [Int:[Int]]()
    var minFreq: Int = 0
    var capacity: Int!
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if !keyToVal.contains(where: { (obj) -> Bool in
            return obj.key == key
        }) {
            return -1
        }
        increaseFreq(key)
        return keyToVal[key]!
    }
    
    func put(_ key: Int, _ value: Int) {
        guard capacity > 0 else {
            return
        }
        
        if keyToVal.contains(where: { (obj) -> Bool in
            return obj.key == key
        }) {
            keyToVal[key] = value
            increaseFreq(key)
            return
        }
        
        if capacity <= keyToVal.count {
            removeMinFreqKey()
        }
        
        keyToVal[key] = value
        keyToFreq[key] = 1
        var set = freqToKeys[1] ?? [Int]()
        set.append(key)
        freqToKeys[1] = set
        minFreq = 1
    }
    
    func increaseFreq(_ key: Int) {
        let freq = keyToFreq[key]!
        keyToFreq[key] = freq + 1
        
        if var array = freqToKeys[freq] {
            if let index = array.firstIndex(of: key) {
                array.remove(at: index)
            }
            freqToKeys[freq] = array
        }
        
        var set = freqToKeys[freq + 1] ?? [Int]()
        set.append(key)
        freqToKeys[freq + 1] = set
        
        let set2 = freqToKeys[freq] ?? [Int]()
        if set2.isEmpty {
            freqToKeys.removeValue(forKey: freq)
            if freq == minFreq {
                minFreq += 1
            }
        }
    }
    
    func removeMinFreqKey() {
        var keyList = freqToKeys[minFreq]!
        guard let deleteKey = keyList.first else {
            return
        }
        keyList.removeFirst()
        freqToKeys[minFreq] = keyList
        if keyList.isEmpty {
            freqToKeys.removeValue(forKey: minFreq)
        }
        keyToVal.removeValue(forKey: deleteKey)
        keyToFreq.removeValue(forKey: deleteKey)
    }
}

let c = LFUCache(3)
c.put(1, 1)
c.put(2, 2)
c.put(3, 3)
c.put(4, 4)
c.get(4)
c.get(3)
c.get(2)
c.get(1)
c.put(5, 5)
c.get(1)
c.get(2)
c.get(3)
c.get(4)
c.get(5)


