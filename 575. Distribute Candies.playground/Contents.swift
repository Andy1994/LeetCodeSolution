class Solution {
  func distributeCandies(_ candies: [Int]) -> Int {
    var resultDict = [String:Int]()
    for num in candies {
      if resultDict[String(num)] == nil {
        resultDict[String(num)] = 1
      } else {
        resultDict[String(num)] = resultDict[String(num)]! + 1
      }
    }
    return min(resultDict.keys.count, candies.count / 2)
  }
}

print(Solution().distributeCandies([1,1,2,3]))
