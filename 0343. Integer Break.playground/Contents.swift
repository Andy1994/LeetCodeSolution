/*
 343. Integer Break
 
 Given a positive integer n, break it into the sum of at least two positive integers and maximize the product of those integers. Return the maximum product you can get.
 */

class Solution {
    func integerBreak(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        for i in 2 ... n {
            var maxValue = 0
            for j in 1 ..< i {
                maxValue = max(maxValue, max(j * (i - j), j * dp[i - j]))
            }
            dp[i] = maxValue
        }
        return dp[n]
    }
}

Solution().integerBreak(10)
