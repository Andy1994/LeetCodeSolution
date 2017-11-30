class Solution {
    func climbStairs(_ n: Int) -> Int {
        var a1 = 1
        var a2 = 2
        if n == 1 {
            return a1
        }
        if n == 2 {
            return a2
        }
        for _ in 3 ... n {
            let t = a1 + a2
            a1 = a2
            a2 = t
        }
        return a2
    }
}

print(Solution().climbStairs(4))
