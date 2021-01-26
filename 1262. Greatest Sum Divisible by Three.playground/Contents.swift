/*
 1262. Greatest Sum Divisible by Three
 
 Given an array nums of integers, we need to find the maximum possible sum of elements of the array such that it is divisible by three.

 Example 1:

 Input: nums = [3,6,5,1,8]
 Output: 18
 Explanation: Pick numbers 3, 6, 1 and 8 their sum is 18 (maximum sum divisible by 3).
 */

class Solution {
    func maxSumDivThree(_ nums: [Int]) -> Int {
        var cache = Array(repeating: Array(repeating: 0, count: 3), count: nums.count + 1)
        cache[0][0] = 0
        cache[0][1] = Int.min
        cache[0][2] = Int.min
        for (index, num) in nums.enumerated() {
            let mod = num % 3
            if mod == 0 {
                cache[index + 1][0] = max(cache[index][0], cache[index][0] + num)
                cache[index + 1][1] = max(cache[index][1], cache[index][1] + num)
                cache[index + 1][2] = max(cache[index][2], cache[index][2] + num)
            } else if mod == 1 {
                cache[index + 1][0] = max(cache[index][0], cache[index][2] + num)
                cache[index + 1][1] = max(cache[index][1], cache[index][0] + num)
                cache[index + 1][2] = max(cache[index][2], cache[index][1] + num)
            } else if mod == 2 {
                cache[index + 1][0] = max(cache[index][0], cache[index][1] + num)
                cache[index + 1][1] = max(cache[index][1], cache[index][2] + num)
                cache[index + 1][2] = max(cache[index][2], cache[index][0] + num)
            }
        }
        return cache[nums.count][0]
    }
}

Solution().maxSumDivThree([3,6,5,1,8])
