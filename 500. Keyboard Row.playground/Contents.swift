class Solution {
  func findWords(_ words: [String]) -> [String] {
    let row1:[Character] = ["q","w","e","r","t","y","u","i","o","p"]
    let row2:[Character] = ["a","s","d","f","g","h","j","k","l"]
    let row3:[Character] = ["z","x","c","v","b","n","m"]
    var result = [String]()
    for word in words {
      let lowerWord = word.lowercased()
      let lowerWordArray = Array(lowerWord)
      var currentRow = -1
      if row1.contains(lowerWordArray.first ?? "a") {
        currentRow = 1
      } else if row2.contains(lowerWordArray.first ?? "a") {
        currentRow = 2
      } else if row3.contains(lowerWordArray.first ?? "a") {
        currentRow = 3
      }
      for index in 1 ..< lowerWordArray.count {
        let cha = lowerWordArray[index]
        if currentRow == 1 {
          if !row1.contains(cha) {
            currentRow = -2
            break
          }
        }
        if currentRow == 2 {
          if !row2.contains(cha) {
            currentRow = -2
            break
          }
        }
        if currentRow == 3 {
          if !row3.contains(cha) {
            currentRow = -2
            break
          }
        }
      }
      if currentRow != -2 {
        result.append(word)
      }
    }
    return result
  }
}

print(Solution().findWords(["Hello", "Alaska", "Dad", "Peace"]))
