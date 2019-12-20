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
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        if let root = root {
            return isUnivalTree(root, root.val)
        } else {
            return true
        }
    }
    
    func isUnivalTree(_ root: TreeNode?, _ val: Int) -> Bool {
        if let root = root {
            if val == root.val && isUnivalTree(root.left, val) && isUnivalTree(root.right, val) {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
}
