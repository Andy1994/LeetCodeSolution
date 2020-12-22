/*
 95. Unique Binary Search Trees II
 
 Given an integer n, generate all structurally unique BST's (binary search trees) that store values 1 ... n.
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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n > 0 else {
            return []
        }
        return helper(1, n)
    }
    
    func helper(_ start: Int, _ end: Int) -> [TreeNode?] {
        guard start <= end else {
            return [nil]
        }
        var res = [TreeNode?]()
        for i in start ... end {
            let leftTrees = helper(start, i - 1)
            let rightTrees = helper(i + 1, end)
            for left in leftTrees {
                for right in rightTrees {
                    res.append(TreeNode(i, left, right))
                }
            }
        }
        return res
    }
}

print(Solution().generateTrees(3))
