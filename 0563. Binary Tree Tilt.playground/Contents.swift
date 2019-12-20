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
  
  var result = 0
  
  func findTilt(_ root: TreeNode?) -> Int {
    find(root)
    return result
  }
  
  func find(_ root: TreeNode?) -> Int {
    if root == nil {
      return 0
    }
    let left = find(root?.left)
    let right = find(root?.right)
    result += abs(left - right)
    return left + right + root!.val
  }
}

let t1 = TreeNode(1)
let t2 = TreeNode(2)
let t3 = TreeNode(3)
t1.left = t2
t1.right = t3

print(Solution().findTilt(t1))
