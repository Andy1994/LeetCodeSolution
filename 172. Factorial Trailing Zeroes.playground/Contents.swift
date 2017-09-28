class Solution {
  func trailingZeroes(_ n: Int) -> Int {
    var m = n
    var result = 0
    while m / 5 > 0 {
      result += m / 5
      m = m / 5
    }
    return result
  }
}