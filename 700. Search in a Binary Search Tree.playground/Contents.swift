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
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if let root = root {
            if root.val == val {
                return root
            } else {
                if let left = root.left, let result = searchBST(left, val) {
                    return result
                }
                if let right = root.right, let result = searchBST(right, val) {
                    return result
                }
                return nil
            }
        } else {
            return nil
        }
    }
}

let treeNode1 = TreeNode(1)
let treeNode2 = TreeNode(2)
let treeNode3 = TreeNode(3)
treeNode2.left = treeNode1
treeNode2.right = treeNode3

print(Solution().searchBST(treeNode2, 2)?.val)
