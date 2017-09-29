class Solution {
  func maxSubArray(_ nums: [Int]) -> Int {
    var maxLeft = nums[0]
    var result = nums[0]
    for i in 1 ..< nums.count {
      maxLeft = max(maxLeft + nums[i], nums[i])
      result = max(result, maxLeft)
    }
    return result
  }
}
