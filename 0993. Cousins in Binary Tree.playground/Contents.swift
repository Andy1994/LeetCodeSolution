/*
 993. Cousins in Binary Tree
 
 In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.

 Two nodes of a binary tree are cousins if they have the same depth, but have different parents.

 We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.

 Return true if and only if the nodes corresponding to the values x and y are cousins.
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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root = root else {
            return false
        }
        var xDeep = -1
        var yDeep = -1
        traverse(root: root, value: x, deep: &xDeep, currentDeep: 1)
        traverse(root: root, value: y, deep: &yDeep, currentDeep: 1)
        if xDeep != yDeep {
            return false
        }
        return !isSameFather(root, x, y)
    }
    
    func traverse(root: TreeNode?, value: Int, deep: inout Int, currentDeep: Int) {
        guard let root = root else  {
            return
        }
        if root.val == value {
            deep = currentDeep
            return
        }
        traverse(root: root.left, value: value, deep: &deep, currentDeep: currentDeep + 1)
        traverse(root: root.right, value: value, deep: &deep, currentDeep: currentDeep + 1)
    }
    
    func isSameFather(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root = root else {
            return false
        }
        var xFather: TreeNode?
        getFather(root, value: x, father: &xFather, currentFather: nil)
        var yFather: TreeNode?
        getFather(root, value: y, father: &yFather, currentFather: nil)
        return xFather?.val == yFather?.val
    }
    
    func getFather(_ root: TreeNode?, value: Int, father: inout TreeNode?, currentFather: TreeNode?) {
        guard let root = root else {
            return
        }
        if root.val == value {
            father = currentFather
            return
        }
        getFather(root.left, value: value, father: &father, currentFather: root)
        getFather(root.right, value: value, father: &father, currentFather: root)
    }
}

let tree = TreeNode(1, TreeNode(2, nil, TreeNode(4)), TreeNode(3, nil, TreeNode(5)))
print(Solution().isCousins(tree, 5, 4))
