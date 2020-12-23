/*
 589. N-ary Tree Preorder Traversal
 
 Given an n-ary tree, return the preorder traversal of its nodes' values.

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
    func preorder(_ root: Node?) -> [Int] {
        var res = [Int]()
        traverse(root: root, res: &res)
        return res
    }
    
    func traverse(root: Node?, res: inout [Int]) {
        guard let root = root else {
            return
        }
        res.append(root.val)
        for child in root.children {
            traverse(root: child, res: &res)
        }
    }
}

