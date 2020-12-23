/*
 654. Maximum Binary Tree
 
 Given an integer array with no duplicates. A maximum tree building on this array is defined as follow:

 The root is the maximum number in the array.
 The left subtree is the maximum tree constructed from left part subarray divided by the maximum number.
 The right subtree is the maximum tree constructed from right part subarray divided by the maximum number.
 Construct the maximum tree by the given array and output the root node of this tree.
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
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return buildTree(nums, l: 0, r: nums.count)
    }
    
    func buildTree(_ nums: [Int], l: Int, r: Int) -> TreeNode? {
        guard l < r else {
            return nil
        }
        let maxI = maxIndex(nums, l: l, r: r)
        let t = TreeNode(nums[maxI])
        t.left = buildTree(nums, l: l, r: maxI)
        t.right = buildTree(nums, l: maxI + 1, r: r)
        return t
    }
    
    func maxIndex(_ nums: [Int], l: Int, r: Int) -> Int {
        var maxIndex = l
        for i in l ..< r {
            if nums[maxIndex] < nums[i] {
                maxIndex = i
            }
        }
        return maxIndex
    }
}
