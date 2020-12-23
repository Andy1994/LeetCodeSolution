/*
 1302. Deepest Leaves Sum
 
 Given a binary tree, return the sum of values of its deepest leaves.
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
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var dict = [Int:[Int]]()
        traverse(root: root, dict: &dict, deep: 1)
        var maxDeep = 0
        dict.forEach { (obj) in
            if obj.key > maxDeep {
                maxDeep = obj.key
            }
        }
        return dict[maxDeep]!.reduce(0, +)
    }
}

extension Solution {
    func traverse(root: TreeNode?, dict: inout [Int:[Int]], deep: Int) {
        guard let root = root else {
            return
        }
        dict[deep] = (dict[deep] ?? []) + [root.val]
        traverse(root: root.left, dict: &dict, deep: deep + 1)
        traverse(root: root.right, dict: &dict, deep: deep + 1)
    }
}
