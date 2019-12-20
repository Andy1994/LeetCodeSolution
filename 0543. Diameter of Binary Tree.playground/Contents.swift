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
  
  var result = 1
  
  func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    find(root)
    return result - 1
  }
  
  func find(_ root: TreeNode?) -> Int {
    if root == nil {
      return 0
    }
    let l = find(root?.left)
    let r = find(root?.right)
    result = max(result, l + r + 1)
    return max(l, r) + 1
  }
}

let t1 = TreeNode(1)
let t2 = TreeNode(2)
let t3 = TreeNode(3)
let t4 = TreeNode(4)
let t5 = TreeNode(5)
t1.left = t2
t1.right = t3
t2.left = t4
t2.right = t5

print(Solution().diameterOfBinaryTree(t1))
