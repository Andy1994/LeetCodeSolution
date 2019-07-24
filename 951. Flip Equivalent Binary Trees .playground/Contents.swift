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
    func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1 == nil && root2 == nil {
            return true
        } else if root1 == nil || root2 == nil {
            return false
        } else if root1!.val != root2!.val {
            return false
        } else {
            return (flipEquiv(root1!.left, root2!.right) && flipEquiv(root1!.right, root2!.left)) ||
             (flipEquiv(root1!.left, root2!.left) && flipEquiv(root1!.right, root2!.right))
        }
    }
}
