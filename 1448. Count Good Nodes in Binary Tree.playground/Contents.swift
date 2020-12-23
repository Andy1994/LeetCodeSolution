/*
 1448. Count Good Nodes in Binary Tree
 
 Given a binary tree root, a node X in the tree is named good if in the path from root to X there are no nodes with a value greater than X.

 Return the number of good nodes in the binary tree.
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) { self.val = val; self.left = left; self.right = right }
}

class Solution {
    func goodNodes(_ root: TreeNode?) -> Int {
        var res = 0
        traverse(root: root, nodes: [], res: &res)
        return res
    }
    
    func traverse(root: TreeNode?, nodes: [Int], res: inout Int) {
        guard let root = root else  {
            return
        }
        let r = nodes.filter { (node) -> Bool in
            return node > root.val
        }
        if r.isEmpty {
            res += 1
        }
        traverse(root: root.left, nodes: nodes + [root.val], res: &res)
        traverse(root: root.right, nodes: nodes + [root.val], res: &res)
    }
}
