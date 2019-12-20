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
  
  var resultArray = Array(repeating: [Int](), count: 1000)
  
  func averageOfLevels(_ root: TreeNode?) -> [Double] {
    find(root, 0)
    var result = [Double]()
    for array in resultArray {
      if array.count == 0 {
        break
      }
      var sum = 0
      for num in array {
        sum += num
      }
      result.append(Double(sum) / Double(array.count))
    }
    return result
  }
  
  func find(_ root: TreeNode?, _ deep: Int) {
    if root != nil {
      resultArray[deep].append(root!.val)
      find(root!.left, deep + 1)
      find(root!.right, deep + 1)
    }
  }
}

let t1 = TreeNode(3)
let t2 = TreeNode(9)
let t3 = TreeNode(20)
let t4 = TreeNode(15)
let t5 = TreeNode(7)
t1.left = t2
t1.right = t3
t3.left = t4
t3.right = t5

print(Solution().averageOfLevels(t1))
