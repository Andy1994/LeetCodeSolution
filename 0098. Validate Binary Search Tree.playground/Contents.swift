/*
 98. Validate Binary Search Tree
 
 Given the root of a binary tree, determine if it is a valid binary search tree (BST).

 A valid BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
}

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, min: Int.min, max: Int.max)
    }
    
    func isValidBST(_ root: TreeNode?, min: Int, max: Int) -> Bool {
        guard let root = root else {
            return true
        }
        if root.val <= min || root.val >= max {
            return false
        }
        return isValidBST(root.left, min: min, max: root.val) && isValidBST(root.right, min: root.val, max: max)
    }
}
