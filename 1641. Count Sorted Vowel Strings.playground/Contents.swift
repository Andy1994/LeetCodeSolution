/*
 1641. Count Sorted Vowel Strings
 
 Given an integer n, return the number of strings of length n that consist only of vowels (a, e, i, o, u) and are lexicographically sorted.

 A string s is lexicographically sorted if for all valid i, s[i] is the same as or comes before s[i+1] in the alphabet.
 */

class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        var dp = [1,1,1,1,1]
        for _ in 1 ..< n {
            dp[4] = dp[0] + dp[1] + dp[2] + dp[3] + dp[4]
            dp[3] = dp[0] + dp[1] + dp[2] + dp[3]
            dp[2] = dp[0] + dp[1] + dp[2]
            dp[1] = dp[0] + dp[1]
        }
        return dp.reduce(0, +)
    }
}

print(Solution().countVowelStrings(5))
