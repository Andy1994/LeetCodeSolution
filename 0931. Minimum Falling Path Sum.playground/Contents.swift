/*
 931. Minimum Falling Path Sum
 
 Given a square array of integers A, we want the minimum sum of a falling path through A.

 A falling path starts at any element in the first row, and chooses one element from each row.  The next row's choice must be in a column that is different from the previous row's column by at most one.
 */

class Solution {
    func minFallingPathSum(_ A: [[Int]]) -> Int {
        var A = A
        let height = A.count
        let width = A[0].count
        if height > 1 {
            for i in 1 ..< height {
                for j in 0 ..< width {
                    var minSum = Int.max
                    if j - 1 >= 0 {
                        minSum = A[i-1][j-1] + A[i][j]
                    }
                    minSum = min(minSum, A[i-1][j] + A[i][j])
                    if j + 1 < width {
                        minSum = min(minSum, A[i-1][j+1] + A[i][j])
                    }
                    A[i][j] = minSum
                }
            }
        }
        var minSum = Int.max
        for i in 0 ..< width {
            minSum = min(minSum, A[height-1][i])
        }
        return minSum
    }
}
