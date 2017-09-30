class Solution {
  func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    for i in 0 ..< nums.count {
      result = result ^ nums[i]
    }
    return result
  }
}