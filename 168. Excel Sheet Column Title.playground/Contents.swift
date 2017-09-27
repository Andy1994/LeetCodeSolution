class Solution {
  func convertToTitle(_ n: Int) -> String {
    let array = ["Z", "A", "B", "C", "D", "E", "F", "G",
                  "H", "I", "J", "K", "L", "M", "N",
                   "O", "P", "Q", "R", "S", "T",
                    "U", "V", "W", "X", "Y", "Z"]
    var str = ""
    if n > 26 {
      if n % 26 == 0 {
        str = convertToTitle((n - 26) / 26) + array[n % 26]
      } else {
        str = convertToTitle(n / 26) + array[n % 26]
      }
    } else {
      str = array[n]
    }
    return str
  }
}