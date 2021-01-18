/*
 131. Palindrome Partitioning
 
 Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.

 A palindrome string is a string that reads the same backward as forward.
 */

import UIKit

class Solution {
    func partition(_ s: String) -> [[String]] {
        func dfs(_ result: inout [[String]], s: String, start: Int, currentList: inout [String], dp: inout [[Bool]]) {
            if start >= s.count {
                result.append(currentList)
            }
            let arr = Array(s)
            for end in start ..< s.count {
                if arr[start] == arr[end] && (end - start <= 2 || dp[start+1][end-1]) {
                    dp[start][end] = true
                    let temp = s.substring(with: Range(NSRange(location: start, length: end + 1 - start), in: s)!)
                    currentList.append(temp)
                    dfs(&result, s: s, start: end + 1, currentList: &currentList, dp: &dp)
                    currentList.remove(at: currentList.count - 1)
                }
            }
        }
        let len = s.count
        var dp = Array(repeating: Array(repeating: false, count: len), count: len)
        var result = [[String]]()
        var currentList = [String]()
        dfs(&result, s: s, start: 0, currentList: &currentList, dp: &dp)
        return result
    }
}
