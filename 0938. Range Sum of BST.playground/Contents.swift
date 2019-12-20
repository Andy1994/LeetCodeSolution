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
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        if let root = root {
            if L > root.val {
                return rangeSumBST(root.right, L, R)
            } else if R < root.val {
                return rangeSumBST(root.left, L, R)
            } else {
                var sum = 0
                sum += rangeSumBST(root.left, L, R)
                sum += root.val
                sum += rangeSumBST(root.right, L, R)
                return sum
            }
        } else {
            return 0
        }
    }
}
