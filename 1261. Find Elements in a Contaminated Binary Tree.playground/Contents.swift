/*
 1261. Find Elements in a Contaminated Binary Tree
 
 Given a binary tree with the following rules:

 root.val == 0
 If treeNode.val == x and treeNode.left != null, then treeNode.left.val == 2 * x + 1
 If treeNode.val == x and treeNode.right != null, then treeNode.right.val == 2 * x + 2
 Now the binary tree is contaminated, which means all treeNode.val have been changed to -1.

 You need to first recover the binary tree and then implement the FindElements class:

 FindElements(TreeNode* root) Initializes the object with a contamined binary tree, you need to recover it first.
 bool find(int target) Return if the target value exists in the recovered binary tree.
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) { self.val = val; self.left = left; self.right = right }
}

class FindElements {

    var cache = [Int:Bool]()
    
    init(_ root: TreeNode?) {
        root?.val = 0
        recover(root)
    }
    
    func find(_ target: Int) -> Bool {
        return cache[target] ?? false
    }
    
    func recover(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        cache[root.val] = true
        root.left?.val = 2 * root.val + 1
        root.right?.val = 2 * root.val + 2
        recover(root.left)
        recover(root.right)
    }
}
