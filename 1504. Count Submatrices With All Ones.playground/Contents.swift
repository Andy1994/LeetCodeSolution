/*
 1504. Count Submatrices With All Ones
 
 Given a rows * columns matrix mat of ones and zeros, return how many submatrices have all ones.
 
 Example 1:

 Input: mat = [[1,0,1],
               [1,1,0],
               [1,1,0]]
 Output: 13
 Explanation:
 There are 6 rectangles of side 1x1.
 There are 2 rectangles of side 1x2.
 There are 3 rectangles of side 2x1.
 There is 1 rectangle of side 2x2.
 There is 1 rectangle of side 3x1.
 Total number of rectangles = 6 + 2 + 3 + 1 + 1 = 13.
 */

class Solution {
    func numSubmat(_ mat: [[Int]]) -> Int {
        var mat = mat
        let height = mat.count
        let width = mat[0].count
        for i in 0 ..< height {
            if width - 2 >= 0 {
                for j in 0 ... width - 2 {
                    let m = width - 2 - j
                    if mat[i][m] == 1 {
                        mat[i][m] = mat[i][m] + mat[i][m + 1]
                    }
                }
            }
        }
        var count = 0
        for i in 0 ..< height {
            for j in 0 ..< width {
                var min_width = mat[i][j]
                for k in i ..< height {
                    if mat[k][j] == 0 {
                        break
                    }
                    min_width = min(min_width, mat[k][j])
                    count += min_width
                }
            }
        }
        return count
    }
}

Solution().numSubmat([[0]])
