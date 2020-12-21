/*
 783. Minimum Distance Between BST Nodes
 
 Given a Binary Search Tree (BST) with the root node root, return the minimum difference between the values of any two different nodes in the tree.
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
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var array = [Int]()
        traverse(root: root, array: &array)
        array = array.sorted()
        guard array.count > 1 else {
            return -1
        }
        var res = Int.max
        for i in 1 ..< array.count {
            res = min(res, abs(array[i] - array[i - 1]))
        }
        return res
    }
    
    func traverse(root: TreeNode?, array: inout [Int]) {
        guard let root = root else  {
            return
        }
        array.append(root.val)
        traverse(root: root.left, array: &array)
        traverse(root: root.right, array: &array)
    }
}

let tree = TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(6))
print(Solution().minDiffInBST(tree))
