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
  
  var result = [String]()
  var nums = [String]()
  
  func binaryTreePaths(_ root: TreeNode?) -> [String] {
    find(root)
    return result
  }
  
  func find(_ root: TreeNode?) {
    if root == nil {
      return
    }
    if root != nil && root?.left == nil && root?.right == nil {
      nums.append(String(root!.val))
      result.append(nums.joined(separator: "->"))
      nums.removeLast()
      return
    }
    nums.append(String(root!.val))
    find(root?.left)
    find(root?.right)
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

print(Solution().binaryTreePaths(t1))



