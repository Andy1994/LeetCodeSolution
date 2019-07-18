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
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        return getLeaf(root1) == getLeaf(root2)
    }
    
    func getLeaf(_ root: TreeNode?) -> [Int] {
        if let root = root {
            if root.left == nil && root.right == nil {
                return [root.val]
            } else {
                return getLeaf(root.left) + getLeaf(root.right)
            }
        } else {
            return []
        }
    }
}
