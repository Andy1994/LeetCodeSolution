/*
 1277. Count Square Submatrices with All Ones
 
 Given a m * n matrix of ones and zeros, return how many square submatrices have all ones.
 */


class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        let height = matrix.count
        let width = matrix[0].count
        var dp = Array(repeating: Array(repeating: 0, count: width), count: height)
        for i in 0 ..< height {
            for j in 0 ..< width {
                if i == 0 || j == 0 {
                    dp[i][j] = matrix[i][j]
                } else if matrix[i][j] == 1 {
                    dp[i][j] = min(min(dp[i-1][j], dp[i][j-1]), dp[i-1][j-1]) + 1
                }
            }
        }
        var sum = 0
        for i in 0 ..< height {
            for j in 0 ..< width {
                sum += dp[i][j]
            }
        }
        return sum
    }
}

print(Solution().countSquares([
    [0,1,1,1],
    [1,1,1,1],
    [0,1,1,1]
  ]))
