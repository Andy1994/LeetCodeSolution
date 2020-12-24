/*
 1026. Maximum Difference Between Node and Ancestor
 
 Given the root of a binary tree, find the maximum value V for which there exist different nodes A and B where V = |A.val - B.val| and A is an ancestor of B.

 A node A is an ancestor of B if either: any child of A is equal to B, or any child of A is an ancestor of B.
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
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        var max = Int.min
        traverse(root: root, rootArray: [], max: &max)
        return max
    }
    
    func traverse(root: TreeNode?, rootArray: [Int], max: inout Int) {
        guard let root = root else  {
            return
        }
        for i in rootArray {
            if abs(root.val - i) > max {
                max = abs(root.val - i)
            }
        }
        traverse(root: root.left, rootArray: rootArray + [root.val], max: &max)
        traverse(root: root.right, rootArray: rootArray + [root.val], max: &max)
    }
}

