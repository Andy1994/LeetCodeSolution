/*
 979. Distribute Coins in Binary Tree
 
 You are given the root of a binary tree with n nodes where each node in the tree has node.val coins and there are n coins total.

 In one move, we may choose two adjacent nodes and move one coin from one node to another. (A move may be from parent to child, or from child to parent.)

 Return the number of moves required to make every node have exactly one coin.
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
    
    var res = 0
    
    func distributeCoins(_ root: TreeNode?) -> Int {
        traverse(root: root)
        return res
    }
    
    func traverse(root: TreeNode?) -> Int {
        guard let root = root else  {
            return 0
        }
        let l = traverse(root: root.left)
        let r = traverse(root: root.right)
        res += abs(l) + abs(r)
        return root.val + l + r - 1
    }
}
