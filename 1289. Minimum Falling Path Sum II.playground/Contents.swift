/*
 1289. Minimum Falling Path Sum II
 
 Given a square grid of integers arr, a falling path with non-zero shifts is a choice of exactly one element from each row of arr, such that no two elements chosen in adjacent rows are in the same column.

 Return the minimum sum of a falling path with non-zero shifts.
 */

class Solution {
    func minFallingPathSum(_ arr: [[Int]]) -> Int {
        var A = arr
        let height = A.count
        let width = A[0].count
        if height > 1 {
            for i in 1 ..< height {
                for j in 0 ..< width {
                    var minSum = Int.max
                    for k in 0 ..< width {
                        if j == k {
                            continue
                        }
                        minSum = min(minSum, A[i-1][k] + A[i][j])
                    }
                    A[i][j] = minSum
                }
            }
        }
        return A[height-1].min()!
    }
}

Solution().minFallingPathSum([[-73,61,43,-48,-36],[3,30,27,57,10],[96,-76,84,59,-15],[5,-49,76,31,-7],[97,91,61,-46,67]])
