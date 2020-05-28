/*
 5. Longest Palindromic Substring
 
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

 Example 1:
 Input: "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 
 Example 2:
 Input: "cbbd"
 Output: "bb"
 
 */

import UIKit

class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard !s.isEmpty else {
            return ""
        }
        // 保存起始位置，测试了用数组似乎能比全局变量稍快一点
        var range = [0, 0]
        let str = Array(s)
        for var i in 0 ..< s.count {
            // 把回文看成中间的部分全是同一字符，左右部分相对称
            // 找到下一个与当前字符不同的字符
            i = findLongest(str: str, low: i, range: &range)
        }
        return (s as NSString).substring(with: NSRange(location: range[0], length: range[1] - range[0] + 1))
    }
    
    func findLongest(str: [Character], low: Int, range: inout [Int]) -> Int {
        var low = low
        var high = low
        // 查找中间部分
        while high < str.count - 1 && str[high + 1] == str[low] {
            high += 1
        }
        // 定位中间部分的最后一个字符
        let ans = high
        // 从中间向左右扩散
        while low > 0 && high < str.count - 1 && str[low - 1] == str[high + 1] {
            low -= 1
            high += 1
        }
        // 记录最大长度
        if high - low > range[1] - range[0] {
            range[0] = low
            range[1] = high
        }
        return ans
    }
}

print(Solution().longestPalindrome("babbad"))
