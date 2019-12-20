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
  
  func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
    if root == nil {
      return 0
    }
    
    let res = totalPaths(root, sum)
    let left = pathSum(root!.left, sum)
    let right = pathSum(root!.right, sum)
    
    return res + left + right
  }
  
  func totalPaths(_ root: TreeNode?, _ sum: Int) -> Int {
    guard let root = root else {
      return 0
    }
    
    var res = 0
    if sum == root.val {
      res += 1
    }
    
    res += totalPaths(root.left, sum - root.val)
    res += totalPaths(root.right, sum - root.val)
    
    return res
  }
}

let t1 = TreeNode(10)
let t2 = TreeNode(5)
let t3 = TreeNode(-3)
let t4 = TreeNode(3)
let t5 = TreeNode(2)
let t6 = TreeNode(11)
let t7 = TreeNode(3)
let t8 = TreeNode(-2)
let t9 = TreeNode(1)
t1.left = t2
t1.right = t3
t3.right = t6
t2.left = t4
t2.right = t5
t4.left = t7
t4.right = t8
t5.right = t9

print(Solution().pathSum(t1, 8))




