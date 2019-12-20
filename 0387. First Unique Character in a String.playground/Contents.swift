class Solution {
  func firstUniqChar(_ s: String) -> Int {
    var dict = [Character:Int]()
    let sArray = Array(s)
    for cha in sArray {
      if dict[cha] == nil {
        dict[cha] = 1
      } else {
        dict[cha] = dict[cha]! + 1
      }
    }
    for index in 0 ..< sArray.count {
      if dict[sArray[index]] == 1 {
        return index
      }
    }
    return -1
  }
}

print(Solution().firstUniqChar("loveleetcode"))
