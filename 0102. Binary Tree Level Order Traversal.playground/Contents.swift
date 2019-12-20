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
    
    var result = Array<[Int]>(repeating: [], count: 1000)
    var finalResult = [[Int]]()
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        traversal(root, 0)
        for numArray in result {
            if numArray != [] {
                finalResult.append(numArray)
            } else {
                break
            }
        }
        return finalResult
    }
    
    func traversal(_ root: TreeNode?, _ depth: Int) {
        if root == nil {
            return
        }
        traversal(root?.left, depth + 1)
        result[depth].append(root?.val ?? 0)
        traversal(root?.right, depth + 1)
    }
}

let t1 = TreeNode(3)
let t2 = TreeNode(9)
let t3 = TreeNode(20)
let t4 = TreeNode(15)
let t5 = TreeNode(17)
t1.left = t2
t1.right = t3
t3.left = t4
t3.right = t5

print(Solution().levelOrder(t1));
