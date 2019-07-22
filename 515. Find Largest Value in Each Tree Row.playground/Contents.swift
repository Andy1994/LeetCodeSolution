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
    func largestValues(_ root: TreeNode?) -> [Int] {
        var dict = [Int: [Int]]()
        traversing(root, 0, &dict)
        var result = [Int]()
        for key in dict.keys.sorted() {
            result.append(dict[key]!.max()!)
        }
        return result
    }
    
    func traversing(_ root: TreeNode?, _ deep: Int, _ dict: inout [Int: [Int]]) {
        guard let root = root else {
            return
        }
        if let array = dict[deep] {
            dict[deep] = array + [root.val]
        } else {
            dict[deep] = [root.val]
        }
        traversing(root.left, deep + 1, &dict)
        traversing(root.right, deep + 1, &dict)
    }
}

let node1 = TreeNode(1)
let node2 = TreeNode(3)
let node3 = TreeNode(2)
node1.left = node2
node1.right = node3
Solution().largestValues(node1)

