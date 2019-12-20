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
  func tree2str(_ t: TreeNode?) -> String {
    if t == nil {
      return ""
    }
    if t?.left == nil && t?.right == nil {
      return "\(t!.val)"
    }
    if t?.right == nil {
      return "\(t!.val)" + "(" + tree2str(t?.left) + ")"
    }
    return "\(t!.val)" + "(" + tree2str(t?.left) + ")" + "(" + tree2str(t?.right) + ")"
  }
}

let t1 = TreeNode(1)
let t2 = TreeNode(2)
let t3 = TreeNode(3)
let t4 = TreeNode(4)
t1.left = t2
t1.right = t3
t2.right = t4
print(Solution().tree2str(t1))
