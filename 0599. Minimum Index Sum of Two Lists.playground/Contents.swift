class Solution {
  func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
    var resultDict = [String:Int](), leastIndex = Int.max, result = [String]()
    for index1 in 0 ..< list1.count {
      for index2 in 0 ..< list2.count {
        if list1[index1] == list2[index2] {
          if resultDict[list1[index1]] == nil {
            resultDict[list1[index1]] = index1 + index2
            break
          }
        }
      }
    }
    for key in resultDict.keys {
      if leastIndex > resultDict[key]! {
        leastIndex = resultDict[key]!
      }
    }
    for key in resultDict.keys {
      if resultDict[key] == leastIndex {
        result.append(key)
      }
    }
    return result
  }
}

print(Solution().findRestaurant(["Shogun", "Tapioca Express", "Burger King", "KFC"], ["KFC", "Shogun", "Burger King", "Tapioca Express"]))
