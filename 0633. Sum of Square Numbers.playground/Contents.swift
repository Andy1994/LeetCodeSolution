import Foundation

class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        if c == 0 {
            return true
        }
        var i = Int(sqrt(Double(c)))
        while i > 0 {
            if i * i == c {
                return true
            }
            let d = c - i * i
            let e = Int(sqrt(Double(d)))
            if e * e == d {
                return true
            }
            i -= 1
        }
        return false
    }
}

print(Solution().judgeSquareSum(6))
