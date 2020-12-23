/*
 559. Maximum Depth of N-ary Tree
 
 Given a n-ary tree, find its maximum depth.

 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

 Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).
 */

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

class Solution {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else {
            return 0
        }
        var maxDepth = 1
        traverse(root: root, maxDepth: &maxDepth, currentDepth: 1)
        return maxDepth
    }
    
    func traverse(root: Node?, maxDepth: inout Int, currentDepth: Int) {
        guard let root = root else {
            return
        }
        for child in root.children {
            traverse(root: child, maxDepth: &maxDepth, currentDepth: currentDepth + 1)
        }
        maxDepth = max(maxDepth, currentDepth)
    }
}
