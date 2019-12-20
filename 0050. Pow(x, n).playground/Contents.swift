class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var x = x
        var n = n
        if n == 0 {
            return 1
        }
        if n < 0 {
            n = -n
            x = 1 / x
        }
        return n % 2 == 0 ? pow(x * x, Double(n / 2)) : x * pow(x * x, Double(n / 2))
    }
}

