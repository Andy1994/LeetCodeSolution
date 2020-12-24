/*
 508. Most Frequent Subtree Sum
 
 Given the root of a tree, you are asked to find the most frequent subtree sum. The subtree sum of a node is defined as the sum of all the node values formed by the subtree rooted at that node (including the node itself). So what is the most frequent subtree sum value? If there is a tie, return all the values with the highest frequency in any order.
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
    
    var cache = [Int:Int]()
    
    func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
        
        let sum = traverse(root: root)
        cache[sum] = (cache[sum] ?? 0) + 1
        
        var maxFrequent = Int.min
        for obj in cache {
            if obj.value > maxFrequent {
                maxFrequent = obj.value
            }
        }
        var res = [Int]()
        for obj in cache {
            if obj.value == maxFrequent {
                res.append(obj.key)
            }
        }
        return res
    }
    
    func traverse(root: TreeNode?) -> Int {
        guard let root = root else  {
            return 0
        }
        let left = traverse(root: root.left)
        let right = traverse(root: root.right)
        let sum = root.val + left + right
        cache[sum] = (cache[sum] ?? 0) + 1
        return sum
    }
}
