import UIKit

class Solution {
    func countSubstrings(_ s: String) -> Int {
        if s == "" {
            return 0
        }
        var result = 0
        for i in 1 ... s.count {
            var location = 0
            while location + i <= s.count {
                let range = NSRange(location: location, length: i)
                if isPalindrome(s.substring(with: Range(range, in: s)!)) {
                    result += 1
                }
                location += 1
            }
        }
        return result
    }
    
    func isPalindrome(_ s: String) -> Bool {
        if s.count == 1 {
            return true
        }
        let chaArray = Array(s)
        for i in 0 ..< chaArray.count / 2 {
            if chaArray[i] != chaArray[chaArray.count - 1 - i] {
                return false
            }
        }
        return true
    }
}

print(Solution().countSubstrings("abc"))


