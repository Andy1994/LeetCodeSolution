/*
 513. Find Bottom Left Tree Value
 
 Given the root of a binary tree, return the leftmost value in the last row of the tree.
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
    
    var maxDeep = Int.min {
        didSet {
            leftValue = Int.min
        }
    }
    var leftValue = Int.min
    
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        traverse(root: root, deep: 0)
        return leftValue
    }
    
    func traverse(root: TreeNode?, deep: Int) {
        guard let root = root else  {
            return
        }
        if deep > maxDeep {
            maxDeep = deep
            leftValue = root.val
        }
        traverse(root: root.left, deep: deep + 1)
        traverse(root: root.right, deep: deep + 1)
    }
}
