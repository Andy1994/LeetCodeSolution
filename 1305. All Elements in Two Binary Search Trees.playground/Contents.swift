/*
 1305. All Elements in Two Binary Search Trees
 
 Given two binary search trees root1 and root2.

 Return a list containing all the integers from both trees sorted in ascending order.
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
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        return (getElements(root1) + getElements(root2)).sorted()
    }
    
    func getElements(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        return [root.val] + getElements(root.left) + getElements(root.right)
    }
}
