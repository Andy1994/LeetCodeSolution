/*
 429. N-ary Tree Level Order Traversal
 
 Given an n-ary tree, return the level order traversal of its nodes' values.

 Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).
 */

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) { self.val = val; self.children = []; }
}

class Solution {
    
    var cache = [Int:[Int]]()
    
    func levelOrder(_ root: Node?) -> [[Int]] {
        traverse(root: root, deep: 0)
        let sorted = cache.sorted { (obj1, obj2) -> Bool in
            return obj1.key < obj2.key
        }
        return sorted.map { (obj) in
            return obj.value
        }
    }
    
    func traverse(root: Node?, deep: Int) {
        guard let root = root else  {
            return
        }
        cache[deep] = (cache[deep] ?? []) + [root.val]
        for child in root.children {
            traverse(root: child, deep: deep + 1)
        }
    }
}

