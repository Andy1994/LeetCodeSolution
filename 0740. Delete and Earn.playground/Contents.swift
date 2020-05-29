/*
 740. Delete and Earn
 
 Given an array nums of integers, you can perform operations on the array.

 In each operation, you pick any nums[i] and delete it to earn nums[i] points. After, you must delete every element equal to nums[i] - 1 or nums[i] + 1.

 You start with 0 points. Return the maximum number of points you can earn by applying such operations.

 Example 1:

 Input: nums = [3, 4, 2]
 Output: 6
 Explanation:
 Delete 4 to earn 4 points, consequently 3 is also deleted.
 Then, delete 2 to earn 2 points. 6 total points are earned.
  

 Example 2:

 Input: nums = [2, 2, 3, 3, 3, 4]
 Output: 9
 Explanation:
 Delete 3 to earn 3 points, deleting both 2's and the 4.
 Then, delete 3 again to earn 3 points, and 3 again to earn 3 points.
 9 total points are earned.
 
 */

class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var a: [Int] = Array(repeating: 0, count: 10001)
        for i in 0 ..< nums.count {
            a[nums[i]] += nums[i]
        }
        var dp: [Int] = Array(repeating: 0, count: 10001)
        dp[1] = a[1]
        for i in 2 ..< a.count {
            dp[i] = max(dp[i - 1], dp[i - 2] + a[i])
        }
        return dp[dp.count - 1]
    }
}

print(Solution().deleteAndEarn([3,7,10,5,2,4,8,9,9,4,9,2,6,4,6,5,4,7,6,10]))
