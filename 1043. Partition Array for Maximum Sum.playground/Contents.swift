/*
 1043. Partition Array for Maximum Sum
 
 Given an integer array arr, you should partition the array into (contiguous) subarrays of length at most k. After partitioning, each subarray has their values changed to become the maximum value of that subarray.

 Return the largest sum of the given array after partitioning.
 
 Example 1:

 Input: arr = [1,15,7,9,2,5,10], k = 3
 Output: 84
 Explanation: arr becomes [15,15,15,9,10,10,10]
 */

class Solution {
    func maxSumAfterPartitioning(_ arr: [Int], _ k: Int) -> Int {
        // dp[i]: maximum sum of subarray arr[0: i] (i included) considering all possible k
        // runtime: O(kN) where N is arr.length
        // space: O(N)
        let len = arr.count
        var dp = Array(repeating: 0, count: len)
        dp[0] = arr[0]
        for i in 1 ..< len {
            var maxValue = arr[i]
            for j in 0 ..< k {
                if i >= j {
                    if arr[i-j] > maxValue {
                        maxValue = arr[i-j]
                    }
                    if i >= j + 1 {
                        dp[i] = max(dp[i], dp[i - j - 1] + maxValue * (j + 1))
                    } else {
                        dp[i] = max(dp[i], maxValue * (j + 1))
                    }
                }
            }
        }
        return dp[len - 1]
    }
}

Solution().maxSumAfterPartitioning([1,15,7,9,2,5,10], 3)
