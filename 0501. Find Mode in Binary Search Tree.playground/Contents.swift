/*
 501. Find Mode in Binary Search Tree
 
 Given a binary search tree (BST) with duplicates, find all the mode(s) (the most frequently occurred element) in the given BST.
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
    var cache = [Int:Int]()
    func findMode(_ root: TreeNode?) -> [Int] {
        traverse(root: root)
        var max = 0
        cache.forEach { (obj) in
            if obj.value > max {
                max = obj.value
            }
        }
        var res = [Int]()
        cache.forEach { (obj) in
            if obj.value == max {
                res.append(obj.key)
            }
        }
        return res
    }
    
    func traverse(root: TreeNode?) {
        guard let root = root else  {
            return
        }
        cache[root.val] = (cache[root.val] ?? 0) + 1
        traverse(root: root.left)
        traverse(root: root.right)
    }
}
