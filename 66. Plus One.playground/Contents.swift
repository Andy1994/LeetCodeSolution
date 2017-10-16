class Solution {
  func plusOne(_ digits: [Int]) -> [Int] {
    var num = digits
    var lenth = num.count
    if num[lenth - 1] + 1 == 10 {
      while num[lenth - 1] + 1 == 10 {
        num[lenth - 1] = 0
        lenth -= 1
        if lenth <= 0 {
          num.insert(1, at: 0)
          return num
        }
      }
    }
    num[lenth - 1] = num[lenth - 1] + 1
    return num
  }
}

print(Solution().plusOne([9,9,7,7,9]))
