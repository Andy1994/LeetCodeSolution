/*
 583. Delete Operation for Two Strings
 
 Given two words word1 and word2, find the minimum number of steps required to make word1 and word2 the same, where in each step you can delete one character in either string.
 */

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let s1 = Array(word1)
        let s2 = Array(word2)
        var cache = Array(repeating: Array(repeating: 0, count: s2.count + 1), count: s1.count + 1)
        func dp(_ i: Int, _ j: Int) -> Int {
            if i == 0 || j == 0 {
                return 0
            }
            if cache[i][j] > 0 {
                return cache[i][j]
            }
            if s1[i - 1] == s2[j - 1] {
                cache[i][j] = dp(i - 1, j - 1) + 1
            } else {
                cache[i][j] = max(dp(i, j - 1), dp(i - 1, j))
            }
            return cache[i][j]
        }
        return s1.count + s2.count - 2 * dp(s1.count, s2.count)
    }
}

print(Solution().minDistance("sea", "eat"))
