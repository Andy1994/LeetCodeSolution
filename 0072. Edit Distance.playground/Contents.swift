/*
 72. Edit Distance
 
 Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.

 You have the following three operations permitted on a word:

 Insert a character
 Delete a character
 Replace a character
 */

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let s1 = Array(word1)
        let s2 = Array(word2)
        var cache = [String:Int]()
        func dp(_ i: Int, _ j: Int) -> Int {
            if let value = cache["\(i),\(j)"] {
                return value
            }
            if i == -1 {
                return j + 1
            }
            if j == -1 {
                return i + 1
            }
            if s1[i] == s2[j] {
                cache["\(i),\(j)"] = dp(i - 1, j - 1)
            } else {
                cache["\(i),\(j)"] = min(min(dp(i, j - 1) + 1, dp(i - 1, j) + 1), dp(i - 1, j - 1) + 1)
            }
            return cache["\(i),\(j)"]!
        }
        return dp(s1.count - 1, s2.count - 1)
    }
}

print(Solution().minDistance("dinitrophenylhydrazine", "benzalphenylhydrazone"))
