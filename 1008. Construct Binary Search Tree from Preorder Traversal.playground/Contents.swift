/*
 1008. Construct Binary Search Tree from Preorder Traversal
 
 Return the root node of a binary search tree that matches the given preorder traversal.

 (Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)

 It's guaranteed that for the given test cases there is always possible to find a binary search tree with the given requirements.
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
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        return buildTree(preorder)
    }
    
    func buildTree(_ nums: [Int]) -> TreeNode? {
        var nums = nums
        guard !nums.isEmpty else {
            return nil
        }
        let value = nums.removeFirst()
        let t = TreeNode(value)
        t.left = buildTree(getLeft(nums, mid: value))
        t.right = buildTree(getRight(nums, mid: value))
        return t
    }
    
    func getLeft(_ nums: [Int], mid: Int) -> [Int] {
        return nums.filter { (num) -> Bool in
            return num < mid
        }
    }
    
    func getRight(_ nums: [Int], mid: Int) -> [Int] {
        return nums.filter { (num) -> Bool in
            return num > mid
        }
    }
}
