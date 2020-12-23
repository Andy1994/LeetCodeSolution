/*
 1315. Sum of Nodes with Even-Valued Grandparent
 
 Given a binary tree, return the sum of values of nodes with even-valued grandparent.  (A grandparent of a node is the parent of its parent, if it exists.)

 If there are no nodes with an even-valued grandparent, return 0.
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
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        var sum = 0
        traverse(root: root, sum: &sum)
        return sum
    }
    
    func traverse(root: TreeNode?, sum: inout Int) {
        guard let root = root else {
            return
        }
        if root.val % 2 == 0 {
            sum += root.left?.left?.val ?? 0
            sum += root.left?.right?.val ?? 0
            sum += root.right?.left?.val ?? 0
            sum += root.right?.right?.val ?? 0
        }
        traverse(root: root.left, sum: &sum)
        traverse(root: root.right, sum: &sum)
    }
}

let tree = TreeNode(1, TreeNode(2, TreeNode(2), nil), nil)
print(Solution().sumEvenGrandparent(tree))
