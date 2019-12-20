public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    
    var array = [Int]()
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        traversal(root)
        return array
    }
    
    func traversal(_ root: TreeNode?) {
        if root == nil {
            return
        }
        traversal(root?.left)
        array.append(root!.val)
        traversal(root?.right)
    }
}

let tree1 = TreeNode(1)
let tree2 = TreeNode(2)
let tree3 = TreeNode(3)
tree1.right = tree2
tree2.left = tree3

print(Solution().inorderTraversal(tree1));

