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
  func isBalanced(_ root: TreeNode?) -> Bool {
    var depth = 0
    return isBalanced(root, depth: &depth)
  }
  
  private func isBalanced(_ root: TreeNode?, depth: inout Int) -> Bool {
    if root == nil {
      depth = 0
      return true
    }
    var left = 0
    var right = 0
    if isBalanced(root?.left, depth: &left) && isBalanced(root?.right, depth: &right) {
      let diff = left - right
      if diff <= 1 && diff >= -1 {
        depth = 1 + (left > right ? left : right)
        return true
      }
    }
    return false
  }
}

let t1 = TreeNode(1)
let t2 = TreeNode(2)
let t3 = TreeNode(3)
t1.left = t2
t2.left = t3
print(Solution().isBalanced(t1))