/*
 1314. Matrix Block Sum
 
 Given a m * n matrix mat and an integer K, return a matrix answer where each answer[i][j] is the sum of all elements mat[r][c] for i - K <= r <= i + K, j - K <= c <= j + K, and (r, c) is a valid position in the matrix.
 */

class Solution {
    func matrixBlockSum(_ mat: [[Int]], _ K: Int) -> [[Int]] {
        var sum = [[Int]]()
        let height = mat.count
        let width = mat[0].count
        for i in 0 ..< height {
            sum.append(mat[i])
        }
        for i in 0 ..< height {
            for j in 0 ..< width {
                sum[i][j] =
                    (i >= 1 ? sum[i - 1][j] : 0) + (j >= 1 ? sum[i][j - 1] : 0) - (i >= 1 && j >= 1 ? sum[i - 1][j - 1] : 0)
                        + mat[i][j]
            }
        }
        var res = Array(repeating: Array(repeating: 0, count: width), count: height)
        for i in 0 ..< height {
            for j in 0 ..< width {
                let r1 = i - K - 1; let r2 = min(i + K, height - 1); let c1 = j - K - 1; let c2 = min(j + K, width - 1);
                res[i][j] = sum[r2][c2] - (r1 < 0 ? 0 : sum[r1][c2]) - (c1 < 0 ? 0 : sum[r2][c1]) + (r1 < 0 || c1 < 0 ? 0
                    : sum[r1][c1])
            }
        }
        return res
    }
}

print(Solution().matrixBlockSum([[1,2,3],[4,5,6],[7,8,9]], 1))
