class Solution {
  func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var map = [[Int]]()
    for i in 0 ..< m {
      map.append(Array(repeating: 0, count: n))
      map[i][0] = 1
    }
    for i in 0 ..< n {
      map[0][i] = 1
    }
    for i in 1 ..< m {
      for j in 1 ..< n {
        map[i][j] = map[i - 1][j] + map[i][j - 1]
      }
    }
    return map[m - 1][n - 1]
  }
}

print(Solution().uniquePaths(5, 4))