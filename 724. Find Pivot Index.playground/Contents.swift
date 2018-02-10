class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        var sum = 0, x = 0
        for num in nums {
            sum += num
        }
        for index in 0 ..< nums.count {
            if x == sum - x - nums[index] {
                return index
            }
            x += nums[index]
        }
        return -1
    }
}

print(Solution().pivotIndex([1, 7, 3, 6, 5, 6]))
