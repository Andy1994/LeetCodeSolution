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
  
  var result = [[Int]]()
  var nums = [Int]()
  
  func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
    find(root, sum)
    return result
  }
  
  func find(_ root: TreeNode?, _ sum: Int) {
    if root == nil {
      return
    }
    if root != nil && root?.left == nil && root?.right == nil {
      nums.append(root?.val ?? 0)
      var s = 0
      for num in nums {
        s += num
      }
      if s == sum {
        result.append(nums)
      }
      nums.removeLast()
      return
    }
    nums.append(root?.val ?? 0)
    find(root?.left, sum)
    find(root?.right, sum)
    nums.removeLast()
  }
}

let t1 = TreeNode(1)
let t2 = TreeNode(2)
let t3 = TreeNode(3)
let t4 = TreeNode(5)
let t5 = TreeNode(5)
t1.left = t2
t1.right = t3
t2.left = t4
t2.right = t5

print(Solution().pathSum(t1, 8))


