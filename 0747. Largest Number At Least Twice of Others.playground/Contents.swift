class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        var max = -1
        var maxIndex = -1
        var thirdMax = -1
        for index in 0 ..< nums.count {
            let num = nums[index]
            if num > thirdMax {
                if num > max {
                    thirdMax = max
                    max = num
                    maxIndex = index
                    continue
                }
                thirdMax = num
            }
        }
        if thirdMax == -1 || max >= 2 * thirdMax {
            return maxIndex
        }
        return -1
    }
}

print(Solution().dominantIndex([4]))
