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
    
    var array = [Int]()
    var min = Int.max
    
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        traversal(root)
        let sortedArray = array.sorted(by: <)
        for index in 0 ..< sortedArray.count {
            let num = sortedArray[index]
            for index2 in index + 1 ..< sortedArray.count {
                let num2 = sortedArray[index2]
                if num2 - num < min {
                    min = num2 - num
                }
            }
        }
        return min
    }
    
    func traversal(_ root: TreeNode?) {
        if root == nil {
            return
        }
        traversal(root?.left)
        array.append(root!.val)
        traversal(root?.right)
    }
}

let tree1 = TreeNode(543)
let tree2 = TreeNode(348)
let tree3 = TreeNode(445)
let tree4 = TreeNode(652)
let tree5 = TreeNode(699)
tree1.left = tree2
tree1.right = tree4
tree4.right = tree5
tree2.right = tree3

print(Solution().getMinimumDifference(tree1));
