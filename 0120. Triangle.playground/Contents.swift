/*
 120. Triangle
 
 Given a triangle array, return the minimum path sum from top to bottom.

 For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.
 */

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 1 else {
            return triangle[0].first!
        }
        var triangle = triangle
        for i in (0 ... triangle.count - 2).reversed() {
            for j in 0 ... triangle[i].count - 1 {
                triangle[i][j] += min(triangle[i + 1][j], triangle[i + 1][j + 1])
            }
        }
        return triangle[0][0]
    }
}

Solution().minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]])
