class Solution {
  func isIsomorphic(_ s: String, _ t: String) -> Bool {
    var sDict = [Character:Character]()
    var tDict = [Character:Character]()
    let sArray = Array(s)
    let tArray = Array(t)
    guard sArray.count == tArray.count else {
      return false
    }
    for index in 0 ..< sArray.count {
      let sCha = sArray[index]
      let tCha = tArray[index]
      
      if sDict[sCha] == nil && tDict[tCha] == nil {
        sDict[sCha] = tCha
        tDict[tCha] = sCha
      } else if sDict[sCha] != tCha || tDict[tCha] != sCha {
        return false
      }
    }
    return true
  }
}

print(Solution().isIsomorphic("edd", "ajj"))
