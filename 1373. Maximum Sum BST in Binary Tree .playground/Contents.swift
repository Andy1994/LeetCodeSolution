/*
 1373. Maximum Sum BST in Binary Tree

 Given a binary tree root, the task is to return the maximum sum of all keys of any sub-tree which is also a Binary Search Tree (BST).

 Assume a BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
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

/*
 Find max sum BST is easy, but always time limit exceeded. So we can add cache to solve the problem, you'll find cache key is funny!
 */

class Solution {
    
    var cache = [String:Int]()
    
    func maxSumBST(_ root: TreeNode?) -> Int {
        var res = 0
        traverse(root: root, res: &res, deep: 0)
        return res
    }
    
    func traverse(root: TreeNode?, res: inout Int, deep: Int) {
        guard let root = root else  {
            return
        }
        let (isValid, sum) = isValidBST(root, deep: deep)
        if isValid {
            res = max(res, sum)
        }
        traverse(root: root.left, res: &res, deep: deep + 1)
        traverse(root: root.right, res: &res, deep: deep + 1)
    }

    func isValidBST(_ root: TreeNode?, deep: Int) -> (Bool, Int) {
        return isValidBST(root, min: Int.min, max: Int.max, deep: deep)
    }
    
    func isValidBST(_ root: TreeNode?, min: Int, max: Int, deep: Int) -> (Bool, Int) {
        guard let root = root else {
            return (true, 0)
        }
        if root.val <= min || root.val >= max {
            return (false, 0)
        }
        if let sum = cache[getKey(root, deep: deep)] {
            return (true, sum)
        }
        let (isLeftValid, leftSum) = isValidBST(root.left, min: min, max: root.val, deep: deep + 1)
        if !isLeftValid {
            return (false, 0)
        }
        let (isRightValid, rightSum) = isValidBST(root.right, min: root.val, max: max, deep: deep + 1)
        if !isRightValid {
            return (false, 0)
        }
        let sum = root.val + leftSum + rightSum
        cache[getKey(root, deep: deep)] = sum
        return (true, sum)
    }
    
    func getKey(_ root: TreeNode?, deep: Int) -> String {
        return "deep: \(deep), val: \(root?.val ?? -999999), left: \(root?.left?.val ?? -999999), right: \(root?.right?.val ?? -999999)"
    }
}
