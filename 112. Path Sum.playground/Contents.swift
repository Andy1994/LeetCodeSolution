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
  
  var nums = [Int]()
  
  func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
    if root == nil {
      return false
    }
    if root != nil && root?.left == nil && root?.right == nil {
      nums.append(root?.val ?? 0)
      var s = 0
      for num in nums {
        s += num
      }
      nums.removeLast()
      if s == sum {
        return true
      } else {
        return false
      }
    }
    nums.append(root?.val ?? 0)
    if hasPathSum(root?.left, sum) || hasPathSum(root?.right, sum) {
      return true
    }
    nums.removeLast()
    return false
  }
}

let t1 = TreeNode(1)
let t2 = TreeNode(2)
let t3 = TreeNode(3)
let t4 = TreeNode(4)
let t5 = TreeNode(5)
t1.left = t2
//t1.right = t3
//t2.left = t4
//t2.right = t5

print(Solution().hasPathSum(nil, 0))

