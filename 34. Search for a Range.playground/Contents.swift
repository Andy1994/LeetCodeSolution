class Solution {
  func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    var range = [nums.count, -1]
    searchRange(nums, target: target, left: 0, right: nums.count - 1, range: &range)
    if range[0] > range[1] {
      range[0] = -1
    }
    return range
  }
  
  private func searchRange(_ nums: [Int], target: Int, left: Int, right: Int, range: inout [Int]) {
    if left > right {
      return
    }
    let mid = left + (right - left) / 2
    if nums[mid] == target {
      if mid < range[0] {
        range[0] = mid
        searchRange(nums, target: target, left: left, right: mid - 1, range: &range)
      }
      if mid > range[1] {
        range[1] = mid
        searchRange(nums, target: target, left: mid + 1, right: right, range: &range)
      }
    } else if nums[mid] < target {
      searchRange(nums, target: target, left: mid + 1, right: right, range: &range)
    } else {
      searchRange(nums, target: target, left: left, right: mid - 1, range: &range)
    }
  }
}

print(Solution().searchRange([5, 7, 7, 8, 8, 10], 8))