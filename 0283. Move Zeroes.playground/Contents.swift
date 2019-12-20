class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var zeroCount = 0
        while nums.contains(0) {
            for index in 0 ..< nums.count {
                if nums[index] == 0 {
                    zeroCount += 1
                    nums.remove(at: index)
                    break
                }
            }
        }
        while zeroCount != 0 {
            zeroCount -= 1
            nums.append(0)
        }
    }
}

var nums = [0, 1, 0, 3, 12]
Solution().moveZeroes(&nums)
print(nums)
