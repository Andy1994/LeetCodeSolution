/*
 516. Longest Palindromic Subsequence
 
 Given a string s, find the longest palindromic subsequence's length in s. You may assume that the maximum length of s is 1000.
 */

class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let a = Array(s)
        let n = a.count
        guard n >= 2 else {
            return n
        }
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in 0 ..< n {
            dp[i][i] = 1
        }
        for i in (0 ... n - 2).reversed() {
            for j in i + 1 ..< n {
                if a[i] == a[j] {
                    dp[i][j] = dp[i + 1][j - 1] + 2
                } else {
                    dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[0][n - 1]
    }
}
