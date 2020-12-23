/*
 894. All Possible Full Binary Trees
 
 A full binary tree is a binary tree where each node has exactly 0 or 2 children.

 Return a list of all possible full binary trees with N nodes.  Each element of the answer is the root node of one possible tree.

 Each node of each tree in the answer must have node.val = 0.

 You may return the final list of trees in any order.
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) { self.val = val; self.left = left; self.right = right }
}

class Solution {
    func allPossibleFBT(_ N: Int) -> [TreeNode?] {
        if N == 0 {
            return []
        }
        if N == 1 {
            return [TreeNode(0)]
        }
        var res = [TreeNode?]()
        for i in 1 ..< N {
            if i % 2 == 0 {
                continue
            }
            let left = allPossibleFBT(i)
            let right = allPossibleFBT(N - i - 1)
            for l in 0 ..< left.count {
                for r in 0 ..< right.count {
                    let tree = TreeNode(0)
                    tree.left = left[l]
                    tree.right = right[r]
                    res.append(tree)
                }
            }
        }
        return res
    }
}
