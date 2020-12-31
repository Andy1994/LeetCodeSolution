/*
 354. Russian Doll Envelopes
 
 You have a number of envelopes with widths and heights given as a pair of integers (w, h). One envelope can fit into another if and only if both the width and height of one envelope is greater than the width and height of the other envelope.

 What is the maximum number of envelopes can you Russian doll? (put one inside other)
 */

class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        let envelopes = envelopes.sorted { (obj1, obj2) -> Bool in
            if obj1[0] == obj2[0] {
                return obj1[1] > obj2[1]
            } else {
                return obj1[0] < obj2[0]
            }
        }
        return lengthOfLIS(envelopes.map { (obj) in
            return obj[1]
        })
    }
    
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 1, count: nums.count)
        for i in 0 ..< nums.count {
            for j in 0 ..< i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        var max = 0
        dp.forEach { (value) in
            if value > max {
                max = value
            }
        }
        return max
    }
}

print(Solution().maxEnvelopes([[4,5],[4,6],[6,7],[2,3],[1,1]]))
