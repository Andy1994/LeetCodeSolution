class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var n1 = 0, n2 = 0
        for index in 0 ..< cost.count {
            let n3 = cost[cost.count - 1 - index] + min(n1, n2)
            n2 = n1
            n1 = n3
        }
        return min(n1, n2)
    }
}

print(Solution().minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]))
