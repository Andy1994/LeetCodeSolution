/*
 1457. Pseudo-Palindromic Paths in a Binary Tree
 
 Given a binary tree where node values are digits from 1 to 9. A path in the binary tree is said to be pseudo-palindromic if at least one permutation of the node values in the path is a palindrome.

 Return the number of pseudo-palindromic paths going from the root node to leaf nodes.
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
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        var temps = [[Int]]()
        traverse(root: root, rootArray: [], temps: &temps)
        var res = 0
        for temp in temps {
            if checkPalindrom(temp) {
                res += 1
            }
        }
        return res
    }
    
    func traverse(root: TreeNode?, rootArray: [Int], temps: inout [[Int]]) {
        guard let root = root else  {
            return
        }
        if root.left == nil && root.right == nil {
            temps.append(rootArray + [root.val])
            return
        }
        traverse(root: root.left, rootArray: rootArray + [root.val], temps: &temps)
        traverse(root: root.right, rootArray: rootArray + [root.val], temps: &temps)
    }
    
    func checkPalindrom(_ nums: [Int]) -> Bool {
        var isPalindrom = 0
        for i in 0 ... 9 {
            let temp = nums.filter { (num) -> Bool in
                return num == i
            }
            if temp.count % 2 == 1 {
                isPalindrom += 1
                if isPalindrom > 1 {
                    return false
                }
            }
        }
        return true
    }
}
