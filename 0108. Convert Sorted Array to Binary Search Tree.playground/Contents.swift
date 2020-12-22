/*
 108. Convert Sorted Array to Binary Search Tree
 
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else {
            return nil
        }
        return buildTree(nums, min: 0, max: nums.count)
    }
    
    func buildTree(_ nums: [Int], min: Int, max: Int) -> TreeNode? {
        guard min < max else {
            return nil
        }
        let mid = min + (max - min) / 2
        let root = TreeNode(nums[mid])
        root.left = buildTree(nums, min: min, max: mid)
        root.right = buildTree(nums, min: mid + 1, max: max)
        return root
    }
}

print(Solution().sortedArrayToBST([-10,-3,0,5,9]))
