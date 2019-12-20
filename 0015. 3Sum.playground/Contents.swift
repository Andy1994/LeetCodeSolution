import UIKit
class Solution {
  func sum(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3 else {
      return []
    }
    var result = [[Int]]()
    for i in 0 ..< nums.count - 2 {
      for j in i + 1 ..< nums.count - 1 {
        for m in j + 1 ..< nums.count {
          if nums[m] == -nums[i] - nums[j] {
            var isExist = false
            let value = [nums[i], nums[j], nums[m]].sorted(by: <)
            for item in result {
              if item == value {
                isExist = true
              }
            }
            if !isExist {
              result.append(value)
            }
            break
          }
        }
      }
    }
    return result
  }
  
  func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3 else {
      return []
    }
    let array = nums.sorted(by: <)
    var result = [[Int]]()
    var dict = [String:Int]()
    for i in 0 ..< array.count - 2 {
      if dict["\(array[i])"] == nil {
        dict.updateValue(0, forKey: "\(array[i])")
        for j in i + 1 ..< array.count - 1 {
          for k in j + 1 ..< array.count {
            if array[i] == -array[j] - array[k] {
              var isExist = false
              let value = [array[i], array[j], array[k]]
              for item in result {
                if item == value {
                  isExist = true
                  break
                }
              }
              if !isExist {
                result.append(value)
              }
              break
            }
          }
        }
      }
    }
    return result
  }
}

print(Solution().threeSum([7,5,-8,-6,-13,7,10,1,1,-4,-14,0,-1,-10,1,-13,-4,6,-11,8,-6,0,0,-5,0,11,-9,8,2,-6,4,-14,6,4,-5,0,-12,12,-13,5,-6,10,-10,0,7,-2,-5,-12,12,-9,12,-9,6,-11,1,14,8,-1,7,-13,8,-11,-11,0,0,-1,-15,3,-11,9,-7,-10,4,-2,5,-4,12,7,-8,9,14,-11,7,5,-15,-15,-4,0,0,-11,3,-15,-15,7,0,0,13,-7,-12,9,9,-3,14,-1,2,5,2,-9,-3,1,7,-12,-3,-1,1,-2,0,12,5,7,8,-7,7,8,7,-15]))