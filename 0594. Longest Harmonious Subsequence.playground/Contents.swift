class Solution {
  func findLHS(_ nums: [Int]) -> Int {
    var dict = [String:Int](), sum = 0
    for num in nums {
      if dict[String(num)] == nil {
        dict[String(num)] = 1
      } else {
        dict[String(num)] = dict[String(num)]! + 1
      }
    }
    for key in dict.keys {
      let num = Int(key)!
      if dict[String(num - 1)] != nil {
        if dict[String(num - 1)]! + dict[key]! > sum {
          sum = dict[String(num - 1)]! + dict[key]!
        }
      }
      if dict[String(num + 1)] != nil {
        if dict[String(num + 1)]! + dict[key]! > sum {
          sum = dict[String(num + 1)]! + dict[key]!
        }
      }
    }
    return sum
  }
}

print(Solution().findLHS([1,3,2,2,5,2,3,7]))
