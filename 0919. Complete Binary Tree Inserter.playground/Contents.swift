/*
 919. Complete Binary Tree Inserter
 
 A complete binary tree is a binary tree in which every level, except possibly the last, is completely filled, and all nodes are as far left as possible.

 Write a data structure CBTInserter that is initialized with a complete binary tree and supports the following operations:

 CBTInserter(TreeNode root) initializes the data structure on a given tree with head node root;
 CBTInserter.insert(int v) will insert a TreeNode into the tree with value node.val = v so that the tree remains complete, and returns the value of the parent of the inserted TreeNode;
 CBTInserter.get_root() will return the head node of the tree.
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) { self.val = val; self.left = left; self.right = right }
}

class CBTInserter {

    var root: TreeNode?
    var deque = [TreeNode?]()
    
    init(_ root: TreeNode?) {
        self.root = root
        
        var queue = [TreeNode?]()
        queue.append(root)
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if node?.left == nil || node?.right == nil {
                deque.append(node)
            }
            if node?.left != nil {
                queue.append(node?.left)
            }
            if node?.right != nil {
                queue.append(node?.right)
            }
        }
    }
    
    func insert(_ v: Int) -> Int {
        guard let node = deque.first else {
            return -1
        }
        deque.append(TreeNode(v))
        if node?.left == nil {
            node?.left = deque.last ?? nil
        } else {
            node?.right = deque.last ?? nil
            deque.removeFirst()
        }
        return node?.val ?? -1
    }
    
    func get_root() -> TreeNode? {
        return root
    }
}

let tree = TreeNode(1)
let obj = CBTInserter(tree)
let ret_1: Int = obj.insert(2)
let ret_2: TreeNode? = obj.get_root()
