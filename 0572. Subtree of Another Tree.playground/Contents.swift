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
  func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    let sStr = tree2str(s, true)
    let tStr = tree2str(t, true)
    if sStr.range(of: tStr) != nil {
      return true
    }
    return false
  }
  
  func tree2str(_ t: TreeNode?, _ left: Bool) -> String {
    if t == nil {
      if left {
        return "lnil"
      } else {
        return "rnil"
      }
    }
    return "#\(t?.val ?? 0) \(tree2str(t?.left, true)) \(tree2str(t?.right, false))"
  }
}

let t1 = TreeNode(3)
let t2 = TreeNode(4)
let t3 = TreeNode(5)
t1.left = t2
t1.right = t3

let t6 = TreeNode(3)
let t7 = TreeNode(4)
t6.left = t7

print(Solution().isSubtree(t1, t6))
