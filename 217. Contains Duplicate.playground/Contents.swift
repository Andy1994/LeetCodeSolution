class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var nums = nums.sorted()
        guard nums.count > 1 else {
            return false
        }
        for index in 0 ..< nums.count - 1 {
            if nums[index] == nums[index + 1] {
                return true
            }
        }
        return false
    }
}

print(Solution().containsDuplicate([1,2,3,4,5]))
