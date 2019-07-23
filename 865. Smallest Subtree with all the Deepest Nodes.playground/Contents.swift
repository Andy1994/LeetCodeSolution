import UIKit

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
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        let (_, tree) = find(root)
        return tree
    }
    
    func find(_ root: TreeNode?) -> (Int, TreeNode?) {
        guard let root = root else {
            return (0, nil)
        }
        let (lDeep, lNode) = find(root.left)
        let (rDeep, rNode) = find(root.right)
        let maxDeep = max(lDeep, rDeep) + 1
        if lDeep == rDeep {
            return (maxDeep, root)
        } else if lDeep > rDeep {
            return (maxDeep, lNode)
        } else {
            return (maxDeep, rNode)
        }
    }
}
