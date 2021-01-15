/*
 64. Minimum Path Sum
 
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.

 Note: You can only move either down or right at any point in time.
 */

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var grid = grid
        let height = grid.count
        let width = grid[0].count
        // init
        if width > 1 {
            for i in 1 ..< width {
                grid[0][i] += grid[0][i-1]
            }
        }
        if height > 1 {
            for i in 1 ..< height {
                grid[i][0] += grid[i-1][0]
            }
        }
        // state transition
        if width > 1 && height > 1 {
            for i in 1 ..< height {
                for j in 1 ..< width {
                    grid[i][j] += min(grid[i-1][j], grid[i][j-1])
                }
            }
        }
        return grid[height-1][width-1]
    }
}

Solution().minPathSum([[1,3,1]])
