class Solution {
  func majorityElement(_ nums: [Int]) -> Int {
    var dict = [String: Int]()
    for i in 0 ..< nums.count {
      if dict["\(nums[i])"] == nil {
        dict.updateValue(1, forKey: "\(nums[i])")
      } else {
        dict.updateValue(dict["\(nums[i])"]! + 1, forKey: "\(nums[i])")
      }
    }
    let array = dict.sorted { (s1, s2) -> Bool in
      s1.value > s2.value
    }
    return Int(array[0].key)!
  }
}
