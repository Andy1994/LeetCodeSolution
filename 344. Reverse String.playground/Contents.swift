class Solution {
  func reverseString(_ s: String) -> String {
    let sArray = Array(s)
    var tempArray = [Character]()
    for cha in sArray {
      tempArray.insert(cha, at: 0)
    }
    return String(tempArray)
  }
}

print(Solution().reverseString("hello"))
