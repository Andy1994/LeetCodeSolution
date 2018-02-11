class Solution {
    
    var hadFindArray: [[Int]]!
    
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        hadFindArray = Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)
        var result = [Int]()
        for j in 0 ..< grid.count {
            for i in 0 ..< grid[0].count {
                if hadFindArray[j][i] == 0 {
                    result.append(findArea(grid, i, j))
                }
            }
        }
        return result.sorted().last ?? 0
    }
    
    func findArea(_ grid: [[Int]] , _ i: Int, _ j: Int) -> Int {
        guard i >= 0 && i < grid[0].count && j >= 0 && j < grid.count else {
            return 0
        }
        guard hadFindArray[j][i] == 0 else {
            return 0
        }
        hadFindArray[j][i] = 1
        var sum = 0
        if grid[j][i] == 1 {
            sum += 1
            sum += findArea(grid, i + 1, j)
            sum += findArea(grid, i - 1, j)
            sum += findArea(grid, i, j + 1)
            sum += findArea(grid, i, j - 1)
        }
        return sum
    }
}

print(Solution().maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],
                                  [0,0,0,0,0,0,0,1,1,1,0,0,0],
                                  [0,1,1,0,1,0,0,0,0,0,0,0,0],
                                  [0,1,0,0,1,1,0,0,1,0,1,0,0],
                                  [0,1,0,0,1,1,0,0,1,1,1,0,0],
                                  [0,0,0,0,0,0,0,0,0,0,1,0,0],
                                  [0,0,0,0,0,0,0,1,1,1,0,0,0],
                                  [0,0,0,0,0,0,0,1,1,0,0,0,0]]))
