/*
 1048. Longest String Chain
 
 Given a list of words, each word consists of English lowercase letters.

 Let's say word1 is a predecessor of word2 if and only if we can add exactly one letter anywhere in word1 to make it equal to word2.  For example, "abc" is a predecessor of "abac".

 A word chain is a sequence of words [word_1, word_2, ..., word_k] with k >= 1, where word_1 is a predecessor of word_2, word_2 is a predecessor of word_3, and so on.

 Return the longest possible length of a word chain with words chosen from the given list of words.
 
 Example 1:

 Input: words = ["a","b","ba","bca","bda","bdca"]
 Output: 4
 Explanation: One of the longest word chain is "a","ba","bda","bdca".
 */

class Solution {
    func longestStrChain(_ words: [String]) -> Int {
        let words = words.sorted { (s1, s2) -> Bool in
            return s1.count < s2.count
        }
        var dp = Array(repeating: 0, count: words.count)
        var res = 0
        for i in 1 ..< words.count {
            for j in 0 ..< i {
                if contains(words[i], words[j]) {
                    dp[i] = max(dp[i], dp[j]+1)
                    res = max(res, dp[i])
                }
            }
        }
        return res + 1
    }
    
    func contains(_ a: String, _ b: String) -> Bool {
        guard a.count == b.count + 1 else {
            return false
        }
        var i = 0, j = 0
        let a = Array(a)
        let b = Array(b)
        while i < a.count, j < b.count {
            if a[i] == b[j] {
                i += 1
                j += 1
            } else {
                i += 1
            }
        }
        return j == b.count
    }
}

Solution().longestStrChain(["a","b","ba","bca","bda","bdca"])
