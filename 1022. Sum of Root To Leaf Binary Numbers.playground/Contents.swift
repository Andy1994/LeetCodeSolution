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
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        return getLeafString(root, value: []).map { (num) in
            return binTodec(number: num)
        }.reduce(0, +)
    }
    
    func getLeafString(_ root: TreeNode?, value: [Int]) -> [String] {
        guard let root = root else {
            return []
        }
        if root.left == nil && root.right == nil {
            return [(value + [root.val]).map{ String($0) }.joined()]
        } else {
            return getLeafString(root.left, value: value + [root.val]) + getLeafString(root.right, value: value + [root.val])
        }
    }
    
    func binTodec(number num: String) -> Int {
        var sum: Int = 0
        for c in num {
            let str = String(c)
            sum = sum * 2 + Int(str)!
        }
        return sum
    }
}

let node1 = TreeNode(1)
let node2 = TreeNode(0)
let node3 = TreeNode(0)
let node4 = TreeNode(1)
node1.left = node2
node2.left = node3
node2.right = node4
Solution().sumRootToLeaf(node1)
