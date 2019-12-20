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
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        var root = root
        shouldDelete(&root)
        return root
    }
    
    @discardableResult
    func shouldDelete(_ root: inout TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        let left = shouldDelete(&root.left)
        if left {
            root.left = nil
        }
        let right = shouldDelete(&root.right)
        if right {
            root.right = nil
        }
        if left && right && root.val == 0 {
            return true
        } else {
            return false
        }
    }
}
