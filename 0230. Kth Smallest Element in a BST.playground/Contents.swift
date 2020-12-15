 /*
  230. Kth Smallest Element in a BST
  
  Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.
  */
 public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init() { self.val = 0; self.left = nil; self.right = nil; }
      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
          self.val = val
          self.left = left
          self.right = right
      }
}
 
class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var data = [Int]()
        traverse(root: root, data: &data)
        data = data.sorted()
        return data[k-1]
    }
    
    func traverse(root: TreeNode?, data: inout [Int]) {
        guard let root = root else  {
            return
        }
        data.append(root.val)
        traverse(root: root.left, data: &data)
        traverse(root: root.right, data: &data)
    }
}
