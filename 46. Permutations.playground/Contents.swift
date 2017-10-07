class Solution {
  func permute(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var tempList = [Int]()
    backtrack(list: &result, tempList: &tempList, nums: nums)
    return result
  }
  
  private func backtrack(list: inout [[Int]], tempList: inout [Int], nums: [Int]) {
    if tempList.count == nums.count {
      list.append(tempList)
    } else {
      for i in 0 ..< nums.count {
        if tempList.contains(nums[i]) {
          continue
        }
        tempList.append(nums[i])
        backtrack(list: &list, tempList: &tempList, nums: nums)
        tempList.remove(at: tempList.count - 1)
      }
    }
  }
}

print(Solution().permute([1,2,3]))