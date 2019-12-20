class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var maxValue = nums[0], minValue = nums[0], result = nums[0]
        for i in 1 ..< nums.count {
            let value1 = maxValue * nums[i]
            let value2 = minValue * nums[i]
            maxValue = max(max(value1, value2), nums[i])
            minValue = min(min(value1, value2), nums[i])
            result = max(result, maxValue)
        }
        return result
    }
}

print(Solution().maxProduct([2,3,-2,4]))
