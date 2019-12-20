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
  func maxDepth(_ root: TreeNode?) -> Int {
    guard root != nil else {
      return 0
    }
    let leftTree = maxDepth(root?.left)
    let rightTree = maxDepth(root?.right)
    return max(leftTree, rightTree) + 1
  }
}

let t1 = TreeNode(0)
let t2 = TreeNode(0)
let t3 = TreeNode(0)
let t4 = TreeNode(0)
t1.right = t2
t2.right = t3
t3.right = t4
print(Solution().maxDepth(t1))


