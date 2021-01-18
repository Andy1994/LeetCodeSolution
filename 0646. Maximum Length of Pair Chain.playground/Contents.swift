/*
 646. Maximum Length of Pair Chain
 
 You are given n pairs of numbers. In every pair, the first number is always smaller than the second number.

 Now, we define a pair (c, d) can follow another pair (a, b) if and only if b < c. Chain of pairs can be formed in this fashion.

 Given a set of pairs, find the length longest chain which can be formed. You needn't use up all the given pairs. You can select pairs in any order.
 */

class Solution {
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        let pairs = pairs.sorted { (obj1, obj2) in
            return obj1[0] < obj2[0]
        }
        var dp = Array(repeating: 1, count: pairs.count)
        for i in 1 ..< pairs.count {
            for j in 0 ..< i {
                if pairs[j][1] < pairs[i][0] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        return dp.max()!
    }
}
