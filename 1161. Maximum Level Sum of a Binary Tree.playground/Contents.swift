/*
 1161. Maximum Level Sum of a Binary Tree
 
 Given the root of a binary tree, the level of its root is 1, the level of its children is 2, and so on.

 Return the smallest level X such that the sum of all the values of nodes at level X is maximal.
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
    
    var cache = [Int:[Int]]()
    
    func maxLevelSum(_ root: TreeNode?) -> Int {
        traverse(root: root, deep: 1)
        var dict = [Int:Int]()
        cache.forEach { (obj) in
            dict[obj.key] = obj.value.reduce(0, +)
        }
        var maxSum = Int.min
        var maxDeep = 0
        dict.forEach { (obj) in
            if obj.value > maxSum {
                maxSum = obj.value
                maxDeep = obj.key
            }
        }
        return maxDeep
    }
    
    func traverse(root: TreeNode?, deep: Int) {
        guard let root = root else  {
            return
        }
        cache[deep] = (cache[deep] ?? []) + [root.val]
        traverse(root: root.left, deep: deep + 1)
        traverse(root: root.right, deep: deep + 1)
    }
}

let t = TreeNode(-100, TreeNode(-200, TreeNode(-20), TreeNode(-5)), TreeNode(-300, TreeNode(-10), nil))
print(Solution().maxLevelSum(t))

