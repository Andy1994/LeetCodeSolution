/*
 99. Recover Binary Search Tree
 
 You are given the root of a binary search tree (BST), where exactly two nodes of the tree were swapped by mistake. Recover the tree without changing its structure.

 Follow up: A solution using O(n) space is pretty straight forward. Could you devise a constant space solution?
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
    func recoverTree(_ root: TreeNode?) {
        var prev: TreeNode?, firstNode: TreeNode?, secondNode: TreeNode?
        traverseTree(root, prev: &prev, firstNode: &firstNode, secondNode: &secondNode)
        let tem = firstNode?.val
        firstNode?.val = secondNode?.val ?? 0
        secondNode?.val = tem ?? 0
    }
    
    func traverseTree(_ root: TreeNode?, prev: inout TreeNode?, firstNode: inout TreeNode?, secondNode: inout TreeNode?) {
        guard let root = root else {
            return
        }
        
        traverseTree(root.left, prev: &prev, firstNode: &firstNode, secondNode: &secondNode)
        
        if let prev = prev, root.val < prev.val {
            secondNode = root
            
            if firstNode == nil {
                firstNode = prev
            } else {
                return
            }
        }
        
        prev = root
        
        traverseTree(root.right, prev: &prev, firstNode: &firstNode, secondNode: &secondNode)
    }
}
