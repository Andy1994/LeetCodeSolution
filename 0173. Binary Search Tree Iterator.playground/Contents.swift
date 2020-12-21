/*
 173. Binary Search Tree Iterator
 
 Implement the BSTIterator class that represents an iterator over the in-order traversal of a binary search tree (BST):

 BSTIterator(TreeNode root) Initializes an object of the BSTIterator class. The root of the BST is given as part of the constructor. The pointer should be initialized to a non-existent number smaller than any element in the BST.
 boolean hasNext() Returns true if there exists a number in the traversal to the right of the pointer, otherwise returns false.
 int next() Moves the pointer to the right, then returns the number at the pointer.
 Notice that by initializing the pointer to a non-existent smallest number, the first call to next() will return the smallest element in the BST.

 You may assume that next() calls will always be valid. That is, there will be at least a next number in the in-order traversal when next() is called.
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

class BSTIterator {

    var cache = [TreeNode]()
    
    init(_ root: TreeNode?) {
        loadToCache(root)
    }
    
    func next() -> Int {
        let node = cache.removeLast()
        loadToCache(node.right)
        return node.val
    }
    
    func hasNext() -> Bool {
        return !cache.isEmpty
    }
    
    func loadToCache(_ root: TreeNode?) {
        var node = root
        while let current = node {
            cache.append(current)
            node = current.left
        }
    }
}

let b = BSTIterator(TreeNode(7, TreeNode(3), TreeNode(15)))
print(b.next())

