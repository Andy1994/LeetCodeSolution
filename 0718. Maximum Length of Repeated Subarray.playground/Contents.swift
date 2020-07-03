/*
 Given two integer arrays A and B, return the maximum length of an subarray that appears in both arrays.

 Example 1:

 Input:
 A: [1,2,3,2,1]
 B: [3,2,1,4,7]
 Output: 3
 Explanation:
 The repeated subarray with maximum length is [3, 2, 1].
  

 Note:

 1 <= len(A), len(B) <= 1000
 0 <= A[i], B[i] < 100
 
 */

class Solution {
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        var dp: [[Int]] = []
        for _ in 0 ... A.count {
            dp.append(Array(repeating: 0, count: B.count + 1))
        }
        var res = 0
        for i in 1 ... A.count {
            for j in 1 ... B.count {
                if A[i - 1] == B[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                }
                res = max(dp[i][j], res)
            }
        }
        return res
    }
}

print(Solution().findLength([1,2,3,2,1], [3,2,1,4,7]))
