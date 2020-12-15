/*
 450. Delete Node in a BST
 
 Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.

 Basically, the deletion can be divided into two stages:

 Search for a node to remove.
 If the node is found, delete the node.
 Follow up: Can you solve it with time complexity O(height of tree)?
 
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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if root.val == key {
            if root.left == nil {
                return root.right
            }
            if root.right == nil {
                return root.left
            }
            if let minNode = getMinNode(root.right) {
                root.val = minNode.val
                root.right = deleteNode(root.right, minNode.val)
            }
        } else if root.val > key {
            root.left = deleteNode(root.left, key)
        } else if root.val < key {
            root.right = deleteNode(root.right, key)
        }
        return root
    }
    
    func getMinNode(_ root: TreeNode?) -> TreeNode? {
        var root = root
        while root?.left != nil {
            root = root?.left
        }
        return root
    }
}


let node = TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(6, nil, TreeNode(7)))
print(Solution().deleteNode(node, 3)?.left?.val)
