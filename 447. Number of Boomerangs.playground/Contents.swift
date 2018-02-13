class Solution {
  func numberOfBoomerangs(_ points: [[Int]]) -> Int {
    var num = 0
    for (i, point) in points.enumerated() {
      var dict = [Int: Int]()
      for (j, anotherpoint) in points.enumerated() {
        if i == j {
          continue
        }
        
        let distance = (anotherpoint[0] - point[0]) * (anotherpoint[0] - point[0])  + (anotherpoint[1] - point[1]) * (anotherpoint[1] - point[1])
        
        if let sameDistancePoints = dict[distance] {
          dict[distance] = sameDistancePoints + 1
        } else {
          dict[distance] = 1
        }
      }
      
      for key in dict.keys {
        num += dict[key]! * (dict[key]! - 1)
      }
    }
    return num
  }
}

print(Solution().numberOfBoomerangs([[0,0],[1,0],[2,0]]))
