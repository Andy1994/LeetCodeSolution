class Solution {
  
  func getRow(_ rowIndex: Int) -> [Int] {
    return generate(rowIndex + 1).last ?? []
  }
  
  func generate(_ numRows: Int) -> [[Int]] {
    var result = [[],[1],[1,1]]
    if numRows == 0 {
      return []
    } else if numRows == 1 {
      return [[1]]
    } else if numRows == 2 {
      return [[1],[1,1]]
    }
    for index in 3 ... numRows {
      var temp = [1]
      for i in 0 ..< result[index - 1].count {
        if i == result[index - 1].count - 1 {
          temp.append(1)
          break
        }
        temp.append(result[index - 1][i] + result[index - 1][i + 1])
      }
      result.append(temp)
    }
    result.removeFirst()
    return result
  }
}

print(Solution().getRow(3))
