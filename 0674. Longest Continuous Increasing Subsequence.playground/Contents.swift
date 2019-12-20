class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var result = 1, tempMax = 1, currentNum = nums[0]
        for index in 1 ..< nums.count {
            let num = nums[index]
            if num > currentNum {
                currentNum = num
                tempMax += 1
                result = max(result, tempMax)
            } else if num <= currentNum {
                currentNum = num
                tempMax = 1
            }
        }
        return result
    }
}

print(Solution().findLengthOfLCIS([1,3,5,4,7]))
