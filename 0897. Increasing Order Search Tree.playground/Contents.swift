/*
 897. Increasing Order Search Tree
 
 Given the root of a binary search tree, rearrange the tree in in-order so that the leftmost node in the tree is now the root of the tree, and every node has no left child and only one right child.
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
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        var res: TreeNode?
        var currrnt: TreeNode?
        traverse(root: root, res: &res, currrnt: &currrnt)
        return res
    }
}

extension Solution {
    func traverse(root: TreeNode?, res: inout TreeNode?, currrnt: inout TreeNode?) {
        guard let root = root else  {
            return
        }
        traverse(root: root.left, res: &res, currrnt: &currrnt)
        if currrnt == nil {
            res = TreeNode(root.val)
            currrnt = res
        } else {
            currrnt?.right = TreeNode(root.val)
            currrnt = currrnt?.right
        }
        traverse(root: root.right, res: &res, currrnt: &currrnt)
    }
}
