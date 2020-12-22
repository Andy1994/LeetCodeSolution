/*
 235. Lowest Common Ancestor of a Binary Search Tree
 
 Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.

 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var array = [TreeNode]()
        traverse(root: root, p: p, q: q, array: &array)
        return array.last
    }
    
    func traverse(root: TreeNode?, p: TreeNode?, q: TreeNode?, array: inout [TreeNode]) {
        guard let root = root else  {
            return
        }
        if containsNode(root, node: p) && containsNode(root, node: q) {
            array.append(root)
        }
        traverse(root: root.left, p: p, q: q, array: &array)
        traverse(root: root.right, p: p, q: q, array: &array)
    }
    
    func containsNode(_ root: TreeNode?, node: TreeNode?) -> Bool {
        guard let root = root, let node = node else {
            return false
        }
        if root.val == node.val {
            return true
        } else {
            return containsNode(root.left, node: node) || containsNode(root.right, node: node)
        }
    }
}
