/*
 222. Count Complete Tree Nodes
 
 Given a complete binary tree, count the number of nodes.

 Note:

 Definition of a complete binary tree from Wikipedia(https://en.wikipedia.org/wiki/Binary_tree#Types_of_binary_trees):
 In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.
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
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return 1 + countNodes(root.left) + countNodes(root.right)
    }
}
