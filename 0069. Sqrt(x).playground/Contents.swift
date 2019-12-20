class Solution {
    func mySqrt(_ x: Int) -> Int {
        var y = Double(x)
        while abs(y * y - Double(x)) > 0.000001 {
            y = (y + Double(x) / y) / 2
        }
        return Int(y)
    }
}

print(Solution().mySqrt(9))
