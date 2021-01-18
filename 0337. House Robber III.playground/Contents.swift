/*
 337. House Robber III
 
 The thief has found himself a new place for his thievery again. There is only one entrance to this area, called the "root." Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that "all houses in this place forms a binary tree". It will automatically contact the police if two directly-linked houses were broken into on the same night.

 Determine the maximum amount of money the thief can rob tonight without alerting the police.
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
    func rob(_ root: TreeNode?) -> Int {
        let res = helper(root)
        return max(res[0], res[1])
    }
    
    func helper(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return [0, 0]
        }
        let left = helper(root.left)
        let right = helper(root.right)
        let rob = root.val + left[1] + right[1]
        let notRob = max(left[0], left[1]) + max(right[0], right[1])
        return [rob, notRob]
    }
}
