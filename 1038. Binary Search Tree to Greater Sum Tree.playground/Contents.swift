/*
 1038. Binary Search Tree to Greater Sum Tree
 
 Given the root of a Binary Search Tree (BST), convert it to a Greater Tree such that every key of the original BST is changed to the original key plus sum of all keys greater than the original key in BST.
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
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        var add = 0
        traverse(root: root, add: &add)
        return root
    }
    
    func traverse(root: TreeNode?, add: inout Int) {
        guard let root = root else  {
            return
        }
        traverse(root: root.right, add: &add)
        add += root.val
        root.val = add
        traverse(root: root.left, add: &add)
    }
}
