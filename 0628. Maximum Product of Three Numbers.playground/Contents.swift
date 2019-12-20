class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        let value1 = nums[0] * nums[1] * nums[nums.count - 1]
        let value2 = nums[nums.count - 1] * nums[nums.count - 2] * nums[nums.count - 3]
        return max(value1, value2)
    }
}

print(Solution().maximumProduct([1,2,3,4]))
