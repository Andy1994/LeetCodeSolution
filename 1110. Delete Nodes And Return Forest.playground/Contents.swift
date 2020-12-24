/*
 1110. Delete Nodes And Return Forest
 
 Given the root of a binary tree, each node in the tree has a distinct value.

 After deleting all nodes with a value in to_delete, we are left with a forest (a disjoint union of trees).

 Return the roots of the trees in the remaining forest.  You may return the result in any order.
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
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        guard let root = root else {
            return []
        }
        var res = [TreeNode?]()
        if to_delete.contains(root.val) {
            traverse(root: root, res: &res, deletes: to_delete, shouldAdd: true)
        } else {
            res.append(root)
            traverse(root: root, res: &res, deletes: to_delete, shouldAdd: false)
        }
        return res
    }
    
    func traverse(root: TreeNode?, res: inout [TreeNode?], deletes: [Int], shouldAdd: Bool) {
        guard let root = root else {
            return
        }
        if root.left != nil && deletes.contains(root.left?.val ?? 0) {
            traverse(root: root.left, res: &res, deletes: deletes, shouldAdd: true)
            root.left = nil
        } else {
            traverse(root: root.left, res: &res, deletes: deletes, shouldAdd: false)
        }
        if root.right != nil && deletes.contains(root.right?.val ?? 0) {
            traverse(root: root.right, res: &res, deletes: deletes, shouldAdd: true)
            root.right = nil
        } else {
            traverse(root: root.right, res: &res, deletes: deletes, shouldAdd: false)
        }
        if shouldAdd {
            if root.left != nil {
                res.append(root.left!)
            }
            if root.right != nil {
                res.append(root.right!)
            }
        }
    }
}
