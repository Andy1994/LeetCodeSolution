class Solution {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        var result = 0
        var nums = nums
        find(&nums, S, &result, 0)
        return result
    }
    
    private func find(_ nums: inout [Int], _ sum: Int, _ result: inout Int, _ index: Int) {
        if nums.reduce(0, +) == sum {
            result += 1
        }
        for i in index ..< nums.count {
            nums[i] = -nums[i]
            find(&nums, sum, &result, i + 1)
            nums[i] = -nums[i]
        }
    }
}

print(Solution().findTargetSumWays([0, 0], 0))
