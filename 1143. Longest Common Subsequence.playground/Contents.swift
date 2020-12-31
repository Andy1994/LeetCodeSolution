/*
 1143. Longest Common Subsequence
 
 Given two strings text1 and text2, return the length of their longest common subsequence.

 A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.
 
 If there is no common subsequence, return 0.
 */

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let array1 = Array(text1)
        let array2 = Array(text2)
        var dp = Array(repeating: Array(repeating: 0, count: array2.count + 1), count: array1.count + 1)
        guard text1.count > 0 && text2.count > 0 else {
            return 0
        }
        for i in 1 ... array1.count {
            for j in 1 ... array2.count {
                if array1[i - 1] == array2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
                }
            }
        }
        var res = Int.min
        for i in 0 ... array1.count {
            for j in 0 ... array2.count {
                res = max(dp[i][j], res)
            }
        }
        return res
    }
}

print(Solution().longestCommonSubsequence("abcde", "ace"))
