class Solution {
  func findTheDifference(_ s: String, _ t: String) -> Character {
    var sDict = [Character:Int]()
    var tDict = [Character:Int]()
    for cha in Array(s) {
      if sDict[cha] == nil {
        sDict[cha] = 1
      } else {
        sDict[cha] = sDict[cha]! + 1
      }
    }
    for cha in Array(t) {
      if tDict[cha] == nil {
        tDict[cha] = 1
      } else {
        tDict[cha] = tDict[cha]! + 1
      }
    }
    for cha in Array(t) {
      if tDict[cha]! != sDict[cha] ?? -1 {
        return cha
      }
    }
    return Character("")
  }
}

print(Solution().findTheDifference("abcd", "abcde"))
