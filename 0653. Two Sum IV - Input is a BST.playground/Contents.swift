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
  
  var resultArray = [Int]()
  
  func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    if root != nil {
      if resultArray.contains(k - root!.val) {
        return true
      }
      resultArray.append(root!.val)
      if findTarget(root?.left, k) || findTarget(root?.right, k) {
        return true
      }
    }
    return false
  }
}

let t1 = TreeNode(5)
let t2 = TreeNode(3)
let t3 = TreeNode(2)
let t4 = TreeNode(4)
let t5 = TreeNode(6)
let t6 = TreeNode(7)
t1.left = t2
t1.right = t5
t2.left = t3
t2.right = t4
t5.right = t6

print(Solution().findTarget(t1, 5))
