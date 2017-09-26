class Solution {
  func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var n = 0
    for i in 0 ..< nums.count {
      if nums[i] != val {
        nums[n] = nums[i]
        n += 1
      }
    }
    return n
  }
}