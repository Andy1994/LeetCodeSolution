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
  
  func findSecondMinimumValue(_ root: TreeNode?) -> Int {
    var min = root?.val ?? 0
    var result = Int.max
    find(root)
    for num in resultArray {
      if min < num && num < result {
        result = num
      }
    }
    return result < Int.max ? result : -1
  }
  
  func find(_ root: TreeNode?) {
    if root != nil {
      resultArray.append(root!.val)
      find(root!.left)
      find(root!.right)
    }
  }
}

let t1 = TreeNode(5)
let t2 = TreeNode(5)
let t3 = TreeNode(6)
t1.left = t2
t1.right = t3

print(Solution().findSecondMinimumValue(t1))
