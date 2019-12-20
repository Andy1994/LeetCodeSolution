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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        } else if p == nil || q == nil {
            return false
        }
        if p?.val ?? 0 == q?.val ?? 0 && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right) {
            return true
        } else {
            return false
        }
    }
}

let t1 = TreeNode(1)
let t2 = TreeNode(1)
let t3 = TreeNode(1)
let t4 = TreeNode(1)
let t5 = TreeNode(2)
t1.left = t3
t2.left = t4
t4.right = t5
t3.right = t5
print(Solution().isSameTree(t1, t2))
