/*
 673. Number of Longest Increasing Subsequence
 
 Given an integer array nums, return the number of longest increasing subsequences.

 Notice that the sequence has to be strictly increasing.
 */

class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        var dp: [[Int]] = Array(repeating: [1,1], count: nums.count)
        var totalMax = 1
        var totalCount = 1
        for i in 1 ..< nums.count {
            var currentMax = 1
            var currentCount = 1
            for j in 0 ..< i {
                if nums[i] > nums[j] {
                    let tempMax = dp[j][0] + 1
                    if (tempMax == currentMax) {
                        currentCount += dp[j][1]
                    } else if tempMax > currentMax {
                        currentMax = tempMax
                        currentCount = dp[j][1]
                    }
                }
            }
            dp[i][0] = currentMax
            dp[i][1] = currentCount
            if currentMax == totalMax {
                totalCount += currentCount
            } else if currentMax > totalMax {
                totalMax = currentMax
                totalCount = currentCount
            }
        }
        return totalCount
    }
}

print(Solution().findNumberOfLIS([1,2,4,3,5,4,7,2]))

