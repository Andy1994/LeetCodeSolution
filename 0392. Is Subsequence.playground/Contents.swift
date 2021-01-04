/*
 392. Is Subsequence
 
 Given a string s and a string t, check if s is subsequence of t.

 A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, "ace" is a subsequence of "abcde" while "aec" is not).

 Follow up:
 If there are lots of incoming S, say S1, S2, ... , Sk where k >= 1B, and you want to check one by one to see if T has its subsequence. In this scenario, how would you change your code?
 */

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard !s.isEmpty else {
            return true
        }
        guard !t.isEmpty else {
            return false
        }
        guard s.count <= t.count else {
            return false
        }
        var dp = Array(repeating: Array(repeating: 0, count: t.count + 1), count: s.count + 1)
        let s1 = Array(s)
        let t1 = Array(t)
        for i in 1 ... s1.count {
            for j in i ... t1.count {
                if s1[i - 1] == t1[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
                }
            }
        }
        return dp[s1.count][t1.count] == s1.count
    }
}

print(Solution().isSubsequence("ahb", "ahbgdc"))
