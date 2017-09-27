class Solution {
  func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    for i in 0 ..< numbers.count {
      if i + 1 < numbers.count {
        for j in i + 1 ..< numbers.count {
          if numbers[j] == target - numbers[i] {
            return [i + 1, j + 1]
          }
          if numbers[j] >= target {
            break
          }
        }
      }
    }
    return []
  }
}