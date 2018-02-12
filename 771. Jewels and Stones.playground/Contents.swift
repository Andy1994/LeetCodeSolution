class Solution {
  func numJewelsInStones(_ J: String, _ S: String) -> Int {
    var dict = [Character:Int](), result = 0
    let jArray = Array(J)
    let sArray = Array(S)
    for item in sArray {
      if dict[item] == nil {
        dict[item] = 1
      } else {
        dict[item] = dict[item]! + 1
      }
    }
    for item in jArray {
      if dict[item] != nil {
        result += dict[item]!
      }
    }
    return result
  }
}

print(Solution().numJewelsInStones("aA", "aAAbbbb"))
