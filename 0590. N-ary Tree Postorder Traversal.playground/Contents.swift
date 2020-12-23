/*
 590. N-ary Tree Postorder Traversal
 
 Given an n-ary tree, return the postorder traversal of its nodes' values.

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
    func postorder(_ root: Node?) -> [Int] {
        var res = [Int]()
        traverse(root: root, res: &res)
        return res
    }
    
    func traverse(root: Node?, res: inout [Int]) {
        guard let root = root else {
            return
        }
        for child in root.children {
            traverse(root: child, res: &res)
        }
        res.append(root.val)
    }
}
