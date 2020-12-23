/*
 1325. Delete Leaves With a Given Value

 Given a binary tree root and an integer target, delete all the leaf nodes with value target.

 Note that once you delete a leaf node with value target, if it's parent node becomes a leaf node and has the value target, it should also be deleted (you need to continue doing that until you can't).
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
    func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        return delete(root, target)
    }
    
    func delete(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        root.left = delete(root.left, target)
        root.right = delete(root.right, target)
        if root.val == target && root.right == nil && root.left == nil {
            return nil
        } else {
            return root
        }
    }
}
